// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIInflationV1
// Functions: 1 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIInflationV1` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIInflationV1Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIInflationV1Contract({required this.client, required this.address});

  /// Resolves `IIInflationV1` through the [ContractRegistry].
  static Future<IIInflationV1Contract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIInflationV1',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIInflationV1Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAnnum(uint256)`.
  static final AbiFunction getAnnumFn = AbiFunction(
    name: 'getAnnum',
    inputs: [
      AbiParameter(name: '_index', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint256,uint256,uint256,((address,uint256,uint256,uint256,uint256,uint256)[],uint256,uint256,uint256,uint256))')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAnnum(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getAnnum(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getAnnumFn,
      args: [index],
    );
    return (out[0]! as List).cast<Object?>();
  }

}
