// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIGenericRewardManager
// Functions: 16 — 6 readable via eth_call, 10 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIGenericRewardManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIGenericRewardManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIGenericRewardManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIGenericRewardManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIGenericRewardManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIGenericRewardManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `activate()`.
  static final AbiFunction activateFn = AbiFunction(
    name: 'activate',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allowedClaimRecipients(address)`.
  static final AbiFunction allowedClaimRecipientsFn = AbiFunction(
    name: 'allowedClaimRecipients',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `claim(address,address,uint256,bool)`.
  static final AbiFunction claimFn = AbiFunction(
    name: 'claim',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
      AbiParameter(name: '_wrap', type: AbiType.parse('bool')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `deactivate()`.
  static final AbiFunction deactivateFn = AbiFunction(
    name: 'deactivate',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `distributeRewards(address[],uint256[])`.
  static final AbiFunction distributeRewardsFn = AbiFunction(
    name: 'distributeRewards',
    inputs: [
      AbiParameter(name: '_addresses', type: AbiType.parse('address[]')),
      AbiParameter(name: '_rewardAmounts', type: AbiType.parse('uint256[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInflationAddress()`.
  static final AbiFunction getInflationAddressFn = AbiFunction(
    name: 'getInflationAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getStateOfRewards(address)`.
  static final AbiFunction getStateOfRewardsFn = AbiFunction(
    name: 'getStateOfRewards',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_totalReward', type: AbiType.parse('uint256')),
      AbiParameter(name: '_claimedReward', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTokenPoolSupplyData()`.
  static final AbiFunction getTokenPoolSupplyDataFn = AbiFunction(
    name: 'getTokenPoolSupplyData',
    inputs: [],
    outputs: [
      AbiParameter(name: '_lockedFundsWei', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_totalInflationAuthorizedWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_totalClaimedWei', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getTotals()`.
  static final AbiFunction getTotalsFn = AbiFunction(
    name: 'getTotals',
    inputs: [],
    outputs: [
      AbiParameter(name: '_totalAwardedWei', type: AbiType.parse('uint256')),
      AbiParameter(name: '_totalClaimedWei', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_totalInflationAuthorizedWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_totalInflationReceivedWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_lastInflationAuthorizationReceivedTs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_dailyAuthorizedInflation',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `receiveInflation()`.
  static final AbiFunction receiveInflationFn = AbiFunction(
    name: 'receiveInflation',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `setAllowedClaimRecipients(address[])`.
  static final AbiFunction setAllowedClaimRecipientsFn = AbiFunction(
    name: 'setAllowedClaimRecipients',
    inputs: [
      AbiParameter(name: '_recipients', type: AbiType.parse('address[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setClaimExecutors(address[])`.
  static final AbiFunction setClaimExecutorsFn = AbiFunction(
    name: 'setClaimExecutors',
    inputs: [
      AbiParameter(name: '_executors', type: AbiType.parse('address[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDailyAuthorizedInflation(uint256)`.
  static final AbiFunction setDailyAuthorizedInflationFn = AbiFunction(
    name: 'setDailyAuthorizedInflation',
    inputs: [
      AbiParameter(name: '_toAuthorizeWei', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `active()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> active() async {
    final out = await client.callFunction(
      contract: address,
      function: activeFn,
    );
    return out[0]! as bool;
  }

  /// Calls `allowedClaimRecipients(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> allowedClaimRecipients(
    EthAddress rewardOwner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: allowedClaimRecipientsFn,
      args: [rewardOwner],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `claimExecutors(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> claimExecutors(EthAddress rewardOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: claimExecutorsFn,
      args: [rewardOwner],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getContractName()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getContractName() async {
    final out = await client.callFunction(
      contract: address,
      function: getContractNameFn,
    );
    return out[0]! as String;
  }

  /// Calls `getStateOfRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt totalReward, BigInt claimedReward})> getStateOfRewards(
    EthAddress beneficiary,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [beneficiary],
    );
    return (totalReward: out[0]! as BigInt, claimedReward: out[1]! as BigInt);
  }

  /// Calls `getTotals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt totalAwardedWei,
      BigInt totalClaimedWei,
      BigInt totalInflationAuthorizedWei,
      BigInt totalInflationReceivedWei,
      BigInt lastInflationAuthorizationReceivedTs,
      BigInt dailyAuthorizedInflation,
    })
  >
  getTotals() async {
    final out = await client.callFunction(
      contract: address,
      function: getTotalsFn,
    );
    return (
      totalAwardedWei: out[0]! as BigInt,
      totalClaimedWei: out[1]! as BigInt,
      totalInflationAuthorizedWei: out[2]! as BigInt,
      totalInflationReceivedWei: out[3]! as BigInt,
      lastInflationAuthorizationReceivedTs: out[4]! as BigInt,
      dailyAuthorizedInflation: out[5]! as BigInt,
    );
  }

  /// Builds an unsigned `activate()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest activateTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: activateFn,
        from: from,
      );

  /// Builds an unsigned `claim(address,address,uint256,bool)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest claimTx(
    EthAddress rewardOwner,
    EthAddress recipient,
    BigInt rewardAmount,
    bool wrap, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimFn,
    args: [rewardOwner, recipient, rewardAmount, wrap],
    from: from,
  );

  /// Builds an unsigned `deactivate()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest deactivateTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: deactivateFn,
        from: from,
      );

  /// Builds an unsigned `distributeRewards(address[],uint256[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest distributeRewardsTx(
    List<EthAddress> addresses,
    List<BigInt> rewardAmounts, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: distributeRewardsFn,
    args: [addresses, rewardAmounts],
    from: from,
  );

  /// Builds an unsigned `getInflationAddress()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest getInflationAddressTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: getInflationAddressFn,
        from: from,
      );

  /// Builds an unsigned `getTokenPoolSupplyData()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest getTokenPoolSupplyDataTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: getTokenPoolSupplyDataFn,
        from: from,
      );

  /// Builds an unsigned `receiveInflation()`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest receiveInflationTx({EthAddress? from, BigInt? value}) =>
      TransactionRequest.callFunction(
        to: address,
        function: receiveInflationFn,
        from: from,
        value: value,
      );

  /// Builds an unsigned `setAllowedClaimRecipients(address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setAllowedClaimRecipientsTx(
    List<EthAddress> recipients, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setAllowedClaimRecipientsFn,
    args: [recipients],
    from: from,
  );

  /// Builds an unsigned `setClaimExecutors(address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setClaimExecutorsTx(
    List<EthAddress> executors, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setClaimExecutorsFn,
    args: [executors],
    from: from,
  );

  /// Builds an unsigned `setDailyAuthorizedInflation(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDailyAuthorizedInflationTx(
    BigInt toAuthorizeWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDailyAuthorizedInflationFn,
    args: [toAuthorizeWei],
    from: from,
  );

  /// `AllowedClaimRecipientsChanged(address,address[])`
  ///
  /// Decode a matching log with
  /// `allowedClaimRecipientsChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedClaimRecipientsChangedEvent = AbiEvent(
    name: 'AllowedClaimRecipientsChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardOwner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'recipients',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
    ],
  );

  /// `ClaimExecutorsChanged(address,address[])`
  ///
  /// Decode a matching log with
  /// `claimExecutorsChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimExecutorsChangedEvent = AbiEvent(
    name: 'ClaimExecutorsChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardOwner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executors',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
    ],
  );

  /// `DailyAuthorizedInflationSet(uint256)`
  ///
  /// Decode a matching log with
  /// `dailyAuthorizedInflationSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent dailyAuthorizedInflationSetEvent = AbiEvent(
    name: 'DailyAuthorizedInflationSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'authorizedAmountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InflationReceived(uint256)`
  ///
  /// Decode a matching log with
  /// `inflationReceivedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent inflationReceivedEvent = AbiEvent(
    name: 'InflationReceived',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amountReceivedWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardClaimed(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `rewardClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardClaimedEvent = AbiEvent(
    name: 'RewardClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'beneficiary',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sentTo',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardManagerActivated(address)`
  ///
  /// Decode a matching log with
  /// `rewardManagerActivatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardManagerActivatedEvent = AbiEvent(
    name: 'RewardManagerActivated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardManager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RewardManagerDeactivated(address)`
  ///
  /// Decode a matching log with
  /// `rewardManagerDeactivatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardManagerDeactivatedEvent = AbiEvent(
    name: 'RewardManagerDeactivated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardManager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsDistributed(address[],uint256[])`
  ///
  /// Decode a matching log with
  /// `rewardsDistributedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsDistributedEvent = AbiEvent(
    name: 'RewardsDistributed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'addresses',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'rewards',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    allowedClaimRecipientsChangedEvent,
    claimExecutorsChangedEvent,
    dailyAuthorizedInflationSetEvent,
    inflationReceivedEvent,
    rewardClaimedEvent,
    rewardManagerActivatedEvent,
    rewardManagerDeactivatedEvent,
    rewardsDistributedEvent,
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
