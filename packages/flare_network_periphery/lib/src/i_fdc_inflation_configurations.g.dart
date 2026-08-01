// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFdcInflationConfigurations
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFdcInflationConfigurations` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFdcInflationConfigurationsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFdcInflationConfigurationsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFdcInflationConfigurations` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFdcInflationConfigurationsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFdcInflationConfigurationsContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `getFdcConfiguration(uint256)`.
  static final AbiFunction getFdcConfigurationFn = AbiFunction(
    name: 'getFdcConfiguration',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes32,bytes32,uint24,uint8,uint224)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFdcConfigurations()`.
  static final AbiFunction getFdcConfigurationsFn = AbiFunction(
    name: 'getFdcConfigurations',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes32,bytes32,uint24,uint8,uint224)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getFdcConfiguration(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getFdcConfiguration(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getFdcConfigurationFn,
      args: [index],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getFdcConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getFdcConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: getFdcConfigurationsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }
}
