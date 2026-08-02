// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoFeedIdConverter
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFtsoFeedIdConverter` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoFeedIdConverterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoFeedIdConverterContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoFeedIdConverter` through the [ContractRegistry].
  ///
  /// Registered as `FtsoFeedIdConverter`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoFeedIdConverterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoFeedIdConverter',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoFeedIdConverterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getFeedCategoryAndName(bytes21)`.
  static final AbiFunction getFeedCategoryAndNameFn = AbiFunction(
    name: 'getFeedCategoryAndName',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(name: '_category', type: AbiType.parse('uint8')),
      AbiParameter(name: '_name', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.pure,
  );

  /// ABI descriptor for `getFeedId(uint8,string)`.
  static final AbiFunction getFeedIdFn = AbiFunction(
    name: 'getFeedId',
    inputs: [
      AbiParameter(name: '_category', type: AbiType.parse('uint8')),
      AbiParameter(name: '_name', type: AbiType.parse('string')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes21'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getFeedCategoryAndName(bytes21)`.
  ///
  /// Declared `pure` in Solidity; read via `eth_call`.
  Future<({BigInt category, String name})> getFeedCategoryAndName(
    Uint8List feedId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedCategoryAndNameFn,
      args: [feedId],
    );
    return (category: out[0]! as BigInt, name: out[1]! as String);
  }

  /// Calls `getFeedId(uint8,string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getFeedId(BigInt category, String name) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedIdFn,
      args: [category, name],
    );
    return out[0]! as Uint8List;
  }
}
