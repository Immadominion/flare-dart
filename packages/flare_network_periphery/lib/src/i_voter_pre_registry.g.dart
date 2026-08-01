// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVoterPreRegistry
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IVoterPreRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVoterPreRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVoterPreRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IVoterPreRegistry` through the [ContractRegistry].
  static Future<IVoterPreRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IVoterPreRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IVoterPreRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPreRegisteredVoters(uint256)`.
  static final AbiFunction getPreRegisteredVotersFn = AbiFunction(
    name: 'getPreRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterSignature(uint256,address)`.
  static final AbiFunction getVoterSignatureFn = AbiFunction(
    name: 'getVoterSignature',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint8,bytes32,bytes32)')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isVoterPreRegistered(uint256,address)`.
  static final AbiFunction isVoterPreRegisteredFn = AbiFunction(
    name: 'isVoterPreRegistered',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getPreRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getPreRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getPreRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getVoterSignature(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getVoterSignature(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterSignatureFn,
      args: [rewardEpochId, voter],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `isVoterPreRegistered(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isVoterPreRegistered(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isVoterPreRegisteredFn,
      args: [rewardEpochId, voter],
    );
    return out[0]! as bool;
  }
}
