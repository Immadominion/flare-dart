// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIPollingFoundation
// Functions: 7 readable of 14 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIPollingFoundation` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIPollingFoundationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIPollingFoundationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIPollingFoundation` through the [ContractRegistry].
  static Future<IIPollingFoundationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIPollingFoundation',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIPollingFoundationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `execute(address[],uint256[],bytes[],string)`.
  static final AbiFunction executeFn = AbiFunction(
    name: 'execute',
    inputs: [
      AbiParameter(name: '_targets', type: AbiType.parse('address[]')),
      AbiParameter(name: '_values', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_calldatas', type: AbiType.parse('bytes[]')),
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `getProposalInfo(uint256)`.
  static final AbiFunction getProposalInfoFn = AbiFunction(
    name: 'getProposalInfo',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_proposer', type: AbiType.parse('address')),
      AbiParameter(name: '_accept', type: AbiType.parse('bool')),
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_execStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_execEndTime', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_thresholdConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_majorityConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_circulatingSupply', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalVotes(uint256)`.
  static final AbiFunction getProposalVotesFn = AbiFunction(
    name: 'getProposalVotes',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_for', type: AbiType.parse('uint256')),
      AbiParameter(name: '_against', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address,uint256)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `hasVoted(uint256,address)`.
  static final AbiFunction hasVotedFn = AbiFunction(
    name: 'hasVoted',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isProposer(address)`.
  static final AbiFunction isProposerFn = AbiFunction(
    name: 'isProposer',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `state(uint256)`.
  static final AbiFunction stateFn = AbiFunction(
    name: 'state',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `execute(address[],uint256[],bytes[],string)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> execute(
    List<EthAddress> targets,
    List<BigInt> values,
    List<Uint8List> calldatas,
    String description,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: executeFn,
      args: [targets, values, calldatas, description],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getProposalInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      EthAddress proposer,
      bool accept,
      BigInt votePowerBlock,
      BigInt voteStartTime,
      BigInt voteEndTime,
      BigInt execStartTime,
      BigInt execEndTime,
      BigInt thresholdConditionBIPS,
      BigInt majorityConditionBIPS,
      BigInt circulatingSupply,
    })
  >
  getProposalInfo(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalInfoFn,
      args: [proposalId],
    );
    return (
      proposer: out[0]! as EthAddress,
      accept: out[1]! as bool,
      votePowerBlock: out[2]! as BigInt,
      voteStartTime: out[3]! as BigInt,
      voteEndTime: out[4]! as BigInt,
      execStartTime: out[5]! as BigInt,
      execEndTime: out[6]! as BigInt,
      thresholdConditionBIPS: out[7]! as BigInt,
      majorityConditionBIPS: out[8]! as BigInt,
      circulatingSupply: out[9]! as BigInt,
    );
  }

  /// Calls `getProposalVotes(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt forValue, BigInt against})> getProposalVotes(
    BigInt proposalId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalVotesFn,
      args: [proposalId],
    );
    return (forValue: out[0]! as BigInt, against: out[1]! as BigInt);
  }

  /// Calls `getVotes(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotes(EthAddress voter, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [voter, blockNumber],
    );
    return out[0]! as BigInt;
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

  /// Calls `isProposer(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isProposer(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isProposerFn,
      args: [account],
    );
    return out[0]! as bool;
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
