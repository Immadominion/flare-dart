// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ITypeTemplateVerification
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ITypeTemplateVerification` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ITypeTemplateVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ITypeTemplateVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `ITypeTemplateVerification` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ITypeTemplateVerificationContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ITypeTemplateVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyTypeTemplate((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bool,(bytes32,uint256[],bool[]),(bytes32,int256[],bool[])[]),(bytes32,(bytes32)[]))))`.
  static final AbiFunction verifyTypeTemplateFn = AbiFunction(
    name: 'verifyTypeTemplate',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bool,(bytes32,uint256[],bool[]),(bytes32,int256[],bool[])[]),(bytes32,(bytes32)[])))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyTypeTemplate((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bool,(bytes32,uint256[],bool[]),(bytes32,int256[],bool[])[]),(bytes32,(bytes32)[]))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyTypeTemplate(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyTypeTemplateFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
