// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFastUpdatesConfiguration
// Functions: 6 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFastUpdatesConfiguration` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFastUpdatesConfigurationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFastUpdatesConfigurationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFastUpdatesConfiguration` through the [ContractRegistry].
  ///
  /// Registered as `FastUpdatesConfiguration`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFastUpdatesConfigurationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FastUpdatesConfiguration',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFastUpdatesConfigurationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getFeedConfigurations()`.
  static final AbiFunction getFeedConfigurationsFn = AbiFunction(
    name: 'getFeedConfigurations',
    inputs: [],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(bytes21,uint32,uint24)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedId(uint256)`.
  static final AbiFunction getFeedIdFn = AbiFunction(
    name: 'getFeedId',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedIds()`.
  static final AbiFunction getFeedIdsFn = AbiFunction(
    name: 'getFeedIds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes21[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedIndex(bytes21)`.
  static final AbiFunction getFeedIndexFn = AbiFunction(
    name: 'getFeedIndex',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNumberOfFeeds()`.
  static final AbiFunction getNumberOfFeedsFn = AbiFunction(
    name: 'getNumberOfFeeds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnusedIndices()`.
  static final AbiFunction getUnusedIndicesFn = AbiFunction(
    name: 'getUnusedIndices',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getFeedConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getFeedConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedConfigurationsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getFeedId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getFeedId(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedIdFn,
      args: [index],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getFeedIds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> getFeedIds() async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedIdsFn,
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `getFeedIndex(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getFeedIndex(Uint8List feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedIndexFn,
      args: [feedId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNumberOfFeeds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNumberOfFeeds() async {
    final out = await client.callFunction(
      contract: address,
      function: getNumberOfFeedsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getUnusedIndices()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> getUnusedIndices() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnusedIndicesFn,
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// `FeedAdded(bytes21,uint32,uint24,uint256)`
  ///
  /// Decode a matching log with
  /// `feedAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent feedAddedEvent = AbiEvent(
    name: 'FeedAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'feedId',
        type: AbiType.parse('bytes21'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardBandValue',
        type: AbiType.parse('uint32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'inflationShare',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'index',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FeedRemoved(bytes21,uint256)`
  ///
  /// Decode a matching log with
  /// `feedRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent feedRemovedEvent = AbiEvent(
    name: 'FeedRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'feedId',
        type: AbiType.parse('bytes21'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'index',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FeedUpdated(bytes21,uint32,uint24,uint256)`
  ///
  /// Decode a matching log with
  /// `feedUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent feedUpdatedEvent = AbiEvent(
    name: 'FeedUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'feedId',
        type: AbiType.parse('bytes21'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardBandValue',
        type: AbiType.parse('uint32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'inflationShare',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'index',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    feedAddedEvent,
    feedRemovedEvent,
    feedUpdatedEvent,
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
