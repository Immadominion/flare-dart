// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultManager
// Functions: 25 readable of 28 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ICoreVaultManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICoreVaultManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICoreVaultManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `ICoreVaultManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ICoreVaultManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICoreVaultManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `assetManager()`.
  static final AbiFunction assetManagerFn = AbiFunction(
    name: 'assetManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `availableFunds()`.
  static final AbiFunction availableFundsFn = AbiFunction(
    name: 'availableFunds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint128'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `coreVaultAddress()`.
  static final AbiFunction coreVaultAddressFn = AbiFunction(
    name: 'coreVaultAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `coreVaultAddressHash()`.
  static final AbiFunction coreVaultAddressHashFn = AbiFunction(
    name: 'coreVaultAddressHash',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `custodianAddress()`.
  static final AbiFunction custodianAddressFn = AbiFunction(
    name: 'custodianAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `escrowedFunds()`.
  static final AbiFunction escrowedFundsFn = AbiFunction(
    name: 'escrowedFunds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint128'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAllowedDestinationAddresses()`.
  static final AbiFunction getAllowedDestinationAddressesFn = AbiFunction(
    name: 'getAllowedDestinationAddresses',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCancelableTransferRequests()`.
  static final AbiFunction getCancelableTransferRequestsFn = AbiFunction(
    name: 'getCancelableTransferRequests',
    inputs: [],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(string,bytes32,uint128)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEmergencyPauseSenders()`.
  static final AbiFunction getEmergencyPauseSendersFn = AbiFunction(
    name: 'getEmergencyPauseSenders',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEmergencyUnpauseSenders()`.
  static final AbiFunction getEmergencyUnpauseSendersFn = AbiFunction(
    name: 'getEmergencyUnpauseSenders',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEscrowByIndex(uint256)`.
  static final AbiFunction getEscrowByIndexFn = AbiFunction(
    name: 'getEscrowByIndex',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes32,uint128,uint64,bool)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEscrowByPreimageHash(bytes32)`.
  static final AbiFunction getEscrowByPreimageHashFn = AbiFunction(
    name: 'getEscrowByPreimageHash',
    inputs: [
      AbiParameter(name: '_preimageHash', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes32,uint128,uint64,bool)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEscrowsCount()`.
  static final AbiFunction getEscrowsCountFn = AbiFunction(
    name: 'getEscrowsCount',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNonCancelableTransferRequests()`.
  static final AbiFunction getNonCancelableTransferRequestsFn = AbiFunction(
    name: 'getNonCancelableTransferRequests',
    inputs: [],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(string,bytes32,uint128)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPreimageHash(uint256)`.
  static final AbiFunction getPreimageHashFn = AbiFunction(
    name: 'getPreimageHash',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPreimageHashesCount()`.
  static final AbiFunction getPreimageHashesCountFn = AbiFunction(
    name: 'getPreimageHashesCount',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSettings()`.
  static final AbiFunction getSettingsFn = AbiFunction(
    name: 'getSettings',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_escrowEndTimeSeconds',
        type: AbiType.parse('uint128'),
      ),
      AbiParameter(name: '_escrowAmount', type: AbiType.parse('uint128')),
      AbiParameter(name: '_minimalAmount', type: AbiType.parse('uint128')),
      AbiParameter(name: '_fee', type: AbiType.parse('uint128')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTriggeringAccounts()`.
  static final AbiFunction getTriggeringAccountsFn = AbiFunction(
    name: 'getTriggeringAccounts',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnprocessedEscrows()`.
  static final AbiFunction getUnprocessedEscrowsFn = AbiFunction(
    name: 'getUnprocessedEscrows',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse('(bytes32,uint128,uint64,bool)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnusedPreimageHashes()`.
  static final AbiFunction getUnusedPreimageHashesFn = AbiFunction(
    name: 'getUnusedPreimageHashes',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isDestinationAddressAllowed(string)`.
  static final AbiFunction isDestinationAddressAllowedFn = AbiFunction(
    name: 'isDestinationAddressAllowed',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextUnprocessedEscrowIndex()`.
  static final AbiFunction nextUnprocessedEscrowIndexFn = AbiFunction(
    name: 'nextUnprocessedEscrowIndex',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextUnusedPreimageHashIndex()`.
  static final AbiFunction nextUnusedPreimageHashIndexFn = AbiFunction(
    name: 'nextUnusedPreimageHashIndex',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `paused()`.
  static final AbiFunction pausedFn = AbiFunction(
    name: 'paused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalRequestAmountWithFee()`.
  static final AbiFunction totalRequestAmountWithFeeFn = AbiFunction(
    name: 'totalRequestAmountWithFee',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `assetManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> assetManager() async {
    final out = await client.callFunction(
      contract: address,
      function: assetManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `availableFunds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> availableFunds() async {
    final out = await client.callFunction(
      contract: address,
      function: availableFundsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `coreVaultAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> coreVaultAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: coreVaultAddressFn,
    );
    return out[0]! as String;
  }

  /// Calls `coreVaultAddressHash()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> coreVaultAddressHash() async {
    final out = await client.callFunction(
      contract: address,
      function: coreVaultAddressHashFn,
    );
    return out[0]! as Uint8List;
  }

  /// Calls `custodianAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> custodianAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: custodianAddressFn,
    );
    return out[0]! as String;
  }

  /// Calls `escrowedFunds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> escrowedFunds() async {
    final out = await client.callFunction(
      contract: address,
      function: escrowedFundsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAllowedDestinationAddresses()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<String>> getAllowedDestinationAddresses() async {
    final out = await client.callFunction(
      contract: address,
      function: getAllowedDestinationAddressesFn,
    );
    return (out[0]! as List).cast<String>();
  }

  /// Calls `getCancelableTransferRequests()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getCancelableTransferRequests() async {
    final out = await client.callFunction(
      contract: address,
      function: getCancelableTransferRequestsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getEmergencyPauseSenders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getEmergencyPauseSenders() async {
    final out = await client.callFunction(
      contract: address,
      function: getEmergencyPauseSendersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getEmergencyUnpauseSenders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getEmergencyUnpauseSenders() async {
    final out = await client.callFunction(
      contract: address,
      function: getEmergencyUnpauseSendersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getEscrowByIndex(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getEscrowByIndex(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getEscrowByIndexFn,
      args: [index],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getEscrowByPreimageHash(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getEscrowByPreimageHash(Uint8List preimageHash) async {
    final out = await client.callFunction(
      contract: address,
      function: getEscrowByPreimageHashFn,
      args: [preimageHash],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getEscrowsCount()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEscrowsCount() async {
    final out = await client.callFunction(
      contract: address,
      function: getEscrowsCountFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNonCancelableTransferRequests()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getNonCancelableTransferRequests() async {
    final out = await client.callFunction(
      contract: address,
      function: getNonCancelableTransferRequestsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getPreimageHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getPreimageHash(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getPreimageHashFn,
      args: [index],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getPreimageHashesCount()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getPreimageHashesCount() async {
    final out = await client.callFunction(
      contract: address,
      function: getPreimageHashesCountFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getSettings()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt escrowEndTimeSeconds,
      BigInt escrowAmount,
      BigInt minimalAmount,
      BigInt fee,
    })
  >
  getSettings() async {
    final out = await client.callFunction(
      contract: address,
      function: getSettingsFn,
    );
    return (
      escrowEndTimeSeconds: out[0]! as BigInt,
      escrowAmount: out[1]! as BigInt,
      minimalAmount: out[2]! as BigInt,
      fee: out[3]! as BigInt,
    );
  }

  /// Calls `getTriggeringAccounts()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getTriggeringAccounts() async {
    final out = await client.callFunction(
      contract: address,
      function: getTriggeringAccountsFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getUnprocessedEscrows()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getUnprocessedEscrows() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnprocessedEscrowsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getUnusedPreimageHashes()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> getUnusedPreimageHashes() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnusedPreimageHashesFn,
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `isDestinationAddressAllowed(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isDestinationAddressAllowed(String address_) async {
    final out = await client.callFunction(
      contract: address,
      function: isDestinationAddressAllowedFn,
      args: [address_],
    );
    return out[0]! as bool;
  }

  /// Calls `nextUnprocessedEscrowIndex()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> nextUnprocessedEscrowIndex() async {
    final out = await client.callFunction(
      contract: address,
      function: nextUnprocessedEscrowIndexFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `nextUnusedPreimageHashIndex()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> nextUnusedPreimageHashIndex() async {
    final out = await client.callFunction(
      contract: address,
      function: nextUnusedPreimageHashIndexFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `paused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> paused() async {
    final out = await client.callFunction(
      contract: address,
      function: pausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `totalRequestAmountWithFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalRequestAmountWithFee() async {
    final out = await client.callFunction(
      contract: address,
      function: totalRequestAmountWithFeeFn,
    );
    return out[0]! as BigInt;
  }
}
