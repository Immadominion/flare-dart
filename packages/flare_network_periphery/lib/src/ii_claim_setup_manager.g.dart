// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIClaimSetupManager
// Functions: 13 readable of 33 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIClaimSetupManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIClaimSetupManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIClaimSetupManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIClaimSetupManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIClaimSetupManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIClaimSetupManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `accountToDelegationAccount(address)`.
  static final AbiFunction accountToDelegationAccountFn = AbiFunction(
    name: 'accountToDelegationAccount',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
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

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAutoClaimAddressesAndExecutorFee(address,address[])`.
  static final AbiFunction getAutoClaimAddressesAndExecutorFeeFn = AbiFunction(
    name: 'getAutoClaimAddressesAndExecutorFee',
    inputs: [
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_owners', type: AbiType.parse('address[]')),
    ],
    outputs: [
      AbiParameter(name: '_recipients', type: AbiType.parse('address[]')),
      AbiParameter(name: '_executorFeeValue', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegationAccountData(address)`.
  static final AbiFunction getDelegationAccountDataFn = AbiFunction(
    name: 'getDelegationAccountData',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_delegationAccount', type: AbiType.parse('address')),
      AbiParameter(name: '_enabled', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorCurrentFeeValue(address)`.
  static final AbiFunction getExecutorCurrentFeeValueFn = AbiFunction(
    name: 'getExecutorCurrentFeeValue',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorFeeValue(address,uint256)`.
  static final AbiFunction getExecutorFeeValueFn = AbiFunction(
    name: 'getExecutorFeeValue',
    inputs: [
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorInfo(address)`.
  static final AbiFunction getExecutorInfoFn = AbiFunction(
    name: 'getExecutorInfo',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_registered', type: AbiType.parse('bool')),
      AbiParameter(name: '_currentFeeValue', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorScheduledFeeValueChanges(address)`.
  static final AbiFunction getExecutorScheduledFeeValueChangesFn = AbiFunction(
    name: 'getExecutorScheduledFeeValueChanges',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_feeValue', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_validFromEpoch', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_fixed', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredExecutors(uint256,uint256)`.
  static final AbiFunction getRegisteredExecutorsFn = AbiFunction(
    name: 'getRegisteredExecutors',
    inputs: [
      AbiParameter(name: '_start', type: AbiType.parse('uint256')),
      AbiParameter(name: '_end', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_registeredExecutors',
        type: AbiType.parse('address[]'),
      ),
      AbiParameter(name: '_totalLength', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isClaimExecutor(address,address)`.
  static final AbiFunction isClaimExecutorFn = AbiFunction(
    name: 'isClaimExecutor',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `registerExecutor(uint256)`.
  static final AbiFunction registerExecutorFn = AbiFunction(
    name: 'registerExecutor',
    inputs: [AbiParameter(name: '_feeValue', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `wNat()`.
  static final AbiFunction wNatFn = AbiFunction(
    name: 'wNat',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `accountToDelegationAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> accountToDelegationAccount(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: accountToDelegationAccountFn,
      args: [owner],
    );
    return out[0]! as EthAddress;
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
  Future<List<EthAddress>> claimExecutors(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: claimExecutorsFn,
      args: [owner],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getAutoClaimAddressesAndExecutorFee(address,address[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> recipients, BigInt executorFeeValue})>
  getAutoClaimAddressesAndExecutorFee(
    EthAddress executor,
    List<EthAddress> owners,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getAutoClaimAddressesAndExecutorFeeFn,
      args: [executor, owners],
    );
    return (
      recipients: (out[0]! as List).cast<EthAddress>(),
      executorFeeValue: out[1]! as BigInt,
    );
  }

  /// Calls `getDelegationAccountData(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({EthAddress delegationAccount, bool enabled})>
  getDelegationAccountData(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegationAccountDataFn,
      args: [owner],
    );
    return (delegationAccount: out[0]! as EthAddress, enabled: out[1]! as bool);
  }

  /// Calls `getExecutorCurrentFeeValue(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecutorCurrentFeeValue(EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorCurrentFeeValueFn,
      args: [executor],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecutorFeeValue(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecutorFeeValue(
    EthAddress executor,
    BigInt rewardEpoch,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorFeeValueFn,
      args: [executor, rewardEpoch],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecutorInfo(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool registered, BigInt currentFeeValue})> getExecutorInfo(
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorInfoFn,
      args: [executor],
    );
    return (registered: out[0]! as bool, currentFeeValue: out[1]! as BigInt);
  }

  /// Calls `getExecutorScheduledFeeValueChanges(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({List<BigInt> feeValue, List<BigInt> validFromEpoch, List<bool> fixed})
  >
  getExecutorScheduledFeeValueChanges(EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorScheduledFeeValueChangesFn,
      args: [executor],
    );
    return (
      feeValue: (out[0]! as List).cast<BigInt>(),
      validFromEpoch: (out[1]! as List).cast<BigInt>(),
      fixed: (out[2]! as List).cast<bool>(),
    );
  }

  /// Calls `getRegisteredExecutors(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> registeredExecutors, BigInt totalLength})>
  getRegisteredExecutors(BigInt start, BigInt end) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredExecutorsFn,
      args: [start, end],
    );
    return (
      registeredExecutors: (out[0]! as List).cast<EthAddress>(),
      totalLength: out[1]! as BigInt,
    );
  }

  /// Calls `isClaimExecutor(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isClaimExecutor(EthAddress owner, EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: isClaimExecutorFn,
      args: [owner, executor],
    );
    return out[0]! as bool;
  }

  /// Calls `registerExecutor(uint256)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> registerExecutor(BigInt feeValue) async {
    final out = await client.callFunction(
      contract: address,
      function: registerExecutorFn,
      args: [feeValue],
    );
    return out[0]! as BigInt;
  }

  /// Calls `wNat()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> wNat() async {
    final out = await client.callFunction(contract: address, function: wNatFn);
    return out[0]! as EthAddress;
  }

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
        name: 'owner',
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

  /// `ClaimExecutorFeeValueChanged(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `claimExecutorFeeValueChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimExecutorFeeValueChangedEvent = AbiEvent(
    name: 'ClaimExecutorFeeValueChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'validFromRewardEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'feeValueWei',
        type: AbiType.parse('uint256'),
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
        name: 'owner',
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

  /// `DelegationAccountCreated(address,address)`
  ///
  /// Decode a matching log with
  /// `delegationAccountCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegationAccountCreatedEvent = AbiEvent(
    name: 'DelegationAccountCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'delegationAccount',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `DelegationAccountUpdated(address,address,bool)`
  ///
  /// Decode a matching log with
  /// `delegationAccountUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegationAccountUpdatedEvent = AbiEvent(
    name: 'DelegationAccountUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'delegationAccount',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'enabled',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorRegistered(address)`
  ///
  /// Decode a matching log with
  /// `executorRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorRegisteredEvent = AbiEvent(
    name: 'ExecutorRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorUnregistered(address,uint256)`
  ///
  /// Decode a matching log with
  /// `executorUnregisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorUnregisteredEvent = AbiEvent(
    name: 'ExecutorUnregistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'validFromRewardEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MaxFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `maxFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maxFeeSetEvent = AbiEvent(
    name: 'MaxFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'maxFeeValueWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MinFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `minFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent minFeeSetEvent = AbiEvent(
    name: 'MinFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'minFeeValueWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RegisterExecutorFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `registerExecutorFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent registerExecutorFeeSetEvent = AbiEvent(
    name: 'RegisterExecutorFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'registerExecutorFeeValueWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SetExecutorsExcessAmountRefunded(address,uint256)`
  ///
  /// Decode a matching log with
  /// `setExecutorsExcessAmountRefundedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent setExecutorsExcessAmountRefundedEvent = AbiEvent(
    name: 'SetExecutorsExcessAmountRefunded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'excessAmount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SetLibraryAddress(address)`
  ///
  /// Decode a matching log with
  /// `setLibraryAddressEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent setLibraryAddressEvent = AbiEvent(
    name: 'SetLibraryAddress',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'libraryAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    allowedClaimRecipientsChangedEvent,
    claimExecutorFeeValueChangedEvent,
    claimExecutorsChangedEvent,
    delegationAccountCreatedEvent,
    delegationAccountUpdatedEvent,
    executorRegisteredEvent,
    executorUnregisteredEvent,
    maxFeeSetEvent,
    minFeeSetEvent,
    registerExecutorFeeSetEvent,
    setExecutorsExcessAmountRefundedEvent,
    setLibraryAddressEvent,
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
