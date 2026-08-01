// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPersonalAccount
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPersonalAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPersonalAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPersonalAccountContract({required this.client, required this.address});

  /// Resolves `IPersonalAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPersonalAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPersonalAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `controllerAddress()`.
  static final AbiFunction controllerAddressFn = AbiFunction(
    name: 'controllerAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `xrplOwner()`.
  static final AbiFunction xrplOwnerFn = AbiFunction(
    name: 'xrplOwner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `controllerAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> controllerAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: controllerAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `implementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> implementation() async {
    final out = await client.callFunction(
      contract: address,
      function: implementationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `xrplOwner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> xrplOwner() async {
    final out = await client.callFunction(
      contract: address,
      function: xrplOwnerFn,
    );
    return out[0]! as String;
  }

  /// `Approved(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvedEvent = AbiEvent(
    name: 'Approved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'fxrp',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'vault',
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

  /// `Claimed(address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `claimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimedEvent = AbiEvent(
    name: 'Claimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralReserved(address,uint256,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservedEvent = AbiEvent(
    name: 'CollateralReserved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Deposited(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `depositedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent depositedEvent = AbiEvent(
    name: 'Deposited',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FXrpRedeemed(uint256,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpRedeemedEvent = AbiEvent(
    name: 'FXrpRedeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'lots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FXrpTransferred(address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpTransferredEvent = AbiEvent(
    name: 'FXrpTransferred',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'to',
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

  /// `RedeemRequested(address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemRequestedEvent = AbiEvent(
    name: 'RedeemRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'claimableEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Redeemed(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemedEvent = AbiEvent(
    name: 'Redeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `WithdrawalClaimed(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `withdrawalClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent withdrawalClaimedEvent = AbiEvent(
    name: 'WithdrawalClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'period',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    approvedEvent,
    claimedEvent,
    collateralReservedEvent,
    depositedEvent,
    fXrpRedeemedEvent,
    fXrpTransferredEvent,
    redeemRequestedEvent,
    redeemedEvent,
    withdrawalClaimedEvent,
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
