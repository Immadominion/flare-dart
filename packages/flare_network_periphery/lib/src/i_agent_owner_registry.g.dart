// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentOwnerRegistry
// Functions: 7 — 7 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 2
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAgentOwnerRegistry` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentOwnerRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentOwnerRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAgentOwnerRegistry` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAgentOwnerRegistryContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAgentOwnerRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAgentDescription(address)`.
  static final AbiFunction getAgentDescriptionFn = AbiFunction(
    name: 'getAgentDescription',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentIconUrl(address)`.
  static final AbiFunction getAgentIconUrlFn = AbiFunction(
    name: 'getAgentIconUrl',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentName(address)`.
  static final AbiFunction getAgentNameFn = AbiFunction(
    name: 'getAgentName',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentTermsOfUseUrl(address)`.
  static final AbiFunction getAgentTermsOfUseUrlFn = AbiFunction(
    name: 'getAgentTermsOfUseUrl',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getManagementAddress(address)`.
  static final AbiFunction getManagementAddressFn = AbiFunction(
    name: 'getManagementAddress',
    inputs: [
      AbiParameter(name: '_workAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getWorkAddress(address)`.
  static final AbiFunction getWorkAddressFn = AbiFunction(
    name: 'getWorkAddress',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isWhitelisted(address)`.
  static final AbiFunction isWhitelistedFn = AbiFunction(
    name: 'isWhitelisted',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAgentDescription(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentDescription(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentDescriptionFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentIconUrl(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentIconUrl(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentIconUrlFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentName(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentName(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentNameFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentTermsOfUseUrl(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentTermsOfUseUrl(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentTermsOfUseUrlFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getManagementAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getManagementAddress(EthAddress workAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getManagementAddressFn,
      args: [workAddress],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getWorkAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getWorkAddress(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getWorkAddressFn,
      args: [managementAddress],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isWhitelisted(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isWhitelisted(EthAddress address_) async {
    final out = await client.callFunction(
      contract: address,
      function: isWhitelistedFn,
      args: [address_],
    );
    return out[0]! as bool;
  }

  /// `AgentNotWhitelisted()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError agentNotWhitelistedError = AbiError(
    name: 'AgentNotWhitelisted',
    inputs: [],
  );

  /// `WorkAddressInUse()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError workAddressInUseError = AbiError(
    name: 'WorkAddressInUse',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    agentNotWhitelistedError,
    workAddressInUseError,
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

  /// `AgentDataChanged(address,string,string,string,string)`
  ///
  /// Decode a matching log with
  /// `agentDataChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentDataChangedEvent = AbiEvent(
    name: 'AgentDataChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'managementAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'description',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'iconUrl',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'termsOfUseUrl',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `Whitelisted(address)`
  ///
  /// Decode a matching log with
  /// `whitelistedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent whitelistedEvent = AbiEvent(
    name: 'Whitelisted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `WhitelistingRevoked(address)`
  ///
  /// Decode a matching log with
  /// `whitelistingRevokedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent whitelistingRevokedEvent = AbiEvent(
    name: 'WhitelistingRevoked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `WorkAddressChanged(address,address,address)`
  ///
  /// Decode a matching log with
  /// `workAddressChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent workAddressChangedEvent = AbiEvent(
    name: 'WorkAddressChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'managementAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'prevWorkAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'workAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    agentDataChangedEvent,
    whitelistedEvent,
    whitelistingRevokedEvent,
    workAddressChangedEvent,
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
