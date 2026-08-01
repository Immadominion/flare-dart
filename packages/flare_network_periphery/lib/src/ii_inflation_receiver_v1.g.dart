// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIInflationReceiverV1
// Functions: 1 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIInflationReceiverV1` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIInflationReceiverV1Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIInflationReceiverV1Contract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIInflationReceiverV1` through the [ContractRegistry].
  static Future<IIInflationReceiverV1Contract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIInflationReceiverV1',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIInflationReceiverV1Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getContractName()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getContractName() async {
    final out = await client.callFunction(
      contract: address,
      function: getContractNameFn,
    );
    return out[0]! as String;
  }
}
