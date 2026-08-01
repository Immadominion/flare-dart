// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIGovernorProposer
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIGovernorProposer` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIGovernorProposerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIGovernorProposerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIGovernorProposer` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIGovernorProposerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIGovernorProposerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `isProposer(address)`.
  static final AbiFunction isProposerFn = AbiFunction(
    name: 'isProposer',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `isProposer(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isProposer(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isProposerFn,
      args: [account],
    );
    return out[0]! as bool;
  }
}
