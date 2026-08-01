// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IICustomFeed
// Functions: 3 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IICustomFeed` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IICustomFeedContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IICustomFeedContract({required this.client, required this.address});

  /// Resolves `IICustomFeed` through the [ContractRegistry].
  static Future<IICustomFeedContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IICustomFeed',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IICustomFeedContract(client: client, address: resolved);
  }

  /// ABI descriptor for `calculateFee()`.
  static final AbiFunction calculateFeeFn = AbiFunction(
    name: 'calculateFee',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_fee', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `feedId()`.
  static final AbiFunction feedIdFn = AbiFunction(
    name: 'feedId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_feedId', type: AbiType.parse('bytes21')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentFeed()`.
  static final AbiFunction getCurrentFeedFn = AbiFunction(
    name: 'getCurrentFeed',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_value', type: AbiType.parse('uint256')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// Calls `calculateFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateFee() async {
    final out = await client.callFunction(
      contract: address,
      function: calculateFeeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `feedId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> feedId() async {
    final out = await client.callFunction(
      contract: address,
      function: feedIdFn,
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getCurrentFeed()`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<({BigInt value, BigInt decimals, BigInt timestamp})> getCurrentFeed() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentFeedFn,
    );
    return (value: out[0]! as BigInt, decimals: out[1]! as BigInt, timestamp: out[2]! as BigInt);
  }

}
