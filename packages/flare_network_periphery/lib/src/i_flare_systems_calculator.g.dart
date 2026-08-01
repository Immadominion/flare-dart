// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFlareSystemsCalculator
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFlareSystemsCalculator` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFlareSystemsCalculatorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFlareSystemsCalculatorContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFlareSystemsCalculator` through the [ContractRegistry].
  ///
  /// Registered as `FlareSystemsCalculator`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFlareSystemsCalculatorContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FlareSystemsCalculator',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFlareSystemsCalculatorContract(client: client, address: resolved);
  }

  /// ABI descriptor for `signingPolicySignNoRewardsDurationBlocks()`.
  static final AbiFunction signingPolicySignNoRewardsDurationBlocksFn =
      AbiFunction(
        name: 'signingPolicySignNoRewardsDurationBlocks',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `signingPolicySignNonPunishableDurationBlocks()`.
  static final AbiFunction signingPolicySignNonPunishableDurationBlocksFn =
      AbiFunction(
        name: 'signingPolicySignNonPunishableDurationBlocks',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `signingPolicySignNonPunishableDurationSeconds()`.
  static final AbiFunction signingPolicySignNonPunishableDurationSecondsFn =
      AbiFunction(
        name: 'signingPolicySignNonPunishableDurationSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `wNatCapPPM()`.
  static final AbiFunction wNatCapPPMFn = AbiFunction(
    name: 'wNatCapPPM',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `signingPolicySignNoRewardsDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNoRewardsDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNoRewardsDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySignNonPunishableDurationBlocks()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNonPunishableDurationBlocks() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNonPunishableDurationBlocksFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySignNonPunishableDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> signingPolicySignNonPunishableDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySignNonPunishableDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `wNatCapPPM()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> wNatCapPPM() async {
    final out = await client.callFunction(
      contract: address,
      function: wNatCapPPMFn,
    );
    return out[0]! as BigInt;
  }

  /// `VoterRegistrationInfo(address,uint32,address,uint16,uint256,uint256,bytes20[],uint256[])`
  ///
  /// Decode a matching log with
  /// `voterRegistrationInfoEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRegistrationInfoEvent = AbiEvent(
    name: 'VoterRegistrationInfo',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'delegationAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'delegationFeeBIPS',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'wNatWeight',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'wNatCappedWeight',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'nodeIds',
        type: AbiType.parse('bytes20[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'nodeWeights',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [voterRegistrationInfoEvent];

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
