// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IClaimSetupManager
// Functions: 26 — 11 readable via eth_call, 16 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IClaimSetupManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IClaimSetupManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IClaimSetupManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IClaimSetupManager` through the [ContractRegistry].
  ///
  /// Registered as `ClaimSetupManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IClaimSetupManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ClaimSetupManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IClaimSetupManagerContract(client: client, address: resolved);
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

  /// ABI descriptor for `batchDelegate(address[],uint256[])`.
  static final AbiFunction batchDelegateFn = AbiFunction(
    name: 'batchDelegate',
    inputs: [
      AbiParameter(name: '_delegatees', type: AbiType.parse('address[]')),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegate(address,uint256)`.
  static final AbiFunction delegateFn = AbiFunction(
    name: 'delegate',
    inputs: [
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `delegateGovernance(address)`.
  static final AbiFunction delegateGovernanceFn = AbiFunction(
    name: 'delegateGovernance',
    inputs: [AbiParameter(name: '_to', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `disableDelegationAccount()`.
  static final AbiFunction disableDelegationAccountFn = AbiFunction(
    name: 'disableDelegationAccount',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `enableDelegationAccount()`.
  static final AbiFunction enableDelegationAccountFn = AbiFunction(
    name: 'enableDelegationAccount',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `revokeDelegationAt(address,uint256)`.
  static final AbiFunction revokeDelegationAtFn = AbiFunction(
    name: 'revokeDelegationAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `setAutoClaiming(address[],bool)`.
  static final AbiFunction setAutoClaimingFn = AbiFunction(
    name: 'setAutoClaiming',
    inputs: [
      AbiParameter(name: '_executors', type: AbiType.parse('address[]')),
      AbiParameter(
        name: '_enableDelegationAccount',
        type: AbiType.parse('bool'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `setClaimExecutors(address[])`.
  static final AbiFunction setClaimExecutorsFn = AbiFunction(
    name: 'setClaimExecutors',
    inputs: [
      AbiParameter(name: '_executors', type: AbiType.parse('address[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `transferExternalToken(address,uint256)`.
  static final AbiFunction transferExternalTokenFn = AbiFunction(
    name: 'transferExternalToken',
    inputs: [
      AbiParameter(name: '_token', type: AbiType.parse('address')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `undelegateAll()`.
  static final AbiFunction undelegateAllFn = AbiFunction(
    name: 'undelegateAll',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `undelegateGovernance()`.
  static final AbiFunction undelegateGovernanceFn = AbiFunction(
    name: 'undelegateGovernance',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unregisterExecutor()`.
  static final AbiFunction unregisterExecutorFn = AbiFunction(
    name: 'unregisterExecutor',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `updateExecutorFeeValue(uint256)`.
  static final AbiFunction updateExecutorFeeValueFn = AbiFunction(
    name: 'updateExecutorFeeValue',
    inputs: [AbiParameter(name: '_feeValue', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `withdraw(uint256)`.
  static final AbiFunction withdrawFn = AbiFunction(
    name: 'withdraw',
    inputs: [AbiParameter(name: '_amount', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// Builds an unsigned `batchDelegate(address[],uint256[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest batchDelegateTx(
    List<EthAddress> delegatees,
    List<BigInt> bips, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: batchDelegateFn,
    args: [delegatees, bips],
    from: from,
  );

  /// Builds an unsigned `delegate(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateTx(
    EthAddress to,
    BigInt bips, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: delegateFn,
    args: [to, bips],
    from: from,
  );

  /// Builds an unsigned `delegateGovernance(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateGovernanceTx(EthAddress to, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: delegateGovernanceFn,
        args: [to],
        from: from,
      );

  /// Builds an unsigned `disableDelegationAccount()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest disableDelegationAccountTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: disableDelegationAccountFn,
        from: from,
      );

  /// Builds an unsigned `enableDelegationAccount()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest enableDelegationAccountTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: enableDelegationAccountFn,
        from: from,
      );

  /// Builds an unsigned `registerExecutor(uint256)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest registerExecutorTx(
    BigInt feeValue, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: registerExecutorFn,
    args: [feeValue],
    from: from,
    value: value,
  );

  /// Builds an unsigned `revokeDelegationAt(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest revokeDelegationAtTx(
    EthAddress who,
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: revokeDelegationAtFn,
    args: [who, blockNumber],
    from: from,
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

  /// Builds an unsigned `setAutoClaiming(address[],bool)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest setAutoClaimingTx(
    List<EthAddress> executors,
    bool enableDelegationAccount, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setAutoClaimingFn,
    args: [executors, enableDelegationAccount],
    from: from,
    value: value,
  );

  /// Builds an unsigned `setClaimExecutors(address[])`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest setClaimExecutorsTx(
    List<EthAddress> executors, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setClaimExecutorsFn,
    args: [executors],
    from: from,
    value: value,
  );

  /// Builds an unsigned `transferExternalToken(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferExternalTokenTx(
    EthAddress token,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferExternalTokenFn,
    args: [token, amount],
    from: from,
  );

  /// Builds an unsigned `undelegateAll()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateAllTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: undelegateAllFn,
        from: from,
      );

  /// Builds an unsigned `undelegateGovernance()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateGovernanceTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: undelegateGovernanceFn,
        from: from,
      );

  /// Builds an unsigned `unregisterExecutor()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unregisterExecutorTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: unregisterExecutorFn,
        from: from,
      );

  /// Builds an unsigned `updateExecutorFeeValue(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateExecutorFeeValueTx(
    BigInt feeValue, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: updateExecutorFeeValueFn,
    args: [feeValue],
    from: from,
  );

  /// Builds an unsigned `withdraw(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest withdrawTx(BigInt amount, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: withdrawFn,
        args: [amount],
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
