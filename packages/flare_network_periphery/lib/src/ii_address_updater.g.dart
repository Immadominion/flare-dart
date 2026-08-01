// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIAddressUpdater
// Functions: 5 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIAddressUpdater` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIAddressUpdaterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIAddressUpdaterContract({required this.client, required this.address});

  /// Resolves `IIAddressUpdater` through the [ContractRegistry].
  static Future<IIAddressUpdaterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIAddressUpdater',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIAddressUpdaterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getContractAddress(string)`.
  static final AbiFunction getContractAddressFn = AbiFunction(
    name: 'getContractAddress',
    inputs: [
      AbiParameter(name: '_name', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressByHash(bytes32)`.
  static final AbiFunction getContractAddressByHashFn = AbiFunction(
    name: 'getContractAddressByHash',
    inputs: [
      AbiParameter(name: '_nameHash', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddresses(string[])`.
  static final AbiFunction getContractAddressesFn = AbiFunction(
    name: 'getContractAddresses',
    inputs: [
      AbiParameter(name: '_names', type: AbiType.parse('string[]')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractAddressesByHash(bytes32[])`.
  static final AbiFunction getContractAddressesByHashFn = AbiFunction(
    name: 'getContractAddressesByHash',
    inputs: [
      AbiParameter(name: '_nameHashes', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractNamesAndAddresses()`.
  static final AbiFunction getContractNamesAndAddressesFn = AbiFunction(
    name: 'getContractNamesAndAddresses',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_contractNames', type: AbiType.parse('string[]')),
      AbiParameter(name: '_contractAddresses', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getContractAddress(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getContractAddress(String name) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressFn,
      args: [name],
    );
    return out[0]! as EthAddress;
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

  /// Calls `getContractAddresses(string[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getContractAddresses(List<String> names) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressesFn,
      args: [names],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getContractAddressesByHash(bytes32[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getContractAddressesByHash(List<Uint8List> nameHashes) async {
    final out = await client.callFunction(
      contract: address,
      function: getContractAddressesByHashFn,
      args: [nameHashes],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getContractNamesAndAddresses()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<String> contractNames, List<EthAddress> contractAddresses})> getContractNamesAndAddresses() async {
    final out = await client.callFunction(
      contract: address,
      function: getContractNamesAndAddressesFn,
    );
    return (contractNames: (out[0]! as List).cast<String>(), contractAddresses: (out[1]! as List).cast<EthAddress>());
  }

}
