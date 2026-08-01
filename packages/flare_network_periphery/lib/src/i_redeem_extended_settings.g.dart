// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedeemExtendedSettings
// Functions: 3 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRedeemExtendedSettings` contract.
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
}
