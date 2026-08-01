// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFastUpdater
// Functions: 9 readable of 10 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFastUpdater` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFastUpdaterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFastUpdaterContract({required this.client, required this.address});

  /// Resolves `IFastUpdater` through the [ContractRegistry].
  static Future<IFastUpdaterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFastUpdater',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFastUpdaterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `blockScoreCutoff(uint256)`.
  static final AbiFunction blockScoreCutoffFn = AbiFunction(
    name: 'blockScoreCutoff',
    inputs: [AbiParameter(name: '_blockNum', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '_cutoff', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `currentRewardEpochId()`.
  static final AbiFunction currentRewardEpochIdFn = AbiFunction(
    name: 'currentRewardEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `currentScoreCutoff()`.
  static final AbiFunction currentScoreCutoffFn = AbiFunction(
    name: 'currentScoreCutoff',
    inputs: [],
    outputs: [AbiParameter(name: '_cutoff', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `currentSortitionWeight(address)`.
  static final AbiFunction currentSortitionWeightFn = AbiFunction(
    name: 'currentSortitionWeight',
    inputs: [
      AbiParameter(
        name: '_signingPolicyAddress',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [AbiParameter(name: '_weight', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `fetchAllCurrentFeeds()`.
  static final AbiFunction fetchAllCurrentFeedsFn = AbiFunction(
    name: 'fetchAllCurrentFeeds',
    inputs: [],
    outputs: [
      AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]')),
      AbiParameter(name: '_feeds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `fetchCurrentFeeds(uint256[])`.
  static final AbiFunction fetchCurrentFeedsFn = AbiFunction(
    name: 'fetchCurrentFeeds',
    inputs: [AbiParameter(name: '_indices', type: AbiType.parse('uint256[]'))],
    outputs: [
      AbiParameter(name: '_feeds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `numberOfUpdates(uint256)`.
  static final AbiFunction numberOfUpdatesFn = AbiFunction(
    name: 'numberOfUpdates',
    inputs: [
      AbiParameter(name: '_historySize', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_noOfUpdates', type: AbiType.parse('uint256[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `numberOfUpdatesInBlock(uint256)`.
  static final AbiFunction numberOfUpdatesInBlockFn = AbiFunction(
    name: 'numberOfUpdatesInBlock',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_noOfUpdates', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `submissionWindow()`.
  static final AbiFunction submissionWindowFn = AbiFunction(
    name: 'submissionWindow',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `blockScoreCutoff(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> blockScoreCutoff(BigInt blockNum) async {
    final out = await client.callFunction(
      contract: address,
      function: blockScoreCutoffFn,
      args: [blockNum],
    );
    return out[0]! as BigInt;
  }

  /// Calls `currentRewardEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> currentRewardEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: currentRewardEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `currentScoreCutoff()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> currentScoreCutoff() async {
    final out = await client.callFunction(
      contract: address,
      function: currentScoreCutoffFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `currentSortitionWeight(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> currentSortitionWeight(EthAddress signingPolicyAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: currentSortitionWeightFn,
      args: [signingPolicyAddress],
    );
    return out[0]! as BigInt;
  }

  /// Calls `fetchAllCurrentFeeds()`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<
    ({
      List<Uint8List> feedIds,
      List<BigInt> feeds,
      List<BigInt> decimals,
      BigInt timestamp,
    })
  >
  fetchAllCurrentFeeds() async {
    final out = await client.callFunction(
      contract: address,
      function: fetchAllCurrentFeedsFn,
    );
    return (
      feedIds: (out[0]! as List).cast<Uint8List>(),
      feeds: (out[1]! as List).cast<BigInt>(),
      decimals: (out[2]! as List).cast<BigInt>(),
      timestamp: out[3]! as BigInt,
    );
  }

  /// Calls `fetchCurrentFeeds(uint256[])`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<({List<BigInt> feeds, List<BigInt> decimals, BigInt timestamp})>
  fetchCurrentFeeds(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: fetchCurrentFeedsFn,
      args: [indices],
    );
    return (
      feeds: (out[0]! as List).cast<BigInt>(),
      decimals: (out[1]! as List).cast<BigInt>(),
      timestamp: out[2]! as BigInt,
    );
  }

  /// Calls `numberOfUpdates(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> numberOfUpdates(BigInt historySize) async {
    final out = await client.callFunction(
      contract: address,
      function: numberOfUpdatesFn,
      args: [historySize],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `numberOfUpdatesInBlock(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> numberOfUpdatesInBlock(BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: numberOfUpdatesInBlockFn,
      args: [blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `submissionWindow()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> submissionWindow() async {
    final out = await client.callFunction(
      contract: address,
      function: submissionWindowFn,
    );
    return out[0]! as BigInt;
  }
}
