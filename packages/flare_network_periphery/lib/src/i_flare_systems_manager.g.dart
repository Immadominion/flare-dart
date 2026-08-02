// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFlareSystemsManager
// Functions: 17 — 13 readable via eth_call, 4 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFlareSystemsManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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

  /// ABI descriptor for `signNewSigningPolicy(uint24,bytes32,(uint8,bytes32,bytes32))`.
  static final AbiFunction signNewSigningPolicyFn = AbiFunction(
    name: 'signNewSigningPolicy',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(
        name: '_newSigningPolicyHash',
        type: AbiType.parse('bytes32'),
      ),
      AbiParameter(
        name: '_signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `signRewards(uint24,(uint256,uint256)[],bytes32,(uint8,bytes32,bytes32))`.
  static final AbiFunction signRewardsFn = AbiFunction(
    name: 'signRewards',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(
        name: '_noOfWeightBasedClaims',
        type: AbiType.parse('(uint256,uint256)[]'),
      ),
      AbiParameter(name: '_rewardsHash', type: AbiType.parse('bytes32')),
      AbiParameter(
        name: '_signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `signUptimeVote(uint24,bytes32,(uint8,bytes32,bytes32))`.
  static final AbiFunction signUptimeVoteFn = AbiFunction(
    name: 'signUptimeVote',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_uptimeVoteHash', type: AbiType.parse('bytes32')),
      AbiParameter(
        name: '_signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `submitUptimeVote(uint24,bytes20[],(uint8,bytes32,bytes32))`.
  static final AbiFunction submitUptimeVoteFn = AbiFunction(
    name: 'submitUptimeVote',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_nodeIds', type: AbiType.parse('bytes20[]')),
      AbiParameter(
        name: '_signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// Builds an unsigned `signNewSigningPolicy(uint24,bytes32,(uint8,bytes32,bytes32))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest signNewSigningPolicyTx(
    BigInt rewardEpochId,
    Uint8List newSigningPolicyHash,
    List<Object?> signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: signNewSigningPolicyFn,
    args: [rewardEpochId, newSigningPolicyHash, signature],
    from: from,
  );

  /// Builds an unsigned `signRewards(uint24,(uint256,uint256)[],bytes32,(uint8,bytes32,bytes32))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest signRewardsTx(
    BigInt rewardEpochId,
    List<List<Object?>> noOfWeightBasedClaims,
    Uint8List rewardsHash,
    List<Object?> signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: signRewardsFn,
    args: [rewardEpochId, noOfWeightBasedClaims, rewardsHash, signature],
    from: from,
  );

  /// Builds an unsigned `signUptimeVote(uint24,bytes32,(uint8,bytes32,bytes32))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest signUptimeVoteTx(
    BigInt rewardEpochId,
    Uint8List uptimeVoteHash,
    List<Object?> signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: signUptimeVoteFn,
    args: [rewardEpochId, uptimeVoteHash, signature],
    from: from,
  );

  /// Builds an unsigned `submitUptimeVote(uint24,bytes20[],(uint8,bytes32,bytes32))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest submitUptimeVoteTx(
    BigInt rewardEpochId,
    List<Uint8List> nodeIds,
    List<Object?> signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: submitUptimeVoteFn,
    args: [rewardEpochId, nodeIds, signature],
    from: from,
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
    randomAcquisitionStartedEvent,
    rewardEpochStartedEvent,
    rewardsSignedEvent,
    signUptimeVoteEnabledEvent,
    signingPolicySignedEvent,
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
