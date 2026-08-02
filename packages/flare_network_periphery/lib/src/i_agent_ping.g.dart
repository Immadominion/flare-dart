// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentPing
// Functions: 2 — 0 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAgentPing` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentPingContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentPingContract({required this.client, required this.address});

  /// Resolves `IAgentPing` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAgentPingContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAgentPingContract(client: client, address: resolved);
  }

  /// ABI descriptor for `agentPing(address,uint256)`.
  static final AbiFunction agentPingFn = AbiFunction(
    name: 'agentPing',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_query', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `agentPingResponse(address,uint256,string)`.
  static final AbiFunction agentPingResponseFn = AbiFunction(
    name: 'agentPingResponse',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_query', type: AbiType.parse('uint256')),
      AbiParameter(name: '_response', type: AbiType.parse('string')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `agentPing(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest agentPingTx(
    EthAddress agentVault,
    BigInt query, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: agentPingFn,
    args: [agentVault, query],
    from: from,
  );

  /// Builds an unsigned `agentPingResponse(address,uint256,string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest agentPingResponseTx(
    EthAddress agentVault,
    BigInt query,
    String response, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: agentPingResponseFn,
    args: [agentVault, query, response],
    from: from,
  );

  /// `AgentPing(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `agentPingEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentPingEvent = AbiEvent(
    name: 'AgentPing',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'query',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentPingResponse(address,address,uint256,string)`
  ///
  /// Decode a matching log with
  /// `agentPingResponseEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentPingResponseEvent = AbiEvent(
    name: 'AgentPingResponse',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'query',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'response',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    agentPingEvent,
    agentPingResponseEvent,
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
