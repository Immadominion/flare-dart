// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoInflationConfigurations
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFtsoInflationConfigurations` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoInflationConfigurationsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoInflationConfigurationsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoInflationConfigurations` through the [ContractRegistry].
  ///
  /// Registered as `FtsoInflationConfigurations`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoInflationConfigurationsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoInflationConfigurations',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoInflationConfigurationsContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `getFtsoConfiguration(uint256)`.
  static final AbiFunction getFtsoConfigurationFn = AbiFunction(
    name: 'getFtsoConfiguration',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes,uint24,uint16,uint24,bytes,uint16)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoConfigurations()`.
  static final AbiFunction getFtsoConfigurationsFn = AbiFunction(
    name: 'getFtsoConfigurations',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes,uint24,uint16,uint24,bytes,uint16)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getFtsoConfiguration(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getFtsoConfiguration(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoConfigurationFn,
      args: [index],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getFtsoConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getFtsoConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoConfigurationsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }
}
