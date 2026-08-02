// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ITimelockFacet
// Functions: 3 — 2 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 3
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ITimelockFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ITimelockFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ITimelockFacetContract({required this.client, required this.address});

  /// Resolves `ITimelockFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ITimelockFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ITimelockFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `executeTimelockedCall(bytes)`.
  static final AbiFunction executeTimelockedCallFn = AbiFunction(
    name: 'executeTimelockedCall',
    inputs: [AbiParameter(name: '_encodedCall', type: AbiType.parse('bytes'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getExecuteTimelockedCallTimestamp(bytes)`.
  static final AbiFunction getExecuteTimelockedCallTimestampFn = AbiFunction(
    name: 'getExecuteTimelockedCallTimestamp',
    inputs: [AbiParameter(name: '_encodedCall', type: AbiType.parse('bytes'))],
    outputs: [
      AbiParameter(
        name: '_allowedAfterTimestamp',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTimelockDurationSeconds()`.
  static final AbiFunction getTimelockDurationSecondsFn = AbiFunction(
    name: 'getTimelockDurationSeconds',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_timelockDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getExecuteTimelockedCallTimestamp(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecuteTimelockedCallTimestamp(
    Uint8List encodedCall,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecuteTimelockedCallTimestampFn,
      args: [encodedCall],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getTimelockDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getTimelockDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getTimelockDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `executeTimelockedCall(bytes)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest executeTimelockedCallTx(
    Uint8List encodedCall, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeTimelockedCallFn,
    args: [encodedCall],
    from: from,
  );

  /// `TimelockDurationTooLong()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError timelockDurationTooLongError = AbiError(
    name: 'TimelockDurationTooLong',
    inputs: [],
  );

  /// `TimelockInvalidSelector()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError timelockInvalidSelectorError = AbiError(
    name: 'TimelockInvalidSelector',
    inputs: [],
  );

  /// `TimelockNotAllowedYet()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError timelockNotAllowedYetError = AbiError(
    name: 'TimelockNotAllowedYet',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    timelockDurationTooLongError,
    timelockInvalidSelectorError,
    timelockNotAllowedYetError,
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

  /// `CallTimelocked(bytes,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `callTimelockedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent callTimelockedEvent = AbiEvent(
    name: 'CallTimelocked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCall',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'allowedAfterTimestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockDurationSet(uint256)`
  ///
  /// Decode a matching log with
  /// `timelockDurationSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockDurationSetEvent = AbiEvent(
    name: 'TimelockDurationSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'timelockDurationSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockedCallCanceled(bytes32)`
  ///
  /// Decode a matching log with
  /// `timelockedCallCanceledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockedCallCanceledEvent = AbiEvent(
    name: 'TimelockedCallCanceled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockedCallExecuted(bytes32)`
  ///
  /// Decode a matching log with
  /// `timelockedCallExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockedCallExecutedEvent = AbiEvent(
    name: 'TimelockedCallExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    callTimelockedEvent,
    timelockDurationSetEvent,
    timelockedCallCanceledEvent,
    timelockedCallExecutedEvent,
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
