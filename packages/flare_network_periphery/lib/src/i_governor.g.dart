// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IGovernor
// Functions: 11 — 6 readable via eth_call, 6 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IGovernor` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IGovernorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IGovernorContract({required this.client, required this.address});

  /// Resolves `IGovernor` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IGovernorContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IGovernorContract(client: client, address: resolved);
  }

  /// ABI descriptor for `cancel(uint256)`.
  static final AbiFunction cancelFn = AbiFunction(
    name: 'cancel',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `castVote(uint256,uint8)`.
  static final AbiFunction castVoteFn = AbiFunction(
    name: 'castVote',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_support', type: AbiType.parse('uint8')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `castVoteBySig(uint256,uint8,uint8,bytes32,bytes32)`.
  static final AbiFunction castVoteBySigFn = AbiFunction(
    name: 'castVoteBySig',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_support', type: AbiType.parse('uint8')),
      AbiParameter(name: '_v', type: AbiType.parse('uint8')),
      AbiParameter(name: '_r', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_s', type: AbiType.parse('bytes32')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `castVoteWithReason(uint256,uint8,string)`.
  static final AbiFunction castVoteWithReasonFn = AbiFunction(
    name: 'castVoteWithReason',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_support', type: AbiType.parse('uint8')),
      AbiParameter(name: '_reason', type: AbiType.parse('string')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `execute(string)`.
  static final AbiFunction executeFn = AbiFunction(
    name: 'execute',
    inputs: [AbiParameter(name: '_description', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `execute(address[],uint256[],bytes[],string)`.
  static final AbiFunction execute2Fn = AbiFunction(
    name: 'execute',
    inputs: [
      AbiParameter(name: '_targets', type: AbiType.parse('address[]')),
      AbiParameter(name: '_values', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_calldatas', type: AbiType.parse('bytes[]')),
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `getProposalInfo(uint256)`.
  static final AbiFunction getProposalInfoFn = AbiFunction(
    name: 'getProposalInfo',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_proposer', type: AbiType.parse('address')),
      AbiParameter(name: '_accept', type: AbiType.parse('bool')),
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_execStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_execEndTime', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_thresholdConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_majorityConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_circulatingSupply', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalVotes(uint256)`.
  static final AbiFunction getProposalVotesFn = AbiFunction(
    name: 'getProposalVotes',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_for', type: AbiType.parse('uint256')),
      AbiParameter(name: '_against', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address,uint256)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `hasVoted(uint256,address)`.
  static final AbiFunction hasVotedFn = AbiFunction(
    name: 'hasVoted',
    inputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `state(uint256)`.
  static final AbiFunction stateFn = AbiFunction(
    name: 'state',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `execute(address[],uint256[],bytes[],string)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> execute2(
    List<EthAddress> targets,
    List<BigInt> values,
    List<Uint8List> calldatas,
    String description,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: execute2Fn,
      args: [targets, values, calldatas, description],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getProposalInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      EthAddress proposer,
      bool accept,
      BigInt votePowerBlock,
      BigInt voteStartTime,
      BigInt voteEndTime,
      BigInt execStartTime,
      BigInt execEndTime,
      BigInt thresholdConditionBIPS,
      BigInt majorityConditionBIPS,
      BigInt circulatingSupply,
    })
  >
  getProposalInfo(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalInfoFn,
      args: [proposalId],
    );
    return (
      proposer: out[0]! as EthAddress,
      accept: out[1]! as bool,
      votePowerBlock: out[2]! as BigInt,
      voteStartTime: out[3]! as BigInt,
      voteEndTime: out[4]! as BigInt,
      execStartTime: out[5]! as BigInt,
      execEndTime: out[6]! as BigInt,
      thresholdConditionBIPS: out[7]! as BigInt,
      majorityConditionBIPS: out[8]! as BigInt,
      circulatingSupply: out[9]! as BigInt,
    );
  }

  /// Calls `getProposalVotes(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt forValue, BigInt against})> getProposalVotes(
    BigInt proposalId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalVotesFn,
      args: [proposalId],
    );
    return (forValue: out[0]! as BigInt, against: out[1]! as BigInt);
  }

  /// Calls `getVotes(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotes(EthAddress voter, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [voter, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `hasVoted(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> hasVoted(BigInt proposalId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: hasVotedFn,
      args: [proposalId, voter],
    );
    return out[0]! as bool;
  }

  /// Calls `state(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> state(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: stateFn,
      args: [proposalId],
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `cancel(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest cancelTx(BigInt proposalId, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: cancelFn,
        args: [proposalId],
        from: from,
      );

  /// Builds an unsigned `castVote(uint256,uint8)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest castVoteTx(
    BigInt proposalId,
    BigInt support, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: castVoteFn,
    args: [proposalId, support],
    from: from,
  );

  /// Builds an unsigned `castVoteBySig(uint256,uint8,uint8,bytes32,bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest castVoteBySigTx(
    BigInt proposalId,
    BigInt support,
    BigInt v,
    Uint8List r,
    Uint8List s, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: castVoteBySigFn,
    args: [proposalId, support, v, r, s],
    from: from,
  );

  /// Builds an unsigned `castVoteWithReason(uint256,uint8,string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest castVoteWithReasonTx(
    BigInt proposalId,
    BigInt support,
    String reason, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: castVoteWithReasonFn,
    args: [proposalId, support, reason],
    from: from,
  );

  /// Builds an unsigned `execute(string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest executeTx(String description, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: executeFn,
        args: [description],
        from: from,
      );

  /// Builds an unsigned `execute(address[],uint256[],bytes[],string)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest execute2Tx(
    List<EthAddress> targets,
    List<BigInt> values,
    List<Uint8List> calldatas,
    String description, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: execute2Fn,
    args: [targets, values, calldatas, description],
    from: from,
    value: value,
  );

  /// `ProposalCanceled(uint256)`
  ///
  /// Decode a matching log with
  /// `proposalCanceledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent proposalCanceledEvent = AbiEvent(
    name: 'ProposalCanceled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'proposalId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `ProposalCreated(uint256,address,address[],uint256[],bytes[],string,bool,uint256[2],uint256[2],uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `proposalCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent proposalCreatedEvent = AbiEvent(
    name: 'ProposalCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'proposalId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'proposer',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'targets',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'values',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'calldatas',
        type: AbiType.parse('bytes[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'description',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'accept',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'voteTimes',
        type: AbiType.parse('uint256[2]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executionTimes',
        type: AbiType.parse('uint256[2]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'votePowerBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'thresholdConditionBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'majorityConditionBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'circulatingSupply',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ProposalExecuted(uint256)`
  ///
  /// Decode a matching log with
  /// `proposalExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent proposalExecutedEvent = AbiEvent(
    name: 'ProposalExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'proposalId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `VoteCast(address,uint256,uint8,uint256,string,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `voteCastEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voteCastEvent = AbiEvent(
    name: 'VoteCast',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'proposalId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'support',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'votePower',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'reason',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'forVotePower',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'againstVotePower',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    proposalCanceledEvent,
    proposalCreatedEvent,
    proposalExecutedEvent,
    voteCastEvent,
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
