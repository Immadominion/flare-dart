import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../abi/abi_event.dart';
import '../abi/abi_function.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';
import '../network/flare_chain.dart';
import 'flare_exception.dart';
import 'json_rpc_client.dart';
import 'logs.dart';
import 'transaction.dart';
import 'tx_request.dart';

/// Block tags accepted where a block parameter is required.
enum BlockTag {
  latest,
  earliest,
  pending,
  safe,
  finalized;

  String get value => name;
}

/// Read access to a Flare network.
///
/// ```dart
/// final client = FlareClient(FlareChain.coston2);
/// try {
///   print(await client.getChainId()); // 114
/// } finally {
///   client.close();
/// }
/// ```
///
/// **This client never holds a private key and performs no signing.** It can
/// read the chain, simulate and price a transaction, assemble one for a wallet
/// to sign ([prepareTransaction]), and broadcast bytes a wallet has already
/// signed ([sendRawTransaction]) — but producing a signature is always someone
/// else's job, so nothing here can move funds on its own.
class FlareClient {
  /// The network this client talks to.
  final FlareChain chain;

  final JsonRpcClient _rpc;

  /// Connects to [chain] over its public RPC endpoint.
  ///
  /// Pass [rpcUrl] to use a private or paid endpoint instead. Pass
  /// [httpClient] to share a connection pool; the caller then owns it.
  FlareClient(
    this.chain, {
    String? rpcUrl,
    RetryPolicy retryPolicy = const RetryPolicy(),
    Duration timeout = const Duration(seconds: 30),
    http.Client? httpClient,
  }) : _rpc = JsonRpcClient(
         rpcUrl ?? chain.rpcUrl,
         retryPolicy: retryPolicy,
         timeout: timeout,
         httpClient: httpClient,
       );

  /// The underlying JSON-RPC transport, for methods this class does not wrap.
  JsonRpcClient get rpc => _rpc;

  /// Absolute gas headroom added by [prepareTransaction], in gas units.
  ///
  /// Sized for Flare's vote-power checkpoint writes, which are the common calls
  /// whose real cost can exceed a simulation against current state.
  static const _defaultGasBuffer = 75000;

  /// `eth_chainId`. Should equal [FlareChain.chainId]; see [verifyChainId].
  Future<int> getChainId() async {
    final result = await _rpc.call('eth_chainId');
    return hexToBigInt(result! as String).toInt();
  }

  /// Confirms the endpoint really serves the expected network.
  ///
  /// Worth calling once at startup: a misconfigured RPC URL otherwise surfaces
  /// much later as confusing "contract not found" errors, because every
  /// registry lookup silently resolves against the wrong chain.
  Future<void> verifyChainId() async {
    final actual = await getChainId();
    if (actual != chain.chainId) {
      throw FlareTransportException(
        'Endpoint reports chain ID $actual but ${chain.name} expects '
        '${chain.chainId}. The RPC URL points at the wrong network.',
        endpoint: chain.rpcUrl,
      );
    }
  }

  /// `eth_blockNumber`.
  Future<BigInt> getBlockNumber() async =>
      hexToBigInt((await _rpc.call('eth_blockNumber'))! as String);

  /// `eth_getBalance`, in wei.
  Future<BigInt> getBalance(
    EthAddress address, {
    BlockTag block = BlockTag.latest,
  }) async => hexToBigInt(
    (await _rpc.call('eth_getBalance', [address.hex, block.value]))! as String,
  );

  /// `eth_getCode`. Empty means the address holds no contract.
  Future<Uint8List> getCode(
    EthAddress address, {
    BlockTag block = BlockTag.latest,
  }) async => hexToBytes(
    (await _rpc.call('eth_getCode', [address.hex, block.value]))! as String,
  );

  /// Whether [address] currently has contract code deployed.
  Future<bool> isContract(EthAddress address) async =>
      (await getCode(address)).isNotEmpty;

