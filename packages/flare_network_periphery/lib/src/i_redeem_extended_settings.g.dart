// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedeemExtendedSettings
// Functions: 6 — 3 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRedeemExtendedSettings` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRedeemExtendedSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRedeemExtendedSettingsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IRedeemExtendedSettings` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRedeemExtendedSettingsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRedeemExtendedSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `minimumRedeemAmountUBA()`.
  static final AbiFunction minimumRedeemAmountUBAFn = AbiFunction(
    name: 'minimumRedeemAmountUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `setMinimumRedeemAmountUBA(uint256)`.
  static final AbiFunction setMinimumRedeemAmountUBAFn = AbiFunction(
    name: 'setMinimumRedeemAmountUBA',
    inputs: [AbiParameter(name: '_valueUBA', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSystemRedemptionFeeBIPS(uint256)`.
  static final AbiFunction setSystemRedemptionFeeBIPSFn = AbiFunction(
    name: 'setSystemRedemptionFeeBIPS',
    inputs: [AbiParameter(name: '_feeBIPS', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSystemRedemptionFeeReceiver(address)`.
  static final AbiFunction setSystemRedemptionFeeReceiverFn = AbiFunction(
    name: 'setSystemRedemptionFeeReceiver',
    inputs: [AbiParameter(name: '_receiver', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `systemRedemptionFeeBIPS()`.
  static final AbiFunction systemRedemptionFeeBIPSFn = AbiFunction(
    name: 'systemRedemptionFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `systemRedemptionFeeReceiver()`.
  static final AbiFunction systemRedemptionFeeReceiverFn = AbiFunction(
    name: 'systemRedemptionFeeReceiver',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `minimumRedeemAmountUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> minimumRedeemAmountUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: minimumRedeemAmountUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `systemRedemptionFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> systemRedemptionFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: systemRedemptionFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `systemRedemptionFeeReceiver()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> systemRedemptionFeeReceiver() async {
    final out = await client.callFunction(
      contract: address,
      function: systemRedemptionFeeReceiverFn,
    );
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `setMinimumRedeemAmountUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setMinimumRedeemAmountUBATx(
    BigInt valueUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setMinimumRedeemAmountUBAFn,
    args: [valueUBA],
    from: from,
  );

  /// Builds an unsigned `setSystemRedemptionFeeBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSystemRedemptionFeeBIPSTx(
    BigInt feeBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSystemRedemptionFeeBIPSFn,
    args: [feeBIPS],
    from: from,
  );

  /// Builds an unsigned `setSystemRedemptionFeeReceiver(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSystemRedemptionFeeReceiverTx(
    EthAddress receiver, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSystemRedemptionFeeReceiverFn,
    args: [receiver],
    from: from,
  );
}
