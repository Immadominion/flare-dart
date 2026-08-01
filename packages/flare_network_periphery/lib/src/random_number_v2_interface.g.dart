// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: RandomNumberV2Interface
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `RandomNumberV2Interface` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class RandomNumberV2InterfaceContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const RandomNumberV2InterfaceContract({required this.client, required this.address});

  /// Resolves `RandomNumberV2Interface` through the [ContractRegistry].
  static Future<RandomNumberV2InterfaceContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'RandomNumberV2Interface',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return RandomNumberV2InterfaceContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getRandomNumber()`.
  static final AbiFunction getRandomNumberFn = AbiFunction(
    name: 'getRandomNumber',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandomNumberHistorical(uint256)`.
  static final AbiFunction getRandomNumberHistoricalFn = AbiFunction(
    name: 'getRandomNumberHistorical',
    inputs: [
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getRandomNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})> getRandomNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberFn,
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool, randomTimestamp: out[2]! as BigInt);
  }

  /// Calls `getRandomNumberHistorical(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})> getRandomNumberHistorical(BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberHistoricalFn,
      args: [votingRoundId],
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool, randomTimestamp: out[2]! as BigInt);
  }

}
