// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IInstructionsFacet
// Functions: 4 — 2 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 8
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IInstructionsFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
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
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IInstructionsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IInstructionsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `executeDepositAfterMinting(uint256,(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),string)`.
  static final AbiFunction executeDepositAfterMintingFn = AbiFunction(
    name: 'executeDepositAfterMinting',
    inputs: [
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(name: '_xrplAddress', type: AbiType.parse('string')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `executeInstruction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),string)`.
  static final AbiFunction executeInstructionFn = AbiFunction(
    name: 'executeInstruction',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(name: '_xrplAddress', type: AbiType.parse('string')),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

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

  /// Builds an unsigned `executeDepositAfterMinting(uint256,(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest executeDepositAfterMintingTx(
    BigInt collateralReservationId,
    List<Object?> proof,
    String xrplAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeDepositAfterMintingFn,
    args: [collateralReservationId, proof, xrplAddress],
    from: from,
  );

  /// Builds an unsigned `executeInstruction((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),string)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest executeInstructionTx(
    List<Object?> proof,
    String xrplAddress, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeInstructionFn,
    args: [proof, xrplAddress],
    from: from,
    value: value,
  );

  /// Builds an unsigned `reserveCollateral(string,bytes32,bytes32)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest reserveCollateralTx(
    String xrplAddress,
    Uint8List paymentReference,
    Uint8List transactionId, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: reserveCollateralFn,
    args: [xrplAddress, paymentReference, transactionId],
    from: from,
    value: value,
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

  /// `InvalidInstruction(uint256,uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidInstructionError = AbiError(
    name: 'InvalidInstruction',
    inputs: [
      AbiParameter(name: 'instructionType', type: AbiType.parse('uint256')),
      AbiParameter(name: 'instructionCommand', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidInstructionType(uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidInstructionTypeError = AbiError(
    name: 'InvalidInstructionType',
    inputs: [
      AbiParameter(name: 'instructionType', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidMinter()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidMinterError = AbiError(
    name: 'InvalidMinter',
    inputs: [],
  );

  /// `InvalidPaymentAmount(uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidPaymentAmountError = AbiError(
    name: 'InvalidPaymentAmount',
    inputs: [
      AbiParameter(name: 'requiredAmount', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidTransactionId()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidTransactionIdError = AbiError(
    name: 'InvalidTransactionId',
    inputs: [],
  );

  /// `MintingNotCompleted()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError mintingNotCompletedError = AbiError(
    name: 'MintingNotCompleted',
    inputs: [],
  );

  /// `UnknownCollateralReservationId()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError unknownCollateralReservationIdError = AbiError(
    name: 'UnknownCollateralReservationId',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    invalidAmountError,
    invalidInstructionError,
    invalidInstructionTypeError,
    invalidMinterError,
    invalidPaymentAmountError,
    invalidTransactionIdError,
    mintingNotCompletedError,
    unknownCollateralReservationIdError,
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

  /// `Approved(address,address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvedEvent = AbiEvent(
    name: 'Approved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fxrp',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Claimed(address,address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `claimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimedEvent = AbiEvent(
    name: 'Claimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralReserved(address,bytes32,bytes32,string,uint256,address,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservedEvent = AbiEvent(
    name: 'CollateralReserved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Deposited(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `depositedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent depositedEvent = AbiEvent(
    name: 'Deposited',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FXrpRedeemed(address,uint256,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpRedeemedEvent = AbiEvent(
    name: 'FXrpRedeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'lots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FXrpTransferred(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpTransferredEvent = AbiEvent(
    name: 'FXrpTransferred',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InstructionExecuted(address,bytes32,bytes32,string,uint256)`
  ///
  /// Decode a matching log with
  /// `instructionExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionExecutedEvent = AbiEvent(
    name: 'InstructionExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedeemRequested(address,address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemRequestedEvent = AbiEvent(
    name: 'RedeemRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'claimableEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Redeemed(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemedEvent = AbiEvent(
    name: 'Redeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `WithdrawalClaimed(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `withdrawalClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent withdrawalClaimedEvent = AbiEvent(
    name: 'WithdrawalClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'period',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    approvedEvent,
    claimedEvent,
    collateralReservedEvent,
    depositedEvent,
    fXrpRedeemedEvent,
    fXrpTransferredEvent,
    instructionExecutedEvent,
    redeemRequestedEvent,
    redeemedEvent,
    withdrawalClaimedEvent,
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
