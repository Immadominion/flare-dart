// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentVaultsFacet
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAgentVaultsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentVaultsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentVaultsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAgentVaultsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAgentVaultsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAgentVaultsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAgentVaults()`.
  static final AbiFunction getAgentVaultsFn = AbiFunction(
    name: 'getAgentVaults',
    inputs: [],
    outputs: [
      AbiParameter(name: '_agentVaultIds', type: AbiType.parse('uint256[]')),
      AbiParameter(
        name: '_agentVaultAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAgentVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> agentVaultIds, List<EthAddress> agentVaultAddresses})>
  getAgentVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentVaultsFn,
    );
    return (
      agentVaultIds: (out[0]! as List).cast<BigInt>(),
      agentVaultAddresses: (out[1]! as List).cast<EthAddress>(),
    );
  }

  /// `AgentVaultAdded(uint256,address)`
  ///
  /// Decode a matching log with
  /// `agentVaultAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentVaultAddedEvent = AbiEvent(
    name: 'AgentVaultAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'agentVaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `AgentVaultRemoved(uint256,address)`
  ///
  /// Decode a matching log with
  /// `agentVaultRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentVaultRemovedEvent = AbiEvent(
    name: 'AgentVaultRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'agentVaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    agentVaultAddedEvent,
    agentVaultRemovedEvent,
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
