// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtsoManagerProxy
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFtsoManagerProxy` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoManagerProxyContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoManagerProxyContract({required this.client, required this.address});

  /// Resolves `IIFtsoManagerProxy` through the [ContractRegistry].
  static Future<IIFtsoManagerProxyContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIFtsoManagerProxy',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIFtsoManagerProxyContract(client: client, address: resolved);
  }

  /// ABI descriptor for `fastUpdater()`.
  static final AbiFunction fastUpdaterFn = AbiFunction(
    name: 'fastUpdater',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `fastUpdatesConfiguration()`.
  static final AbiFunction fastUpdatesConfigurationFn = AbiFunction(
    name: 'fastUpdatesConfiguration',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `flareSystemsManager()`.
  static final AbiFunction flareSystemsManagerFn = AbiFunction(
    name: 'flareSystemsManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `relay()`.
  static final AbiFunction relayFn = AbiFunction(
    name: 'relay',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `fastUpdater()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fastUpdater() async {
    final out = await client.callFunction(
      contract: address,
      function: fastUpdaterFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `fastUpdatesConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fastUpdatesConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: fastUpdatesConfigurationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `flareSystemsManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> flareSystemsManager() async {
    final out = await client.callFunction(
      contract: address,
      function: flareSystemsManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `relay()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> relay() async {
    final out = await client.callFunction(
      contract: address,
      function: relayFn,
    );
    return out[0]! as EthAddress;
  }

}
