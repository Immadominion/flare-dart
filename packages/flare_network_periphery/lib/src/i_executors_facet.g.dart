// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IExecutorsFacet
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IExecutorsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IExecutorsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IExecutorsFacetContract({required this.client, required this.address});

  /// Resolves `IExecutorsFacet` through the [ContractRegistry].
  static Future<IExecutorsFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IExecutorsFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IExecutorsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getExecutorInfo()`.
  static final AbiFunction getExecutorInfoFn = AbiFunction(
    name: 'getExecutorInfo',
    inputs: [],
    outputs: [
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_executorFee', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getExecutorInfo()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({EthAddress executor, BigInt executorFee})> getExecutorInfo() async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorInfoFn,
    );
    return (executor: out[0]! as EthAddress, executorFee: out[1]! as BigInt);
  }
}
