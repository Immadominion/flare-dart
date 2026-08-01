import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../abi/abi_function.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';
import '../network/flare_chain.dart';
import 'flare_exception.dart';
import 'json_rpc_client.dart';

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
/// This class covers reads only — `eth_call` and chain queries. It never holds
/// a private key and cannot send a transaction, so nothing it exposes can move
/// funds. Signing lives in a separate, opt-in layer.
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

  /// Releases the underlying HTTP connection.
  void close() => _rpc.close();
}
