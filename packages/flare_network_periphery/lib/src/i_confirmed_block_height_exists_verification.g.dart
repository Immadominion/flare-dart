// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IConfirmedBlockHeightExistsVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IConfirmedBlockHeightExistsVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IConfirmedBlockHeightExistsVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IConfirmedBlockHeightExistsVerificationContract({required this.client, required this.address});

  /// Resolves `IConfirmedBlockHeightExistsVerification` through the [ContractRegistry].
  static Future<IConfirmedBlockHeightExistsVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IConfirmedBlockHeightExistsVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IConfirmedBlockHeightExistsVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyConfirmedBlockHeightExists((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`.
  static final AbiFunction verifyConfirmedBlockHeightExistsFn = AbiFunction(
    name: 'verifyConfirmedBlockHeightExists',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyConfirmedBlockHeightExists((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyConfirmedBlockHeightExists(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyConfirmedBlockHeightExistsFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

}
