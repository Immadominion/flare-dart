// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IERC173
// Functions: 1 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IERC173` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IERC173Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IERC173Contract({required this.client, required this.address});

  /// Resolves `IERC173` through the [ContractRegistry].
  static Future<IERC173Contract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IERC173',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IERC173Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: 'owner_', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(
      contract: address,
      function: ownerFn,
    );
    return out[0]! as EthAddress;
  }

}
