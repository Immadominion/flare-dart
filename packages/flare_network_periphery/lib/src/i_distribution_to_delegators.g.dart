// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDistributionToDelegators
// Functions: 6 readable of 9 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDistributionToDelegators` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDistributionToDelegatorsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDistributionToDelegatorsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IDistributionToDelegators` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDistributionToDelegatorsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDistributionToDelegatorsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getClaimableAmount(uint256)`.
  static final AbiFunction getClaimableAmountFn = AbiFunction(
    name: 'getClaimableAmount',
    inputs: [AbiParameter(name: '_month', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '_amountWei', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getClaimableAmountOf(address,uint256)`.
  static final AbiFunction getClaimableAmountOfFn = AbiFunction(
    name: 'getClaimableAmountOf',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
      AbiParameter(name: '_month', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_amountWei', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getClaimableMonths()`.
  static final AbiFunction getClaimableMonthsFn = AbiFunction(
    name: 'getClaimableMonths',
    inputs: [],
    outputs: [
      AbiParameter(name: '_startMonth', type: AbiType.parse('uint256')),
      AbiParameter(name: '_endMonth', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentMonth()`.
  static final AbiFunction getCurrentMonthFn = AbiFunction(
    name: 'getCurrentMonth',
    inputs: [],
    outputs: [
      AbiParameter(name: '_currentMonth', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getMonthToExpireNext()`.
  static final AbiFunction getMonthToExpireNextFn = AbiFunction(
    name: 'getMonthToExpireNext',
    inputs: [],
    outputs: [
      AbiParameter(name: '_monthToExpireNext', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextClaimableMonth(address)`.
  static final AbiFunction nextClaimableMonthFn = AbiFunction(
    name: 'nextClaimableMonth',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getClaimableAmount(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getClaimableAmount(BigInt month) async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimableAmountFn,
      args: [month],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getClaimableAmountOf(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getClaimableAmountOf(EthAddress account, BigInt month) async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimableAmountOfFn,
      args: [account, month],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getClaimableMonths()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt startMonth, BigInt endMonth})> getClaimableMonths() async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimableMonthsFn,
    );
    return (startMonth: out[0]! as BigInt, endMonth: out[1]! as BigInt);
  }

  /// Calls `getCurrentMonth()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentMonth() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentMonthFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getMonthToExpireNext()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getMonthToExpireNext() async {
    final out = await client.callFunction(
      contract: address,
      function: getMonthToExpireNextFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `nextClaimableMonth(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> nextClaimableMonth(EthAddress rewardOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: nextClaimableMonthFn,
      args: [rewardOwner],
    );
    return out[0]! as BigInt;
  }

  /// `AccountClaimed(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `accountClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent accountClaimedEvent = AbiEvent(
    name: 'AccountClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'whoClaimed',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sentTo',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AccountOptOut(address,bool)`
  ///
  /// Decode a matching log with
  /// `accountOptOutEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent accountOptOutEvent = AbiEvent(
    name: 'AccountOptOut',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'theAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'confirmed',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `EntitlementStart(uint256)`
  ///
  /// Decode a matching log with
  /// `entitlementStartEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent entitlementStartEvent = AbiEvent(
    name: 'EntitlementStart',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'entitlementStartTs',
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
    accountClaimedEvent,
    accountOptOutEvent,
    entitlementStartEvent,
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
