// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IXRPPaymentVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IXRPPaymentVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IXRPPaymentVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IXRPPaymentVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IXRPPaymentVerification` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IXRPPaymentVerificationContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IXRPPaymentVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyXRPPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`.
  static final AbiFunction verifyXRPPaymentFn = AbiFunction(
    name: 'verifyXRPPayment',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyXRPPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyXRPPayment(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyXRPPaymentFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
