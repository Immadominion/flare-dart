// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ITypeTemplateVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ITypeTemplateVerification` contract.
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
  static Future<ITypeTemplateVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ITypeTemplateVerification',
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
