// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IInstructionsFacet
// Functions: 2 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IInstructionsFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IInstructionsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IInstructionsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IInstructionsFacet` through the [ContractRegistry].
  static Future<IInstructionsFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IInstructionsFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IInstructionsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getTransactionIdForCollateralReservation(uint256)`.
  static final AbiFunction getTransactionIdForCollateralReservationFn =
      AbiFunction(
        name: 'getTransactionIdForCollateralReservation',
        inputs: [
          AbiParameter(
            name: '_collateralReservationId',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [
          AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `reserveCollateral(string,bytes32,bytes32)`.
  static final AbiFunction reserveCollateralFn = AbiFunction(
    name: 'reserveCollateral',
    inputs: [
      AbiParameter(name: '_xrplAddress', type: AbiType.parse('string')),
      AbiParameter(name: '_paymentReference', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.payable,
  );

  /// Calls `getTransactionIdForCollateralReservation(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getTransactionIdForCollateralReservation(
    BigInt collateralReservationId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getTransactionIdForCollateralReservationFn,
      args: [collateralReservationId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `reserveCollateral(string,bytes32,bytes32)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> reserveCollateral(
    String xrplAddress,
    Uint8List paymentReference,
    Uint8List transactionId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: reserveCollateralFn,
      args: [xrplAddress, paymentReference, transactionId],
    );
    return out[0]! as BigInt;
  }
}
