// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoRegistryGenesis
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoRegistryGenesis` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoRegistryGenesisContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoRegistryGenesisContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoRegistryGenesis` through the [ContractRegistry].
  static Future<IFtsoRegistryGenesisContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFtsoRegistryGenesis',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoRegistryGenesisContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getFtsos(uint256[])`.
  static final AbiFunction getFtsosFn = AbiFunction(
    name: 'getFtsos',
    inputs: [AbiParameter(name: '_indices', type: AbiType.parse('uint256[]'))],
    outputs: [AbiParameter(name: '_ftsos', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getFtsos(uint256[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsos(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsosFn,
      args: [indices],
    );
    return (out[0]! as List).cast<EthAddress>();
  }
}
