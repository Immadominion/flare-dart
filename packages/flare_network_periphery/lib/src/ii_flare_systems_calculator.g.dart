// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFlareSystemsCalculator
// Functions: 5 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFlareSystemsCalculator` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFlareSystemsCalculatorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFlareSystemsCalculatorContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFlareSystemsCalculator` through the [ContractRegistry].
  static Future<IIFlareSystemsCalculatorContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIFlareSystemsCalculator',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFlareSystemsCalculatorContract(client: client, address: resolved);
  }

  /// ABI descriptor for `calculateBurnFactorPPM(uint24,address)`.
  static final AbiFunction calculateBurnFactorPPMFn = AbiFunction(
    name: 'calculateBurnFactorPPM',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `signingPolicySignNoRewardsDurationBlocks()`.
  static final AbiFunction signingPolicySignNoRewardsDurationBlocksFn =
      AbiFunction(
        name: 'signingPolicySignNoRewardsDurationBlocks',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `signingPolicySignNonPunishableDurationBlocks()`.
  static final AbiFunction signingPolicySignNonPunishableDurationBlocksFn =
      AbiFunction(
        name: 'signingPolicySignNonPunishableDurationBlocks',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `signingPolicySignNonPunishableDurationSeconds()`.
  static final AbiFunction signingPolicySignNonPunishableDurationSecondsFn =
      AbiFunction(
        name: 'signingPolicySignNonPunishableDurationSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `wNatCapPPM()`.
  static final AbiFunction wNatCapPPMFn = AbiFunction(
    name: 'wNatCapPPM',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `calculateBurnFactorPPM(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateBurnFactorPPM(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: calculateBurnFactorPPMFn,
      args: [rewardEpochId, voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySignNoRewardsDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNoRewardsDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNoRewardsDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySignNonPunishableDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNonPunishableDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNonPunishableDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySignNonPunishableDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNonPunishableDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNonPunishableDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `wNatCapPPM()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> wNatCapPPM() async {
    final out = await client.callFunction(
      contract: address,
      function: wNatCapPPMFn,
    );
    return out[0]! as BigInt;
  }
}
