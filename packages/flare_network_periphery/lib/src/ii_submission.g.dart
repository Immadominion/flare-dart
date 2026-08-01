// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IISubmission
// Functions: 3 readable of 9 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IISubmission` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IISubmissionContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IISubmissionContract({required this.client, required this.address});

  /// Resolves `IISubmission` through the [ContractRegistry].
  static Future<IISubmissionContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IISubmission',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IISubmissionContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQuality()`.
  static final AbiFunction getCurrentRandomWithQualityFn = AbiFunction(
    name: 'getCurrentRandomWithQuality',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQualityAndTimestamp()`.
  static final AbiFunction getCurrentRandomWithQualityAndTimestampFn = AbiFunction(
    name: 'getCurrentRandomWithQualityAndTimestamp',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentRandom()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRandom() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRandomWithQuality()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom})> getCurrentRandomWithQuality() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityFn,
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool);
  }

  /// Calls `getCurrentRandomWithQualityAndTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})> getCurrentRandomWithQualityAndTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityAndTimestampFn,
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool, randomTimestamp: out[2]! as BigInt);
  }

}
