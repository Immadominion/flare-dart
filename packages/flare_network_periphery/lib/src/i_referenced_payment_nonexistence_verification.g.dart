// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IReferencedPaymentNonexistenceVerification
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IReferencedPaymentNonexistenceVerification` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IReferencedPaymentNonexistenceVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IReferencedPaymentNonexistenceVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IReferencedPaymentNonexistenceVerification` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IReferencedPaymentNonexistenceVerificationContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IReferencedPaymentNonexistenceVerificationContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `verifyReferencedPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))))`.
  static final AbiFunction verifyReferencedPaymentNonexistenceFn = AbiFunction(
    name: 'verifyReferencedPaymentNonexistence',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64)))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyReferencedPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyReferencedPaymentNonexistence(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyReferencedPaymentNonexistenceFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
