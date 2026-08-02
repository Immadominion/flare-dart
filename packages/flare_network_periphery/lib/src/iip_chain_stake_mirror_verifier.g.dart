// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIPChainStakeMirrorVerifier
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIPChainStakeMirrorVerifier` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIPChainStakeMirrorVerifierContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIPChainStakeMirrorVerifierContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIPChainStakeMirrorVerifier` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIPChainStakeMirrorVerifierContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIPChainStakeMirrorVerifierContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `verifyStake((bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64),bytes32[])`.
  static final AbiFunction verifyStakeFn = AbiFunction(
    name: 'verifyStake',
    inputs: [
      AbiParameter(
        name: '_stakeData',
        type: AbiType.parse(
          '(bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64)',
        ),
      ),
      AbiParameter(name: '_merkleProof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyStake((bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64),bytes32[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyStake(
    List<Object?> stakeData,
    List<Uint8List> merkleProof,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyStakeFn,
      args: [stakeData, merkleProof],
    );
    return out[0]! as bool;
  }
}
