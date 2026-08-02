// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultManager
// Functions: 28 — 25 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 19
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ICoreVaultManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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

  /// ABI descriptor for `pause()`.
  static final AbiFunction pauseFn = AbiFunction(
    name: 'pause',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `paused()`.
  static final AbiFunction pausedFn = AbiFunction(
    name: 'paused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `processEscrows(uint256)`.
  static final AbiFunction processEscrowsFn = AbiFunction(
    name: 'processEscrows',
    inputs: [AbiParameter(name: '_maxCount', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `totalRequestAmountWithFee()`.
  static final AbiFunction totalRequestAmountWithFeeFn = AbiFunction(
    name: 'totalRequestAmountWithFee',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `triggerInstructions()`.
  static final AbiFunction triggerInstructionsFn = AbiFunction(
    name: 'triggerInstructions',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_numberOfInstructions',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.nonpayable,
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

  /// Builds an unsigned `pause()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest pauseTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: pauseFn,
        from: from,
      );

  /// Builds an unsigned `processEscrows(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest processEscrowsTx(BigInt maxCount, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: processEscrowsFn,
        args: [maxCount],
        from: from,
      );

  /// Builds an unsigned `triggerInstructions()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest triggerInstructionsTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: triggerInstructionsFn,
        from: from,
      );

  /// `AlreadyConfirmed()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError alreadyConfirmedError = AbiError(
    name: 'AlreadyConfirmed',
    inputs: [],
  );

  /// `AmountZero()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError amountZeroError = AbiError(
    name: 'AmountZero',
    inputs: [],
  );

  /// `ContractPaused()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError contractPausedError = AbiError(
    name: 'ContractPaused',
    inputs: [],
  );

  /// `DestinationNotAllowed()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError destinationNotAllowedError = AbiError(
    name: 'DestinationNotAllowed',
    inputs: [],
  );

  /// `EscrowAlreadyFinished()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError escrowAlreadyFinishedError = AbiError(
    name: 'EscrowAlreadyFinished',
    inputs: [],
  );

  /// `FeeZero()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError feeZeroError = AbiError(name: 'FeeZero', inputs: []);

  /// `InsufficientFunds()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError insufficientFundsError = AbiError(
    name: 'InsufficientFunds',
    inputs: [],
  );

  /// `InvalidAddress()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidAddressError = AbiError(
    name: 'InvalidAddress',
    inputs: [],
  );

  /// `InvalidAmount()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidAmountError = AbiError(
    name: 'InvalidAmount',
    inputs: [],
  );

  /// `InvalidChain()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidChainError = AbiError(
    name: 'InvalidChain',
    inputs: [],
  );

  /// `InvalidEndTime()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidEndTimeError = AbiError(
    name: 'InvalidEndTime',
    inputs: [],
  );

  /// `InvalidPreimageHash()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidPreimageHashError = AbiError(
    name: 'InvalidPreimageHash',
    inputs: [],
  );

  /// `NotAuthorized()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError notAuthorizedError = AbiError(
    name: 'NotAuthorized',
    inputs: [],
  );

  /// `NotCoreVault()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError notCoreVaultError = AbiError(
    name: 'NotCoreVault',
    inputs: [],
  );

  /// `NotFound()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError notFoundError = AbiError(name: 'NotFound', inputs: []);

  /// `OnlyAssetManager()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError onlyAssetManagerError = AbiError(
    name: 'OnlyAssetManager',
    inputs: [],
  );

  /// `PaymentFailed()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError paymentFailedError = AbiError(
    name: 'PaymentFailed',
    inputs: [],
  );

  /// `PaymentNotProven()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError paymentNotProvenError = AbiError(
    name: 'PaymentNotProven',
    inputs: [],
  );

  /// `RequestExists()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError requestExistsError = AbiError(
    name: 'RequestExists',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    alreadyConfirmedError,
    amountZeroError,
    contractPausedError,
    destinationNotAllowedError,
    escrowAlreadyFinishedError,
    feeZeroError,
    insufficientFundsError,
    invalidAddressError,
    invalidAmountError,
    invalidChainError,
    invalidEndTimeError,
    invalidPreimageHashError,
    notAuthorizedError,
    notCoreVaultError,
    notFoundError,
    onlyAssetManagerError,
    paymentFailedError,
    paymentNotProvenError,
    requestExistsError,
  ];

  /// Explains why a call to this contract reverted.
  ///
  /// ```dart
  /// try {
  ///   await client.estimateGas(request.toCallRequest());
  /// } on FlareRpcException catch (e) {
  ///   print(decodeRevert(e)?.description);
  /// }
  /// ```
  ///
  /// Returns null when the node attached no revert data,
  /// which is how Flare reports a bare `revert()`.
  static RevertReason? decodeRevert(FlareRpcException e) =>
      e.revertReasonWith(allErrors);

  /// `AllowedDestinationAddressAdded(string)`
  ///
  /// Decode a matching log with
  /// `allowedDestinationAddressAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedDestinationAddressAddedEvent = AbiEvent(
    name: 'AllowedDestinationAddressAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'destinationAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `AllowedDestinationAddressRemoved(string)`
  ///
  /// Decode a matching log with
  /// `allowedDestinationAddressRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedDestinationAddressRemovedEvent = AbiEvent(
    name: 'AllowedDestinationAddressRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'destinationAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `CustodianAddressUpdated(string)`
  ///
  /// Decode a matching log with
  /// `custodianAddressUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent custodianAddressUpdatedEvent = AbiEvent(
    name: 'CustodianAddressUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'custodianAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `CustomInstructions(uint256,string,bytes32)`
  ///
  /// Decode a matching log with
  /// `customInstructionsEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent customInstructionsEvent = AbiEvent(
    name: 'CustomInstructions',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sequence',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'instructionsHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `EmergencyPauseSenderAdded(address)`
  ///
  /// Decode a matching log with
  /// `emergencyPauseSenderAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyPauseSenderAddedEvent = AbiEvent(
    name: 'EmergencyPauseSenderAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `EmergencyPauseSenderRemoved(address)`
  ///
  /// Decode a matching log with
  /// `emergencyPauseSenderRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyPauseSenderRemovedEvent = AbiEvent(
    name: 'EmergencyPauseSenderRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `EmergencyUnpauseSenderAdded(address)`
  ///
  /// Decode a matching log with
  /// `emergencyUnpauseSenderAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyUnpauseSenderAddedEvent = AbiEvent(
    name: 'EmergencyUnpauseSenderAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `EmergencyUnpauseSenderRemoved(address)`
  ///
  /// Decode a matching log with
  /// `emergencyUnpauseSenderRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyUnpauseSenderRemovedEvent = AbiEvent(
    name: 'EmergencyUnpauseSenderRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `EscrowExpired(bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `escrowExpiredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent escrowExpiredEvent = AbiEvent(
    name: 'EscrowExpired',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'preimageHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `EscrowFinished(bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `escrowFinishedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent escrowFinishedEvent = AbiEvent(
    name: 'EscrowFinished',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'preimageHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `EscrowInstructions(uint256,bytes32,string,string,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `escrowInstructionsEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent escrowInstructionsEvent = AbiEvent(
    name: 'EscrowInstructions',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sequence',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'preimageHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'destination',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'fee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'cancelAfterTs',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `NotAllEscrowsProcessed()`
  ///
  /// Decode a matching log with
  /// `notAllEscrowsProcessedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent notAllEscrowsProcessedEvent = AbiEvent(
    name: 'NotAllEscrowsProcessed',
    anonymous: false,
    parameters: [],
  );

  /// `Paused()`
  ///
  /// Decode a matching log with
  /// `pausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pausedEvent = AbiEvent(
    name: 'Paused',
    anonymous: false,
    parameters: [],
  );

  /// `PaymentConfirmed(bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `paymentConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent paymentConfirmedEvent = AbiEvent(
    name: 'PaymentConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PaymentInstructions(uint256,string,string,uint256,uint256,bytes32)`
  ///
  /// Decode a matching log with
  /// `paymentInstructionsEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent paymentInstructionsEvent = AbiEvent(
    name: 'PaymentInstructions',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'sequence',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'destination',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'fee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `PreimageHashAdded(bytes32)`
  ///
  /// Decode a matching log with
  /// `preimageHashAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent preimageHashAddedEvent = AbiEvent(
    name: 'PreimageHashAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'preimageHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `SettingsUpdated(uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `settingsUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent settingsUpdatedEvent = AbiEvent(
    name: 'SettingsUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'escrowEndTimeSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'escrowAmount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minimalAmount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'fee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TransferRequestCanceled(string,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `transferRequestCanceledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferRequestCanceledEvent = AbiEvent(
    name: 'TransferRequestCanceled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'destinationAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TransferRequested(string,bytes32,uint256,bool)`
  ///
  /// Decode a matching log with
  /// `transferRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferRequestedEvent = AbiEvent(
    name: 'TransferRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'destinationAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'cancelable',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `TriggeringAccountAdded(address)`
  ///
  /// Decode a matching log with
  /// `triggeringAccountAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent triggeringAccountAddedEvent = AbiEvent(
    name: 'TriggeringAccountAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'triggeringAccount',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `TriggeringAccountRemoved(address)`
  ///
  /// Decode a matching log with
  /// `triggeringAccountRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent triggeringAccountRemovedEvent = AbiEvent(
    name: 'TriggeringAccountRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'triggeringAccount',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `Unpaused()`
  ///
  /// Decode a matching log with
  /// `unpausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpausedEvent = AbiEvent(
    name: 'Unpaused',
    anonymous: false,
    parameters: [],
  );

  /// `UnusedPreimageHashRemoved(bytes32)`
  ///
  /// Decode a matching log with
  /// `unusedPreimageHashRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unusedPreimageHashRemovedEvent = AbiEvent(
    name: 'UnusedPreimageHashRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'preimageHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    allowedDestinationAddressAddedEvent,
    allowedDestinationAddressRemovedEvent,
    custodianAddressUpdatedEvent,
    customInstructionsEvent,
    emergencyPauseSenderAddedEvent,
    emergencyPauseSenderRemovedEvent,
    emergencyUnpauseSenderAddedEvent,
    emergencyUnpauseSenderRemovedEvent,
    escrowExpiredEvent,
    escrowFinishedEvent,
    escrowInstructionsEvent,
    notAllEscrowsProcessedEvent,
    pausedEvent,
    paymentConfirmedEvent,
    paymentInstructionsEvent,
    preimageHashAddedEvent,
    settingsUpdatedEvent,
    transferRequestCanceledEvent,
    transferRequestedEvent,
    triggeringAccountAddedEvent,
    triggeringAccountRemovedEvent,
    unpausedEvent,
    unusedPreimageHashRemovedEvent,
  ];

  /// Decodes [log] into whichever of [allEvents] it matches.
  ///
  /// Returns null when the log belongs to a different event,
  /// which is normal: one address emits many event types and
  /// an address-only filter returns all of them.
  static DecodedLog? decodeLog(FlareLog log) {
    for (final event in allEvents) {
      if (!event.matches(log.topics)) continue;
      return DecodedLog(
        log: log,
        event: event,
        values: event.decode(topics: log.topics, data: log.data),
      );
    }
    return null;
  }
}
