// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFeeCalculator
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFeeCalculator` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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
  ///
  /// Registered as `FeeCalculator`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFeeCalculatorContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FeeCalculator',
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
