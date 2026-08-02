// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPollingFtso
// Functions: 18 — 11 readable via eth_call, 8 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPollingFtso` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPollingFtsoContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPollingFtsoContract({required this.client, required this.address});

  /// Resolves `IPollingFtso` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPollingFtsoContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPollingFtsoContract(client: client, address: resolved);
  }

  /// ABI descriptor for `addMember()`.
  static final AbiFunction addMemberFn = AbiFunction(
    name: 'addMember',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `canPropose(address)`.
  static final AbiFunction canProposeFn = AbiFunction(
    name: 'canPropose',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `canVote(address,uint256)`.
  static final AbiFunction canVoteFn = AbiFunction(
    name: 'canVote',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

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
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `changeManagementGroupMembers(address[],address[])`.
  static final AbiFunction changeManagementGroupMembersFn = AbiFunction(
    name: 'changeManagementGroupMembers',
    inputs: [
      AbiParameter(name: '_providersToAdd', type: AbiType.parse('address[]')),
      AbiParameter(
        name: '_providersToRemove',
        type: AbiType.parse('address[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getLastProposal()`.
  static final AbiFunction getLastProposalFn = AbiFunction(
    name: 'getLastProposal',
    inputs: [],
    outputs: [
      AbiParameter(name: '_proposalId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getManagementGroupMembers()`.
  static final AbiFunction getManagementGroupMembersFn = AbiFunction(
    name: 'getManagementGroupMembers',
    inputs: [],
    outputs: [AbiParameter(name: '_list', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalDescription(uint256)`.
  static final AbiFunction getProposalDescriptionFn = AbiFunction(
    name: 'getProposalDescription',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_description', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProposalInfo(uint256)`.
  static final AbiFunction getProposalInfoFn = AbiFunction(
    name: 'getProposalInfo',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_description', type: AbiType.parse('string')),
      AbiParameter(name: '_proposer', type: AbiType.parse('address')),
      AbiParameter(name: '_voteStartTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voteEndTime', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_thresholdConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_majorityConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_noOfEligibleMembers',
        type: AbiType.parse('uint256'),
      ),
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

  /// ABI descriptor for `isMember(address)`.
  static final AbiFunction isMemberFn = AbiFunction(
    name: 'isMember',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `propose(string)`.
  static final AbiFunction proposeFn = AbiFunction(
    name: 'propose',
    inputs: [AbiParameter(name: '_description', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `removeMember(address)`.
  static final AbiFunction removeMemberFn = AbiFunction(
    name: 'removeMember',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setParameters(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256)`.
  static final AbiFunction setParametersFn = AbiFunction(
    name: 'setParameters',
    inputs: [
      AbiParameter(name: '_votingDelaySeconds', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_votingPeriodSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_thresholdConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_majorityConditionBIPS',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_proposalFeeValueWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_addAfterRewardedEpochs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_addAfterNotChilledEpochs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_removeAfterNotRewardedEpochs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_removeAfterEligibleProposals',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_removeAfterNonParticipatingProposals',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_removeForDays', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setProxyVoter(address)`.
  static final AbiFunction setProxyVoterFn = AbiFunction(
    name: 'setProxyVoter',
    inputs: [AbiParameter(name: '_proxyVoter', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `state(uint256)`.
  static final AbiFunction stateFn = AbiFunction(
    name: 'state',
    inputs: [AbiParameter(name: '_proposalId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `canPropose(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> canPropose(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: canProposeFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `canVote(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> canVote(EthAddress account, BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: canVoteFn,
      args: [account, proposalId],
    );
    return out[0]! as bool;
  }

  /// Calls `getLastProposal()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt proposalId, String description})> getLastProposal() async {
    final out = await client.callFunction(
      contract: address,
      function: getLastProposalFn,
    );
    return (proposalId: out[0]! as BigInt, description: out[1]! as String);
  }

  /// Calls `getManagementGroupMembers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getManagementGroupMembers() async {
    final out = await client.callFunction(
      contract: address,
      function: getManagementGroupMembersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getProposalDescription(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getProposalDescription(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalDescriptionFn,
      args: [proposalId],
    );
    return out[0]! as String;
  }

  /// Calls `getProposalInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      String description,
      EthAddress proposer,
      BigInt voteStartTime,
      BigInt voteEndTime,
      BigInt thresholdConditionBIPS,
      BigInt majorityConditionBIPS,
      BigInt noOfEligibleMembers,
    })
  >
  getProposalInfo(BigInt proposalId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProposalInfoFn,
      args: [proposalId],
    );
    return (
      description: out[0]! as String,
      proposer: out[1]! as EthAddress,
      voteStartTime: out[2]! as BigInt,
      voteEndTime: out[3]! as BigInt,
      thresholdConditionBIPS: out[4]! as BigInt,
      majorityConditionBIPS: out[5]! as BigInt,
      noOfEligibleMembers: out[6]! as BigInt,
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

  /// Calls `isMember(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isMember(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isMemberFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `propose(string)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> propose(String description) async {
    final out = await client.callFunction(
      contract: address,
      function: proposeFn,
      args: [description],
    );
    return out[0]! as BigInt;
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

  /// Builds an unsigned `addMember()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest addMemberTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: addMemberFn,
        from: from,
      );

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

  /// Builds an unsigned `changeManagementGroupMembers(address[],address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest changeManagementGroupMembersTx(
    List<EthAddress> providersToAdd,
    List<EthAddress> providersToRemove, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: changeManagementGroupMembersFn,
    args: [providersToAdd, providersToRemove],
    from: from,
  );

  /// Builds an unsigned `propose(string)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest proposeTx(
    String description, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proposeFn,
    args: [description],
    from: from,
    value: value,
  );

  /// Builds an unsigned `removeMember(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest removeMemberTx(EthAddress account, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: removeMemberFn,
        args: [account],
        from: from,
      );

  /// Builds an unsigned `setParameters(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setParametersTx(
    BigInt votingDelaySeconds,
    BigInt votingPeriodSeconds,
    BigInt thresholdConditionBIPS,
    BigInt majorityConditionBIPS,
    BigInt proposalFeeValueWei,
    BigInt addAfterRewardedEpochs,
    BigInt addAfterNotChilledEpochs,
    BigInt removeAfterNotRewardedEpochs,
    BigInt removeAfterEligibleProposals,
    BigInt removeAfterNonParticipatingProposals,
    BigInt removeForDays, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setParametersFn,
    args: [
      votingDelaySeconds,
      votingPeriodSeconds,
      thresholdConditionBIPS,
      majorityConditionBIPS,
      proposalFeeValueWei,
      addAfterRewardedEpochs,
      addAfterNotChilledEpochs,
      removeAfterNotRewardedEpochs,
      removeAfterEligibleProposals,
      removeAfterNonParticipatingProposals,
      removeForDays,
    ],
    from: from,
  );

  /// Builds an unsigned `setProxyVoter(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setProxyVoterTx(
    EthAddress proxyVoter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setProxyVoterFn,
    args: [proxyVoter],
    from: from,
  );

  /// `FtsoProposalCreated(uint256,address,string,uint256,uint256,uint256,uint256,address[])`
  ///
  /// Decode a matching log with
  /// `ftsoProposalCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoProposalCreatedEvent = AbiEvent(
    name: 'FtsoProposalCreated',
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
        name: 'description',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'voteStartTime',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'voteEndTime',
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
        name: 'eligibleMembers',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
    ],
  );

  /// `MaintainerSet(address)`
  ///
  /// Decode a matching log with
  /// `maintainerSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maintainerSetEvent = AbiEvent(
    name: 'MaintainerSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'newMaintainer',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ManagementGroupMemberAdded(address)`
  ///
  /// Decode a matching log with
  /// `managementGroupMemberAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent managementGroupMemberAddedEvent = AbiEvent(
    name: 'ManagementGroupMemberAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'addedMember',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ManagementGroupMemberRemoved(address)`
  ///
  /// Decode a matching log with
  /// `managementGroupMemberRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent managementGroupMemberRemovedEvent = AbiEvent(
    name: 'ManagementGroupMemberRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'removedMember',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ParametersSet(uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `parametersSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent parametersSetEvent = AbiEvent(
    name: 'ParametersSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'votingDelaySeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'votingPeriodSeconds',
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
        name: 'proposalFeeValueWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'addAfterRewardedEpochs',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'addAfterNotChilledEpochs',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'removeAfterNotRewardedEpochs',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'removeAfterEligibleProposals',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'removeAfterNonParticipatingProposals',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'removeForDays',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
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

  /// `ProxyVoterSet(address,address)`
  ///
  /// Decode a matching log with
  /// `proxyVoterSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent proxyVoterSetEvent = AbiEvent(
    name: 'ProxyVoterSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'proxyVoter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `VoteCast(address,uint256,uint8,uint256,uint256)`
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
    ftsoProposalCreatedEvent,
    maintainerSetEvent,
    managementGroupMemberAddedEvent,
    managementGroupMemberRemovedEvent,
    parametersSetEvent,
    proposalCanceledEvent,
    proxyVoterSetEvent,
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
