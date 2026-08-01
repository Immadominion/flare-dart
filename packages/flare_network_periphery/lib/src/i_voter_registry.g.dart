// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVoterRegistry
// Functions: 7 readable of 8 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IVoterRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVoterRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVoterRegistryContract({required this.client, required this.address});

  /// Resolves `IVoterRegistry` through the [ContractRegistry].
  static Future<IVoterRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IVoterRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IVoterRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `chilledUntilRewardEpochId(bytes20)`.
  static final AbiFunction chilledUntilRewardEpochIdFn = AbiFunction(
    name: 'chilledUntilRewardEpochId',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('bytes20')),
    ],
    outputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNumberOfRegisteredVoters(uint256)`.
  static final AbiFunction getNumberOfRegisteredVotersFn = AbiFunction(
    name: 'getNumberOfRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredVoters(uint256)`.
  static final AbiFunction getRegisteredVotersFn = AbiFunction(
    name: 'getRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isVoterRegistered(address,uint256)`.
  static final AbiFunction isVoterRegisteredFn = AbiFunction(
    name: 'isVoterRegistered',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `maxVoters()`.
  static final AbiFunction maxVotersFn = AbiFunction(
    name: 'maxVoters',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `newSigningPolicyInitializationStartBlockNumber(uint256)`.
  static final AbiFunction newSigningPolicyInitializationStartBlockNumberFn = AbiFunction(
    name: 'newSigningPolicyInitializationStartBlockNumber',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `publicKeyRequired()`.
  static final AbiFunction publicKeyRequiredFn = AbiFunction(
    name: 'publicKeyRequired',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `chilledUntilRewardEpochId(bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> chilledUntilRewardEpochId(Uint8List beneficiary) async {
    final out = await client.callFunction(
      contract: address,
      function: chilledUntilRewardEpochIdFn,
      args: [beneficiary],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNumberOfRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNumberOfRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getNumberOfRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `isVoterRegistered(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isVoterRegistered(EthAddress voter, BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: isVoterRegisteredFn,
      args: [voter, rewardEpochId],
    );
    return out[0]! as bool;
  }

  /// Calls `maxVoters()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxVoters() async {
    final out = await client.callFunction(
      contract: address,
      function: maxVotersFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `newSigningPolicyInitializationStartBlockNumber(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> newSigningPolicyInitializationStartBlockNumber(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: newSigningPolicyInitializationStartBlockNumberFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `publicKeyRequired()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> publicKeyRequired() async {
    final out = await client.callFunction(
      contract: address,
      function: publicKeyRequiredFn,
    );
    return out[0]! as bool;
  }

}
