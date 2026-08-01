// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAddressValidityVerification
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAddressValidityVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAddressValidityVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAddressValidityVerificationContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAddressValidityVerification` through the [ContractRegistry].
  static Future<IAddressValidityVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IAddressValidityVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAddressValidityVerificationContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `verifyAddressValidity((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))))`.
  static final AbiFunction verifyAddressValidityFn = AbiFunction(
    name: 'verifyAddressValidity',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32)))',
        ),
      ),
    ],
    outputs: [AbiParameter(name: '_proved', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `verifyAddressValidity((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyAddressValidity(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyAddressValidityFn,
      args: [proof],
    );
    return out[0]! as bool;
  }
}
