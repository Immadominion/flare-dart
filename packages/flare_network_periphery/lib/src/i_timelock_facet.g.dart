// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ITimelockFacet
// Functions: 2 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ITimelockFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ITimelockFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ITimelockFacetContract({required this.client, required this.address});

  /// Resolves `ITimelockFacet` through the [ContractRegistry].
  static Future<ITimelockFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ITimelockFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return ITimelockFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getExecuteTimelockedCallTimestamp(bytes)`.
  static final AbiFunction getExecuteTimelockedCallTimestampFn = AbiFunction(
    name: 'getExecuteTimelockedCallTimestamp',
    inputs: [
      AbiParameter(name: '_encodedCall', type: AbiType.parse('bytes')),
    ],
    outputs: [
      AbiParameter(name: '_allowedAfterTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTimelockDurationSeconds()`.
  static final AbiFunction getTimelockDurationSecondsFn = AbiFunction(
    name: 'getTimelockDurationSeconds',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_timelockDurationSeconds', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getExecuteTimelockedCallTimestamp(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecuteTimelockedCallTimestamp(Uint8List encodedCall) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecuteTimelockedCallTimestampFn,
      args: [encodedCall],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getTimelockDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getTimelockDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getTimelockDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

}
