// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPersonalAccountsFacet
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 2
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPersonalAccountsFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPersonalAccountsFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPersonalAccountsFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IPersonalAccountsFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPersonalAccountsFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPersonalAccountsFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPersonalAccount(string)`.
  static final AbiFunction getPersonalAccountFn = AbiFunction(
    name: 'getPersonalAccount',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getPersonalAccount(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getPersonalAccount(String xrplOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getPersonalAccountFn,
      args: [xrplOwner],
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

  /// `InvalidPersonalAccountImplementation()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidPersonalAccountImplementationError = AbiError(
    name: 'InvalidPersonalAccountImplementation',
    inputs: [],
  );

  /// `PersonalAccountNotSuccessfullyDeployed(address)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError personalAccountNotSuccessfullyDeployedError = AbiError(
    name: 'PersonalAccountNotSuccessfullyDeployed',
    inputs: [
      AbiParameter(
        name: 'personalAccountAddress',
        type: AbiType.parse('address'),
      ),
    ],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    invalidPersonalAccountImplementationError,
    personalAccountNotSuccessfullyDeployedError,
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

  /// `PersonalAccountCreated(address,string)`
  ///
  /// Decode a matching log with
  /// `personalAccountCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent personalAccountCreatedEvent = AbiEvent(
    name: 'PersonalAccountCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `PersonalAccountImplementationSet(address)`
  ///
  /// Decode a matching log with
  /// `personalAccountImplementationSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent personalAccountImplementationSetEvent = AbiEvent(
    name: 'PersonalAccountImplementationSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'newImplementation',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    personalAccountCreatedEvent,
    personalAccountImplementationSetEvent,
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
