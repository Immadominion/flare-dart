// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFlareAssetRegistry
// Functions: 12 readable of 17 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFlareAssetRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFlareAssetRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFlareAssetRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFlareAssetRegistry` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFlareAssetRegistryContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFlareAssetRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `allAssetTypes()`.
  static final AbiFunction allAssetTypesFn = AbiFunction(
    name: 'allAssetTypes',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allAssets()`.
  static final AbiFunction allAssetsFn = AbiFunction(
    name: 'allAssets',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allAssetsOfType(bytes32)`.
  static final AbiFunction allAssetsOfTypeFn = AbiFunction(
    name: 'allAssetsOfType',
    inputs: [AbiParameter(name: '_assetType', type: AbiType.parse('bytes32'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allAssetsOfTypeWithSymbols(bytes32)`.
  static final AbiFunction allAssetsOfTypeWithSymbolsFn = AbiFunction(
    name: 'allAssetsOfTypeWithSymbols',
    inputs: [AbiParameter(name: '_assetType', type: AbiType.parse('bytes32'))],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
      AbiParameter(name: '', type: AbiType.parse('string[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allAssetsWithSymbols()`.
  static final AbiFunction allAssetsWithSymbolsFn = AbiFunction(
    name: 'allAssetsWithSymbols',
    inputs: [],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
      AbiParameter(name: '', type: AbiType.parse('string[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetBySymbol(string)`.
  static final AbiFunction assetBySymbolFn = AbiFunction(
    name: 'assetBySymbol',
    inputs: [AbiParameter(name: 'symbol', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetType(address)`.
  static final AbiFunction assetTypeFn = AbiFunction(
    name: 'assetType',
    inputs: [AbiParameter(name: '_token', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAttribute(address,bytes32)`.
  static final AbiFunction getAttributeFn = AbiFunction(
    name: 'getAttribute',
    inputs: [
      AbiParameter(name: 'token', type: AbiType.parse('address')),
      AbiParameter(name: 'nameHash', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: 'defined', type: AbiType.parse('bool')),
      AbiParameter(name: 'value', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `incentivePoolFor(address)`.
  static final AbiFunction incentivePoolForFn = AbiFunction(
    name: 'incentivePoolFor',
    inputs: [AbiParameter(name: 'token', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isFlareAsset(address)`.
  static final AbiFunction isFlareAssetFn = AbiFunction(
    name: 'isFlareAsset',
    inputs: [AbiParameter(name: 'token', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `maxDelegatesByPercent(address)`.
  static final AbiFunction maxDelegatesByPercentFn = AbiFunction(
    name: 'maxDelegatesByPercent',
    inputs: [AbiParameter(name: 'token', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `supportsFtsoDelegation(address)`.
  static final AbiFunction supportsFtsoDelegationFn = AbiFunction(
    name: 'supportsFtsoDelegation',
    inputs: [AbiParameter(name: 'token', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `allAssetTypes()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> allAssetTypes() async {
    final out = await client.callFunction(
      contract: address,
      function: allAssetTypesFn,
    );
    return (out[0]! as List).cast<Uint8List>();
  }

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

  /// Calls `allAssetsOfType(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> allAssetsOfType(Uint8List assetType) async {
    final out = await client.callFunction(
      contract: address,
      function: allAssetsOfTypeFn,
      args: [assetType],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `allAssetsOfTypeWithSymbols(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<(List<EthAddress>, List<String>)> allAssetsOfTypeWithSymbols(
    Uint8List assetType,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: allAssetsOfTypeWithSymbolsFn,
      args: [assetType],
    );
    return (
      (out[0]! as List).cast<EthAddress>(),
      (out[1]! as List).cast<String>(),
    );
  }

  /// Calls `allAssetsWithSymbols()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<(List<EthAddress>, List<String>)> allAssetsWithSymbols() async {
    final out = await client.callFunction(
      contract: address,
      function: allAssetsWithSymbolsFn,
    );
    return (
      (out[0]! as List).cast<EthAddress>(),
      (out[1]! as List).cast<String>(),
    );
  }

  /// Calls `assetBySymbol(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> assetBySymbol(String symbol) async {
    final out = await client.callFunction(
      contract: address,
      function: assetBySymbolFn,
      args: [symbol],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `assetType(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> assetType(EthAddress token) async {
    final out = await client.callFunction(
      contract: address,
      function: assetTypeFn,
      args: [token],
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

  /// Calls `incentivePoolFor(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> incentivePoolFor(EthAddress token) async {
    final out = await client.callFunction(
      contract: address,
      function: incentivePoolForFn,
      args: [token],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isFlareAsset(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isFlareAsset(EthAddress token) async {
    final out = await client.callFunction(
      contract: address,
      function: isFlareAssetFn,
      args: [token],
    );
    return out[0]! as bool;
  }

  /// Calls `maxDelegatesByPercent(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxDelegatesByPercent(EthAddress token) async {
    final out = await client.callFunction(
      contract: address,
      function: maxDelegatesByPercentFn,
      args: [token],
    );
    return out[0]! as BigInt;
  }

  /// Calls `supportsFtsoDelegation(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> supportsFtsoDelegation(EthAddress token) async {
    final out = await client.callFunction(
      contract: address,
      function: supportsFtsoDelegationFn,
      args: [token],
    );
    return out[0]! as bool;
  }
}
