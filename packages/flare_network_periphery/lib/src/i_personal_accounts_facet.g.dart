// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPersonalAccountsFacet
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPersonalAccountsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPersonalAccountsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPersonalAccountsFacetContract({required this.client, required this.address});

  /// Resolves `IPersonalAccountsFacet` through the [ContractRegistry].
  static Future<IPersonalAccountsFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPersonalAccountsFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPersonalAccountsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPersonalAccount(string)`.
  static final AbiFunction getPersonalAccountFn = AbiFunction(
    name: 'getPersonalAccount',
    inputs: [
      AbiParameter(name: '_xrplOwner', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getPersonalAccount(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getPersonalAccount(String xrplOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getPersonalAccountFn,
      args: [xrplOwner],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `implementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> implementation() async {
    final out = await client.callFunction(
      contract: address,
      function: implementationFn,
    );
    return out[0]! as EthAddress;
  }

}
