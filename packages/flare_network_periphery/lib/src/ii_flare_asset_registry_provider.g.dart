// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFlareAssetRegistryProvider
// Functions: 3 — 3 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIFlareAssetRegistryProvider` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFlareAssetRegistryProviderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFlareAssetRegistryProviderContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFlareAssetRegistryProvider` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFlareAssetRegistryProviderContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFlareAssetRegistryProviderContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `allAssets()`.
  static final AbiFunction allAssetsFn = AbiFunction(
    name: 'allAssets',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetType()`.
  static final AbiFunction assetTypeFn = AbiFunction(
    name: 'assetType',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAttribute(address,bytes32)`.
  static final AbiFunction getAttributeFn = AbiFunction(
    name: 'getAttribute',
    inputs: [
      AbiParameter(name: '_token', type: AbiType.parse('address')),
      AbiParameter(name: '_nameHash', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_defined', type: AbiType.parse('bool')),
      AbiParameter(name: '_value', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `allAssets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> allAssets() async {
    final out = await client.callFunction(
      contract: address,
      function: allAssetsFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `assetType()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> assetType() async {
    final out = await client.callFunction(
      contract: address,
      function: assetTypeFn,
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getAttribute(address,bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool defined, Uint8List value})> getAttribute(
    EthAddress token,
    Uint8List nameHash,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getAttributeFn,
      args: [token, nameHash],
    );
    return (defined: out[0]! as bool, value: out[1]! as Uint8List);
  }
}
