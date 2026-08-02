// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRNat
// Functions: 27 — 18 readable via eth_call, 9 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRNat` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRNatContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRNatContract({required this.client, required this.address});

  /// Resolves `IRNat` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRNatContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRNatContract(client: client, address: resolved);
  }

  /// ABI descriptor for `allowance(address,address)`.
  static final AbiFunction allowanceFn = AbiFunction(
    name: 'allowance',
    inputs: [
      AbiParameter(name: 'owner', type: AbiType.parse('address')),
      AbiParameter(name: 'spender', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `approve(address,uint256)`.
  static final AbiFunction approveFn = AbiFunction(
    name: 'approve',
    inputs: [
      AbiParameter(name: 'spender', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `claimRewards(uint256[],uint256)`.
  static final AbiFunction claimRewardsFn = AbiFunction(
    name: 'claimRewards',
    inputs: [
      AbiParameter(name: '_projectIds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_month', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_claimedRewardsWei', type: AbiType.parse('uint128')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `distributeRewards(uint256,uint256,address[],uint128[])`.
  static final AbiFunction distributeRewardsFn = AbiFunction(
    name: 'distributeRewards',
    inputs: [
      AbiParameter(name: '_projectId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_month', type: AbiType.parse('uint256')),
      AbiParameter(name: '_recipients', type: AbiType.parse('address[]')),
      AbiParameter(name: '_amountsWei', type: AbiType.parse('uint128[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `firstMonthStartTs()`.
  static final AbiFunction firstMonthStartTsFn = AbiFunction(
    name: 'firstMonthStartTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalancesOf(address)`.
  static final AbiFunction getBalancesOfFn = AbiFunction(
    name: 'getBalancesOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_wNatBalance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_rNatBalance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_lockedBalance', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getClaimableRewards(uint256,address)`.
  static final AbiFunction getClaimableRewardsFn = AbiFunction(
    name: 'getClaimableRewards',
    inputs: [
      AbiParameter(name: '_projectId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint128'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentMonth()`.
  static final AbiFunction getCurrentMonthFn = AbiFunction(
    name: 'getCurrentMonth',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getOwnerRewardsInfo(uint256,uint256,address)`.
  static final AbiFunction getOwnerRewardsInfoFn = AbiFunction(
    name: 'getOwnerRewardsInfo',
    inputs: [
      AbiParameter(name: '_projectId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_month', type: AbiType.parse('uint256')),
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_assignedRewards', type: AbiType.parse('uint128')),
      AbiParameter(name: '_claimedRewards', type: AbiType.parse('uint128')),
      AbiParameter(name: '_claimable', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProjectInfo(uint256)`.
  static final AbiFunction getProjectInfoFn = AbiFunction(
    name: 'getProjectInfo',
    inputs: [AbiParameter(name: '_projectId', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_name', type: AbiType.parse('string')),
      AbiParameter(name: '_distributor', type: AbiType.parse('address')),
      AbiParameter(
        name: '_currentMonthDistributionEnabled',
        type: AbiType.parse('bool'),
      ),
      AbiParameter(name: '_distributionDisabled', type: AbiType.parse('bool')),
      AbiParameter(name: '_claimingDisabled', type: AbiType.parse('bool')),
      AbiParameter(
        name: '_totalAssignedRewards',
        type: AbiType.parse('uint128'),
      ),
      AbiParameter(
        name: '_totalDistributedRewards',
        type: AbiType.parse('uint128'),
      ),
      AbiParameter(
        name: '_totalClaimedRewards',
        type: AbiType.parse('uint128'),
      ),
      AbiParameter(
        name: '_totalUnassignedUnclaimedRewards',
        type: AbiType.parse('uint128'),
      ),
      AbiParameter(
        name: '_monthsWithRewards',
        type: AbiType.parse('uint256[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProjectRewardsInfo(uint256,uint256)`.
  static final AbiFunction getProjectRewardsInfoFn = AbiFunction(
    name: 'getProjectRewardsInfo',
    inputs: [
      AbiParameter(name: '_projectId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_month', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_assignedRewards', type: AbiType.parse('uint128')),
      AbiParameter(name: '_distributedRewards', type: AbiType.parse('uint128')),
      AbiParameter(name: '_claimedRewards', type: AbiType.parse('uint128')),
      AbiParameter(
        name: '_unassignedUnclaimedRewards',
        type: AbiType.parse('uint128'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProjectsBasicInfo()`.
  static final AbiFunction getProjectsBasicInfoFn = AbiFunction(
    name: 'getProjectsBasicInfo',
    inputs: [],
    outputs: [
      AbiParameter(name: '_names', type: AbiType.parse('string[]')),
      AbiParameter(name: '_claimingDisabled', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getProjectsCount()`.
  static final AbiFunction getProjectsCountFn = AbiFunction(
    name: 'getProjectsCount',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRNatAccount(address)`.
  static final AbiFunction getRNatAccountFn = AbiFunction(
    name: 'getRNatAccount',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardsInfo()`.
  static final AbiFunction getRewardsInfoFn = AbiFunction(
    name: 'getRewardsInfo',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_totalAssignableRewards',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_totalAssignedRewards',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_totalClaimedRewards',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_totalWithdrawnRewards',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_totalWithdrawnAssignableRewards',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `name()`.
  static final AbiFunction nameFn = AbiFunction(
    name: 'name',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `symbol()`.
  static final AbiFunction symbolFn = AbiFunction(
    name: 'symbol',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalSupply()`.
  static final AbiFunction totalSupplyFn = AbiFunction(
    name: 'totalSupply',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `transfer(address,uint256)`.
  static final AbiFunction transferFn = AbiFunction(
    name: 'transfer',
    inputs: [
      AbiParameter(name: 'to', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `transferFrom(address,address,uint256)`.
  static final AbiFunction transferFromFn = AbiFunction(
    name: 'transferFrom',
    inputs: [
      AbiParameter(name: 'from', type: AbiType.parse('address')),
      AbiParameter(name: 'to', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `wNat()`.
  static final AbiFunction wNatFn = AbiFunction(
    name: 'wNat',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `withdraw(uint128,bool)`.
  static final AbiFunction withdrawFn = AbiFunction(
    name: 'withdraw',
    inputs: [
      AbiParameter(name: '_amount', type: AbiType.parse('uint128')),
      AbiParameter(name: '_wrap', type: AbiType.parse('bool')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `withdrawAll(bool)`.
  static final AbiFunction withdrawAllFn = AbiFunction(
    name: 'withdrawAll',
    inputs: [AbiParameter(name: '_wrap', type: AbiType.parse('bool'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `allowance(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> allowance(EthAddress owner, EthAddress spender) async {
    final out = await client.callFunction(
      contract: address,
      function: allowanceFn,
      args: [owner, spender],
    );
    return out[0]! as BigInt;
  }

  /// Calls `balanceOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOf(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfFn,
      args: [account],
    );
    return out[0]! as BigInt;
  }

  /// Calls `decimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> decimals() async {
    final out = await client.callFunction(
      contract: address,
      function: decimalsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `firstMonthStartTs()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> firstMonthStartTs() async {
    final out = await client.callFunction(
      contract: address,
      function: firstMonthStartTsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getBalancesOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt wNatBalance, BigInt rNatBalance, BigInt lockedBalance})>
  getBalancesOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalancesOfFn,
      args: [owner],
    );
    return (
      wNatBalance: out[0]! as BigInt,
      rNatBalance: out[1]! as BigInt,
      lockedBalance: out[2]! as BigInt,
    );
  }

  /// Calls `getClaimableRewards(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getClaimableRewards(BigInt projectId, EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimableRewardsFn,
      args: [projectId, owner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentMonth()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentMonth() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentMonthFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getOwnerRewardsInfo(uint256,uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt assignedRewards, BigInt claimedRewards, bool claimable})>
  getOwnerRewardsInfo(BigInt projectId, BigInt month, EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getOwnerRewardsInfoFn,
      args: [projectId, month, owner],
    );
    return (
      assignedRewards: out[0]! as BigInt,
      claimedRewards: out[1]! as BigInt,
      claimable: out[2]! as bool,
    );
  }

  /// Calls `getProjectInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      String name,
      EthAddress distributor,
      bool currentMonthDistributionEnabled,
      bool distributionDisabled,
      bool claimingDisabled,
      BigInt totalAssignedRewards,
      BigInt totalDistributedRewards,
      BigInt totalClaimedRewards,
      BigInt totalUnassignedUnclaimedRewards,
      List<BigInt> monthsWithRewards,
    })
  >
  getProjectInfo(BigInt projectId) async {
    final out = await client.callFunction(
      contract: address,
      function: getProjectInfoFn,
      args: [projectId],
    );
    return (
      name: out[0]! as String,
      distributor: out[1]! as EthAddress,
      currentMonthDistributionEnabled: out[2]! as bool,
      distributionDisabled: out[3]! as bool,
      claimingDisabled: out[4]! as bool,
      totalAssignedRewards: out[5]! as BigInt,
      totalDistributedRewards: out[6]! as BigInt,
      totalClaimedRewards: out[7]! as BigInt,
      totalUnassignedUnclaimedRewards: out[8]! as BigInt,
      monthsWithRewards: (out[9]! as List).cast<BigInt>(),
    );
  }

  /// Calls `getProjectRewardsInfo(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt assignedRewards,
      BigInt distributedRewards,
      BigInt claimedRewards,
      BigInt unassignedUnclaimedRewards,
    })
  >
  getProjectRewardsInfo(BigInt projectId, BigInt month) async {
    final out = await client.callFunction(
      contract: address,
      function: getProjectRewardsInfoFn,
      args: [projectId, month],
    );
    return (
      assignedRewards: out[0]! as BigInt,
      distributedRewards: out[1]! as BigInt,
      claimedRewards: out[2]! as BigInt,
      unassignedUnclaimedRewards: out[3]! as BigInt,
    );
  }

  /// Calls `getProjectsBasicInfo()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<String> names, List<bool> claimingDisabled})>
  getProjectsBasicInfo() async {
    final out = await client.callFunction(
      contract: address,
      function: getProjectsBasicInfoFn,
    );
    return (
      names: (out[0]! as List).cast<String>(),
      claimingDisabled: (out[1]! as List).cast<bool>(),
    );
  }

  /// Calls `getProjectsCount()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getProjectsCount() async {
    final out = await client.callFunction(
      contract: address,
      function: getProjectsCountFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRNatAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getRNatAccount(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getRNatAccountFn,
      args: [owner],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getRewardsInfo()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt totalAssignableRewards,
      BigInt totalAssignedRewards,
      BigInt totalClaimedRewards,
      BigInt totalWithdrawnRewards,
      BigInt totalWithdrawnAssignableRewards,
    })
  >
  getRewardsInfo() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardsInfoFn,
    );
    return (
      totalAssignableRewards: out[0]! as BigInt,
      totalAssignedRewards: out[1]! as BigInt,
      totalClaimedRewards: out[2]! as BigInt,
      totalWithdrawnRewards: out[3]! as BigInt,
      totalWithdrawnAssignableRewards: out[4]! as BigInt,
    );
  }

  /// Calls `name()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> name() async {
    final out = await client.callFunction(contract: address, function: nameFn);
    return out[0]! as String;
  }

  /// Calls `symbol()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> symbol() async {
    final out = await client.callFunction(
      contract: address,
      function: symbolFn,
    );
    return out[0]! as String;
  }

  /// Calls `totalSupply()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalSupply() async {
    final out = await client.callFunction(
      contract: address,
      function: totalSupplyFn,
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

  /// Builds an unsigned `approve(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest approveTx(
    EthAddress spender,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: approveFn,
    args: [spender, amount],
    from: from,
  );

  /// Builds an unsigned `claimRewards(uint256[],uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest claimRewardsTx(
    List<BigInt> projectIds,
    BigInt month, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimRewardsFn,
    args: [projectIds, month],
    from: from,
  );

  /// Builds an unsigned `distributeRewards(uint256,uint256,address[],uint128[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest distributeRewardsTx(
    BigInt projectId,
    BigInt month,
    List<EthAddress> recipients,
    List<BigInt> amountsWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: distributeRewardsFn,
    args: [projectId, month, recipients, amountsWei],
    from: from,
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

  /// Builds an unsigned `transfer(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferTx(
    EthAddress to,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferFn,
    args: [to, amount],
    from: from,
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

  /// Builds an unsigned `transferFrom(address,address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferFromTx(
    EthAddress from_,
    EthAddress to,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferFromFn,
    args: [from_, to, amount],
    from: from,
  );

  /// Builds an unsigned `withdraw(uint128,bool)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest withdrawTx(BigInt amount, bool wrap, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: withdrawFn,
        args: [amount, wrap],
        from: from,
      );

  /// Builds an unsigned `withdrawAll(bool)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest withdrawAllTx(bool wrap, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: withdrawAllFn,
        args: [wrap],
        from: from,
      );

  /// `Approval(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvalEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvalEvent = AbiEvent(
    name: 'Approval',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'spender',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ClaimingPermissionUpdated(uint256[],bool)`
  ///
  /// Decode a matching log with
  /// `claimingPermissionUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimingPermissionUpdatedEvent = AbiEvent(
    name: 'ClaimingPermissionUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectIds',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'disabled',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `DistributionPermissionUpdated(uint256[],bool)`
  ///
  /// Decode a matching log with
  /// `distributionPermissionUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent distributionPermissionUpdatedEvent = AbiEvent(
    name: 'DistributionPermissionUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectIds',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'disabled',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `ProjectAdded(uint256,string,address,bool)`
  ///
  /// Decode a matching log with
  /// `projectAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent projectAddedEvent = AbiEvent(
    name: 'ProjectAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'id',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'distributor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'currentMonthDistributionEnabled',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `ProjectUpdated(uint256,string,address,bool)`
  ///
  /// Decode a matching log with
  /// `projectUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent projectUpdatedEvent = AbiEvent(
    name: 'ProjectUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'id',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'distributor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'currentMonthDistributionEnabled',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `RNatAccountCreated(address,address)`
  ///
  /// Decode a matching log with
  /// `rNatAccountCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rNatAccountCreatedEvent = AbiEvent(
    name: 'RNatAccountCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'rNatAccount',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsAssigned(uint256,uint256,uint128)`
  ///
  /// Decode a matching log with
  /// `rewardsAssignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsAssignedEvent = AbiEvent(
    name: 'RewardsAssigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint128'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsClaimed(uint256,uint256,address,uint128)`
  ///
  /// Decode a matching log with
  /// `rewardsClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsClaimedEvent = AbiEvent(
    name: 'RewardsClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint128'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsDistributed(uint256,uint256,address[],uint128[])`
  ///
  /// Decode a matching log with
  /// `rewardsDistributedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsDistributedEvent = AbiEvent(
    name: 'RewardsDistributed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'recipients',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amounts',
        type: AbiType.parse('uint128[]'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsUnassigned(uint256,uint256,uint128)`
  ///
  /// Decode a matching log with
  /// `rewardsUnassignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsUnassignedEvent = AbiEvent(
    name: 'RewardsUnassigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint128'),
        indexed: false,
      ),
    ],
  );

  /// `Transfer(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `transferEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferEvent = AbiEvent(
    name: 'Transfer',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'from',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UnassignedRewardsWithdrawn(address,uint128)`
  ///
  /// Decode a matching log with
  /// `unassignedRewardsWithdrawnEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unassignedRewardsWithdrawnEvent = AbiEvent(
    name: 'UnassignedRewardsWithdrawn',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'recipient',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint128'),
        indexed: false,
      ),
    ],
  );

  /// `UnclaimedRewardsUnassigned(uint256,uint256,uint128)`
  ///
  /// Decode a matching log with
  /// `unclaimedRewardsUnassignedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unclaimedRewardsUnassignedEvent = AbiEvent(
    name: 'UnclaimedRewardsUnassigned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'projectId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint128'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    approvalEvent,
    claimingPermissionUpdatedEvent,
    distributionPermissionUpdatedEvent,
    projectAddedEvent,
    projectUpdatedEvent,
    rNatAccountCreatedEvent,
    rewardsAssignedEvent,
    rewardsClaimedEvent,
    rewardsDistributedEvent,
    rewardsUnassignedEvent,
    transferEvent,
    unassignedRewardsWithdrawnEvent,
    unclaimedRewardsUnassignedEvent,
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
