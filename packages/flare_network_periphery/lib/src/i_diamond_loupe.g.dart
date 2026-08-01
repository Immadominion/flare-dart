// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDiamondLoupe
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDiamondLoupe` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDiamondLoupeContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDiamondLoupeContract({required this.client, required this.address});

  /// Resolves `IDiamondLoupe` through the [ContractRegistry].
  static Future<IDiamondLoupeContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IDiamondLoupe',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IDiamondLoupeContract(client: client, address: resolved);
  }

  /// ABI descriptor for `facetAddress(bytes4)`.
  static final AbiFunction facetAddressFn = AbiFunction(
    name: 'facetAddress',
    inputs: [
      AbiParameter(name: '_functionSelector', type: AbiType.parse('bytes4')),
    ],
    outputs: [
      AbiParameter(name: 'facetAddress_', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facetAddresses()`.
  static final AbiFunction facetAddressesFn = AbiFunction(
    name: 'facetAddresses',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: 'facetAddresses_', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facetFunctionSelectors(address)`.
  static final AbiFunction facetFunctionSelectorsFn = AbiFunction(
    name: 'facetFunctionSelectors',
    inputs: [
      AbiParameter(name: '_facet', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: 'facetFunctionSelectors_', type: AbiType.parse('bytes4[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facets()`.
  static final AbiFunction facetsFn = AbiFunction(
    name: 'facets',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: 'facets_', type: AbiType.parse('(address,bytes4[])[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `facetAddress(bytes4)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> facetAddress(Uint8List functionSelector) async {
    final out = await client.callFunction(
      contract: address,
      function: facetAddressFn,
      args: [functionSelector],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `facetAddresses()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> facetAddresses() async {
    final out = await client.callFunction(
      contract: address,
      function: facetAddressesFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `facetFunctionSelectors(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> facetFunctionSelectors(EthAddress facet) async {
    final out = await client.callFunction(
      contract: address,
      function: facetFunctionSelectorsFn,
      args: [facet],
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `facets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> facets() async {
    final out = await client.callFunction(
      contract: address,
      function: facetsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

}
