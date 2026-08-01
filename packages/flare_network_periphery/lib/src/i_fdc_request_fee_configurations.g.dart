// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFdcRequestFeeConfigurations
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFdcRequestFeeConfigurations` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFdcRequestFeeConfigurationsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFdcRequestFeeConfigurationsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFdcRequestFeeConfigurations` through the [ContractRegistry].
  ///
  /// Registered as `FdcRequestFeeConfigurations`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFdcRequestFeeConfigurationsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FdcRequestFeeConfigurations',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFdcRequestFeeConfigurationsContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `getRequestFee(bytes)`.
  static final AbiFunction getRequestFeeFn = AbiFunction(
    name: 'getRequestFee',
    inputs: [AbiParameter(name: '_data', type: AbiType.parse('bytes'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getRequestFee(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRequestFee(Uint8List data) async {
    final out = await client.callFunction(
      contract: address,
      function: getRequestFeeFn,
      args: [data],
    );
    return out[0]! as BigInt;
  }
}
