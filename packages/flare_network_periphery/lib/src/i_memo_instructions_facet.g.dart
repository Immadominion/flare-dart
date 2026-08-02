// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IMemoInstructionsFacet
// Functions: 4 — 3 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 12
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IMemoInstructionsFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IMemoInstructionsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IMemoInstructionsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IMemoInstructionsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IMemoInstructionsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IMemoInstructionsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getExecutor(address)`.
  static final AbiFunction getExecutorFn = AbiFunction(
    name: 'getExecutor',
    inputs: [
      AbiParameter(name: '_personalAccount', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNonce(address)`.
  static final AbiFunction getNonceFn = AbiFunction(
    name: 'getNonce',
    inputs: [
      AbiParameter(name: '_personalAccount', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isTransactionIdUsed(bytes32)`.
  static final AbiFunction isTransactionIdUsedFn = AbiFunction(
    name: 'isTransactionIdUsed',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `mintedFAssets(bytes32,string,uint256,uint256,bytes,address)`.
  static final AbiFunction mintedFAssetsFn = AbiFunction(
    name: 'mintedFAssets',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_sourceAddress', type: AbiType.parse('string')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_underlyingTimestamp',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_memoData', type: AbiType.parse('bytes')),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// Calls `getExecutor(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getExecutor(EthAddress personalAccount) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorFn,
      args: [personalAccount],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getNonce(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNonce(EthAddress personalAccount) async {
    final out = await client.callFunction(
      contract: address,
      function: getNonceFn,
      args: [personalAccount],
    );
    return out[0]! as BigInt;
  }

  /// Calls `isTransactionIdUsed(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isTransactionIdUsed(Uint8List transactionId) async {
    final out = await client.callFunction(
      contract: address,
      function: isTransactionIdUsedFn,
      args: [transactionId],
    );
    return out[0]! as bool;
  }

  /// Builds an unsigned `mintedFAssets(bytes32,string,uint256,uint256,bytes,address)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest mintedFAssetsTx(
    Uint8List transactionId,
    String sourceAddress,
    BigInt amount,
    BigInt underlyingTimestamp,
    Uint8List memoData,
    EthAddress executor, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: mintedFAssetsFn,
    args: [
      transactionId,
      sourceAddress,
      amount,
      underlyingTimestamp,
      memoData,
      executor,
    ],
    from: from,
    value: value,
  );

  /// `AddressZero()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError addressZeroError = AbiError(
    name: 'AddressZero',
    inputs: [],
  );

  /// `CallFailed(bytes)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError callFailedError = AbiError(
    name: 'CallFailed',
    inputs: [AbiParameter(name: 'returnData', type: AbiType.parse('bytes'))],
  );

  /// `InsufficientAmountForFee(uint256,uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError insufficientAmountForFeeError = AbiError(
    name: 'InsufficientAmountForFee',
    inputs: [
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
      AbiParameter(name: 'fee', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidInstructionId(uint8)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidInstructionIdError = AbiError(
    name: 'InvalidInstructionId',
    inputs: [AbiParameter(name: 'instructionId', type: AbiType.parse('uint8'))],
  );

  /// `InvalidMemoData()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidMemoDataError = AbiError(
    name: 'InvalidMemoData',
    inputs: [],
  );

  /// `InvalidNonce(uint256,uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidNonceError = AbiError(
    name: 'InvalidNonce',
    inputs: [
      AbiParameter(name: 'expected', type: AbiType.parse('uint256')),
      AbiParameter(name: 'actual', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidNonceIncrease(uint256,uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidNonceIncreaseError = AbiError(
    name: 'InvalidNonceIncrease',
    inputs: [
      AbiParameter(name: 'currentNonce', type: AbiType.parse('uint256')),
      AbiParameter(name: 'newNonce', type: AbiType.parse('uint256')),
    ],
  );

  /// `InvalidSender(address,address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidSenderError = AbiError(
    name: 'InvalidSender',
    inputs: [
      AbiParameter(name: 'sender', type: AbiType.parse('address')),
      AbiParameter(name: 'personalAccount', type: AbiType.parse('address')),
    ],
  );

  /// `OnlyAssetManager()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError onlyAssetManagerError = AbiError(
    name: 'OnlyAssetManager',
    inputs: [],
  );

  /// `TransactionAlreadyExecuted()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError transactionAlreadyExecutedError = AbiError(
    name: 'TransactionAlreadyExecuted',
    inputs: [],
  );

  /// `ValueZero()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError valueZeroError = AbiError(
    name: 'ValueZero',
    inputs: [],
  );

  /// `WrongExecutor(address,address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError wrongExecutorError = AbiError(
    name: 'WrongExecutor',
    inputs: [
      AbiParameter(name: 'expected', type: AbiType.parse('address')),
      AbiParameter(name: 'actual', type: AbiType.parse('address')),
    ],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    addressZeroError,
    callFailedError,
    insufficientAmountForFeeError,
    invalidInstructionIdError,
    invalidMemoDataError,
    invalidNonceError,
    invalidNonceIncreaseError,
    invalidSenderError,
    onlyAssetManagerError,
    transactionAlreadyExecutedError,
    valueZeroError,
    wrongExecutorError,
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

  /// `DirectMintingExecuted(address,bytes32,string,uint256,uint256,address)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedEvent = AbiEvent(
    name: 'DirectMintingExecuted',
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
        name: 'sourceAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorRemoved(address)`
  ///
  /// Decode a matching log with
  /// `executorRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorRemovedEvent = AbiEvent(
    name: 'ExecutorRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `ExecutorSet(address,address)`
  ///
  /// Decode a matching log with
  /// `executorSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorSetEvent = AbiEvent(
    name: 'ExecutorSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `IgnoreMemoSet(address,bytes32)`
  ///
  /// Decode a matching log with
  /// `ignoreMemoSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ignoreMemoSetEvent = AbiEvent(
    name: 'IgnoreMemoSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'targetTxId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
    ],
  );

  /// `NonceIncreased(address,uint256)`
  ///
  /// Decode a matching log with
  /// `nonceIncreasedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent nonceIncreasedEvent = AbiEvent(
    name: 'NonceIncreased',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'newNonce',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ReplacementFeeSet(address,bytes32,uint64)`
  ///
  /// Decode a matching log with
  /// `replacementFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent replacementFeeSetEvent = AbiEvent(
    name: 'ReplacementFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'targetTxId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'newFee',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `UserOperationExecuted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `userOperationExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent userOperationExecutedEvent = AbiEvent(
    name: 'UserOperationExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nonce',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    directMintingExecutedEvent,
    executorRemovedEvent,
    executorSetEvent,
    ignoreMemoSetEvent,
    nonceIncreasedEvent,
    replacementFeeSetEvent,
    userOperationExecutedEvent,
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
