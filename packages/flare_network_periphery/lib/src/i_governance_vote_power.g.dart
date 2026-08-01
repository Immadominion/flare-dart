// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IGovernanceVotePower
// Functions: 4 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IGovernanceVotePower` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IGovernanceVotePowerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IGovernanceVotePowerContract({required this.client, required this.address});

  /// Resolves `IGovernanceVotePower` through the [ContractRegistry].
  static Future<IGovernanceVotePowerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IGovernanceVotePower',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IGovernanceVotePowerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDelegateOfAt(address,uint256)`.
  static final AbiFunction getDelegateOfAtFn = AbiFunction(
    name: 'getDelegateOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAtNow(address)`.
  static final AbiFunction getDelegateOfAtNowFn = AbiFunction(
    name: 'getDelegateOfAtNow',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

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
