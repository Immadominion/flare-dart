import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/abi_function.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';
import 'flare_exception.dart';
import 'transaction.dart';

/// A transaction for an external wallet to sign.
///
/// This package holds no private keys and never will, so the last step of any
/// state change belongs to a wallet — Reown/WalletConnect, an injected
/// provider, a hardware device. What the SDK can do is assemble the request
/// correctly, price it, and confirm the outcome.
///
/// ```dart
/// final request = TransactionRequest.callFunction(
///   to: wNat,
///   function: abi.function('deposit'),
///   value: BigInt.from(10).pow(18), // 1 FLR
///   from: userAddress,
/// );
///
/// final ready = await client.prepareTransaction(request);
/// final hash = await wallet.send(ready.toWalletJson()); // your wallet library
/// final receipt = await client.waitForReceipt(hash);
/// ```
///
/// Every field is optional because a request is built up in stages: the caller
/// supplies intent, [FlareClient.prepareTransaction] fills in the rest.
@immutable
final class TransactionRequest {
  /// The account that will send it. Wallets normally override this with the
  /// account the user has actually selected.
  final EthAddress? from;

  /// The recipient. Null only when deploying a contract.
  final EthAddress? to;

  /// Calldata.
  final Uint8List? data;

  /// Native value to attach, in wei.
  final BigInt? value;

  /// Gas limit.
  final BigInt? gas;

  /// Sender nonce.
  ///
  /// Usually best left null: wallets track their own nonces, including
  /// transactions this SDK cannot see, and a stale value here causes a
  /// rejection rather than a queue.
  final BigInt? nonce;

  /// EIP-1559 total fee cap per gas, in wei.
  final BigInt? maxFeePerGas;

  /// EIP-1559 priority fee per gas, in wei.
  final BigInt? maxPriorityFeePerGas;

  /// Chain ID, which pins the request to one network (EIP-155).
  final int? chainId;

  const TransactionRequest({
    this.from,
    this.to,
    this.data,
    this.value,
    this.gas,
    this.nonce,
    this.maxFeePerGas,
    this.maxPriorityFeePerGas,
    this.chainId,
  });

  /// Builds a request that calls [function] on [to] with [args].
  ///
  /// Encoding happens here, so an argument of the wrong type or arity fails
  /// immediately rather than as an opaque revert later.
  factory TransactionRequest.callFunction({
    required EthAddress to,
    required AbiFunction function,
    List<Object?> args = const [],
    EthAddress? from,
    BigInt? value,
    BigInt? gas,
  }) => TransactionRequest(
    from: from,
    to: to,
    data: function.encodeCall(args),
    value: value,
    gas: gas,
  );

  /// A plain transfer of native FLR, with no calldata.
  factory TransactionRequest.transfer({
    required EthAddress to,
    required BigInt value,
    EthAddress? from,
  }) => TransactionRequest(from: from, to: to, value: value);

