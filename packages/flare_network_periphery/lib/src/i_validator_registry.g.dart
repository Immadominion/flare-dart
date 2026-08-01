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

  const IValidatorRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IValidatorRegistry` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IValidatorRegistryContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IValidatorRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDataProviderForNodeId(bytes32)`.
  static final AbiFunction getDataProviderForNodeIdFn = AbiFunction(
    name: 'getDataProviderForNodeId',
    inputs: [AbiParameter(name: '_nodeId', type: AbiType.parse('bytes32'))],
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
  Future<EthAddress> getDataProviderForPChainPublicKey(
    Uint8List pChainPublicKey,
  ) async {
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
  Future<({String nodeId, String pChainPublicKey})> getDataProviderInfo(
    EthAddress dataProvider,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderInfoFn,
      args: [dataProvider],
    );
    return (nodeId: out[0]! as String, pChainPublicKey: out[1]! as String);
  }

  /// `DataProviderRegistered(address,string,string)`
  ///
  /// Decode a matching log with
  /// `dataProviderRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent dataProviderRegisteredEvent = AbiEvent(
    name: 'DataProviderRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'dataProvider',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'pChainPublicKey',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `DataProviderUnregistered(address)`
  ///
  /// Decode a matching log with
  /// `dataProviderUnregisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent dataProviderUnregisteredEvent = AbiEvent(
    name: 'DataProviderUnregistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'dataProvider',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    dataProviderRegisteredEvent,
    dataProviderUnregisteredEvent,
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
