// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoRewardOffersManager
// Functions: 2 — 1 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFtsoRewardOffersManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoRewardOffersManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoRewardOffersManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoRewardOffersManager` through the [ContractRegistry].
  ///
  /// Registered as `FtsoRewardOffersManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoRewardOffersManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoRewardOffersManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoRewardOffersManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `minimalRewardsOfferValueWei()`.
  static final AbiFunction minimalRewardsOfferValueWeiFn = AbiFunction(
    name: 'minimalRewardsOfferValueWei',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `offerRewards(uint24,(uint120,bytes21,uint16,uint24,uint24,address)[])`.
  static final AbiFunction offerRewardsFn = AbiFunction(
    name: 'offerRewards',
    inputs: [
      AbiParameter(name: '_nextRewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(
        name: '_offers',
        type: AbiType.parse('(uint120,bytes21,uint16,uint24,uint24,address)[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// Calls `minimalRewardsOfferValueWei()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> minimalRewardsOfferValueWei() async {
    final out = await client.callFunction(
      contract: address,
      function: minimalRewardsOfferValueWeiFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `offerRewards(uint24,(uint120,bytes21,uint16,uint24,uint24,address)[])`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest offerRewardsTx(
    BigInt nextRewardEpochId,
    List<List<Object?>> offers, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: offerRewardsFn,
    args: [nextRewardEpochId, offers],
    from: from,
    value: value,
  );

  /// `InflationRewardsOffered(uint24,bytes,bytes,uint256,uint16,uint24,bytes,uint16)`
  ///
  /// Decode a matching log with
  /// `inflationRewardsOfferedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent inflationRewardsOfferedEvent = AbiEvent(
    name: 'InflationRewardsOffered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'feedIds',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'decimals',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minRewardedTurnoutBIPS',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'primaryBandRewardSharePPM',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'secondaryBandWidthPPMs',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mode',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
    ],
  );

  /// `MinimalRewardsOfferValueSet(uint256)`
  ///
  /// Decode a matching log with
  /// `minimalRewardsOfferValueSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent minimalRewardsOfferValueSetEvent = AbiEvent(
    name: 'MinimalRewardsOfferValueSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'valueWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsOffered(uint24,bytes21,int8,uint256,uint16,uint24,uint24,address)`
  ///
  /// Decode a matching log with
  /// `rewardsOfferedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsOfferedEvent = AbiEvent(
    name: 'RewardsOffered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'feedId',
        type: AbiType.parse('bytes21'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'decimals',
        type: AbiType.parse('int8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minRewardedTurnoutBIPS',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'primaryBandRewardSharePPM',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'secondaryBandWidthPPM',
        type: AbiType.parse('uint24'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'claimBackAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    inflationRewardsOfferedEvent,
    minimalRewardsOfferValueSetEvent,
    rewardsOfferedEvent,
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
