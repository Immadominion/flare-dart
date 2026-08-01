// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IBalanceDecreasingTransactionVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IBalanceDecreasingTransactionVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IBalanceDecreasingTransactionVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IBalanceDecreasingTransactionVerificationContract({required this.client, required this.address});

  /// Resolves `IBalanceDecreasingTransactionVerification` through the [ContractRegistry].
  static Future<IBalanceDecreasingTransactionVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IBalanceDecreasingTransactionVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IBalanceDecreasingTransactionVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyBalanceDecreasingTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))))`.
  static final AbiFunction verifyBalanceDecreasingTransactionFn = AbiFunction(
    name: 'verifyBalanceDecreasingTransaction',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyBalanceDecreasingTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyBalanceDecreasingTransaction(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyBalanceDecreasingTransactionFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

}
