// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAssetManagerController
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAssetManagerController` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAssetManagerControllerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAssetManagerControllerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAssetManagerController` through the [ContractRegistry].
  static Future<IAssetManagerControllerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IAssetManagerController',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAssetManagerControllerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `assetManagerExists(address)`.
  static final AbiFunction assetManagerExistsFn = AbiFunction(
    name: 'assetManagerExists',
    inputs: [
      AbiParameter(name: '_assetManager', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAssetManagers()`.
  static final AbiFunction getAssetManagersFn = AbiFunction(
    name: 'getAssetManagers',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `assetManagerExists(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> assetManagerExists(EthAddress assetManager) async {
    final out = await client.callFunction(
      contract: address,
      function: assetManagerExistsFn,
      args: [assetManager],
    );
    return out[0]! as bool;
  }

  /// Calls `getAssetManagers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getAssetManagers() async {
    final out = await client.callFunction(
      contract: address,
      function: getAssetManagersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }
}
