// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPaymentVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPaymentVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPaymentVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPaymentVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IPaymentVerification` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPaymentVerificationContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPaymentVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `verifyPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))))`.
  static final AbiFunction verifyPaymentFn = AbiFunction(
    name: 'verifyPayment',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyPayment(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyPaymentFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
