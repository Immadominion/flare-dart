// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPauseFacet
// Functions: 7 — 5 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 5
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPauseFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPauseFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPauseFacetContract({required this.client, required this.address});

  /// Resolves `IPauseFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPauseFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPauseFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPausers()`.
  static final AbiFunction getPausersFn = AbiFunction(
    name: 'getPausers',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnpausers()`.
  static final AbiFunction getUnpausersFn = AbiFunction(
    name: 'getUnpausers',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPaused()`.
  static final AbiFunction isPausedFn = AbiFunction(
    name: 'isPaused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPauser(address)`.
  static final AbiFunction isPauserFn = AbiFunction(
    name: 'isPauser',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isUnpauser(address)`.
  static final AbiFunction isUnpauserFn = AbiFunction(
    name: 'isUnpauser',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pause()`.
  static final AbiFunction pauseFn = AbiFunction(
    name: 'pause',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unpause()`.
  static final AbiFunction unpauseFn = AbiFunction(
    name: 'unpause',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getPausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getPausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getPausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getUnpausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getUnpausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnpausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `isPaused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPaused() async {
    final out = await client.callFunction(
      contract: address,
      function: isPausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `isPauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isPauserFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `isUnpauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isUnpauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isUnpauserFn,
      args: [account],
    );
    return out[0]! as bool;
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

  /// Builds an unsigned `unpause()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unpauseTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: unpauseFn,
        from: from,
      );

  /// `IsPaused()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError isPausedError = AbiError(name: 'IsPaused', inputs: []);

  /// `NotPauser(address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError notPauserError = AbiError(
    name: 'NotPauser',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
  );

  /// `NotUnpauser(address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError notUnpauserError = AbiError(
    name: 'NotUnpauser',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
  );

  /// `PauserAlreadyAdded(address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError pauserAlreadyAddedError = AbiError(
    name: 'PauserAlreadyAdded',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
  );

  /// `UnpauserAlreadyAdded(address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError unpauserAlreadyAddedError = AbiError(
    name: 'UnpauserAlreadyAdded',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    isPausedError,
    notPauserError,
    notUnpauserError,
    pauserAlreadyAddedError,
    unpauserAlreadyAddedError,
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

  /// `Paused(address)`
  ///
  /// Decode a matching log with
  /// `pausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pausedEvent = AbiEvent(
    name: 'Paused',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `PauserAdded(address)`
  ///
  /// Decode a matching log with
  /// `pauserAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pauserAddedEvent = AbiEvent(
    name: 'PauserAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `PauserRemoved(address)`
  ///
  /// Decode a matching log with
  /// `pauserRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pauserRemovedEvent = AbiEvent(
    name: 'PauserRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `Unpaused(address)`
  ///
  /// Decode a matching log with
  /// `unpausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpausedEvent = AbiEvent(
    name: 'Unpaused',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `UnpauserAdded(address)`
  ///
  /// Decode a matching log with
  /// `unpauserAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpauserAddedEvent = AbiEvent(
    name: 'UnpauserAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `UnpauserRemoved(address)`
  ///
  /// Decode a matching log with
  /// `unpauserRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpauserRemovedEvent = AbiEvent(
    name: 'UnpauserRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    pausedEvent,
    pauserAddedEvent,
    pauserRemovedEvent,
    unpausedEvent,
    unpauserAddedEvent,
    unpauserRemovedEvent,
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
