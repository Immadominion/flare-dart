// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFlareSystemsManager
// Functions: 13 readable of 17 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFlareSystemsManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFlareSystemsManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFlareSystemsManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFlareSystemsManager` through the [ContractRegistry].
  ///
  /// Registered as `FlareSystemsManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFlareSystemsManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FlareSystemsManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFlareSystemsManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `firstRewardEpochStartTs()`.
  static final AbiFunction firstRewardEpochStartTsFn = AbiFunction(
    name: 'firstRewardEpochStartTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `firstVotingRoundStartTs()`.
  static final AbiFunction firstVotingRoundStartTsFn = AbiFunction(
    name: 'firstVotingRoundStartTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpoch()`.
  static final AbiFunction getCurrentRewardEpochFn = AbiFunction(
    name: 'getCurrentRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpochId()`.
  static final AbiFunction getCurrentRewardEpochIdFn = AbiFunction(
    name: 'getCurrentRewardEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentVotingEpochId()`.
  static final AbiFunction getCurrentVotingEpochIdFn = AbiFunction(
    name: 'getCurrentVotingEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSeed(uint256)`.
  static final AbiFunction getSeedFn = AbiFunction(
    name: 'getSeed',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getStartVotingRoundId(uint256)`.
  static final AbiFunction getStartVotingRoundIdFn = AbiFunction(
    name: 'getStartVotingRoundId',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getThreshold(uint256)`.
  static final AbiFunction getThresholdFn = AbiFunction(
    name: 'getThreshold',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint16'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotePowerBlock(uint256)`.
  static final AbiFunction getVotePowerBlockFn = AbiFunction(
    name: 'getVotePowerBlock',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterRegistrationData(uint256)`.
  static final AbiFunction getVoterRegistrationDataFn = AbiFunction(
    name: 'getVoterRegistrationData',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_enabled', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isVoterRegistrationEnabled()`.
  static final AbiFunction isVoterRegistrationEnabledFn = AbiFunction(
    name: 'isVoterRegistrationEnabled',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochDurationSeconds()`.
  static final AbiFunction rewardEpochDurationSecondsFn = AbiFunction(
    name: 'rewardEpochDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votingEpochDurationSeconds()`.
  static final AbiFunction votingEpochDurationSecondsFn = AbiFunction(
    name: 'votingEpochDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `firstRewardEpochStartTs()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> firstRewardEpochStartTs() async {
    final out = await client.callFunction(
      contract: address,
      function: firstRewardEpochStartTsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `firstVotingRoundStartTs()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> firstVotingRoundStartTs() async {
    final out = await client.callFunction(
      contract: address,
      function: firstVotingRoundStartTsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRewardEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentVotingEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentVotingEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentVotingEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getSeed(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getSeed(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getSeedFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getStartVotingRoundId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getStartVotingRoundId(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getStartVotingRoundIdFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getThreshold(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getThreshold(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getThresholdFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVotePowerBlock(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotePowerBlock(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotePowerBlockFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterRegistrationData(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt votePowerBlock, bool enabled})> getVoterRegistrationData(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterRegistrationDataFn,
      args: [rewardEpochId],
    );
    return (votePowerBlock: out[0]! as BigInt, enabled: out[1]! as bool);
  }

  /// Calls `isVoterRegistrationEnabled()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isVoterRegistrationEnabled() async {
    final out = await client.callFunction(
      contract: address,
      function: isVoterRegistrationEnabledFn,
    );
    return out[0]! as bool;
  }

  /// Calls `rewardEpochDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardEpochDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardEpochDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `votingEpochDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votingEpochDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: votingEpochDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }
}
