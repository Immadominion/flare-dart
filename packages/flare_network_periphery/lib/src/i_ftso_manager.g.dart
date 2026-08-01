// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoManager
// Functions: 10 readable of 10 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoManagerContract({required this.client, required this.address});

  /// Resolves `IFtsoManager` through the [ContractRegistry].
  ///
  /// Registered as `FtsoManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceEpochData()`.
  static final AbiFunction getCurrentPriceEpochDataFn = AbiFunction(
    name: 'getCurrentPriceEpochData',
    inputs: [],
    outputs: [
      AbiParameter(name: '_priceEpochId', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_priceEpochStartTimestamp',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_priceEpochEndTimestamp',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_priceEpochRevealEndTimestamp',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_currentTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceEpochId()`.
  static final AbiFunction getCurrentPriceEpochIdFn = AbiFunction(
    name: 'getCurrentPriceEpochId',
    inputs: [],
    outputs: [
      AbiParameter(name: '_priceEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpoch()`.
  static final AbiFunction getCurrentRewardEpochFn = AbiFunction(
    name: 'getCurrentRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFallbackMode()`.
  static final AbiFunction getFallbackModeFn = AbiFunction(
    name: 'getFallbackMode',
    inputs: [],
    outputs: [
      AbiParameter(name: '_fallbackMode', type: AbiType.parse('bool')),
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
      AbiParameter(name: '_ftsoInFallbackMode', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsos()`.
  static final AbiFunction getFtsosFn = AbiFunction(
    name: 'getFtsos',
    inputs: [],
    outputs: [AbiParameter(name: '_ftsos', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochConfiguration()`.
  static final AbiFunction getPriceEpochConfigurationFn = AbiFunction(
    name: 'getPriceEpochConfiguration',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_firstPriceEpochStartTs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_priceEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_revealEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochConfiguration()`.
  static final AbiFunction getRewardEpochConfigurationFn = AbiFunction(
    name: 'getRewardEpochConfiguration',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_firstRewardEpochStartTs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_rewardEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochToExpireNext()`.
  static final AbiFunction getRewardEpochToExpireNextFn = AbiFunction(
    name: 'getRewardEpochToExpireNext',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochVotePowerBlock(uint256)`.
  static final AbiFunction getRewardEpochVotePowerBlockFn = AbiFunction(
    name: 'getRewardEpochVotePowerBlock',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
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

  /// Calls `getCurrentPriceEpochData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt priceEpochId,
      BigInt priceEpochStartTimestamp,
      BigInt priceEpochEndTimestamp,
      BigInt priceEpochRevealEndTimestamp,
      BigInt currentTimestamp,
    })
  >
  getCurrentPriceEpochData() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceEpochDataFn,
    );
    return (
      priceEpochId: out[0]! as BigInt,
      priceEpochStartTimestamp: out[1]! as BigInt,
      priceEpochEndTimestamp: out[2]! as BigInt,
      priceEpochRevealEndTimestamp: out[3]! as BigInt,
      currentTimestamp: out[4]! as BigInt,
    );
  }

  /// Calls `getCurrentPriceEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentPriceEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFallbackMode()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({bool fallbackMode, List<EthAddress> ftsos, List<bool> ftsoInFallbackMode})
  >
  getFallbackMode() async {
    final out = await client.callFunction(
      contract: address,
      function: getFallbackModeFn,
    );
    return (
      fallbackMode: out[0]! as bool,
      ftsos: (out[1]! as List).cast<EthAddress>(),
      ftsoInFallbackMode: (out[2]! as List).cast<bool>(),
    );
  }

  /// Calls `getFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsosFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getPriceEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt firstPriceEpochStartTs,
      BigInt priceEpochDurationSeconds,
      BigInt revealEpochDurationSeconds,
    })
  >
  getPriceEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochConfigurationFn,
    );
    return (
      firstPriceEpochStartTs: out[0]! as BigInt,
      priceEpochDurationSeconds: out[1]! as BigInt,
      revealEpochDurationSeconds: out[2]! as BigInt,
    );
  }

  /// Calls `getRewardEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt firstRewardEpochStartTs, BigInt rewardEpochDurationSeconds})>
  getRewardEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochConfigurationFn,
    );
    return (
      firstRewardEpochStartTs: out[0]! as BigInt,
      rewardEpochDurationSeconds: out[1]! as BigInt,
    );
  }

  /// Calls `getRewardEpochToExpireNext()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRewardEpochToExpireNext() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochToExpireNextFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochVotePowerBlock(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRewardEpochVotePowerBlock(BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochVotePowerBlockFn,
      args: [rewardEpoch],
    );
    return out[0]! as BigInt;
  }

  /// `AccruingUnearnedRewardsFailed(uint256)`
  ///
  /// Decode a matching log with
  /// `accruingUnearnedRewardsFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent accruingUnearnedRewardsFailedEvent = AbiEvent(
    name: 'AccruingUnearnedRewardsFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DistributingRewardsFailed(address,uint256)`
  ///
  /// Decode a matching log with
  /// `distributingRewardsFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent distributingRewardsFailedEvent = AbiEvent(
    name: 'DistributingRewardsFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftso',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FallbackMode(bool)`
  ///
  /// Decode a matching log with
  /// `fallbackModeEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fallbackModeEvent = AbiEvent(
    name: 'FallbackMode',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'fallbackMode',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `FinalizingPriceEpochFailed(address,uint256,uint8)`
  ///
  /// Decode a matching log with
  /// `finalizingPriceEpochFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent finalizingPriceEpochFailedEvent = AbiEvent(
    name: 'FinalizingPriceEpochFailed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftso',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'failingType',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
    ],
  );

  /// `FtsoAdded(address,bool)`
  ///
  /// Decode a matching log with
  /// `ftsoAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoAddedEvent = AbiEvent(
    name: 'FtsoAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftso',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'add',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `FtsoFallbackMode(address,bool)`
  ///
  /// Decode a matching log with
  /// `ftsoFallbackModeEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoFallbackModeEvent = AbiEvent(
    name: 'FtsoFallbackMode',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftso',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'fallbackMode',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `InitializingCurrentEpochStateForRevealFailed(address,uint256)`
  ///
  /// Decode a matching log with
  /// `initializingCurrentEpochStateForRevealFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent initializingCurrentEpochStateForRevealFailedEvent =
      AbiEvent(
        name: 'InitializingCurrentEpochStateForRevealFailed',
        anonymous: false,
        parameters: [
          AbiEventParameter(
            name: 'ftso',
            type: AbiType.parse('address'),
            indexed: false,
          ),
          AbiEventParameter(
            name: 'epochId',
            type: AbiType.parse('uint256'),
            indexed: false,
          ),
        ],
      );

  /// `PriceEpochFinalized(address,uint256)`
  ///
  /// Decode a matching log with
  /// `priceEpochFinalizedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent priceEpochFinalizedEvent = AbiEvent(
    name: 'PriceEpochFinalized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'chosenFtso',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardEpochFinalized(uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `rewardEpochFinalizedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardEpochFinalizedEvent = AbiEvent(
    name: 'RewardEpochFinalized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'votepowerBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'startBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UseGoodRandomSet(bool,uint256)`
  ///
  /// Decode a matching log with
  /// `useGoodRandomSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent useGoodRandomSetEvent = AbiEvent(
    name: 'UseGoodRandomSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'useGoodRandom',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'maxWaitForGoodRandomSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    accruingUnearnedRewardsFailedEvent,
    distributingRewardsFailedEvent,
    fallbackModeEvent,
    finalizingPriceEpochFailedEvent,
    ftsoAddedEvent,
    ftsoFallbackModeEvent,
    initializingCurrentEpochStateForRevealFailedEvent,
    priceEpochFinalizedEvent,
    rewardEpochFinalizedEvent,
    useGoodRandomSetEvent,
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
