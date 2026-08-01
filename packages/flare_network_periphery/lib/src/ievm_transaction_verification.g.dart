// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IEVMTransactionVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IEVMTransactionVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IEVMTransactionVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IEVMTransactionVerificationContract({required this.client, required this.address});

  /// Resolves `IEVMTransactionVerification` through the [ContractRegistry].
  static Future<IEVMTransactionVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IEVMTransactionVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IEVMTransactionVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyEVMTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[]))))`.
  static final AbiFunction verifyEVMTransactionFn = AbiFunction(
    name: 'verifyEVMTransaction',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[])))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyEVMTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[]))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyEVMTransaction(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyEVMTransactionFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

}
