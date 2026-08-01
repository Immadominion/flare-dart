// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtso
// Functions: 15 readable of 15 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtso` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoContract({required this.client, required this.address});

  /// Resolves `IFtso` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFtsoContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentEpochId()`.
  static final AbiFunction getCurrentEpochIdFn = AbiFunction(
    name: 'getCurrentEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPrice()`.
  static final AbiFunction getCurrentPriceFn = AbiFunction(
    name: 'getCurrentPrice',
    inputs: [],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceDetails()`.
  static final AbiFunction getCurrentPriceDetailsFn = AbiFunction(
    name: 'getCurrentPriceDetails',
    inputs: [],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_priceTimestamp', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_priceFinalizationType',
        type: AbiType.parse('uint8'),
      ),
      AbiParameter(
        name: '_lastPriceEpochFinalizationTimestamp',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_lastPriceEpochFinalizationType',
        type: AbiType.parse('uint8'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceFromTrustedProviders()`.
  static final AbiFunction getCurrentPriceFromTrustedProvidersFn = AbiFunction(
    name: 'getCurrentPriceFromTrustedProviders',
    inputs: [],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimals()`.
  static final AbiFunction getCurrentPriceWithDecimalsFn = AbiFunction(
    name: 'getCurrentPriceWithDecimals',
    inputs: [],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_assetPriceUsdDecimals',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimalsFromTrustedProviders()`.
  static final AbiFunction getCurrentPriceWithDecimalsFromTrustedProvidersFn =
      AbiFunction(
        name: 'getCurrentPriceWithDecimalsFromTrustedProviders',
        inputs: [],
        outputs: [
          AbiParameter(name: '_price', type: AbiType.parse('uint256')),
          AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
          AbiParameter(
            name: '_assetPriceUsdDecimals',
            type: AbiType.parse('uint256'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochId(uint256)`.
  static final AbiFunction getEpochIdFn = AbiFunction(
    name: 'getEpochId',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochPrice(uint256)`.
  static final AbiFunction getEpochPriceFn = AbiFunction(
    name: 'getEpochPrice',
    inputs: [AbiParameter(name: '_epochId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochPriceForVoter(uint256,address)`.
  static final AbiFunction getEpochPriceForVoterFn = AbiFunction(
    name: 'getEpochPriceForVoter',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochConfiguration()`.
  static final AbiFunction getPriceEpochConfigurationFn = AbiFunction(
    name: 'getPriceEpochConfiguration',
    inputs: [],
    outputs: [
      AbiParameter(name: '_firstEpochStartTs', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_submitPeriodSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_revealPeriodSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochData()`.
  static final AbiFunction getPriceEpochDataFn = AbiFunction(
    name: 'getPriceEpochData',
    inputs: [],
    outputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_epochSubmitEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_epochRevealEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_fallbackMode', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandom(uint256)`.
  static final AbiFunction getRandomFn = AbiFunction(
    name: 'getRandom',
    inputs: [AbiParameter(name: '_epochId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `symbol()`.
  static final AbiFunction symbolFn = AbiFunction(
    name: 'symbol',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `active()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> active() async {
    final out = await client.callFunction(
      contract: address,
      function: activeFn,
    );
    return out[0]! as bool;
  }

  /// Calls `getCurrentEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentPrice()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})> getCurrentPrice() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPriceDetails()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt price,
      BigInt priceTimestamp,
      BigInt priceFinalizationType,
      BigInt lastPriceEpochFinalizationTimestamp,
      BigInt lastPriceEpochFinalizationType,
    })
  >
  getCurrentPriceDetails() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceDetailsFn,
    );
    return (
      price: out[0]! as BigInt,
      priceTimestamp: out[1]! as BigInt,
      priceFinalizationType: out[2]! as BigInt,
      lastPriceEpochFinalizationTimestamp: out[3]! as BigInt,
      lastPriceEpochFinalizationType: out[4]! as BigInt,
    );
  }

  /// Calls `getCurrentPriceFromTrustedProviders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})>
  getCurrentPriceFromTrustedProviders() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceFromTrustedProvidersFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPriceWithDecimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})>
  getCurrentPriceWithDecimals() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimalsFn,
    );
    return (
      price: out[0]! as BigInt,
      timestamp: out[1]! as BigInt,
      assetPriceUsdDecimals: out[2]! as BigInt,
    );
  }

  /// Calls `getCurrentPriceWithDecimalsFromTrustedProviders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})>
  getCurrentPriceWithDecimalsFromTrustedProviders() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimalsFromTrustedProvidersFn,
    );
    return (
      price: out[0]! as BigInt,
      timestamp: out[1]! as BigInt,
      assetPriceUsdDecimals: out[2]! as BigInt,
    );
  }

  /// Calls `getCurrentRandom()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRandom() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochId(BigInt timestamp) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochIdFn,
      args: [timestamp],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochPrice(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochPrice(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochPriceFn,
      args: [epochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochPriceForVoter(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochPriceForVoter(BigInt epochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochPriceForVoterFn,
      args: [epochId, voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPriceEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt firstEpochStartTs,
      BigInt submitPeriodSeconds,
      BigInt revealPeriodSeconds,
    })
  >
  getPriceEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochConfigurationFn,
    );
    return (
      firstEpochStartTs: out[0]! as BigInt,
      submitPeriodSeconds: out[1]! as BigInt,
      revealPeriodSeconds: out[2]! as BigInt,
    );
  }

  /// Calls `getPriceEpochData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt epochId,
      BigInt epochSubmitEndTime,
      BigInt epochRevealEndTime,
      BigInt votePowerBlock,
      bool fallbackMode,
    })
  >
  getPriceEpochData() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochDataFn,
    );
    return (
      epochId: out[0]! as BigInt,
      epochSubmitEndTime: out[1]! as BigInt,
      epochRevealEndTime: out[2]! as BigInt,
      votePowerBlock: out[3]! as BigInt,
      fallbackMode: out[4]! as bool,
    );
  }

  /// Calls `getRandom(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRandom(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomFn,
      args: [epochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `symbol()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> symbol() async {
    final out = await client.callFunction(
      contract: address,
      function: symbolFn,
    );
    return out[0]! as String;
  }

  /// `LowTurnout(uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `lowTurnoutEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent lowTurnoutEvent = AbiEvent(
    name: 'LowTurnout',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'natTurnout',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lowNatTurnoutThresholdBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PriceEpochInitializedOnFtso(uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `priceEpochInitializedOnFtsoEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent priceEpochInitializedOnFtsoEvent = AbiEvent(
    name: 'PriceEpochInitializedOnFtso',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'endTime',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PriceFinalized(uint256,uint256,bool,uint256,uint256,uint256,uint256,uint8,uint256)`
  ///
  /// Decode a matching log with
  /// `priceFinalizedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent priceFinalizedEvent = AbiEvent(
    name: 'PriceFinalized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'price',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'rewardedFtso',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lowIQRRewardPrice',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'highIQRRewardPrice',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lowElasticBandRewardPrice',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'highElasticBandRewardPrice',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'finalizationType',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PriceRevealed(address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `priceRevealedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent priceRevealedEvent = AbiEvent(
    name: 'PriceRevealed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'price',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'votePowerNat',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'votePowerAsset',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    lowTurnoutEvent,
    priceEpochInitializedOnFtsoEvent,
    priceFinalizedEvent,
    priceRevealedEvent,
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
