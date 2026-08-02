// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtsoFeedPublisher
// Functions: 6 — 4 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIFtsoFeedPublisher` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoFeedPublisherContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoFeedPublisherContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFtsoFeedPublisher` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFtsoFeedPublisherContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFtsoFeedPublisherContract(client: client, address: resolved);
  }

  /// ABI descriptor for `feedsHistorySize()`.
  static final AbiFunction feedsHistorySizeFn = AbiFunction(
    name: 'feedsHistorySize',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ftsoProtocolId()`.
  static final AbiFunction ftsoProtocolIdFn = AbiFunction(
    name: 'ftsoProtocolId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentFeed(bytes21)`.
  static final AbiFunction getCurrentFeedFn = AbiFunction(
    name: 'getCurrentFeed',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(uint32,bytes21,int32,uint16,int8)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeed(bytes21,uint256)`.
  static final AbiFunction getFeedFn = AbiFunction(
    name: 'getFeed',
    inputs: [
      AbiParameter(name: '_feedId', type: AbiType.parse('bytes21')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(uint32,bytes21,int32,uint16,int8)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `publish((bytes32[],(uint32,bytes21,int32,uint16,int8))[])`.
  static final AbiFunction publishFn = AbiFunction(
    name: 'publish',
    inputs: [
      AbiParameter(
        name: '_proofs',
        type: AbiType.parse('(bytes32[],(uint32,bytes21,int32,uint16,int8))[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `publishFeeds((uint32,bytes21,int32,uint16,int8)[])`.
  static final AbiFunction publishFeedsFn = AbiFunction(
    name: 'publishFeeds',
    inputs: [
      AbiParameter(
        name: '_feeds',
        type: AbiType.parse('(uint32,bytes21,int32,uint16,int8)[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `feedsHistorySize()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> feedsHistorySize() async {
    final out = await client.callFunction(
      contract: address,
      function: feedsHistorySizeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `ftsoProtocolId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> ftsoProtocolId() async {
    final out = await client.callFunction(
      contract: address,
      function: ftsoProtocolIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentFeed(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getCurrentFeed(Uint8List feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentFeedFn,
      args: [feedId],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getFeed(bytes21,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getFeed(Uint8List feedId, BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedFn,
      args: [feedId, votingRoundId],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Builds an unsigned `publish((bytes32[],(uint32,bytes21,int32,uint16,int8))[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest publishTx(
    List<List<Object?>> proofs, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: publishFn,
    args: [proofs],
    from: from,
  );

  /// Builds an unsigned `publishFeeds((uint32,bytes21,int32,uint16,int8)[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest publishFeedsTx(
    List<List<Object?>> feeds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: publishFeedsFn,
    args: [feeds],
    from: from,
  );

  /// `FtsoFeedPublished(uint32,bytes21,int32,uint16,int8)`
  ///
  /// Decode a matching log with
  /// `ftsoFeedPublishedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoFeedPublishedEvent = AbiEvent(
    name: 'FtsoFeedPublished',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'votingRoundId',
        type: AbiType.parse('uint32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'id',
        type: AbiType.parse('bytes21'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('int32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'turnoutBIPS',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'decimals',
        type: AbiType.parse('int8'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [ftsoFeedPublishedEvent];

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
