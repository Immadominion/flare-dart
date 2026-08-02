// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IInstructionFeesFacet
// Functions: 2 — 2 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 3
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IInstructionFeesFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IInstructionFeesFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IInstructionFeesFacetContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IInstructionFeesFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IInstructionFeesFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IInstructionFeesFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDefaultInstructionFee()`.
  static final AbiFunction getDefaultInstructionFeeFn = AbiFunction(
    name: 'getDefaultInstructionFee',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInstructionFee(uint256)`.
  static final AbiFunction getInstructionFeeFn = AbiFunction(
    name: 'getInstructionFee',
    inputs: [
      AbiParameter(name: '_instructionId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getDefaultInstructionFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDefaultInstructionFee() async {
    final out = await client.callFunction(
      contract: address,
      function: getDefaultInstructionFeeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getInstructionFee(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInstructionFee(BigInt instructionId) async {
    final out = await client.callFunction(
      contract: address,
      function: getInstructionFeeFn,
      args: [instructionId],
    );
    return out[0]! as BigInt;
  }

  /// `InstructionFeeNotSet(uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError instructionFeeNotSetError = AbiError(
    name: 'InstructionFeeNotSet',
    inputs: [
      AbiParameter(name: 'instructionId', type: AbiType.parse('uint256')),
    ],
  );

  /// `InstructionFeesLengthsMismatch()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError instructionFeesLengthsMismatchError = AbiError(
    name: 'InstructionFeesLengthsMismatch',
    inputs: [],
  );

  /// `InvalidInstructionFee(uint256)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidInstructionFeeError = AbiError(
    name: 'InvalidInstructionFee',
    inputs: [
      AbiParameter(name: 'instructionId', type: AbiType.parse('uint256')),
    ],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    instructionFeeNotSetError,
    instructionFeesLengthsMismatchError,
    invalidInstructionFeeError,
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

  /// `DefaultInstructionFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `defaultInstructionFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent defaultInstructionFeeSetEvent = AbiEvent(
    name: 'DefaultInstructionFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'defaultInstructionFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InstructionFeeRemoved(uint256)`
  ///
  /// Decode a matching log with
  /// `instructionFeeRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionFeeRemovedEvent = AbiEvent(
    name: 'InstructionFeeRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `InstructionFeeSet(uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `instructionFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionFeeSetEvent = AbiEvent(
    name: 'InstructionFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'instructionFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    defaultInstructionFeeSetEvent,
    instructionFeeRemovedEvent,
    instructionFeeSetEvent,
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
