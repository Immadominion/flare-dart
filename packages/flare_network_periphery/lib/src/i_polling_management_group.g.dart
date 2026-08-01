// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPollingManagementGroup
// Functions: 10 readable of 15 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPollingManagementGroup` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPollingManagementGroupContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPollingManagementGroupContract({required this.client, required this.address});

  /// Resolves `IPollingManagementGroup` through the [ContractRegistry].
  static Future<IPollingManagementGroupContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPollingManagementGroup',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPollingManagementGroupContract(client: client, address: resolved);
  }

  /// ABI descriptor for `canPropose(address)`.
  static final AbiFunction canProposeFn = AbiFunction(
    name: 'canPropose',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `canVote(address,uint256)`.
  static final AbiFunction canVoteFn = AbiFunction(
    name: 'canVote',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getLastProposal()`.
  static final AbiFunction getLastProposalFn = AbiFunction(
    name: 'getLastProposal',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalDescription(uint256)`.
  static final AbiFunction getProposalDescriptionFn = AbiFunction(
    name: 'getProposalDescription',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalInfo(uint256)`.
  static final AbiFunction getProposalInfoFn = AbiFunction(
    name: 'getProposalInfo',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_description', type: AbiType.parse('string')),
      AbiParameter(name: '_proposer', type: AbiType.parse('address')),
      AbiParameter(name: '_accept', type: AbiType.parse('bool')),
      AbiParameter(name: '_voteStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_thresholdConditionBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_majorityConditionBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_noOfEligibleMembers', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalVotes(uint256)`.
  static final AbiFunction getProposalVotesFn = AbiFunction(
    name: 'getProposalVotes',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_for', type: AbiType.parse('uint256')),
      AbiParameter(name: '_against', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `hasVoted(uint256,address)`.
  static final AbiFunction hasVotedFn = AbiFunction(
    name: 'hasVoted',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isMember(address)`.
  static final AbiFunction isMemberFn = AbiFunction(
    name: 'isMember',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `propose(string)`.
  static final AbiFunction proposeFn = AbiFunction(
    name: 'propose',
    inputs: [
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `state(uint256)`.
  static final AbiFunction stateFn = AbiFunction(
    name: 'state',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint8')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `canPropose(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> canPropose(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: canProposeFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `canVote(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> canVote(EthAddress account, BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: canVoteFn,
      args: [account, proposalId],
    );
    return out[0]! as bool;
  }

  /// Calls `getLastProposal()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt proposalId, String description})> getLastProposal() async {
    final out = await client.callFunction(
      contract: address,
      function: getLastProposalFn,
    );
    return (proposalId: out[0]! as BigInt, description: out[1]! as String);
  }

  /// Calls `getProposalDescription(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getProposalDescription(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalDescriptionFn,
      args: [proposalId],
    );
    return out[0]! as String;
  }

  /// Calls `getProposalInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({String description, EthAddress proposer, bool accept, BigInt voteStartTime, BigInt voteEndTime, BigInt thresholdConditionBIPS, BigInt majorityConditionBIPS, BigInt noOfEligibleMembers})> getProposalInfo(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalInfoFn,
      args: [proposalId],
    );
    return (description: out[0]! as String, proposer: out[1]! as EthAddress, accept: out[2]! as bool, voteStartTime: out[3]! as BigInt, voteEndTime: out[4]! as BigInt, thresholdConditionBIPS: out[5]! as BigInt, majorityConditionBIPS: out[6]! as BigInt, noOfEligibleMembers: out[7]! as BigInt);
  }

  /// Calls `getProposalVotes(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt forValue, BigInt against})> getProposalVotes(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalVotesFn,
      args: [proposalId],
    );
    return (forValue: out[0]! as BigInt, against: out[1]! as BigInt);
  }

  /// Calls `hasVoted(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> hasVoted(BigInt proposalId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: hasVotedFn,
      args: [proposalId, voter],
    );
    return out[0]! as bool;
  }

  /// Calls `isMember(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isMember(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: isMemberFn,
      args: [voter],
    );
    return out[0]! as bool;
  }

  /// Calls `propose(string)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> propose(String description) async {
    final out = await client.callFunction(
      contract: address,
      function: proposeFn,
      args: [description],
    );
    return out[0]! as BigInt;
  }

  /// Calls `state(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> state(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: stateFn,
      args: [proposalId],
    );
    return out[0]! as BigInt;
  }

}
