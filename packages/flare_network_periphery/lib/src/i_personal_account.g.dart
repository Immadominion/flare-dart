// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPersonalAccount
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPersonalAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPersonalAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPersonalAccountContract({required this.client, required this.address});

  /// Resolves `IPersonalAccount` through the [ContractRegistry].
  static Future<IPersonalAccountContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPersonalAccount',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPersonalAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `controllerAddress()`.
  static final AbiFunction controllerAddressFn = AbiFunction(
    name: 'controllerAddress',
    inputs: [
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

  /// ABI descriptor for `xrplOwner()`.
  static final AbiFunction xrplOwnerFn = AbiFunction(
    name: 'xrplOwner',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `controllerAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> controllerAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: controllerAddressFn,
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

  /// Calls `xrplOwner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> xrplOwner() async {
    final out = await client.callFunction(
      contract: address,
      function: xrplOwnerFn,
    );
    return out[0]! as String;
  }

}
