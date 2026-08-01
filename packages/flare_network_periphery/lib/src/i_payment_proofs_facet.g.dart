// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPaymentProofsFacet
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPaymentProofsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPaymentProofsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPaymentProofsFacetContract({required this.client, required this.address});

  /// Resolves `IPaymentProofsFacet` through the [ContractRegistry].
  static Future<IPaymentProofsFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPaymentProofsFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPaymentProofsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPaymentProofValidityDurationSeconds()`.
  static final AbiFunction getPaymentProofValidityDurationSecondsFn = AbiFunction(
    name: 'getPaymentProofValidityDurationSeconds',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSourceId()`.
  static final AbiFunction getSourceIdFn = AbiFunction(
    name: 'getSourceId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getPaymentProofValidityDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getPaymentProofValidityDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getPaymentProofValidityDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getSourceId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getSourceId() async {
    final out = await client.callFunction(
      contract: address,
      function: getSourceIdFn,
    );
    return out[0]! as Uint8List;
  }

}
