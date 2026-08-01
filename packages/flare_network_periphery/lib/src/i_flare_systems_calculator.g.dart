// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFlareSystemsCalculator
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFlareSystemsCalculator` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFlareSystemsCalculatorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFlareSystemsCalculatorContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFlareSystemsCalculator` through the [ContractRegistry].
  ///
  /// Registered as `FlareSystemsCalculator`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFlareSystemsCalculatorContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FlareSystemsCalculator',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFlareSystemsCalculatorContract(client: client, address: resolved);
  }

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
