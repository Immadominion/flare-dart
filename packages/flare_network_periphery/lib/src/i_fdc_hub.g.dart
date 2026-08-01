// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFdcHub
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFdcHub` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFdcHubContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFdcHubContract({required this.client, required this.address});

  /// Resolves `IFdcHub` through the [ContractRegistry].
  static Future<IFdcHubContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFdcHub',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFdcHubContract(client: client, address: resolved);
  }

  /// ABI descriptor for `fdcInflationConfigurations()`.
  static final AbiFunction fdcInflationConfigurationsFn = AbiFunction(
    name: 'fdcInflationConfigurations',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `fdcRequestFeeConfigurations()`.
  static final AbiFunction fdcRequestFeeConfigurationsFn = AbiFunction(
    name: 'fdcRequestFeeConfigurations',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `requestsOffsetSeconds()`.
  static final AbiFunction requestsOffsetSecondsFn = AbiFunction(
    name: 'requestsOffsetSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `fdcInflationConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fdcInflationConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: fdcInflationConfigurationsFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `fdcRequestFeeConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fdcRequestFeeConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: fdcRequestFeeConfigurationsFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `requestsOffsetSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> requestsOffsetSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: requestsOffsetSecondsFn,
    );
    return out[0]! as BigInt;
  }
}
