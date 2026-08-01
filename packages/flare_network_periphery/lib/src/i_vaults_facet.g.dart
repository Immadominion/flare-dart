// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVaultsFacet
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IVaultsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVaultsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVaultsFacetContract({required this.client, required this.address});

  /// Resolves `IVaultsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IVaultsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IVaultsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getVaults()`.
  static final AbiFunction getVaultsFn = AbiFunction(
    name: 'getVaults',
    inputs: [],
    outputs: [
      AbiParameter(name: '_vaultIds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_vaultAddresses', type: AbiType.parse('address[]')),
      AbiParameter(name: '_vaultTypes', type: AbiType.parse('uint8[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<BigInt> vaultIds,
      List<EthAddress> vaultAddresses,
      List<BigInt> vaultTypes,
    })
  >
  getVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: getVaultsFn,
    );
    return (
      vaultIds: (out[0]! as List).cast<BigInt>(),
      vaultAddresses: (out[1]! as List).cast<EthAddress>(),
      vaultTypes: (out[2]! as List).cast<BigInt>(),
    );
  }

  /// `VaultAdded(uint256,address,uint8)`
  ///
  /// Decode a matching log with
  /// `vaultAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent vaultAddedEvent = AbiEvent(
    name: 'VaultAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vaultType',
        type: AbiType.parse('uint8'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [vaultAddedEvent];

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
