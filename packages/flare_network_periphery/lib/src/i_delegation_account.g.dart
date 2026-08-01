// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDelegationAccount
// Functions: 0 readable of 0 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDelegationAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDelegationAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDelegationAccountContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IDelegationAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDelegationAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDelegationAccountContract(client: client, address: resolved);
  }

  /// `DelegateFtso(address,uint256)`
  ///
  /// Decode a matching log with
  /// `delegateFtsoEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegateFtsoEvent = AbiEvent(
    name: 'DelegateFtso',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'bips',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DelegateGovernance(address)`
  ///
  /// Decode a matching log with
  /// `delegateGovernanceEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegateGovernanceEvent = AbiEvent(
    name: 'DelegateGovernance',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorFeePaid(address,uint256)`
  ///
  /// Decode a matching log with
  /// `executorFeePaidEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorFeePaidEvent = AbiEvent(
    name: 'ExecutorFeePaid',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ExternalTokenTransferred(address,uint256)`
  ///
  /// Decode a matching log with
  /// `externalTokenTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent externalTokenTransferredEvent = AbiEvent(
    name: 'ExternalTokenTransferred',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'token',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Initialize(address,address)`
  ///
  /// Decode a matching log with
  /// `initializeEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent initializeEvent = AbiEvent(
    name: 'Initialize',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'manager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RevokeFtso(address,uint256)`
  ///
  /// Decode a matching log with
  /// `revokeFtsoEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent revokeFtsoEvent = AbiEvent(
    name: 'RevokeFtso',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'blockNumber',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UndelegateAllFtso()`
  ///
  /// Decode a matching log with
  /// `undelegateAllFtsoEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent undelegateAllFtsoEvent = AbiEvent(
    name: 'UndelegateAllFtso',
    anonymous: false,
    parameters: [],
  );

  /// `UndelegateGovernance()`
  ///
  /// Decode a matching log with
  /// `undelegateGovernanceEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent undelegateGovernanceEvent = AbiEvent(
    name: 'UndelegateGovernance',
    anonymous: false,
    parameters: [],
  );

  /// `WithdrawToOwner(uint256)`
  ///
  /// Decode a matching log with
  /// `withdrawToOwnerEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent withdrawToOwnerEvent = AbiEvent(
    name: 'WithdrawToOwner',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    delegateFtsoEvent,
    delegateGovernanceEvent,
    executorFeePaidEvent,
    externalTokenTransferredEvent,
    initializeEvent,
    revokeFtsoEvent,
    undelegateAllFtsoEvent,
    undelegateGovernanceEvent,
    withdrawToOwnerEvent,
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
