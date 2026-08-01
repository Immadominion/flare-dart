// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDiamondCut
// Functions: 0 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDiamondCut` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDiamondCutContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDiamondCutContract({required this.client, required this.address});

  /// Resolves `IDiamondCut` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDiamondCutContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDiamondCutContract(client: client, address: resolved);
  }

  /// `DiamondCut((address,uint8,bytes4[])[],address,bytes)`
  ///
  /// Decode a matching log with
  /// `diamondCutEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent diamondCutEvent = AbiEvent(
    name: 'DiamondCut',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: '_diamondCut',
        type: AbiType.parse('(address,uint8,bytes4[])[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_init',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_calldata',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [diamondCutEvent];

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
