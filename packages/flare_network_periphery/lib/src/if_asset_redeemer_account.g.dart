// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFAssetRedeemerAccount
// Functions: 2 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFAssetRedeemerAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFAssetRedeemerAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFAssetRedeemerAccountContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFAssetRedeemerAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFAssetRedeemerAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFAssetRedeemerAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `composer()`.
  static final AbiFunction composerFn = AbiFunction(
    name: 'composer',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `composer()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> composer() async {
    final out = await client.callFunction(
      contract: address,
      function: composerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(contract: address, function: ownerFn);
    return out[0]! as EthAddress;
  }

  /// `FAssetRedeemed(uint256,string,bool,uint256,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `fAssetRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fAssetRedeemedEvent = AbiEvent(
    name: 'FAssetRedeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amountToRedeemUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemerUnderlyingAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemWithTag',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'destinationTag',
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
        name: 'redeemedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MaxAllowancesSet(address,address,address,address)`
  ///
  /// Decode a matching log with
  /// `maxAllowancesSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maxAllowancesSetEvent = AbiEvent(
    name: 'MaxAllowancesSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fAsset',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'stableCoin',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'wNat',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPaymentDefaulted(uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionPaymentDefaultedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPaymentDefaultedEvent = AbiEvent(
    name: 'RedemptionPaymentDefaulted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `XrpRedemptionPaymentDefaulted(uint256)`
  ///
  /// Decode a matching log with
  /// `xrpRedemptionPaymentDefaultedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrpRedemptionPaymentDefaultedEvent = AbiEvent(
    name: 'XrpRedemptionPaymentDefaulted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    fAssetRedeemedEvent,
    maxAllowancesSetEvent,
    redemptionPaymentDefaultedEvent,
    xrpRedemptionPaymentDefaultedEvent,
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
