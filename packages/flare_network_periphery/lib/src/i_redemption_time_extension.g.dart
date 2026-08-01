// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedemptionTimeExtension
// Functions: 1 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRedemptionTimeExtension` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRedemptionTimeExtensionContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRedemptionTimeExtensionContract({required this.client, required this.address});

  /// Resolves `IRedemptionTimeExtension` through the [ContractRegistry].
  static Future<IRedemptionTimeExtensionContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IRedemptionTimeExtension',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IRedemptionTimeExtensionContract(client: client, address: resolved);
  }

  /// ABI descriptor for `redemptionPaymentExtensionSeconds()`.
  static final AbiFunction redemptionPaymentExtensionSecondsFn = AbiFunction(
    name: 'redemptionPaymentExtensionSeconds',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `redemptionPaymentExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> redemptionPaymentExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionPaymentExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }

}
