// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IValidatorRegistry
// Functions: 3 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IValidatorRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IValidatorRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IValidatorRegistryContract({required this.client, required this.address});

  /// Resolves `IValidatorRegistry` through the [ContractRegistry].
  static Future<IValidatorRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IValidatorRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IValidatorRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDataProviderForNodeId(bytes32)`.
  static final AbiFunction getDataProviderForNodeIdFn = AbiFunction(
    name: 'getDataProviderForNodeId',
    inputs: [
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderForPChainPublicKey(bytes32)`.
  static final AbiFunction getDataProviderForPChainPublicKeyFn = AbiFunction(
    name: 'getDataProviderForPChainPublicKey',
    inputs: [
      AbiParameter(name: '_pChainPublicKey', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderInfo(address)`.
  static final AbiFunction getDataProviderInfoFn = AbiFunction(
    name: 'getDataProviderInfo',
    inputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_nodeId', type: AbiType.parse('string')),
      AbiParameter(name: '_pChainPublicKey', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getDataProviderForNodeId(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDataProviderForNodeId(Uint8List nodeId) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderForNodeIdFn,
      args: [nodeId],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDataProviderForPChainPublicKey(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDataProviderForPChainPublicKey(Uint8List pChainPublicKey) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderForPChainPublicKeyFn,
      args: [pChainPublicKey],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDataProviderInfo(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({String nodeId, String pChainPublicKey})> getDataProviderInfo(EthAddress dataProvider) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderInfoFn,
      args: [dataProvider],
    );
    return (nodeId: out[0]! as String, pChainPublicKey: out[1]! as String);
  }

}
