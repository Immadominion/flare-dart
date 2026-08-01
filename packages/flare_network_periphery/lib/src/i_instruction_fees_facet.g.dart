// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IInstructionFeesFacet
// Functions: 2 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IInstructionFeesFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IInstructionFeesFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IInstructionFeesFacetContract({required this.client, required this.address});

  /// Resolves `IInstructionFeesFacet` through the [ContractRegistry].
  static Future<IInstructionFeesFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IInstructionFeesFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IInstructionFeesFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDefaultInstructionFee()`.
  static final AbiFunction getDefaultInstructionFeeFn = AbiFunction(
    name: 'getDefaultInstructionFee',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInstructionFee(uint256)`.
  static final AbiFunction getInstructionFeeFn = AbiFunction(
    name: 'getInstructionFee',
    inputs: [
      AbiParameter(name: '_instructionId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getDefaultInstructionFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDefaultInstructionFee() async {
    final out = await client.callFunction(
      contract: address,
      function: getDefaultInstructionFeeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getInstructionFee(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInstructionFee(BigInt instructionId) async {
    final out = await client.callFunction(
      contract: address,
      function: getInstructionFeeFn,
      args: [instructionId],
    );
    return out[0]! as BigInt;
  }

}
