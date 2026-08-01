// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDirectMinting
// Functions: 2 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDirectMinting` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDirectMintingContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDirectMintingContract({required this.client, required this.address});

  /// Resolves `IDirectMinting` through the [ContractRegistry].
  static Future<IDirectMintingContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IDirectMinting',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDirectMintingContract(client: client, address: resolved);
  }

  /// ABI descriptor for `directMintingDelayState(bytes32)`.
  static final AbiFunction directMintingDelayStateFn = AbiFunction(
    name: 'directMintingDelayState',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_delayState', type: AbiType.parse('uint8')),
      AbiParameter(name: '_allowedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: '_startedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `directMintingPaymentAddress()`.
  static final AbiFunction directMintingPaymentAddressFn = AbiFunction(
    name: 'directMintingPaymentAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `directMintingDelayState(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt delayState, BigInt allowedAt, BigInt startedAt})>
  directMintingDelayState(Uint8List transactionId) async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingDelayStateFn,
      args: [transactionId],
    );
    return (
      delayState: out[0]! as BigInt,
      allowedAt: out[1]! as BigInt,
      startedAt: out[2]! as BigInt,
    );
  }

  /// Calls `directMintingPaymentAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> directMintingPaymentAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingPaymentAddressFn,
    );
    return out[0]! as String;
  }
}
