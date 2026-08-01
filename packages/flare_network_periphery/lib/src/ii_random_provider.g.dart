// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIRandomProvider
// Functions: 2 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIRandomProvider` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIRandomProviderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIRandomProviderContract({required this.client, required this.address});

  /// Resolves `IIRandomProvider` through the [ContractRegistry].
  static Future<IIRandomProviderContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIRandomProvider',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIRandomProviderContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [
      AbiParameter(name: '_currentRandom', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQuality()`.
  static final AbiFunction getCurrentRandomWithQualityFn = AbiFunction(
    name: 'getCurrentRandomWithQuality',
    inputs: [],
    outputs: [
      AbiParameter(name: '_currentRandom', type: AbiType.parse('uint256')),
      AbiParameter(name: '_goodRandom', type: AbiType.parse('bool')),
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
  Future<({BigInt currentRandom, bool goodRandom})>
  getCurrentRandomWithQuality() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityFn,
    );
    return (currentRandom: out[0]! as BigInt, goodRandom: out[1]! as bool);
  }
}
