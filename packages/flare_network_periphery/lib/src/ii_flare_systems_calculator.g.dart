// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFlareSystemsCalculator
// Functions: 6 — 5 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIFlareSystemsCalculator` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFlareSystemsCalculatorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFlareSystemsCalculatorContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFlareSystemsCalculator` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFlareSystemsCalculatorContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFlareSystemsCalculatorContract(client: client, address: resolved);
  }

  /// ABI descriptor for `calculateBurnFactorPPM(uint24,address)`.
  static final AbiFunction calculateBurnFactorPPMFn = AbiFunction(
    name: 'calculateBurnFactorPPM',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `calculateRegistrationWeight(address,uint32,uint256)`.
  static final AbiFunction calculateRegistrationWeightFn = AbiFunction(
    name: 'calculateRegistrationWeight',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint32')),
      AbiParameter(
        name: '_votePowerBlockNumber',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [
      AbiParameter(name: '_registrationWeight', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

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

  /// Calls `calculateBurnFactorPPM(uint24,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> calculateBurnFactorPPM(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: calculateBurnFactorPPMFn,
      args: [rewardEpochId, voter],
    );
    return out[0]! as BigInt;
  }

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

  /// Builds an unsigned `calculateRegistrationWeight(address,uint32,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest calculateRegistrationWeightTx(
    EthAddress voter,
    BigInt rewardEpochId,
    BigInt votePowerBlockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: calculateRegistrationWeightFn,
    args: [voter, rewardEpochId, votePowerBlockNumber],
    from: from,
  );

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
