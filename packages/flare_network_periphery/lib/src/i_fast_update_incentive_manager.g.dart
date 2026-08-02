// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFastUpdateIncentiveManager
// Functions: 11 — 10 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFastUpdateIncentiveManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFastUpdateIncentiveManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFastUpdateIncentiveManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFastUpdateIncentiveManager` through the [ContractRegistry].
  ///
  /// Registered as `FastUpdateIncentiveManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFastUpdateIncentiveManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FastUpdateIncentiveManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFastUpdateIncentiveManagerContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `getBaseScale()`.
  static final AbiFunction getBaseScaleFn = AbiFunction(
    name: 'getBaseScale',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentSampleSizeIncreasePrice()`.
  static final AbiFunction getCurrentSampleSizeIncreasePriceFn = AbiFunction(
    name: 'getCurrentSampleSizeIncreasePrice',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExpectedSampleSize()`.
  static final AbiFunction getExpectedSampleSizeFn = AbiFunction(
    name: 'getExpectedSampleSize',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getIncentiveDuration()`.
  static final AbiFunction getIncentiveDurationFn = AbiFunction(
    name: 'getIncentiveDuration',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPrecision()`.
  static final AbiFunction getPrecisionFn = AbiFunction(
    name: 'getPrecision',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRange()`.
  static final AbiFunction getRangeFn = AbiFunction(
    name: 'getRange',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getScale()`.
  static final AbiFunction getScaleFn = AbiFunction(
    name: 'getScale',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `offerIncentive((uint256,uint256))`.
  static final AbiFunction offerIncentiveFn = AbiFunction(
    name: 'offerIncentive',
    inputs: [
      AbiParameter(name: '_offer', type: AbiType.parse('(uint256,uint256)')),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `rangeIncreaseLimit()`.
  static final AbiFunction rangeIncreaseLimitFn = AbiFunction(
    name: 'rangeIncreaseLimit',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rangeIncreasePrice()`.
  static final AbiFunction rangeIncreasePriceFn = AbiFunction(
    name: 'rangeIncreasePrice',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `sampleIncreaseLimit()`.
  static final AbiFunction sampleIncreaseLimitFn = AbiFunction(
    name: 'sampleIncreaseLimit',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getBaseScale()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getBaseScale() async {
    final out = await client.callFunction(
      contract: address,
      function: getBaseScaleFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentSampleSizeIncreasePrice()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentSampleSizeIncreasePrice() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentSampleSizeIncreasePriceFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExpectedSampleSize()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExpectedSampleSize() async {
    final out = await client.callFunction(
      contract: address,
      function: getExpectedSampleSizeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getIncentiveDuration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getIncentiveDuration() async {
    final out = await client.callFunction(
      contract: address,
      function: getIncentiveDurationFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPrecision()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getPrecision() async {
    final out = await client.callFunction(
      contract: address,
      function: getPrecisionFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRange()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRange() async {
    final out = await client.callFunction(
      contract: address,
      function: getRangeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getScale()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getScale() async {
    final out = await client.callFunction(
      contract: address,
      function: getScaleFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `rangeIncreaseLimit()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rangeIncreaseLimit() async {
    final out = await client.callFunction(
      contract: address,
      function: rangeIncreaseLimitFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `rangeIncreasePrice()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rangeIncreasePrice() async {
    final out = await client.callFunction(
      contract: address,
      function: rangeIncreasePriceFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `sampleIncreaseLimit()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> sampleIncreaseLimit() async {
    final out = await client.callFunction(
      contract: address,
      function: sampleIncreaseLimitFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `offerIncentive((uint256,uint256))`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest offerIncentiveTx(
    List<Object?> offer, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: offerIncentiveFn,
    args: [offer],
    from: from,
    value: value,
  );

  /// `IncentiveOffered(uint24,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `incentiveOfferedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent incentiveOfferedEvent = AbiEvent(
    name: 'IncentiveOffered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rangeIncrease',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'sampleSizeIncrease',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'offerAmount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InflationRewardsOffered(uint24,(bytes21,uint32,uint24)[],uint256)`
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
        name: 'feedConfigurations',
        type: AbiType.parse('(bytes21,uint32,uint24)[]'),
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
    incentiveOfferedEvent,
    inflationRewardsOfferedEvent,
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
