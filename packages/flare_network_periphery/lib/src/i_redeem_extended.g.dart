// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedeemExtended
// Functions: 4 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRedeemExtended` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRedeemExtendedContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRedeemExtendedContract({required this.client, required this.address});

  /// Resolves `IRedeemExtended` through the [ContractRegistry].
  static Future<IRedeemExtendedContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IRedeemExtended',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRedeemExtendedContract(client: client, address: resolved);
  }

  /// ABI descriptor for `redeemAmount(uint256,string,address)`.
  static final AbiFunction redeemAmountFn = AbiFunction(
    name: 'redeemAmount',
    inputs: [
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_redeemerUnderlyingAddressString',
        type: AbiType.parse('string'),
      ),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_redeemedAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `redeemWithTag(uint256,string,address,uint256)`.
  static final AbiFunction redeemWithTagFn = AbiFunction(
    name: 'redeemWithTag',
    inputs: [
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_redeemerUnderlyingAddressString',
        type: AbiType.parse('string'),
      ),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_destinationTag', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_redeemedAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `redeemWithTagSupported()`.
  static final AbiFunction redeemWithTagSupportedFn = AbiFunction(
    name: 'redeemWithTagSupported',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redemptionRequestInfoExt(uint256)`.
  static final AbiFunction redemptionRequestInfoExtFn = AbiFunction(
    name: 'redemptionRequestInfoExt',
    inputs: [
      AbiParameter(
        name: '_redemptionRequestId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint64,uint8,address,address,string,bytes32,uint128,uint128,uint16,uint64,uint64,uint64,uint64,bool,bool,address,uint256,bool,uint256)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `redeemAmount(uint256,string,address)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> redeemAmount(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redeemAmountFn,
      args: [amountUBA, redeemerUnderlyingAddressString, executor],
    );
    return out[0]! as BigInt;
  }

  /// Calls `redeemWithTag(uint256,string,address,uint256)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> redeemWithTag(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
    BigInt destinationTag,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redeemWithTagFn,
      args: [
        amountUBA,
        redeemerUnderlyingAddressString,
        executor,
        destinationTag,
      ],
    );
    return out[0]! as BigInt;
  }

  /// Calls `redeemWithTagSupported()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> redeemWithTagSupported() async {
    final out = await client.callFunction(
      contract: address,
      function: redeemWithTagSupportedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `redemptionRequestInfoExt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> redemptionRequestInfoExt(
    BigInt redemptionRequestId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionRequestInfoExtFn,
      args: [redemptionRequestId],
    );
    return (out[0]! as List).cast<Object?>();
  }
}
