// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IXrplProviderWalletsFacet
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 2
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IXrplProviderWalletsFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IXrplProviderWalletsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IXrplProviderWalletsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IXrplProviderWalletsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IXrplProviderWalletsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IXrplProviderWalletsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getXrplProviderWallets()`.
  static final AbiFunction getXrplProviderWalletsFn = AbiFunction(
    name: 'getXrplProviderWallets',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string[]'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getXrplProviderWallets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<String>> getXrplProviderWallets() async {
    final out = await client.callFunction(
      contract: address,
      function: getXrplProviderWalletsFn,
    );
    return (out[0]! as List).cast<String>();
  }

  /// `InvalidXrplProviderWallet(string)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidXrplProviderWalletError = AbiError(
    name: 'InvalidXrplProviderWallet',
    inputs: [
      AbiParameter(name: 'xrplProviderWallet', type: AbiType.parse('string')),
    ],
  );

  /// `XrplProviderWalletAlreadyExists(string)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError xrplProviderWalletAlreadyExistsError = AbiError(
    name: 'XrplProviderWalletAlreadyExists',
    inputs: [
      AbiParameter(name: 'xrplProviderWallet', type: AbiType.parse('string')),
    ],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    invalidXrplProviderWalletError,
    xrplProviderWalletAlreadyExistsError,
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

  /// `XrplProviderWalletAdded(string)`
  ///
  /// Decode a matching log with
  /// `xrplProviderWalletAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrplProviderWalletAddedEvent = AbiEvent(
    name: 'XrplProviderWalletAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'xrplProviderWallet',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `XrplProviderWalletRemoved(string)`
  ///
  /// Decode a matching log with
  /// `xrplProviderWalletRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrplProviderWalletRemovedEvent = AbiEvent(
    name: 'XrplProviderWalletRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'xrplProviderWallet',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    xrplProviderWalletAddedEvent,
    xrplProviderWalletRemovedEvent,
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
