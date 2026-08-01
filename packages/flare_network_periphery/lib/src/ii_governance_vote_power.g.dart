// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIGovernanceVotePower
// Functions: 7 readable of 12 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIGovernanceVotePower` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIGovernanceVotePowerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIGovernanceVotePowerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIGovernanceVotePower` through the [ContractRegistry].
  static Future<IIGovernanceVotePowerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIGovernanceVotePower',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIGovernanceVotePowerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCleanupBlockNumber()`.
  static final AbiFunction getCleanupBlockNumberFn = AbiFunction(
    name: 'getCleanupBlockNumber',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAt(address,uint256)`.
  static final AbiFunction getDelegateOfAtFn = AbiFunction(
    name: 'getDelegateOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAtNow(address)`.
  static final AbiFunction getDelegateOfAtNowFn = AbiFunction(
    name: 'getDelegateOfAtNow',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ownerToken()`.
  static final AbiFunction ownerTokenFn = AbiFunction(
    name: 'ownerToken',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pChainStakeMirror()`.
  static final AbiFunction pChainStakeMirrorFn = AbiFunction(
    name: 'pChainStakeMirror',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCleanupBlockNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCleanupBlockNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: getCleanupBlockNumberFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDelegateOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDelegateOfAtNow(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAtNow(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtNowFn,
      args: [who],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVotes(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotes(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [who],
    );
    return out[0]! as BigInt;
  }

  /// Calls `ownerToken()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> ownerToken() async {
    final out = await client.callFunction(
      contract: address,
      function: ownerTokenFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `pChainStakeMirror()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> pChainStakeMirror() async {
    final out = await client.callFunction(
      contract: address,
      function: pChainStakeMirrorFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `votePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as BigInt;
  }
}
