// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRNatAccount
// Functions: 4 — 4 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRNatAccount` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRNatAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRNatAccountContract({required this.client, required this.address});

  /// Resolves `IRNatAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRNatAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRNatAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rNat()`.
  static final AbiFunction rNatFn = AbiFunction(
    name: 'rNat',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `receivedRewards()`.
  static final AbiFunction receivedRewardsFn = AbiFunction(
    name: 'receivedRewards',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint128'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `withdrawnRewards()`.
  static final AbiFunction withdrawnRewardsFn = AbiFunction(
    name: 'withdrawnRewards',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint128'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(contract: address, function: ownerFn);
    return out[0]! as EthAddress;
  }

  /// Calls `rNat()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> rNat() async {
    final out = await client.callFunction(contract: address, function: rNatFn);
    return out[0]! as EthAddress;
  }

  /// Calls `receivedRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> receivedRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: receivedRewardsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `withdrawnRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> withdrawnRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: withdrawnRewardsFn,
    );
    return out[0]! as BigInt;
  }

  /// `ClaimExecutorsSet(address[])`
  ///
  /// Decode a matching log with
  /// `claimExecutorsSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimExecutorsSetEvent = AbiEvent(
    name: 'ClaimExecutorsSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executors',
        type: AbiType.parse('address[]'),
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

  /// `FundsWithdrawn(uint256,bool)`
  ///
  /// Decode a matching log with
  /// `fundsWithdrawnEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fundsWithdrawnEvent = AbiEvent(
    name: 'FundsWithdrawn',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'wrap',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `Initialized(address,address)`
  ///
  /// Decode a matching log with
  /// `initializedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent initializedEvent = AbiEvent(
    name: 'Initialized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'rNat',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `LockedAmountBurned(uint256)`
  ///
  /// Decode a matching log with
  /// `lockedAmountBurnedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent lockedAmountBurnedEvent = AbiEvent(
    name: 'LockedAmountBurned',
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
    claimExecutorsSetEvent,
    externalTokenTransferredEvent,
    fundsWithdrawnEvent,
    initializedEvent,
    lockedAmountBurnedEvent,
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
