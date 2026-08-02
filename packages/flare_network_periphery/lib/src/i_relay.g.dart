// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRelay
// Functions: 16 — 13 readable via eth_call, 4 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRelay` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRelayContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRelayContract({required this.client, required this.address});

  /// Resolves `IRelay` through the [ContractRegistry].
  ///
  /// Registered as `Relay`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IRelayContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'Relay',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRelayContract(client: client, address: resolved);
  }

  /// ABI descriptor for `feeCollectionAddress()`.
  static final AbiFunction feeCollectionAddressFn = AbiFunction(
    name: 'feeCollectionAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandomNumber()`.
  static final AbiFunction getRandomNumberFn = AbiFunction(
    name: 'getRandomNumber',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandomNumberHistorical(uint256)`.
  static final AbiFunction getRandomNumberHistoricalFn = AbiFunction(
    name: 'getRandomNumberHistorical',
    inputs: [
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotingRoundId(uint256)`.
  static final AbiFunction getVotingRoundIdFn = AbiFunction(
    name: 'getVotingRoundId',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `governanceFeeSetup(bytes,(bytes32,uint256,(uint8,uint256)[]))`.
  static final AbiFunction governanceFeeSetupFn = AbiFunction(
    name: 'governanceFeeSetup',
    inputs: [
      AbiParameter(name: '_relayMessage', type: AbiType.parse('bytes')),
      AbiParameter(
        name: '_config',
        type: AbiType.parse('(bytes32,uint256,(uint8,uint256)[])'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `isFinalized(uint256,uint256)`.
  static final AbiFunction isFinalizedFn = AbiFunction(
    name: 'isFinalized',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `lastInitializedRewardEpochData()`.
  static final AbiFunction lastInitializedRewardEpochDataFn = AbiFunction(
    name: 'lastInitializedRewardEpochData',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_lastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: '_startingVotingRoundIdForLastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `merkleRoots(uint256,uint256)`.
  static final AbiFunction merkleRootsFn = AbiFunction(
    name: 'merkleRoots',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_merkleRoot', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `protocolFeeInWei(uint256)`.
  static final AbiFunction protocolFeeInWeiFn = AbiFunction(
    name: 'protocolFeeInWei',
    inputs: [AbiParameter(name: '_protocolId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `relay()`.
  static final AbiFunction relayFn = AbiFunction(
    name: 'relay',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `signingPolicySetter()`.
  static final AbiFunction signingPolicySetterFn = AbiFunction(
    name: 'signingPolicySetter',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `startingVotingRoundIds(uint256)`.
  static final AbiFunction startingVotingRoundIdsFn = AbiFunction(
    name: 'startingVotingRoundIds',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_startingVotingRoundId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `stateData()`.
  static final AbiFunction stateDataFn = AbiFunction(
    name: 'stateData',
    inputs: [],
    outputs: [
      AbiParameter(
        name: 'randomNumberProtocolId',
        type: AbiType.parse('uint8'),
      ),
      AbiParameter(
        name: 'firstVotingRoundStartTs',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: 'votingEpochDurationSeconds',
        type: AbiType.parse('uint8'),
      ),
      AbiParameter(
        name: 'firstRewardEpochStartVotingRoundId',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: 'rewardEpochDurationInVotingEpochs',
        type: AbiType.parse('uint16'),
      ),
      AbiParameter(
        name: 'thresholdIncreaseBIPS',
        type: AbiType.parse('uint16'),
      ),
      AbiParameter(name: 'randomVotingRoundId', type: AbiType.parse('uint32')),
      AbiParameter(name: 'isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(
        name: 'lastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(name: 'noSigningPolicyRelay', type: AbiType.parse('bool')),
      AbiParameter(
        name: 'messageFinalizationWindowInRewardEpochs',
        type: AbiType.parse('uint32'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `toSigningPolicyHash(uint256)`.
  static final AbiFunction toSigningPolicyHashFn = AbiFunction(
    name: 'toSigningPolicyHash',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_signingPolicyHash', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verify(uint256,uint256,bytes32,bytes32[])`.
  static final AbiFunction verifyFn = AbiFunction(
    name: 'verify',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_leaf', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_proof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `verifyCustomSignature(bytes,bytes32)`.
  static final AbiFunction verifyCustomSignatureFn = AbiFunction(
    name: 'verifyCustomSignature',
    inputs: [
      AbiParameter(name: '_relayMessage', type: AbiType.parse('bytes')),
      AbiParameter(name: '_messageHash', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `feeCollectionAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> feeCollectionAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: feeCollectionAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getRandomNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getRandomNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberFn,
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getRandomNumberHistorical(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getRandomNumberHistorical(BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberHistoricalFn,
      args: [votingRoundId],
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getVotingRoundId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotingRoundId(BigInt timestamp) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotingRoundIdFn,
      args: [timestamp],
    );
    return out[0]! as BigInt;
  }

  /// Calls `isFinalized(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isFinalized(BigInt protocolId, BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: isFinalizedFn,
      args: [protocolId, votingRoundId],
    );
    return out[0]! as bool;
  }

  /// Calls `lastInitializedRewardEpochData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt lastInitializedRewardEpoch,
      BigInt startingVotingRoundIdForLastInitializedRewardEpoch,
    })
  >
  lastInitializedRewardEpochData() async {
    final out = await client.callFunction(
      contract: address,
      function: lastInitializedRewardEpochDataFn,
    );
    return (
      lastInitializedRewardEpoch: out[0]! as BigInt,
      startingVotingRoundIdForLastInitializedRewardEpoch: out[1]! as BigInt,
    );
  }

  /// Calls `merkleRoots(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> merkleRoots(BigInt protocolId, BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: merkleRootsFn,
      args: [protocolId, votingRoundId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `protocolFeeInWei(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> protocolFeeInWei(BigInt protocolId) async {
    final out = await client.callFunction(
      contract: address,
      function: protocolFeeInWeiFn,
      args: [protocolId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySetter()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> signingPolicySetter() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySetterFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `startingVotingRoundIds(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> startingVotingRoundIds(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: startingVotingRoundIdsFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `stateData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt randomNumberProtocolId,
      BigInt firstVotingRoundStartTs,
      BigInt votingEpochDurationSeconds,
      BigInt firstRewardEpochStartVotingRoundId,
      BigInt rewardEpochDurationInVotingEpochs,
      BigInt thresholdIncreaseBIPS,
      BigInt randomVotingRoundId,
      bool isSecureRandom,
      BigInt lastInitializedRewardEpoch,
      bool noSigningPolicyRelay,
      BigInt messageFinalizationWindowInRewardEpochs,
    })
  >
  stateData() async {
    final out = await client.callFunction(
      contract: address,
      function: stateDataFn,
    );
    return (
      randomNumberProtocolId: out[0]! as BigInt,
      firstVotingRoundStartTs: out[1]! as BigInt,
      votingEpochDurationSeconds: out[2]! as BigInt,
      firstRewardEpochStartVotingRoundId: out[3]! as BigInt,
      rewardEpochDurationInVotingEpochs: out[4]! as BigInt,
      thresholdIncreaseBIPS: out[5]! as BigInt,
      randomVotingRoundId: out[6]! as BigInt,
      isSecureRandom: out[7]! as bool,
      lastInitializedRewardEpoch: out[8]! as BigInt,
      noSigningPolicyRelay: out[9]! as bool,
      messageFinalizationWindowInRewardEpochs: out[10]! as BigInt,
    );
  }

  /// Calls `toSigningPolicyHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> toSigningPolicyHash(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: toSigningPolicyHashFn,
      args: [rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `verify(uint256,uint256,bytes32,bytes32[])`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<bool> verify(
    BigInt protocolId,
    BigInt votingRoundId,
    Uint8List leaf,
    List<Uint8List> proof,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyFn,
      args: [protocolId, votingRoundId, leaf, proof],
    );
    return out[0]! as bool;
  }

  /// Builds an unsigned `governanceFeeSetup(bytes,(bytes32,uint256,(uint8,uint256)[]))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest governanceFeeSetupTx(
    Uint8List relayMessage,
    List<Object?> config, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: governanceFeeSetupFn,
    args: [relayMessage, config],
    from: from,
  );

  /// Builds an unsigned `relay()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest relayTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: relayFn,
        from: from,
      );

  /// Builds an unsigned `verify(uint256,uint256,bytes32,bytes32[])`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest verifyTx(
    BigInt protocolId,
    BigInt votingRoundId,
    Uint8List leaf,
    List<Uint8List> proof, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: verifyFn,
    args: [protocolId, votingRoundId, leaf, proof],
    from: from,
    value: value,
  );

  /// Builds an unsigned `verifyCustomSignature(bytes,bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest verifyCustomSignatureTx(
    Uint8List relayMessage,
    Uint8List messageHash, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: verifyCustomSignatureFn,
    args: [relayMessage, messageHash],
    from: from,
  );

  /// `ProtocolMessageRelayed(uint8,uint32,bool,bytes32)`
  ///
  /// Decode a matching log with
  /// `protocolMessageRelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent protocolMessageRelayedEvent = AbiEvent(
    name: 'ProtocolMessageRelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'protocolId',
        type: AbiType.parse('uint8'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'votingRoundId',
        type: AbiType.parse('uint32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'isSecureRandom',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'merkleRoot',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `SigningPolicyInitialized(uint24,uint32,uint16,uint256,address[],uint16[],bytes,uint64)`
  ///
  /// Decode a matching log with
  /// `signingPolicyInitializedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signingPolicyInitializedEvent = AbiEvent(
    name: 'SigningPolicyInitialized',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'startVotingRoundId',
        type: AbiType.parse('uint32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'threshold',
        type: AbiType.parse('uint16'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'seed',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'voters',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'weights',
        type: AbiType.parse('uint16[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'signingPolicyBytes',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `SigningPolicyRelayed(uint256)`
  ///
  /// Decode a matching log with
  /// `signingPolicyRelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signingPolicyRelayedEvent = AbiEvent(
    name: 'SigningPolicyRelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    protocolMessageRelayedEvent,
    signingPolicyInitializedEvent,
    signingPolicyRelayedEvent,
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
