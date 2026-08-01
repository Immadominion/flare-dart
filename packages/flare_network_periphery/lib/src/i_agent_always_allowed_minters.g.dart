// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentAlwaysAllowedMinters
// Functions: 1 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAgentAlwaysAllowedMinters` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentAlwaysAllowedMintersContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentAlwaysAllowedMintersContract({required this.client, required this.address});

  /// Resolves `IAgentAlwaysAllowedMinters` through the [ContractRegistry].
  static Future<IAgentAlwaysAllowedMintersContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IAgentAlwaysAllowedMinters',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IAgentAlwaysAllowedMintersContract(client: client, address: resolved);
  }

  /// ABI descriptor for `alwaysAllowedMintersForAgent(address)`.
  static final AbiFunction alwaysAllowedMintersForAgentFn = AbiFunction(
    name: 'alwaysAllowedMintersForAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `alwaysAllowedMintersForAgent(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> alwaysAllowedMintersForAgent(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: alwaysAllowedMintersForAgentFn,
      args: [agentVault],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

}
