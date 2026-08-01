// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentVaultsFacet
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAgentVaultsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentVaultsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentVaultsFacetContract({required this.client, required this.address});

  /// Resolves `IAgentVaultsFacet` through the [ContractRegistry].
  static Future<IAgentVaultsFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IAgentVaultsFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IAgentVaultsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAgentVaults()`.
  static final AbiFunction getAgentVaultsFn = AbiFunction(
    name: 'getAgentVaults',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_agentVaultIds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_agentVaultAddresses', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAgentVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> agentVaultIds, List<EthAddress> agentVaultAddresses})> getAgentVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentVaultsFn,
    );
    return (agentVaultIds: (out[0]! as List).cast<BigInt>(), agentVaultAddresses: (out[1]! as List).cast<EthAddress>());
  }

}
