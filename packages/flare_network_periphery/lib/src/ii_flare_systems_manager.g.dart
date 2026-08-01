// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFlareSystemsManager
// Functions: 40 readable of 44 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFlareSystemsManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFlareSystemsManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFlareSystemsManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFlareSystemsManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFlareSystemsManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFlareSystemsManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `currentRewardEpochExpectedEndTs()`.
  static final AbiFunction currentRewardEpochExpectedEndTsFn = AbiFunction(
    name: 'currentRewardEpochExpectedEndTs',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_currentRewardEpochExpectedEndTs',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

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

  /// ABI descriptor for `getRandomAcquisitionInfo(uint24)`.
  static final AbiFunction getRandomAcquisitionInfoFn = AbiFunction(
    name: 'getRandomAcquisitionInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(
        name: '_randomAcquisitionStartTs',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_randomAcquisitionStartBlock',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_randomAcquisitionEndTs',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_randomAcquisitionEndBlock',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochStartInfo(uint24)`.
  static final AbiFunction getRewardEpochStartInfoFn = AbiFunction(
    name: 'getRewardEpochStartInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(name: '_rewardEpochStartTs', type: AbiType.parse('uint64')),
      AbiParameter(
        name: '_rewardEpochStartBlock',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardsSignInfo(uint24)`.
  static final AbiFunction getRewardsSignInfoFn = AbiFunction(
    name: 'getRewardsSignInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(name: '_rewardsSignStartTs', type: AbiType.parse('uint64')),
      AbiParameter(
        name: '_rewardsSignStartBlock',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(name: '_rewardsSignEndTs', type: AbiType.parse('uint64')),
      AbiParameter(name: '_rewardsSignEndBlock', type: AbiType.parse('uint64')),
    ],
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

  /// ABI descriptor for `getSigningPolicySignInfo(uint24)`.
  static final AbiFunction getSigningPolicySignInfoFn = AbiFunction(
    name: 'getSigningPolicySignInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(
        name: '_signingPolicySignStartTs',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_signingPolicySignStartBlock',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_signingPolicySignEndTs',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_signingPolicySignEndBlock',
        type: AbiType.parse('uint64'),
      ),
    ],
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

  /// ABI descriptor for `getUptimeVoteSignStartInfo(uint24)`.
  static final AbiFunction getUptimeVoteSignStartInfoFn = AbiFunction(
    name: 'getUptimeVoteSignStartInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(
        name: '_uptimeVoteSignStartTs',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_uptimeVoteSignStartBlock',
        type: AbiType.parse('uint64'),
      ),
    ],
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

  /// ABI descriptor for `getVoterRewardsSignInfo(uint24,address)`.
  static final AbiFunction getVoterRewardsSignInfoFn = AbiFunction(
    name: 'getVoterRewardsSignInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_rewardsSignTs', type: AbiType.parse('uint64')),
      AbiParameter(name: '_rewardsSignBlock', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterSigningPolicySignInfo(uint24,address)`.
  static final AbiFunction getVoterSigningPolicySignInfoFn = AbiFunction(
    name: 'getVoterSigningPolicySignInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_signingPolicySignTs', type: AbiType.parse('uint64')),
      AbiParameter(
        name: '_signingPolicySignBlock',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterUptimeVoteSignInfo(uint24,address)`.
  static final AbiFunction getVoterUptimeVoteSignInfoFn = AbiFunction(
    name: 'getVoterUptimeVoteSignInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_uptimeVoteSignTs', type: AbiType.parse('uint64')),
      AbiParameter(name: '_uptimeVoteSignBlock', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterUptimeVoteSubmitInfo(uint24,address)`.
  static final AbiFunction getVoterUptimeVoteSubmitInfoFn = AbiFunction(
    name: 'getVoterUptimeVoteSubmitInfo',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_uptimeVoteSubmitTs', type: AbiType.parse('uint64')),
      AbiParameter(
        name: '_uptimeVoteSubmitBlock',
        type: AbiType.parse('uint64'),
      ),
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

  /// ABI descriptor for `lastInitializedVotingRoundId()`.
  static final AbiFunction lastInitializedVotingRoundIdFn = AbiFunction(
    name: 'lastInitializedVotingRoundId',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_lastInitializedVotingRoundId',
        type: AbiType.parse('uint32'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `newSigningPolicyInitializationStartSeconds()`.
  static final AbiFunction newSigningPolicyInitializationStartSecondsFn =
      AbiFunction(
        name: 'newSigningPolicyInitializationStartSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `newSigningPolicyMinNumberOfVotingRoundsDelay()`.
  static final AbiFunction newSigningPolicyMinNumberOfVotingRoundsDelayFn =
      AbiFunction(
        name: 'newSigningPolicyMinNumberOfVotingRoundsDelay',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint32'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `noOfWeightBasedClaims(uint256,uint256)`.
  static final AbiFunction noOfWeightBasedClaimsFn = AbiFunction(
    name: 'noOfWeightBasedClaims',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_rewardManagerId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `noOfWeightBasedClaimsHash(uint256)`.
  static final AbiFunction noOfWeightBasedClaimsHashFn = AbiFunction(
    name: 'noOfWeightBasedClaimsHash',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `randomAcquisitionMaxDurationBlocks()`.
  static final AbiFunction randomAcquisitionMaxDurationBlocksFn = AbiFunction(
    name: 'randomAcquisitionMaxDurationBlocks',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `randomAcquisitionMaxDurationSeconds()`.
  static final AbiFunction randomAcquisitionMaxDurationSecondsFn = AbiFunction(
    name: 'randomAcquisitionMaxDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochDurationSeconds()`.
  static final AbiFunction rewardEpochDurationSecondsFn = AbiFunction(
    name: 'rewardEpochDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochIdToExpireNext()`.
  static final AbiFunction rewardEpochIdToExpireNextFn = AbiFunction(
    name: 'rewardEpochIdToExpireNext',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_rewardEpochIdToExpireNext',
        type: AbiType.parse('uint24'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardExpiryOffsetSeconds()`.
  static final AbiFunction rewardExpiryOffsetSecondsFn = AbiFunction(
    name: 'rewardExpiryOffsetSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardsHash(uint256)`.
  static final AbiFunction rewardsHashFn = AbiFunction(
    name: 'rewardsHash',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `signingPolicyMinNumberOfVoters()`.
  static final AbiFunction signingPolicyMinNumberOfVotersFn = AbiFunction(
    name: 'signingPolicyMinNumberOfVoters',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint16'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `signingPolicyThresholdPPM()`.
  static final AbiFunction signingPolicyThresholdPPMFn = AbiFunction(
    name: 'signingPolicyThresholdPPM',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `submitUptimeVoteMinDurationBlocks()`.
  static final AbiFunction submitUptimeVoteMinDurationBlocksFn = AbiFunction(
    name: 'submitUptimeVoteMinDurationBlocks',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `submitUptimeVoteMinDurationSeconds()`.
  static final AbiFunction submitUptimeVoteMinDurationSecondsFn = AbiFunction(
    name: 'submitUptimeVoteMinDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `uptimeVoteHash(uint256)`.
  static final AbiFunction uptimeVoteHashFn = AbiFunction(
    name: 'uptimeVoteHash',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `voterRegistrationMinDurationBlocks()`.
  static final AbiFunction voterRegistrationMinDurationBlocksFn = AbiFunction(
    name: 'voterRegistrationMinDurationBlocks',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `voterRegistrationMinDurationSeconds()`.
  static final AbiFunction voterRegistrationMinDurationSecondsFn = AbiFunction(
    name: 'voterRegistrationMinDurationSeconds',
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

  /// Calls `currentRewardEpochExpectedEndTs()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> currentRewardEpochExpectedEndTs() async {
    final out = await client.callFunction(
      contract: address,
      function: currentRewardEpochExpectedEndTsFn,
    );
    return out[0]! as BigInt;
  }

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

  /// Calls `getRandomAcquisitionInfo(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt randomAcquisitionStartTs,
      BigInt randomAcquisitionStartBlock,
      BigInt randomAcquisitionEndTs,
      BigInt randomAcquisitionEndBlock,
    })
  >
  getRandomAcquisitionInfo(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomAcquisitionInfoFn,
      args: [rewardEpochId],
    );
    return (
      randomAcquisitionStartTs: out[0]! as BigInt,
      randomAcquisitionStartBlock: out[1]! as BigInt,
      randomAcquisitionEndTs: out[2]! as BigInt,
      randomAcquisitionEndBlock: out[3]! as BigInt,
    );
  }

  /// Calls `getRewardEpochStartInfo(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt rewardEpochStartTs, BigInt rewardEpochStartBlock})>
  getRewardEpochStartInfo(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochStartInfoFn,
      args: [rewardEpochId],
    );
    return (
      rewardEpochStartTs: out[0]! as BigInt,
      rewardEpochStartBlock: out[1]! as BigInt,
    );
  }

  /// Calls `getRewardsSignInfo(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt rewardsSignStartTs,
      BigInt rewardsSignStartBlock,
      BigInt rewardsSignEndTs,
      BigInt rewardsSignEndBlock,
    })
  >
  getRewardsSignInfo(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardsSignInfoFn,
      args: [rewardEpochId],
    );
    return (
      rewardsSignStartTs: out[0]! as BigInt,
      rewardsSignStartBlock: out[1]! as BigInt,
      rewardsSignEndTs: out[2]! as BigInt,
      rewardsSignEndBlock: out[3]! as BigInt,
    );
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

  /// Calls `getSigningPolicySignInfo(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt signingPolicySignStartTs,
      BigInt signingPolicySignStartBlock,
      BigInt signingPolicySignEndTs,
      BigInt signingPolicySignEndBlock,
    })
  >
  getSigningPolicySignInfo(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getSigningPolicySignInfoFn,
      args: [rewardEpochId],
    );
    return (
      signingPolicySignStartTs: out[0]! as BigInt,
      signingPolicySignStartBlock: out[1]! as BigInt,
      signingPolicySignEndTs: out[2]! as BigInt,
      signingPolicySignEndBlock: out[3]! as BigInt,
    );
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

  /// Calls `getUptimeVoteSignStartInfo(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt uptimeVoteSignStartTs, BigInt uptimeVoteSignStartBlock})>
  getUptimeVoteSignStartInfo(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getUptimeVoteSignStartInfoFn,
      args: [rewardEpochId],
    );
    return (
      uptimeVoteSignStartTs: out[0]! as BigInt,
      uptimeVoteSignStartBlock: out[1]! as BigInt,
    );
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

  /// Calls `getVoterRewardsSignInfo(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt rewardsSignTs, BigInt rewardsSignBlock})>
  getVoterRewardsSignInfo(BigInt rewardEpochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterRewardsSignInfoFn,
      args: [rewardEpochId, voter],
    );
    return (
      rewardsSignTs: out[0]! as BigInt,
      rewardsSignBlock: out[1]! as BigInt,
    );
  }

  /// Calls `getVoterSigningPolicySignInfo(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt signingPolicySignTs, BigInt signingPolicySignBlock})>
  getVoterSigningPolicySignInfo(BigInt rewardEpochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterSigningPolicySignInfoFn,
      args: [rewardEpochId, voter],
    );
    return (
      signingPolicySignTs: out[0]! as BigInt,
      signingPolicySignBlock: out[1]! as BigInt,
    );
  }

  /// Calls `getVoterUptimeVoteSignInfo(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt uptimeVoteSignTs, BigInt uptimeVoteSignBlock})>
  getVoterUptimeVoteSignInfo(BigInt rewardEpochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterUptimeVoteSignInfoFn,
      args: [rewardEpochId, voter],
    );
    return (
      uptimeVoteSignTs: out[0]! as BigInt,
      uptimeVoteSignBlock: out[1]! as BigInt,
    );
  }

  /// Calls `getVoterUptimeVoteSubmitInfo(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt uptimeVoteSubmitTs, BigInt uptimeVoteSubmitBlock})>
  getVoterUptimeVoteSubmitInfo(BigInt rewardEpochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterUptimeVoteSubmitInfoFn,
      args: [rewardEpochId, voter],
    );
    return (
      uptimeVoteSubmitTs: out[0]! as BigInt,
      uptimeVoteSubmitBlock: out[1]! as BigInt,
    );
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

  /// Calls `lastInitializedVotingRoundId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> lastInitializedVotingRoundId() async {
    final out = await client.callFunction(
      contract: address,
      function: lastInitializedVotingRoundIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `newSigningPolicyInitializationStartSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> newSigningPolicyInitializationStartSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: newSigningPolicyInitializationStartSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `newSigningPolicyMinNumberOfVotingRoundsDelay()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> newSigningPolicyMinNumberOfVotingRoundsDelay() async {
    final out = await client.callFunction(
      contract: address,
      function: newSigningPolicyMinNumberOfVotingRoundsDelayFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `noOfWeightBasedClaims(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> noOfWeightBasedClaims(
    BigInt rewardEpochId,
    BigInt rewardManagerId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: noOfWeightBasedClaimsFn,
      args: [rewardEpochId, rewardManagerId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `noOfWeightBasedClaimsHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> noOfWeightBasedClaimsHash(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: noOfWeightBasedClaimsHashFn,
      args: [rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `randomAcquisitionMaxDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> randomAcquisitionMaxDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: randomAcquisitionMaxDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `randomAcquisitionMaxDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> randomAcquisitionMaxDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: randomAcquisitionMaxDurationSecondsFn,
    );
    return out[0]! as BigInt;
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

  /// Calls `rewardEpochIdToExpireNext()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardEpochIdToExpireNext() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardEpochIdToExpireNextFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `rewardExpiryOffsetSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardExpiryOffsetSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardExpiryOffsetSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `rewardsHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> rewardsHash(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: rewardsHashFn,
      args: [rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `signingPolicyMinNumberOfVoters()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicyMinNumberOfVoters() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicyMinNumberOfVotersFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicyThresholdPPM()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicyThresholdPPM() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicyThresholdPPMFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `submitUptimeVoteMinDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> submitUptimeVoteMinDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: submitUptimeVoteMinDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `submitUptimeVoteMinDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> submitUptimeVoteMinDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: submitUptimeVoteMinDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `uptimeVoteHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> uptimeVoteHash(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: uptimeVoteHashFn,
      args: [rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `voterRegistrationMinDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> voterRegistrationMinDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: voterRegistrationMinDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `voterRegistrationMinDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> voterRegistrationMinDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: voterRegistrationMinDurationSecondsFn,
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

  /// `ClosingExpiredRewardEpochFailed(uint24)`
  ///
  /// Decode a matching log with
  /// `closingExpiredRewardEpochFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent closingExpiredRewardEpochFailedEvent = AbiEvent(
    name: 'ClosingExpiredRewardEpochFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
    ],
  );

  /// `RandomAcquisitionStarted(uint24,uint64)`
  ///
  /// Decode a matching log with
  /// `randomAcquisitionStartedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent randomAcquisitionStartedEvent = AbiEvent(
    name: 'RandomAcquisitionStarted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `RewardEpochStarted(uint24,uint32,uint64)`
  ///
  /// Decode a matching log with
  /// `rewardEpochStartedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardEpochStartedEvent = AbiEvent(
    name: 'RewardEpochStarted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'startVotingRoundId',
        type: AbiType.parse('uint32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsSigned(uint24,address,address,bytes32,(uint256,uint256)[],uint64,bool)`
  ///
  /// Decode a matching log with
  /// `rewardsSignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsSignedEvent = AbiEvent(
    name: 'RewardsSigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardsHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'noOfWeightBasedClaims',
        type: AbiType.parse('(uint256,uint256)[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'thresholdReached',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `SettingCleanUpBlockNumberFailed(uint64)`
  ///
  /// Decode a matching log with
  /// `settingCleanUpBlockNumberFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent settingCleanUpBlockNumberFailedEvent = AbiEvent(
    name: 'SettingCleanUpBlockNumberFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'blockNumber',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `SignUptimeVoteEnabled(uint24,uint64)`
  ///
  /// Decode a matching log with
  /// `signUptimeVoteEnabledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signUptimeVoteEnabledEvent = AbiEvent(
    name: 'SignUptimeVoteEnabled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `SigningPolicySigned(uint24,address,address,uint64,bool)`
  ///
  /// Decode a matching log with
  /// `signingPolicySignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signingPolicySignedEvent = AbiEvent(
    name: 'SigningPolicySigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'thresholdReached',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `TriggeringVoterRegistrationFailed(uint24)`
  ///
  /// Decode a matching log with
  /// `triggeringVoterRegistrationFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent triggeringVoterRegistrationFailedEvent = AbiEvent(
    name: 'TriggeringVoterRegistrationFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
    ],
  );

  /// `UptimeVoteSigned(uint24,address,address,bytes32,uint64,bool)`
  ///
  /// Decode a matching log with
  /// `uptimeVoteSignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent uptimeVoteSignedEvent = AbiEvent(
    name: 'UptimeVoteSigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'uptimeVoteHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'thresholdReached',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `UptimeVoteSubmitted(uint24,address,address,bytes20[],uint64)`
  ///
  /// Decode a matching log with
  /// `uptimeVoteSubmittedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent uptimeVoteSubmittedEvent = AbiEvent(
    name: 'UptimeVoteSubmitted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeIds',
        type: AbiType.parse('bytes20[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `VotePowerBlockSelected(uint24,uint64,uint64)`
  ///
  /// Decode a matching log with
  /// `votePowerBlockSelectedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent votePowerBlockSelectedEvent = AbiEvent(
    name: 'VotePowerBlockSelected',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'votePowerBlock',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    closingExpiredRewardEpochFailedEvent,
    randomAcquisitionStartedEvent,
    rewardEpochStartedEvent,
    rewardsSignedEvent,
    settingCleanUpBlockNumberFailedEvent,
    signUptimeVoteEnabledEvent,
    signingPolicySignedEvent,
    triggeringVoterRegistrationFailedEvent,
    uptimeVoteSignedEvent,
    uptimeVoteSubmittedEvent,
    votePowerBlockSelectedEvent,
  ];

  /// Decodes [log] into whichever of [allEvents] it matches.
  ///
  /// Returns null when the log belongs to a different event,
  /// which is normal: one address emits many event types and
  /// an address-only filter returns all of them.
  static DecodedLog? decodeLog(FlareLog log) {
    for (final event in allEvents) {
      if (!event.matches(log.topics)) continue;
      return DecodedLog(
        log: log,
        event: event,
        values: event.decode(topics: log.topics, data: log.data),
      );
    }
    return null;
  }
}
