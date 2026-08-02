// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAssetManagerController
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAssetManagerController` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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
  ///
  /// Registered as `AssetManagerController`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IAssetManagerControllerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'AssetManagerController',
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

  /// `AssetManagerAdded(address)`
  ///
  /// Decode a matching log with
  /// `assetManagerAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent assetManagerAddedEvent = AbiEvent(
    name: 'AssetManagerAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'assetManager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `AssetManagerRemoved(address)`
  ///
  /// Decode a matching log with
  /// `assetManagerRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent assetManagerRemovedEvent = AbiEvent(
    name: 'AssetManagerRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'assetManager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    assetManagerAddedEvent,
    assetManagerRemovedEvent,
  ];

  /// Decodes [log] into whichever of [allEvents] it matches.
  ///
  /// Returns null when the log belongs to a different event,
  /// which is normal: one address emits many event types and
  /// an address-only filter returns all of them.
  static DecodedLog? decodeLog(FlareLog log) {
    for (final event in allEvents) {
      if (!event.matches(log.topics)) continue;
      return DecodedLog(
        log: log,
        event: event,
        values: event.decode(topics: log.topics, data: log.data),
      );
    }
    return null;
  }
}
