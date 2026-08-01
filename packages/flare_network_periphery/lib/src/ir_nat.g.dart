// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRNat
// Functions: 18 readable of 27 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRNat` contract.
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

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `wNat()`.
  static final AbiFunction wNatFn = AbiFunction(
    name: 'wNat',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
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
}
