// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIPChainStakeMirrorVerifier
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIPChainStakeMirrorVerifier` contract.
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
