// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IWNat
// Functions: 4 — 0 readable via eth_call, 4 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IWNat` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IWNatContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IWNatContract({required this.client, required this.address});

  /// Resolves `IWNat` through the [ContractRegistry].
  ///
  /// Registered as `WNat`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IWNatContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'WNat',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IWNatContract(client: client, address: resolved);
  }

  /// ABI descriptor for `deposit()`.
  static final AbiFunction depositFn = AbiFunction(
    name: 'deposit',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `depositTo(address)`.
  static final AbiFunction depositToFn = AbiFunction(
    name: 'depositTo',
    inputs: [AbiParameter(name: '_recipient', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `withdraw(uint256)`.
  static final AbiFunction withdrawFn = AbiFunction(
    name: 'withdraw',
    inputs: [AbiParameter(name: '_amount', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `withdrawFrom(address,uint256)`.
  static final AbiFunction withdrawFromFn = AbiFunction(
    name: 'withdrawFrom',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `deposit()`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest depositTx({EthAddress? from, BigInt? value}) =>
      TransactionRequest.callFunction(
        to: address,
        function: depositFn,
        from: from,
        value: value,
      );

  /// Builds an unsigned `depositTo(address)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest depositToTx(
    EthAddress recipient, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: depositToFn,
    args: [recipient],
    from: from,
    value: value,
  );

  /// Builds an unsigned `withdraw(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest withdrawTx(BigInt amount, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: withdrawFn,
        args: [amount],
        from: from,
      );

  /// Builds an unsigned `withdrawFrom(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest withdrawFromTx(
    EthAddress owner,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: withdrawFromFn,
    args: [owner, amount],
    from: from,
  );
}
