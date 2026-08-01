// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IXrplProviderWalletsFacet
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IXrplProviderWalletsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IXrplProviderWalletsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IXrplProviderWalletsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IXrplProviderWalletsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IXrplProviderWalletsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IXrplProviderWalletsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getXrplProviderWallets()`.
  static final AbiFunction getXrplProviderWalletsFn = AbiFunction(
    name: 'getXrplProviderWallets',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getXrplProviderWallets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<String>> getXrplProviderWallets() async {
    final out = await client.callFunction(
      contract: address,
      function: getXrplProviderWalletsFn,
    );
    return (out[0]! as List).cast<String>();
  }
}
