// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: TestFtsoV2Interface
// Functions: 10 readable of 10 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `TestFtsoV2Interface` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class TestFtsoV2InterfaceContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const TestFtsoV2InterfaceContract({
    required this.client,
    required this.address,
  });

  /// Resolves `TestFtsoV2Interface` through the [ContractRegistry].
  ///
  /// Registered as `FtsoV2`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<TestFtsoV2InterfaceContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoV2',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return TestFtsoV2InterfaceContract(client: client, address: resolved);
  }

  /// ABI descriptor for `calculateFeeById(bytes21)`.
  static final AbiFunction calculateFeeByIdFn = AbiFunction(
    name: 'calculateFeeById',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [AbiParameter(name: '_fee', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `calculateFeeByIds(bytes21[])`.
  static final AbiFunction calculateFeeByIdsFn = AbiFunction(
    name: 'calculateFeeByIds',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [AbiParameter(name: '_fee', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedById(bytes21)`.
  static final AbiFunction getFeedByIdFn = AbiFunction(
    name: 'getFeedById',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(name: '_value', type: AbiType.parse('uint256')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedByIdInWei(bytes21)`.
  static final AbiFunction getFeedByIdInWeiFn = AbiFunction(
    name: 'getFeedByIdInWei',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(name: '_value', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedIdChanges()`.
  static final AbiFunction getFeedIdChangesFn = AbiFunction(
    name: 'getFeedIdChanges',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_feedIdChanges',
        type: AbiType.parse('(bytes21,bytes21)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedsById(bytes21[])`.
  static final AbiFunction getFeedsByIdFn = AbiFunction(
    name: 'getFeedsById',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [
      AbiParameter(name: '_values', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFeedsByIdInWei(bytes21[])`.
  static final AbiFunction getFeedsByIdInWeiFn = AbiFunction(
    name: 'getFeedsByIdInWei',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [
      AbiParameter(name: '_values', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoProtocolId()`.
  static final AbiFunction getFtsoProtocolIdFn = AbiFunction(
    name: 'getFtsoProtocolId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedFeedIds()`.
  static final AbiFunction getSupportedFeedIdsFn = AbiFunction(
    name: 'getSupportedFeedIds',
    inputs: [],
    outputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyFeedData((bytes32[],(uint32,bytes21,int32,uint16,int8)))`.
  static final AbiFunction verifyFeedDataFn = AbiFunction(
    name: 'verifyFeedData',
    inputs: [
      AbiParameter(
        name: '_feedData',
        type: AbiType.parse('(bytes32[],(uint32,bytes21,int32,uint16,int8))'),
      ),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `calculateFeeById(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateFeeById(Uint8List feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: calculateFeeByIdFn,
      args: [feedId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `calculateFeeByIds(bytes21[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateFeeByIds(List<Uint8List> feedIds) async {
    final out = await client.callFunction(
      contract: address,
      function: calculateFeeByIdsFn,
      args: [feedIds],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFeedById(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt value, BigInt decimals, BigInt timestamp})> getFeedById(
    Uint8List feedId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedByIdFn,
      args: [feedId],
    );
    return (
      value: out[0]! as BigInt,
      decimals: out[1]! as BigInt,
      timestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getFeedByIdInWei(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt value, BigInt timestamp})> getFeedByIdInWei(
    Uint8List feedId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedByIdInWeiFn,
      args: [feedId],
    );
    return (value: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getFeedIdChanges()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getFeedIdChanges() async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedIdChangesFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getFeedsById(bytes21[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> values, List<BigInt> decimals, BigInt timestamp})>
  getFeedsById(List<Uint8List> feedIds) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedsByIdFn,
      args: [feedIds],
    );
    return (
      values: (out[0]! as List).cast<BigInt>(),
      decimals: (out[1]! as List).cast<BigInt>(),
      timestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getFeedsByIdInWei(bytes21[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> values, BigInt timestamp})> getFeedsByIdInWei(
    List<Uint8List> feedIds,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedsByIdInWeiFn,
      args: [feedIds],
    );
    return (
      values: (out[0]! as List).cast<BigInt>(),
      timestamp: out[1]! as BigInt,
    );
  }

  /// Calls `getFtsoProtocolId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getFtsoProtocolId() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoProtocolIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getSupportedFeedIds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> getSupportedFeedIds() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedFeedIdsFn,
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `verifyFeedData((bytes32[],(uint32,bytes21,int32,uint16,int8)))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyFeedData(List<Object?> feedData) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyFeedDataFn,
      args: [feedData],
    );
    return out[0]! as bool;
  }
}
