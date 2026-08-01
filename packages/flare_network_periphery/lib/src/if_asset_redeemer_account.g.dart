// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFAssetRedeemerAccount
// Functions: 2 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFAssetRedeemerAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFAssetRedeemerAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFAssetRedeemerAccountContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFAssetRedeemerAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFAssetRedeemerAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFAssetRedeemerAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `composer()`.
  static final AbiFunction composerFn = AbiFunction(
    name: 'composer',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `composer()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> composer() async {
    final out = await client.callFunction(
      contract: address,
      function: composerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(contract: address, function: ownerFn);
    return out[0]! as EthAddress;
  }
}
