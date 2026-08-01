// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoFeedPublisher
// Functions: 4 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoFeedPublisher` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoFeedPublisherContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoFeedPublisherContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoFeedPublisher` through the [ContractRegistry].
  static Future<IFtsoFeedPublisherContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFtsoFeedPublisher',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoFeedPublisherContract(client: client, address: resolved);
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
}
