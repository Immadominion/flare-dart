// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IERC165
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IERC165` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IERC165Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IERC165Contract({required this.client, required this.address});

  /// Resolves `IERC165` through the [ContractRegistry].
  static Future<IERC165Contract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IERC165',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IERC165Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `supportsInterface(bytes4)`.
  static final AbiFunction supportsInterfaceFn = AbiFunction(
    name: 'supportsInterface',
    inputs: [AbiParameter(name: 'interfaceId', type: AbiType.parse('bytes4'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `supportsInterface(bytes4)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> supportsInterface(Uint8List interfaceId) async {
    final out = await client.callFunction(
      contract: address,
      function: supportsInterfaceFn,
      args: [interfaceId],
    );
    return out[0]! as bool;
  }
}
