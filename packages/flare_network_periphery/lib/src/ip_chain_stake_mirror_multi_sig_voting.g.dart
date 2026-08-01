// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPChainStakeMirrorMultiSigVoting
// Functions: 8 readable of 10 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPChainStakeMirrorMultiSigVoting` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPChainStakeMirrorMultiSigVotingContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPChainStakeMirrorMultiSigVotingContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IPChainStakeMirrorMultiSigVoting` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPChainStakeMirrorMultiSigVotingContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPChainStakeMirrorMultiSigVotingContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `getCurrentEpochId()`.
  static final AbiFunction getCurrentEpochIdFn = AbiFunction(
    name: 'getCurrentEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochConfiguration()`.
  static final AbiFunction getEpochConfigurationFn = AbiFunction(
    name: 'getEpochConfiguration',
    inputs: [],
    outputs: [
      AbiParameter(name: '_firstEpochStartTs', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_epochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochId(uint256)`.
  static final AbiFunction getEpochIdFn = AbiFunction(
    name: 'getEpochId',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getMerkleRoot(uint256)`.
  static final AbiFunction getMerkleRootFn = AbiFunction(
    name: 'getMerkleRoot',
    inputs: [AbiParameter(name: '_epochId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoters()`.
  static final AbiFunction getVotersFn = AbiFunction(
    name: 'getVoters',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(uint256)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [AbiParameter(name: '_epochId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(bytes32,address[])[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotingThreshold()`.
  static final AbiFunction getVotingThresholdFn = AbiFunction(
    name: 'getVotingThreshold',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `shouldVote(uint256,address)`.
  static final AbiFunction shouldVoteFn = AbiFunction(
    name: 'shouldVote',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt firstEpochStartTs, BigInt epochDurationSeconds})>
  getEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochConfigurationFn,
    );
    return (
      firstEpochStartTs: out[0]! as BigInt,
      epochDurationSeconds: out[1]! as BigInt,
    );
  }

  /// Calls `getEpochId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochId(BigInt timestamp) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochIdFn,
      args: [timestamp],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getMerkleRoot(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getMerkleRoot(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getMerkleRootFn,
      args: [epochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getVoters()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getVoters() async {
    final out = await client.callFunction(
      contract: address,
      function: getVotersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getVotes(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getVotes(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [epochId],
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getVotingThreshold()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotingThreshold() async {
    final out = await client.callFunction(
      contract: address,
      function: getVotingThresholdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `shouldVote(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> shouldVote(BigInt epochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: shouldVoteFn,
      args: [epochId, voter],
    );
    return out[0]! as bool;
  }

  /// `PChainStakeMirrorValidatorUptimeVoteSubmitted(uint256,uint256,address,bytes20[])`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorValidatorUptimeVoteSubmittedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorValidatorUptimeVoteSubmittedEvent =
      AbiEvent(
        name: 'PChainStakeMirrorValidatorUptimeVoteSubmitted',
        anonymous: false,
        parameters: [
          AbiEventParameter(
            name: 'rewardEpochId',
            type: AbiType.parse('uint256'),
            indexed: true,
          ),
          AbiEventParameter(
            name: 'timestamp',
            type: AbiType.parse('uint256'),
            indexed: true,
          ),
          AbiEventParameter(
            name: 'voter',
            type: AbiType.parse('address'),
            indexed: false,
          ),
          AbiEventParameter(
            name: 'nodeIds',
            type: AbiType.parse('bytes20[]'),
            indexed: false,
          ),
        ],
      );

  /// `PChainStakeMirrorVoteSubmitted(uint256,address,bytes32)`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorVoteSubmittedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorVoteSubmittedEvent = AbiEvent(
    name: 'PChainStakeMirrorVoteSubmitted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'merkleRoot',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `PChainStakeMirrorVotersSet(address[])`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorVotersSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorVotersSetEvent = AbiEvent(
    name: 'PChainStakeMirrorVotersSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voters',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
    ],
  );

  /// `PChainStakeMirrorVotingFinalized(uint256,bytes32)`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorVotingFinalizedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorVotingFinalizedEvent = AbiEvent(
    name: 'PChainStakeMirrorVotingFinalized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'merkleRoot',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `PChainStakeMirrorVotingReset(uint256)`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorVotingResetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorVotingResetEvent = AbiEvent(
    name: 'PChainStakeMirrorVotingReset',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PChainStakeMirrorVotingThresholdSet(uint256)`
  ///
  /// Decode a matching log with
  /// `pChainStakeMirrorVotingThresholdSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pChainStakeMirrorVotingThresholdSetEvent = AbiEvent(
    name: 'PChainStakeMirrorVotingThresholdSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'votingThreshold',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    pChainStakeMirrorValidatorUptimeVoteSubmittedEvent,
    pChainStakeMirrorVoteSubmittedEvent,
    pChainStakeMirrorVotersSetEvent,
    pChainStakeMirrorVotingFinalizedEvent,
    pChainStakeMirrorVotingResetEvent,
    pChainStakeMirrorVotingThresholdSetEvent,
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
