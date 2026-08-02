// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoRegistryGenesis
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFtsoRegistryGenesis` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFtsoRegistryGenesisContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
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
