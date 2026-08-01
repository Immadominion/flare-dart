// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFlareContractRegistry
// Functions: 5 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFlareContractRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFlareContractRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFlareContractRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFlareContractRegistry` through the [ContractRegistry].
  ///
  /// Registered as `FlareContractRegistry`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFlareContractRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FlareContractRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFlareContractRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAllContracts()`.
  static final AbiFunction getAllContractsFn = AbiFunction(
    name: 'getAllContracts',
    inputs: [],
    outputs: [
      AbiParameter(name: '_names', type: AbiType.parse('string[]')),
      AbiParameter(name: '_addresses', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressByHash(bytes32)`.
  static final AbiFunction getContractAddressByHashFn = AbiFunction(
    name: 'getContractAddressByHash',
    inputs: [AbiParameter(name: '_nameHash', type: AbiType.parse('bytes32'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressByName(string)`.
  static final AbiFunction getContractAddressByNameFn = AbiFunction(
    name: 'getContractAddressByName',
    inputs: [AbiParameter(name: '_name', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressesByHash(bytes32[])`.
  static final AbiFunction getContractAddressesByHashFn = AbiFunction(
    name: 'getContractAddressesByHash',
    inputs: [
      AbiParameter(name: '_nameHashes', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressesByName(string[])`.
  static final AbiFunction getContractAddressesByNameFn = AbiFunction(
    name: 'getContractAddressesByName',
    inputs: [AbiParameter(name: '_names', type: AbiType.parse('string[]'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAllContracts()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<String> names, List<EthAddress> addresses})>
  getAllContracts() async {
    final out = await client.callFunction(
      contract: address,
      function: getAllContractsFn,
    );
    return (
      names: (out[0]! as List).cast<String>(),
      addresses: (out[1]! as List).cast<EthAddress>(),
    );
  }

  /// Calls `getContractAddressByHash(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getContractAddressByHash(Uint8List nameHash) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressByHashFn,
      args: [nameHash],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getContractAddressByName(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getContractAddressByName(String name) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressByNameFn,
      args: [name],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getContractAddressesByHash(bytes32[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getContractAddressesByHash(
    List<Uint8List> nameHashes,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressesByHashFn,
      args: [nameHashes],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getContractAddressesByName(string[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getContractAddressesByName(
    List<String> names,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressesByNameFn,
      args: [names],
    );
    return (out[0]! as List).cast<EthAddress>();
  }
}
