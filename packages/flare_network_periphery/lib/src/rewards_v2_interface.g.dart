// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: RewardsV2Interface
// Functions: 4 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `RewardsV2Interface` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class RewardsV2InterfaceContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const RewardsV2InterfaceContract({
    required this.client,
    required this.address,
  });

  /// Resolves `RewardsV2Interface` through the [ContractRegistry].
  static Future<RewardsV2InterfaceContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'RewardsV2Interface',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return RewardsV2InterfaceContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNextClaimableRewardEpochId(address)`.
  static final AbiFunction getNextClaimableRewardEpochIdFn = AbiFunction(
    name: 'getNextClaimableRewardEpochId',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochIdsWithClaimableRewards()`.
  static final AbiFunction getRewardEpochIdsWithClaimableRewardsFn =
      AbiFunction(
        name: 'getRewardEpochIdsWithClaimableRewards',
        inputs: [],
        outputs: [
          AbiParameter(name: '_startEpochId', type: AbiType.parse('uint24')),
          AbiParameter(name: '_endEpochId', type: AbiType.parse('uint24')),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getStateOfRewards(address)`.
  static final AbiFunction getStateOfRewardsFn = AbiFunction(
    name: 'getStateOfRewards',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(
        name: '_rewardStates',
        type: AbiType.parse('(uint24,bytes20,uint120,uint8,bool)[][]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `active()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> active() async {
    final out = await client.callFunction(
      contract: address,
      function: activeFn,
    );
    return out[0]! as bool;
  }

  /// Calls `getNextClaimableRewardEpochId(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNextClaimableRewardEpochId(EthAddress rewardOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getNextClaimableRewardEpochIdFn,
      args: [rewardOwner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochIdsWithClaimableRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt startEpochId, BigInt endEpochId})>
  getRewardEpochIdsWithClaimableRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochIdsWithClaimableRewardsFn,
    );
    return (startEpochId: out[0]! as BigInt, endEpochId: out[1]! as BigInt);
  }

  /// Calls `getStateOfRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<List<Object?>>>> getStateOfRewards(
    EthAddress rewardOwner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [rewardOwner],
    );
    return (out[0]! as List).cast<List<List<Object?>>>();
  }
}
