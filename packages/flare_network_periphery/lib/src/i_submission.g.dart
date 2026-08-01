// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ISubmission
// Functions: 3 readable of 8 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ISubmission` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ISubmissionContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ISubmissionContract({required this.client, required this.address});

  /// Resolves `ISubmission` through the [ContractRegistry].
  ///
  /// Registered as `Submission`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<ISubmissionContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'Submission',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ISubmissionContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQuality()`.
  static final AbiFunction getCurrentRandomWithQualityFn = AbiFunction(
    name: 'getCurrentRandomWithQuality',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQualityAndTimestamp()`.
  static final AbiFunction getCurrentRandomWithQualityAndTimestampFn =
      AbiFunction(
        name: 'getCurrentRandomWithQualityAndTimestamp',
        inputs: [],
        outputs: [
          AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
          AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
          AbiParameter(
            name: '_randomTimestamp',
            type: AbiType.parse('uint256'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// Calls `getCurrentRandom()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRandom() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRandomWithQuality()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom})>
  getCurrentRandomWithQuality() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityFn,
    );
    return (randomNumber: out[0]! as BigInt, isSecureRandom: out[1]! as bool);
  }

  /// Calls `getCurrentRandomWithQualityAndTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getCurrentRandomWithQualityAndTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityAndTimestampFn,
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }

  /// `NewVotingRoundInitiated()`
  ///
  /// Decode a matching log with
  /// `newVotingRoundInitiatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent newVotingRoundInitiatedEvent = AbiEvent(
    name: 'NewVotingRoundInitiated',
    anonymous: false,
    parameters: [],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [newVotingRoundInitiatedEvent];

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
