// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAddressBinder
// Functions: 2 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAddressBinder` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAddressBinderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAddressBinderContract({required this.client, required this.address});

  /// Resolves `IAddressBinder` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAddressBinderContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAddressBinderContract(client: client, address: resolved);
  }

  /// ABI descriptor for `cAddressToPAddress(address)`.
  static final AbiFunction cAddressToPAddressFn = AbiFunction(
    name: 'cAddressToPAddress',
    inputs: [AbiParameter(name: '_cAddress', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pAddressToCAddress(bytes20)`.
  static final AbiFunction pAddressToCAddressFn = AbiFunction(
    name: 'pAddressToCAddress',
    inputs: [AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20'))],
    outputs: [AbiParameter(name: '_cAddress', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `cAddressToPAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> cAddressToPAddress(EthAddress cAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: cAddressToPAddressFn,
      args: [cAddress],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `pAddressToCAddress(bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> pAddressToCAddress(Uint8List pAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: pAddressToCAddressFn,
      args: [pAddress],
    );
    return out[0]! as EthAddress;
  }
}
