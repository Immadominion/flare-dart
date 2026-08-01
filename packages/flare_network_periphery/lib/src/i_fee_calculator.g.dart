// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFeeCalculator
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFeeCalculator` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFeeCalculatorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFeeCalculatorContract({required this.client, required this.address});

  /// Resolves `IFeeCalculator` through the [ContractRegistry].
  static Future<IFeeCalculatorContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFeeCalculator',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFeeCalculatorContract(client: client, address: resolved);
  }

  /// ABI descriptor for `calculateFeeByIds(bytes21[])`.
  static final AbiFunction calculateFeeByIdsFn = AbiFunction(
    name: 'calculateFeeByIds',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [AbiParameter(name: '_fee', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `calculateFeeByIndices(uint256[])`.
  static final AbiFunction calculateFeeByIndicesFn = AbiFunction(
    name: 'calculateFeeByIndices',
    inputs: [AbiParameter(name: '_indices', type: AbiType.parse('uint256[]'))],
    outputs: [AbiParameter(name: '_fee', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

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

  /// Calls `calculateFeeByIndices(uint256[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateFeeByIndices(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: calculateFeeByIndicesFn,
      args: [indices],
    );
    return out[0]! as BigInt;
  }
}