  /// A contract deployment.
  ///
  /// [to] stays absent rather than null or `0x0`: a wallet reads a present-but-
  /// empty recipient as a transfer to the zero address, which burns the value.
  factory TransactionRequest.deploy({
    required Uint8List bytecode,
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest(from: from, data: bytecode, value: value);

  /// Serialises to the object an EIP-1193 wallet expects as the sole parameter
  /// of `eth_sendTransaction` or `eth_signTransaction`.
  ///
  /// Quantities are minimal hex (`0x0`, never `0x00`) and `data` is hex bytes,
  /// per the Ethereum JSON-RPC spec. Flare's node enforces this strictly: a
  /// padded `0x0000` is rejected with `-32602 cannot unmarshal hex number with
  /// leading zero digits`, and so is an odd-length `data`.
  ///
  /// Only fields that are set are emitted. Sending an explicit null is rejected
  /// by strict wallets, and a zero is not the same as an absent field — a
  /// contract deployment must **omit** `to` rather than send null.
  ///
  /// `data` is used, never the `input` alias: MetaMask's parameter whitelist
  /// has no `input` key, so an `input` payload is silently dropped and the user
  /// is shown a bare value transfer to approve.
  ///
  /// `type` is never emitted. Wallets infer `0x2` from the presence of the
  /// max-fee pair, and an explicit type inconsistent with the fee fields is
  /// rejected.
  ///
  /// [includeNonce] is off by default — see [nonce].
  ///
  /// [includeChainId] is off by default too. It is tempting to send it as a
  /// guard against a Coston2 request being signed on mainnet, but that guard
  /// does not exist: MetaMask normalises the parameters and strips `chainId`
  /// before any validation runs, and neither viem's formatter nor Reown's
  /// serialiser emits the key at all. Cross-chain safety comes from the CAIP-2
  /// chain argument passed alongside the request — see [FlareChain.caip2] —
  /// not from inside this object.
  Map<String, Object?> toWalletJson({
    bool includeNonce = false,
    bool includeChainId = false,
  }) => {
    if (from != null) 'from': from!.hex,
    if (to != null) 'to': to!.hex,
    if (data != null && data!.isNotEmpty) 'data': bytesToHex(data!),
    if (value != null) 'value': bigIntToHex(value!),
    if (gas != null) 'gas': bigIntToHex(gas!),
    if (includeNonce && nonce != null) 'nonce': bigIntToHex(nonce!),
    if (maxFeePerGas != null) 'maxFeePerGas': bigIntToHex(maxFeePerGas!),
    if (maxPriorityFeePerGas != null)
      'maxPriorityFeePerGas': bigIntToHex(maxPriorityFeePerGas!),
    if (includeChainId && chainId != null)
      'chainId': '0x${chainId!.toRadixString(16)}',
  };

  /// Throws [FlareContractException] if a wallet could not act on this.
  ///
  /// Checks what a wallet will reject anyway, but here the message says which
  /// field is wrong instead of surfacing as a declined signature the user has
  /// to interpret.
  void assertSendable() {
    void require(bool ok, String what) {
      if (!ok) {
        throw FlareContractException(
          'Transaction is not ready to send: $what',
          address: to?.hex,
        );
      }
    }

    require(from != null, '`from` is missing');
    require(
      to != null || (data != null && data!.isNotEmpty),
      'neither `to` nor deployment bytecode is set',
    );
    final cap = maxFeePerGas;
    final tip = maxPriorityFeePerGas;
    require(
      cap == null || tip == null || tip <= cap,
      'maxPriorityFeePerGas ($tip) exceeds maxFeePerGas ($cap)',
    );
    require(gas != null, '`gas` is missing — call prepareTransaction first');
    require(cap != null && tip != null, 'fees are missing');
  }

  /// The same call as a simulation request, for `eth_call` or gas estimation.
  ///
  /// Fee and nonce fields are dropped: they do not affect execution, and
  /// supplying a fee cap can make an estimate fail for an account that holds
  /// too little to cover it.
  CallRequest toCallRequest() =>
      CallRequest(from: from, to: to, data: data, value: value, gas: gas);

  /// Returns a copy with the given fields replaced. Nulls leave a field as is.
  TransactionRequest copyWith({
    EthAddress? from,
    EthAddress? to,
    Uint8List? data,
    BigInt? value,
    BigInt? gas,
    BigInt? nonce,
    BigInt? maxFeePerGas,
    BigInt? maxPriorityFeePerGas,
    int? chainId,
  }) => TransactionRequest(
    from: from ?? this.from,
    to: to ?? this.to,
    data: data ?? this.data,
    value: value ?? this.value,
    gas: gas ?? this.gas,
    nonce: nonce ?? this.nonce,
    maxFeePerGas: maxFeePerGas ?? this.maxFeePerGas,
    maxPriorityFeePerGas: maxPriorityFeePerGas ?? this.maxPriorityFeePerGas,
    chainId: chainId ?? this.chainId,
  );

  /// Whether every field a wallet needs is present.
  bool get isReady =>
      gas != null &&
      maxFeePerGas != null &&
      maxPriorityFeePerGas != null &&
      chainId != null;

  /// The most this can cost, in wei: `gas × maxFeePerGas + value`.
  ///
  /// The worst case, not the expected one. Under EIP-1559 the difference
  /// between [maxFeePerGas] and the block's base fee is refunded, so the actual
  /// charge is normally lower. Null until [gas] and [maxFeePerGas] are set.
  BigInt? get maxCost {
    final g = gas;
    final f = maxFeePerGas;
    if (g == null || f == null) return null;
    return g * f + (value ?? BigInt.zero);
  }

  @override
  String toString() =>
      'TransactionRequest(to: ${to?.hex ?? 'deploy'}, '
      'value: ${value ?? BigInt.zero}, '
      'data: ${data == null ? 'none' : '${data!.length} bytes'}, '
      '${isReady ? 'ready' : 'unprepared'})';
}

/// Suggested EIP-1559 fees for the next block.
///
/// Flare's fee market is unusually quiet. Measured on 2026-08-02 over ten
/// consecutive blocks on both mainnet and Coston2: `baseFeePerGas` was
/// **500 gwei on every block**, with `gasUsedRatio` between 0.3% and 4%, and
/// `eth_maxPriorityFeePerGas` returned **exactly 150 gwei** on both networks.
/// A base fee only rises when blocks fill, and Flare's are close to empty, so
/// in practice it sits at its floor.
///
/// The headroom in [maxFeePerGas] still matters. It costs nothing when unused —
/// the surplus over the base fee is refunded — and it is what stops a
/// transaction stalling if the base fee does climb between building and mining.
@immutable
final class FeeEstimate {
  /// Base fee of the latest block, in wei per gas. Burned, not paid to anyone.
  final BigInt baseFeePerGas;

  /// Suggested priority fee, in wei per gas.
  final BigInt maxPriorityFeePerGas;

  /// Suggested total cap, in wei per gas.
  final BigInt maxFeePerGas;

  const FeeEstimate({
    required this.baseFeePerGas,
    required this.maxPriorityFeePerGas,
    required this.maxFeePerGas,
  });

  /// Worst-case fee for [gas] units: `gas × maxFeePerGas`.
  BigInt maxCostFor(BigInt gas) => gas * maxFeePerGas;

  /// Fee for [gas] units at the current base fee, which is what a transaction
  /// mined into the next block would actually be charged.
  BigInt likelyCostFor(BigInt gas) =>
      gas * (baseFeePerGas + maxPriorityFeePerGas);

  @override
  String toString() =>
      'FeeEstimate(base ${_gwei(baseFeePerGas)} gwei, '
      'tip ${_gwei(maxPriorityFeePerGas)} gwei, '
      'cap ${_gwei(maxFeePerGas)} gwei)';

  static String _gwei(BigInt wei) =>
      (wei / BigInt.from(1000000000)).toStringAsFixed(2);
}
