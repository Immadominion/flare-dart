// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoFeedDecimals
// Functions: 7 readable of 7 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoFeedDecimals` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoFeedDecimalsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoFeedDecimalsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoFeedDecimals` through the [ContractRegistry].
  ///
  /// Registered as `FtsoFeedDecimals`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoFeedDecimalsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoFeedDecimals',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoFeedDecimalsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `decimalsUpdateOffset()`.
  static final AbiFunction decimalsUpdateOffsetFn = AbiFunction(
    name: 'decimalsUpdateOffset',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultDecimals()`.
  static final AbiFunction defaultDecimalsFn = AbiFunction(
    name: 'defaultDecimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('int8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentDecimals(bytes21)`.
  static final AbiFunction getCurrentDecimalsFn = AbiFunction(
    name: 'getCurrentDecimals',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('int8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentDecimalsBulk(bytes)`.
  static final AbiFunction getCurrentDecimalsBulkFn = AbiFunction(
    name: 'getCurrentDecimalsBulk',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes'))],
    outputs: [AbiParameter(name: '_decimals', type: AbiType.parse('bytes'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDecimals(bytes21,uint256)`.
  static final AbiFunction getDecimalsFn = AbiFunction(
    name: 'getDecimals',
    inputs: [
      AbiParameter(name: '_feedId', type: AbiType.parse('bytes21')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('int8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDecimalsBulk(bytes,uint256)`.
  static final AbiFunction getDecimalsBulkFn = AbiFunction(
    name: 'getDecimalsBulk',
    inputs: [
      AbiParameter(name: '_feedIds', type: AbiType.parse('bytes')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_decimals', type: AbiType.parse('bytes'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getScheduledDecimalsChanges(bytes21)`.
  static final AbiFunction getScheduledDecimalsChangesFn = AbiFunction(
    name: 'getScheduledDecimalsChanges',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_validFromEpochId', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_fixed', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `decimalsUpdateOffset()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> decimalsUpdateOffset() async {
    final out = await client.callFunction(
      contract: address,
      function: decimalsUpdateOffsetFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `defaultDecimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultDecimals() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultDecimalsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentDecimals(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentDecimals(Uint8List feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentDecimalsFn,
      args: [feedId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentDecimalsBulk(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getCurrentDecimalsBulk(Uint8List feedIds) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentDecimalsBulkFn,
      args: [feedIds],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getDecimals(bytes21,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDecimals(Uint8List feedId, BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getDecimalsFn,
      args: [feedId, rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDecimalsBulk(bytes,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getDecimalsBulk(
    Uint8List feedIds,
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getDecimalsBulkFn,
      args: [feedIds, rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getScheduledDecimalsChanges(bytes21)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({List<BigInt> decimals, List<BigInt> validFromEpochId, List<bool> fixed})
  >
  getScheduledDecimalsChanges(Uint8List feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: getScheduledDecimalsChangesFn,
      args: [feedId],
    );
    return (
      decimals: (out[0]! as List).cast<BigInt>(),
      validFromEpochId: (out[1]! as List).cast<BigInt>(),
      fixed: (out[2]! as List).cast<bool>(),
    );
  }
}
