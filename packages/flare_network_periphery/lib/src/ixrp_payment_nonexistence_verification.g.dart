// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IXRPPaymentNonexistenceVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IXRPPaymentNonexistenceVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IXRPPaymentNonexistenceVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IXRPPaymentNonexistenceVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IXRPPaymentNonexistenceVerification` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IXRPPaymentNonexistenceVerificationContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IXRPPaymentNonexistenceVerificationContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `verifyXRPPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64))))`.
  static final AbiFunction verifyXRPPaymentNonexistenceFn = AbiFunction(
    name: 'verifyXRPPaymentNonexistence',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64)))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyXRPPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyXRPPaymentNonexistence(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyXRPPaymentNonexistenceFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
