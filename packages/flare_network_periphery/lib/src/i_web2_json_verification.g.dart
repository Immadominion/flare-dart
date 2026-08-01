// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IWeb2JsonVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IWeb2JsonVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IWeb2JsonVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IWeb2JsonVerificationContract({required this.client, required this.address});

  /// Resolves `IWeb2JsonVerification` through the [ContractRegistry].
  static Future<IWeb2JsonVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IWeb2JsonVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IWeb2JsonVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyWeb2Json((bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes))))`.
  static final AbiFunction verifyWeb2JsonFn = AbiFunction(
    name: 'verifyWeb2Json',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyWeb2Json((bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyWeb2Json(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyWeb2JsonFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

}