  /// `eth_gasPrice`, in wei.
  Future<BigInt> getGasPrice() async =>
      hexToBigInt((await _rpc.call('eth_gasPrice'))! as String);

  /// `eth_maxPriorityFeePerGas`, in wei.
  ///
  /// Read this rather than assuming a value. Flare's suggested tip is orders of
  /// magnitude above the 1 gwei that some Ethereum-oriented libraries hardcode,
  /// and an under-tipped transaction simply waits.
  Future<BigInt> getMaxPriorityFeePerGas() async =>
      hexToBigInt((await _rpc.call('eth_maxPriorityFeePerGas'))! as String);

  /// Raw `eth_call`, returning the undecoded return data.
  Future<Uint8List> ethCall({
    required EthAddress to,
    required Uint8List data,
    EthAddress? from,
    BlockTag block = BlockTag.latest,
  }) async {
    final params = <String, Object?>{
      'to': to.hex,
      'data': bytesToHex(data),
      if (from != null) 'from': from.hex,
    };
    final result = await _rpc.call('eth_call', [params, block.value]);
    return hexToBytes(result! as String);
  }

  /// Calls [function] on [contract] and decodes the result.
  ///
  /// Returns one entry per declared output. Functions declared `payable` are
  /// callable this way when they need no value — FTSOv2's feed getters are
  /// declared `payable` yet read for free.
  Future<List<Object?>> callFunction({
    required EthAddress contract,
    required AbiFunction function,
    List<Object?> args = const [],
    EthAddress? from,
    BlockTag block = BlockTag.latest,
  }) async {
    final data = await ethCall(
      to: contract,
      data: function.encodeCall(args),
      from: from,
      block: block,
    );
    if (data.isEmpty) {
      throw FlareContractException(
        'Call to ${function.name} returned no data. Either $contract holds no '
        'contract on ${chain.name}, or the call reverted.',
        address: contract.checksummed,
        function: function.canonicalSignature,
      );
    }
    return function.decodeReturn(data);
  }

  /// Calls [function] and returns its single output.
  ///
  /// Throws [FlareAbiException] if the function does not declare exactly one.
  Future<Object?> callFunctionSingle({
    required EthAddress contract,
    required AbiFunction function,
    List<Object?> args = const [],
    EthAddress? from,
    BlockTag block = BlockTag.latest,
  }) async {
    if (function.outputs.length != 1) {
      throw FlareAbiException(
        '${function.name} declares ${function.outputs.length} outputs; '
        'use callFunction instead.',
        solidityType: function.canonicalSignature,
      );
    }
    final out = await callFunction(
      contract: contract,
      function: function,
      args: args,
      from: from,
      block: block,
    );
    return out.single;
  }

  /// The receipt for [transactionHash], or null while it is still pending.
  ///
  /// This is how a wallet-signed transaction is followed to completion: this
  /// package cannot sign, but once an external wallet returns a hash it can
  /// tell you whether the transaction actually succeeded.
  ///
  /// **Check [TransactionReceipt.succeeded].** A reverted transaction still
  /// produces a receipt and still costs gas; the receipt arriving is not the
  /// same as the transaction working.
  Future<TransactionReceipt?> getTransactionReceipt(
    Uint8List transactionHash,
  ) async {
    final result = await _rpc.call('eth_getTransactionReceipt', [
      bytesToHex(transactionHash),
    ]);
    if (result == null) return null;
    if (result is! Map) {
      throw FlareTransportException(
        'Expected an object from eth_getTransactionReceipt, '
        'got ${result.runtimeType}',
        endpoint: chain.rpcUrl,
      );
    }
    return TransactionReceipt.fromJson(result.cast<String, Object?>());
  }

