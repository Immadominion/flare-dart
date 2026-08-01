// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoRewardManager
// Functions: 16 readable of 22 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoRewardManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoRewardManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoRewardManagerContract({required this.client, required this.address});

  /// Resolves `IFtsoRewardManager` through the [ContractRegistry].
  static Future<IFtsoRewardManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFtsoRewardManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IFtsoRewardManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getClaimedReward(uint256,address,address)`.
  static final AbiFunction getClaimedRewardFn = AbiFunction(
    name: 'getClaimedReward',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
      AbiParameter(name: '_claimer', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_claimed', type: AbiType.parse('bool')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpoch()`.
  static final AbiFunction getCurrentRewardEpochFn = AbiFunction(
    name: 'getCurrentRewardEpoch',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderCurrentFeePercentage(address)`.
  static final AbiFunction getDataProviderCurrentFeePercentageFn = AbiFunction(
    name: 'getDataProviderCurrentFeePercentage',
    inputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_feePercentageBIPS', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderFeePercentage(address,uint256)`.
  static final AbiFunction getDataProviderFeePercentageFn = AbiFunction(
    name: 'getDataProviderFeePercentage',
    inputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_feePercentageBIPS', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderPerformanceInfo(uint256,address)`.
  static final AbiFunction getDataProviderPerformanceInfoFn = AbiFunction(
    name: 'getDataProviderPerformanceInfo',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votePowerIgnoringRevocation', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderScheduledFeePercentageChanges(address)`.
  static final AbiFunction getDataProviderScheduledFeePercentageChangesFn = AbiFunction(
    name: 'getDataProviderScheduledFeePercentageChanges',
    inputs: [
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_feePercentageBIPS', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_validFromEpoch', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_fixed', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochReward(uint256)`.
  static final AbiFunction getEpochRewardFn = AbiFunction(
    name: 'getEpochReward',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_totalReward', type: AbiType.parse('uint256')),
      AbiParameter(name: '_claimedReward', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochsWithClaimableRewards()`.
  static final AbiFunction getEpochsWithClaimableRewardsFn = AbiFunction(
    name: 'getEpochsWithClaimableRewards',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_startEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_endEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochsWithUnclaimedRewards(address)`.
  static final AbiFunction getEpochsWithUnclaimedRewardsFn = AbiFunction(
    name: 'getEpochsWithUnclaimedRewards',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_epochIds', type: AbiType.parse('uint256[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInitialRewardEpoch()`.
  static final AbiFunction getInitialRewardEpochFn = AbiFunction(
    name: 'getInitialRewardEpoch',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochToExpireNext()`.
  static final AbiFunction getRewardEpochToExpireNextFn = AbiFunction(
    name: 'getRewardEpochToExpireNext',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochVotePowerBlock(uint256)`.
  static final AbiFunction getRewardEpochVotePowerBlockFn = AbiFunction(
    name: 'getRewardEpochVotePowerBlock',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getStateOfRewards(address,uint256)`.
  static final AbiFunction getStateOfRewardsFn = AbiFunction(
    name: 'getStateOfRewards',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_dataProviders', type: AbiType.parse('address[]')),
      AbiParameter(name: '_rewardAmounts', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_claimed', type: AbiType.parse('bool[]')),
      AbiParameter(name: '_claimable', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getStateOfRewardsFromDataProviders(address,uint256,address[])`.
  static final AbiFunction getStateOfRewardsFromDataProvidersFn = AbiFunction(
    name: 'getStateOfRewardsFromDataProviders',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: '_dataProviders', type: AbiType.parse('address[]')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmounts', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_claimed', type: AbiType.parse('bool[]')),
      AbiParameter(name: '_claimable', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextClaimableRewardEpoch(address)`.
  static final AbiFunction nextClaimableRewardEpochFn = AbiFunction(
    name: 'nextClaimableRewardEpoch',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
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

  /// Calls `getClaimedReward(uint256,address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool claimed, BigInt amount})> getClaimedReward(BigInt rewardEpoch, EthAddress dataProvider, EthAddress claimer) async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimedRewardFn,
      args: [rewardEpoch, dataProvider, claimer],
    );
    return (claimed: out[0]! as bool, amount: out[1]! as BigInt);
  }

  /// Calls `getCurrentRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDataProviderCurrentFeePercentage(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDataProviderCurrentFeePercentage(EthAddress dataProvider) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderCurrentFeePercentageFn,
      args: [dataProvider],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDataProviderFeePercentage(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDataProviderFeePercentage(EthAddress dataProvider, BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderFeePercentageFn,
      args: [dataProvider, rewardEpoch],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDataProviderPerformanceInfo(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt rewardAmount, BigInt votePowerIgnoringRevocation})> getDataProviderPerformanceInfo(BigInt rewardEpoch, EthAddress dataProvider) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderPerformanceInfoFn,
      args: [rewardEpoch, dataProvider],
    );
    return (rewardAmount: out[0]! as BigInt, votePowerIgnoringRevocation: out[1]! as BigInt);
  }

  /// Calls `getDataProviderScheduledFeePercentageChanges(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> feePercentageBIPS, List<BigInt> validFromEpoch, List<bool> fixed})> getDataProviderScheduledFeePercentageChanges(EthAddress dataProvider) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderScheduledFeePercentageChangesFn,
      args: [dataProvider],
    );
    return (feePercentageBIPS: (out[0]! as List).cast<BigInt>(), validFromEpoch: (out[1]! as List).cast<BigInt>(), fixed: (out[2]! as List).cast<bool>());
  }

  /// Calls `getEpochReward(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt totalReward, BigInt claimedReward})> getEpochReward(BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochRewardFn,
      args: [rewardEpoch],
    );
    return (totalReward: out[0]! as BigInt, claimedReward: out[1]! as BigInt);
  }

  /// Calls `getEpochsWithClaimableRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt startEpochId, BigInt endEpochId})> getEpochsWithClaimableRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochsWithClaimableRewardsFn,
    );
    return (startEpochId: out[0]! as BigInt, endEpochId: out[1]! as BigInt);
  }

  /// Calls `getEpochsWithUnclaimedRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> getEpochsWithUnclaimedRewards(EthAddress beneficiary) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochsWithUnclaimedRewardsFn,
      args: [beneficiary],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `getInitialRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInitialRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: getInitialRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochToExpireNext()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRewardEpochToExpireNext() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochToExpireNextFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochVotePowerBlock(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRewardEpochVotePowerBlock(BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochVotePowerBlockFn,
      args: [rewardEpoch],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getStateOfRewards(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> dataProviders, List<BigInt> rewardAmounts, List<bool> claimed, bool claimable})> getStateOfRewards(EthAddress beneficiary, BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [beneficiary, rewardEpoch],
    );
    return (dataProviders: (out[0]! as List).cast<EthAddress>(), rewardAmounts: (out[1]! as List).cast<BigInt>(), claimed: (out[2]! as List).cast<bool>(), claimable: out[3]! as bool);
  }

  /// Calls `getStateOfRewardsFromDataProviders(address,uint256,address[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> rewardAmounts, List<bool> claimed, bool claimable})> getStateOfRewardsFromDataProviders(EthAddress beneficiary, BigInt rewardEpoch, List<EthAddress> dataProviders) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFromDataProvidersFn,
      args: [beneficiary, rewardEpoch, dataProviders],
    );
    return (rewardAmounts: (out[0]! as List).cast<BigInt>(), claimed: (out[1]! as List).cast<bool>(), claimable: out[2]! as bool);
  }

  /// Calls `nextClaimableRewardEpoch(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> nextClaimableRewardEpoch(EthAddress rewardOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: nextClaimableRewardEpochFn,
      args: [rewardOwner],
    );
    return out[0]! as BigInt;
  }

}
