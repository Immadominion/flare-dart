// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRandomProvider
// Functions: 3 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRandomProvider` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRandomProviderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRandomProviderContract({required this.client, required this.address});

  /// Resolves `IRandomProvider` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRandomProviderContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRandomProviderContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQuality()`.
  static final AbiFunction getCurrentRandomWithQualityFn = AbiFunction(
    name: 'getCurrentRandomWithQuality',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQualityAndTimestamp()`.
  static final AbiFunction getCurrentRandomWithQualityAndTimestampFn =
      AbiFunction(
        name: 'getCurrentRandomWithQualityAndTimestamp',
        inputs: [],
        outputs: [
          AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
          AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
          AbiParameter(
            name: '_randomTimestamp',
            type: AbiType.parse('uint256'),
          ),
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
  Future<({BigInt randomNumber, bool isSecureRandom})>
  getCurrentRandomWithQuality() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityFn,
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool);
  }

  /// Calls `getCurrentRandomWithQualityAndTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getCurrentRandomWithQualityAndTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityAndTimestampFn,
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }
}
