// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDirectMinting
// Functions: 2 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDirectMinting` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDirectMintingContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDirectMintingContract({required this.client, required this.address});

  /// Resolves `IDirectMinting` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDirectMintingContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDirectMintingContract(client: client, address: resolved);
  }

  /// ABI descriptor for `directMintingDelayState(bytes32)`.
  static final AbiFunction directMintingDelayStateFn = AbiFunction(
    name: 'directMintingDelayState',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_delayState', type: AbiType.parse('uint8')),
      AbiParameter(name: '_allowedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: '_startedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `directMintingPaymentAddress()`.
  static final AbiFunction directMintingPaymentAddressFn = AbiFunction(
    name: 'directMintingPaymentAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `directMintingDelayState(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt delayState, BigInt allowedAt, BigInt startedAt})>
  directMintingDelayState(Uint8List transactionId) async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingDelayStateFn,
      args: [transactionId],
    );
    return (
      delayState: out[0]! as BigInt,
      allowedAt: out[1]! as BigInt,
      startedAt: out[2]! as BigInt,
    );
  }

  /// Calls `directMintingPaymentAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> directMintingPaymentAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingPaymentAddressFn,
    );
    return out[0]! as String;
  }

  /// `DirectMintingDelayed(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingDelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingDelayedEvent = AbiEvent(
    name: 'DirectMintingDelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executionAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingExecuted(bytes32,address,address,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedEvent = AbiEvent(
    name: 'DirectMintingExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'targetAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingExecutedToSmartAccount(bytes32,string,address,uint256,uint256,bytes)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedToSmartAccountEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedToSmartAccountEvent = AbiEvent(
    name: 'DirectMintingExecutedToSmartAccount',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'sourceAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'memoData',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingPaymentTooSmallForFee(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingPaymentTooSmallForFeeEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingPaymentTooSmallForFeeEvent = AbiEvent(
    name: 'DirectMintingPaymentTooSmallForFee',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'receivedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minimumMintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingsUnblocked(uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingsUnblockedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingsUnblockedEvent = AbiEvent(
    name: 'DirectMintingsUnblocked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'startedUntilTimestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `LargeDirectMintingDelayed(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `largeDirectMintingDelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent largeDirectMintingDelayedEvent = AbiEvent(
    name: 'LargeDirectMintingDelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executionAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    directMintingDelayedEvent,
    directMintingExecutedEvent,
    directMintingExecutedToSmartAccountEvent,
    directMintingPaymentTooSmallForFeeEvent,
    directMintingsUnblockedEvent,
    largeDirectMintingDelayedEvent,
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
