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

  const IPChainStakeMirrorMultiSigVotingContract({required this.client, required this.address});

  /// Resolves `IPChainStakeMirrorMultiSigVoting` through the [ContractRegistry].
  static Future<IPChainStakeMirrorMultiSigVotingContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPChainStakeMirrorMultiSigVoting',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPChainStakeMirrorMultiSigVotingContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentEpochId()`.
  static final AbiFunction getCurrentEpochIdFn = AbiFunction(
    name: 'getCurrentEpochId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochConfiguration()`.
  static final AbiFunction getEpochConfigurationFn = AbiFunction(
    name: 'getEpochConfiguration',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_firstEpochStartTs', type: AbiType.parse('uint256')),
      AbiParameter(name: '_epochDurationSeconds', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochId(uint256)`.
  static final AbiFunction getEpochIdFn = AbiFunction(
    name: 'getEpochId',
    inputs: [
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getMerkleRoot(uint256)`.
  static final AbiFunction getMerkleRootFn = AbiFunction(
    name: 'getMerkleRoot',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoters()`.
  static final AbiFunction getVotersFn = AbiFunction(
    name: 'getVoters',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(uint256)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(bytes32,address[])[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotingThreshold()`.
  static final AbiFunction getVotingThresholdFn = AbiFunction(
    name: 'getVotingThreshold',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `shouldVote(uint256,address)`.
  static final AbiFunction shouldVoteFn = AbiFunction(
    name: 'shouldVote',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
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
  Future<({BigInt firstEpochStartTs, BigInt epochDurationSeconds})> getEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochConfigurationFn,
    );
    return (firstEpochStartTs: out[0]! as BigInt, epochDurationSeconds: out[1]! as BigInt);
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

}