  /// Waits for [transactionHash] to be mined and returns its receipt.
  ///
  /// Polls until [timeout] elapses, defaulting to this network's own
  /// [FlareChain.blockTime]. The four networks are not interchangeable here:
  /// measured over 1,000 blocks each, Songbird produces one every 1.066 s and
  /// Coston one every 3.995 s. A single shared interval either burns requests
  /// on the fast chains or adds latency on the slow ones.
  ///
  /// Throws [FlareTransportException] on timeout. A timeout means the
  /// transaction has not been included **yet** — it may still land later, so
  /// treat it as unknown rather than failed.
  Future<TransactionReceipt> waitForReceipt(
    Uint8List transactionHash, {
    Duration? pollInterval,
    Duration timeout = const Duration(minutes: 2),
  }) async {
    pollInterval ??= chain.blockTime;
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      final receipt = await getTransactionReceipt(transactionHash);
      if (receipt != null) return receipt;
      await Future<void>.delayed(pollInterval);
    }
    throw FlareTransportException(
      'Transaction ${bytesToHex(transactionHash)} was not mined within '
      '${timeout.inSeconds}s. It may still be pending — re-check rather than '
      'assuming it failed.',
      endpoint: chain.rpcUrl,
    );
  }

  /// A transaction by hash, or null if the node has never seen it.
  Future<TransactionInfo?> getTransactionByHash(Uint8List hash) async {
    final result = await _rpc.call('eth_getTransactionByHash', [
      bytesToHex(hash),
    ]);
    if (result == null) return null;
    if (result is! Map) return null;
    return TransactionInfo.fromJson(result.cast<String, Object?>());
  }

  /// `eth_getTransactionCount` — the next nonce for [address].
  ///
  /// Pass [BlockTag.pending] to include transactions still in the mempool,
  /// which is what a wallet needs when queuing another transaction.
  Future<BigInt> getTransactionCount(
    EthAddress address, {
    BlockTag block = BlockTag.latest,
  }) async => hexToBigInt(
    (await _rpc.call('eth_getTransactionCount', [address.hex, block.value]))!
        as String,
  );

  /// `eth_estimateGas` — how much gas [request] would consume.
  ///
  /// Use this to price an action before asking a user to sign it. The node
  /// simulates the call, so a request that would revert throws here rather
  /// than costing real gas to discover.
  ///
  /// When it does revert, the thrown [FlareRpcException] carries the ABI-encoded
  /// reason; read it with `RevertReason` rather than parsing the message:
  ///
  /// ```dart
  /// try {
  ///   await client.estimateGas(request);
  /// } on FlareRpcException catch (e) {
  ///   print(e.revertReason?.description ?? 'no reason given');
  /// }
  /// ```
  Future<BigInt> estimateGas(CallRequest request) async => hexToBigInt(
    (await _rpc.call('eth_estimateGas', [request.toJson()]))! as String,
  );

  /// Suggests EIP-1559 fees for the next block.
  ///
  /// Reads the latest block's base fee and the node's own priority-fee
  /// suggestion in **one batched round-trip**, then caps the total at
  /// `baseFee × baseFeeMultiplier + tip`.
  ///
  /// [baseFeeMultiplier] is headroom against the base fee rising between
  /// building the transaction and it being mined. Unused headroom is refunded,
  /// so it is nearly free — but not entirely: `gas × maxFeePerGas` is the
  /// number a wallet shows the user as the maximum cost, and against Flare's
  /// 500 gwei floor an inflated cap makes a routine action look alarming.
  ///
  /// The default of 1.5 comes from measurement rather than convention. Across
  /// 8,192 mainnet blocks the base fee sat exactly at the 500 gwei floor 95.2%
  /// of the time and never rose more than 11.3% above it; on Coston2 it was at
  /// the floor 99.9% of the time. 1.5 covers four times the largest excursion
  /// observed. Ethereum-derived defaults of 2 are sized for a fee market Flare
  /// does not currently have.
  ///
  /// Pass [priorityFee] to override the node's suggestion. That suggestion was
  /// exactly 150 gwei on all four networks when measured — a flat constant, not
  /// a market signal. Blocks run around 2% full, and a transaction with a zero
  /// tip was observed mined on mainnet, so bidding above it buys little; every
  /// fee on Flare is burned rather than paid to a validator.
  Future<FeeEstimate> suggestFees({
    num baseFeeMultiplier = 1.5,
    BigInt? priorityFee,
  }) async {
    if (baseFeeMultiplier < 1) {
      throw ArgumentError.value(
        baseFeeMultiplier,
        'baseFeeMultiplier',
        'A cap below the base fee can never be mined',
      );
    }

    final responses = await _rpc.batch([
      const RpcRequest('eth_getBlockByNumber', ['latest', false]),
      if (priorityFee == null) const RpcRequest('eth_maxPriorityFeePerGas'),
    ]);

    final block = responses.first;
    final baseFee =
        block is Map && block['baseFeePerGas'] is String
            ? hexToBigInt(block['baseFeePerGas']! as String)
            // Pre-London chains have no base fee. Flare is post-London on every
            // network, so this is a guard rather than a path taken.
            : BigInt.zero;

    final tip = priorityFee ?? hexToBigInt(responses.last! as String);

    // Scaled integer arithmetic, never doubles: a wei value above 2^53 loses
    // precision as a double, and fees are compared exactly by the node.
    final scale = BigInt.from(1000);
    final scaled = BigInt.from((baseFeeMultiplier * 1000).round());

    return FeeEstimate(
      baseFeePerGas: baseFee,
      maxPriorityFeePerGas: tip,
      maxFeePerGas: (baseFee * scaled) ~/ scale + tip,
    );
  }

  /// Fills in everything [request] is missing, ready for a wallet to sign.
  ///
  /// Supplies chain ID, fees and gas limit, leaving anything already set alone.
  /// Gas is estimated by simulating the call, so a request that would revert
  /// fails here — before the user is asked to approve it, and before it costs
  /// anything.
  ///
  /// The gas limit is padded to `max(estimate × (1 + gasBufferRatio),
  /// estimate + gasBufferMinimum)`. Two mechanisms because one is not enough:
  ///
  /// - The node adds **no** buffer of its own. A plain transfer estimates at
  ///   exactly 21000, so whatever margin exists is the one added here.
  /// - An estimate is only exact for the state it simulated against. Flare's
  ///   delegation and reward-claim calls write vote-power checkpoints whose
  ///   cost depends on how much history the account already has, so a
  ///   percentage of a small estimate can be far too little. The absolute floor
  ///   covers that; the ratio covers everything else.
  ///
  /// Unused gas is refunded. Running out is not.
  ///
  /// The nonce is deliberately left alone unless [includeNonce] is set: wallets
  /// track their own, including transactions this client cannot see.
  Future<TransactionRequest> prepareTransaction(
    TransactionRequest request, {
    double gasBufferRatio = 0.05,
    BigInt? gasBufferMinimum,
    bool includeNonce = false,
    num baseFeeMultiplier = 1.5,
  }) async {
    final needsFees =
        request.maxFeePerGas == null || request.maxPriorityFeePerGas == null;

    final fees =
        needsFees
            ? await suggestFees(baseFeeMultiplier: baseFeeMultiplier)
            : null;

    var gas = request.gas;
    if (gas == null) {
      final estimate = await estimateGas(request.toCallRequest());
      final scaled =
          (estimate * BigInt.from(((1 + gasBufferRatio) * 1000).round())) ~/
          BigInt.from(1000);
      final floored =
          estimate + (gasBufferMinimum ?? BigInt.from(_defaultGasBuffer));
      gas = scaled > floored ? scaled : floored;
    }

    var nonce = request.nonce;
    if (includeNonce && nonce == null) {
      final from = request.from;
      if (from == null) {
        throw ArgumentError(
          'A nonce cannot be fetched without `from` on the request',
        );
      }
      nonce = await getTransactionCount(from, block: BlockTag.pending);
    }

    return request.copyWith(
      gas: gas,
      nonce: nonce,
      chainId: request.chainId ?? chain.chainId,
      maxFeePerGas: request.maxFeePerGas ?? fees?.maxFeePerGas,
      maxPriorityFeePerGas:
          request.maxPriorityFeePerGas ?? fees?.maxPriorityFeePerGas,
    );
  }

  /// `eth_sendRawTransaction` — broadcasts an already-signed transaction.
  ///
  /// For wallets that sign without broadcasting (`eth_signTransaction`, and
  /// hardware devices generally). A wallet that offers `eth_sendTransaction`
  /// broadcasts for you and you do not need this.
  ///
  /// **This client cannot produce [signedTransaction].** It holds no keys and
  /// performs no signing; the bytes must come from a wallet or signer. What it
  /// returns is the transaction hash, which [waitForReceipt] then resolves.
  ///
  /// **Never retried**, whatever [RetryPolicy] this client carries. Every other
  /// method here is a read, where a retry is free; a broadcast is not. A
  /// response lost in transit does not mean the node discarded the transaction,
  /// so resending risks submitting it twice and turns a success into a
  /// confusing `already known`. On a timeout, poll [getTransactionByHash]
  /// instead of sending again.
  Future<Uint8List> sendRawTransaction(Uint8List signedTransaction) async {
    if (signedTransaction.isEmpty) {
      throw ArgumentError.value(
        signedTransaction,
        'signedTransaction',
        'Cannot broadcast empty bytes',
      );
    }
    final result = await _rpc.callOnce('eth_sendRawTransaction', [
      bytesToHex(signedTransaction),
    ]);
    return hexToBytes(result! as String);
  }

  /// Simulates [request] without sending it, returning the raw return data.
  ///
  /// The same execution the node would perform, against current state, for free
  /// — so a doomed action is discovered before a user is asked to approve it.
  /// A revert throws [FlareRpcException] carrying the decodable reason.
  ///
  /// Goes through [TransactionRequest.toCallRequest], which keeps `from` and
  /// `value`. Dropping either silently changes what is simulated: a call gated
  /// on `msg.sender` would fail, and a payable one would run with no value
  /// attached.
  Future<Uint8List> simulate(TransactionRequest request) async {
    final result = await _rpc.call('eth_call', [
      request.toCallRequest().toJson(),
      BlockTag.latest.value,
    ]);
    return hexToBytes(result! as String);
  }

  /// A block by height. Returns transaction hashes rather than full bodies.
  ///
  /// **Flare rejects heights it has not finalised** rather than returning null:
  /// asking for a block beyond the head raises
  /// `FlareRpcException(-32000, 'cannot query unfinalized data')`. That is a
  /// different condition from "this block does not exist", so it is surfaced
  /// rather than flattened to null. Use [getLatestBlock] for the head, which is
  /// always answerable.
  Future<BlockInfo?> getBlockByNumber(BigInt number) async {
    final result = await _rpc.call('eth_getBlockByNumber', [
      bigIntToHex(number),
      false,
    ]);
    if (result is! Map) return null;
    return BlockInfo.fromJson(result.cast<String, Object?>());
  }

  /// The most recent block.
  Future<BlockInfo?> getLatestBlock() async {
    final result = await _rpc.call('eth_getBlockByNumber', ['latest', false]);
    if (result is! Map) return null;
    return BlockInfo.fromJson(result.cast<String, Object?>());
  }

  /// A block by hash, or null if unknown.
  Future<BlockInfo?> getBlockByHash(Uint8List hash) async {
    final result = await _rpc.call('eth_getBlockByHash', [
      bytesToHex(hash),
      false,
    ]);
    if (result is! Map) return null;
    return BlockInfo.fromJson(result.cast<String, Object?>());
  }

  /// Largest block span Flare's public RPC accepts in one `eth_getLogs`.
  ///
  /// Measured on 2026-08-02 against both Coston2 and Flare mainnet: a span of
  /// 30 succeeds, 31 fails with *"requested too many blocks … maximum is set to
  /// 30"*. At roughly 1.8 s per block that is about 54 seconds of history per
  /// request, so any useful query has to be split. [getLogs] does that for you.
  static const maxLogBlockSpan = 30;

  /// Fetches logs matching [filter], splitting the range to fit the node's
  /// limit.
  ///
  /// A single `eth_getLogs` covering more than [maxLogBlockSpan] blocks is
  /// rejected outright by Flare's public endpoints, so this issues as many
  /// requests as the range needs and concatenates the results in block order.
  ///
  /// Block tags such as `latest` are resolved to concrete heights first,
  /// otherwise the windows could not be computed. That means a very wide range
  /// is many round trips: prefer [streamLogs] for large scans so results
  /// arrive as they are found.
  Future<List<FlareLog>> getLogs(LogFilter filter) async {
    final out = <FlareLog>[];
    await for (final log in streamLogs(filter)) {
      out.add(log);
    }
    return out;
  }

  /// Like [getLogs], but yields each log as its window returns.
  ///
  /// Preferred for wide ranges: a scan of 10,000 blocks is 334 requests, and
  /// buffering all of it before returning anything is both slow to first result
  /// and memory-hungry on a phone.
  Stream<FlareLog> streamLogs(LogFilter filter) async* {
    final from = await _resolveBlock(filter.fromBlock);
    final to = await _resolveBlock(filter.toBlock);

    if (from > to) {
      throw FlareRpcException(
        'fromBlock ($from) is after toBlock ($to)',
        code: -32602,
        method: 'eth_getLogs',
      );
    }

    final span = BigInt.from(maxLogBlockSpan);
    for (var start = from; start <= to; start += span) {
      final end =
          (start + span - BigInt.one) > to ? to : start + span - BigInt.one;
      final result = await _rpc.call('eth_getLogs', [
        filter.forRange(start, end).toJson(),
      ]);

      if (result is! List) {
        throw FlareTransportException(
          'Expected a JSON array from eth_getLogs, got ${result.runtimeType}',
          endpoint: chain.rpcUrl,
        );
      }
      for (final entry in result) {
        if (entry is Map) {
          yield FlareLog.fromJson(entry.cast<String, Object?>());
        }
      }
    }
  }

  /// Fetches logs for [event] and decodes them.
  ///
  /// Logs whose topics do not match [event] are skipped rather than throwing:
  /// one address can emit several event types, and a filter constrained only by
  /// address will return all of them.
  ///
  /// ```dart
  /// final transfers = await client.getEventLogs(
  ///   event: erc20Abi.event('Transfer'),
  ///   addresses: [token],
  ///   fromBlock: BlockRef.height(head - 100),
  /// );
  /// for (final t in transfers) print(t['value']);
  /// ```
  Future<List<DecodedLog>> getEventLogs({
    required AbiEvent event,
    List<EthAddress> addresses = const [],
    List<Object?> indexedValues = const [],
    BlockRef fromBlock = BlockRef.latest,
    BlockRef toBlock = BlockRef.latest,
  }) async {
    final filter = LogFilter(
      addresses: addresses,
      topics: event.encodeTopicFilter(indexedValues),
      fromBlock: fromBlock,
      toBlock: toBlock,
    );

    final out = <DecodedLog>[];
    await for (final log in streamLogs(filter)) {
      if (!event.matches(log.topics)) continue;
      out.add(
        DecodedLog(
          log: log,
          event: event,
          values: event.decode(topics: log.topics, data: log.data),
        ),
      );
    }
    return out;
  }

  /// Resolves a block tag such as `latest` to a concrete height.
  Future<BigInt> _resolveBlock(BlockRef ref) async {
    final n = ref.asNumber;
    if (n != null) return n;
    if (ref == BlockRef.earliest) return BigInt.zero;
    // `latest`, `pending` and `finalized` all resolve against the head; the
    // distinction does not survive being turned into a fixed window anyway.
    return getBlockNumber();
  }

  /// Releases the underlying HTTP connection.
  void close() => _rpc.close();
}
