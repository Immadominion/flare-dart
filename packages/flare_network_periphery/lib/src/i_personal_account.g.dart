// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPersonalAccount
// Functions: 4 — 3 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 9
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPersonalAccount` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPersonalAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPersonalAccountContract({required this.client, required this.address});

  /// Resolves `IPersonalAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPersonalAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPersonalAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `controllerAddress()`.
  static final AbiFunction controllerAddressFn = AbiFunction(
    name: 'controllerAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `executeUserOp((address,uint256,bytes)[])`.
  static final AbiFunction executeUserOpFn = AbiFunction(
    name: 'executeUserOp',
    inputs: [
      AbiParameter(
        name: '_calls',
        type: AbiType.parse('(address,uint256,bytes)[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `xrplOwner()`.
  static final AbiFunction xrplOwnerFn = AbiFunction(
    name: 'xrplOwner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `controllerAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> controllerAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: controllerAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `implementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> implementation() async {
    final out = await client.callFunction(
      contract: address,
      function: implementationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `xrplOwner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> xrplOwner() async {
    final out = await client.callFunction(
      contract: address,
      function: xrplOwnerFn,
    );
    return out[0]! as String;
  }

  /// Builds an unsigned `executeUserOp((address,uint256,bytes)[])`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest executeUserOpTx(
    List<List<Object?>> calls, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeUserOpFn,
    args: [calls],
    from: from,
    value: value,
  );

  /// `AgentNotAvailable()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError agentNotAvailableError = AbiError(
    name: 'AgentNotAvailable',
    inputs: [],
  );

  /// `AlreadyInitialized()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError alreadyInitializedError = AbiError(
    name: 'AlreadyInitialized',
    inputs: [],
  );

  /// `ApprovalFailed()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError approvalFailedError = AbiError(
    name: 'ApprovalFailed',
    inputs: [],
  );

  /// `CallFailed(uint256,bytes)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError callFailedError = AbiError(
    name: 'CallFailed',
    inputs: [
      AbiParameter(name: 'index', type: AbiType.parse('uint256')),
      AbiParameter(name: 'returnData', type: AbiType.parse('bytes')),
    ],
  );

  /// `InsufficientFundsForCollateralReservation(uint256,uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError insufficientFundsForCollateralReservationError =
      AbiError(
        name: 'InsufficientFundsForCollateralReservation',
        inputs: [
          AbiParameter(
            name: 'collateralReservationFee',
            type: AbiType.parse('uint256'),
          ),
          AbiParameter(name: 'executorFee', type: AbiType.parse('uint256')),
        ],
      );

  /// `InsufficientFundsForRedeem(uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError insufficientFundsForRedeemError = AbiError(
    name: 'InsufficientFundsForRedeem',
    inputs: [AbiParameter(name: 'executorFee', type: AbiType.parse('uint256'))],
  );

  /// `InvalidControllerAddress()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidControllerAddressError = AbiError(
    name: 'InvalidControllerAddress',
    inputs: [],
  );

  /// `InvalidXrplOwner()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidXrplOwnerError = AbiError(
    name: 'InvalidXrplOwner',
    inputs: [],
  );

  /// `OnlyController()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError onlyControllerError = AbiError(
    name: 'OnlyController',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    agentNotAvailableError,
    alreadyInitializedError,
    approvalFailedError,
    callFailedError,
    insufficientFundsForCollateralReservationError,
    insufficientFundsForRedeemError,
    invalidControllerAddressError,
    invalidXrplOwnerError,
    onlyControllerError,
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

  /// `Approved(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvedEvent = AbiEvent(
    name: 'Approved',
    anonymous: false,
    parameters: [
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

  /// `Claimed(address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `claimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimedEvent = AbiEvent(
    name: 'Claimed',
    anonymous: false,
    parameters: [
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

  /// `CollateralReserved(address,uint256,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservedEvent = AbiEvent(
    name: 'CollateralReserved',
    anonymous: false,
    parameters: [
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
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Deposited(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `depositedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent depositedEvent = AbiEvent(
    name: 'Deposited',
    anonymous: false,
    parameters: [
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

  /// `FXrpRedeemed(uint256,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpRedeemedEvent = AbiEvent(
    name: 'FXrpRedeemed',
    anonymous: false,
    parameters: [
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

  /// `FXrpTransferred(address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpTransferredEvent = AbiEvent(
    name: 'FXrpTransferred',
    anonymous: false,
    parameters: [
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

  /// `RedeemRequested(address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemRequestedEvent = AbiEvent(
    name: 'RedeemRequested',
    anonymous: false,
    parameters: [
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

  /// `Redeemed(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemedEvent = AbiEvent(
    name: 'Redeemed',
    anonymous: false,
    parameters: [
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

  /// `WithdrawalClaimed(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `withdrawalClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent withdrawalClaimedEvent = AbiEvent(
    name: 'WithdrawalClaimed',
    anonymous: false,
    parameters: [
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
