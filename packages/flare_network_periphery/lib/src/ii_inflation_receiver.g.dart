// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIInflationReceiver
// Functions: 2 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIInflationReceiver` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIInflationReceiverContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIInflationReceiverContract({required this.client, required this.address});

  /// Resolves `IIInflationReceiver` through the [ContractRegistry].
  static Future<IIInflationReceiverContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIInflationReceiver',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIInflationReceiverContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExpectedBalance()`.
  static final AbiFunction getExpectedBalanceFn = AbiFunction(
    name: 'getExpectedBalance',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
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

  /// Calls `getExpectedBalance()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExpectedBalance() async {
    final out = await client.callFunction(
      contract: address,
      function: getExpectedBalanceFn,
    );
    return out[0]! as BigInt;
  }

}
