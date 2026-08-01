// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFdcVerification
// Functions: 11 readable of 11 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFdcVerification` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFdcVerificationContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFdcVerificationContract({required this.client, required this.address});

  /// Resolves `IFdcVerification` through the [ContractRegistry].
  static Future<IFdcVerificationContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFdcVerification',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IFdcVerificationContract(client: client, address: resolved);
  }

  /// ABI descriptor for `fdcProtocolId()`.
  static final AbiFunction fdcProtocolIdFn = AbiFunction(
    name: 'fdcProtocolId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_fdcProtocolId', type: AbiType.parse('uint8')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `relay()`.
  static final AbiFunction relayFn = AbiFunction(
    name: 'relay',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyAddressValidity((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))))`.
  static final AbiFunction verifyAddressValidityFn = AbiFunction(
    name: 'verifyAddressValidity',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

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

  /// ABI descriptor for `verifyConfirmedBlockHeightExists((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`.
  static final AbiFunction verifyConfirmedBlockHeightExistsFn = AbiFunction(
    name: 'verifyConfirmedBlockHeightExists',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyEVMTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[]))))`.
  static final AbiFunction verifyEVMTransactionFn = AbiFunction(
    name: 'verifyEVMTransaction',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[])))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))))`.
  static final AbiFunction verifyPaymentFn = AbiFunction(
    name: 'verifyPayment',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyReferencedPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))))`.
  static final AbiFunction verifyReferencedPaymentNonexistenceFn = AbiFunction(
    name: 'verifyReferencedPaymentNonexistence',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyWeb2Json((bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes))))`.
  static final AbiFunction verifyWeb2JsonFn = AbiFunction(
    name: 'verifyWeb2Json',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyXRPPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`.
  static final AbiFunction verifyXRPPaymentFn = AbiFunction(
    name: 'verifyXRPPayment',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verifyXRPPaymentNonexistence((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64))))`.
  static final AbiFunction verifyXRPPaymentNonexistenceFn = AbiFunction(
    name: 'verifyXRPPaymentNonexistence',
    inputs: [
      AbiParameter(name: '_proof', type: AbiType.parse('(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64)))')),
    ],
    outputs: [
      AbiParameter(name: '_proved', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `fdcProtocolId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> fdcProtocolId() async {
    final out = await client.callFunction(
      contract: address,
      function: fdcProtocolIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `relay()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> relay() async {
    final out = await client.callFunction(
      contract: address,
      function: relayFn,
    );
    return out[0]! as EthAddress;
  }

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

  /// Calls `verifyConfirmedBlockHeightExists((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyConfirmedBlockHeightExists(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyConfirmedBlockHeightExistsFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

  /// Calls `verifyEVMTransaction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint16,bool,bool,uint32[]),(uint64,uint64,address,bool,address,uint256,bytes,uint8,(uint32,address,bytes32[],bytes,bool)[]))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyEVMTransaction(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyEVMTransactionFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

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

  /// Calls `verifyWeb2Json((bytes32[],(bytes32,bytes32,uint64,uint64,(string,string,string,string,string,string,string),(bytes))))`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> verifyWeb2Json(List<Object?> proof) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyWeb2JsonFn,
      args: [proof],
    );
    return out[0]! as bool;
  }

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
