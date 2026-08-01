// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IMemoInstructionsFacet
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IMemoInstructionsFacet` contract.
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
