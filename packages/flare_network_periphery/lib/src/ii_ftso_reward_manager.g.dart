// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtsoRewardManager
// Functions: 35 — 19 readable via eth_call, 16 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIFtsoRewardManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoRewardManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoRewardManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFtsoRewardManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFtsoRewardManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFtsoRewardManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `accrueUnearnedRewards(uint256,uint256,uint256)`.
  static final AbiFunction accrueUnearnedRewardsFn = AbiFunction(
    name: 'accrueUnearnedRewards',
    inputs: [
      AbiParameter(name: 'epochId', type: AbiType.parse('uint256')),
      AbiParameter(
        name: 'priceEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: 'priceEpochEndTime', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

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

  /// ABI descriptor for `autoClaim(address[],uint256)`.
  static final AbiFunction autoClaimFn = AbiFunction(
    name: 'autoClaim',
    inputs: [
      AbiParameter(name: '_rewardOwners', type: AbiType.parse('address[]')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claim(address,address,uint256,bool)`.
  static final AbiFunction claimFn = AbiFunction(
    name: 'claim',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: '_wrap', type: AbiType.parse('bool')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claimFromDataProviders(address,address,uint256[],address[],bool)`.
  static final AbiFunction claimFromDataProvidersFn = AbiFunction(
    name: 'claimFromDataProviders',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochs', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_dataProviders', type: AbiType.parse('address[]')),
      AbiParameter(name: '_wrap', type: AbiType.parse('bool')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claimReward(address,uint256[])`.
  static final AbiFunction claimRewardFn = AbiFunction(
    name: 'claimReward',
    inputs: [
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochs', type: AbiType.parse('uint256[]')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `claimRewardFromDataProviders(address,uint256[],address[])`.
  static final AbiFunction claimRewardFromDataProvidersFn = AbiFunction(
    name: 'claimRewardFromDataProviders',
    inputs: [
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochs', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_dataProviders', type: AbiType.parse('address[]')),
    ],
    outputs: [
      AbiParameter(name: '_rewardAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `closeExpiredRewardEpoch(uint256)`.
  static final AbiFunction closeExpiredRewardEpochFn = AbiFunction(
    name: 'closeExpiredRewardEpoch',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `deactivate()`.
  static final AbiFunction deactivateFn = AbiFunction(
    name: 'deactivate',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `distributeRewards(address[],uint256[],uint256,uint256,address,uint256,uint256,uint256,uint256)`.
  static final AbiFunction distributeRewardsFn = AbiFunction(
    name: 'distributeRewards',
    inputs: [
      AbiParameter(name: 'addresses', type: AbiType.parse('address[]')),
      AbiParameter(name: 'weights', type: AbiType.parse('uint256[]')),
      AbiParameter(name: 'totalWeight', type: AbiType.parse('uint256')),
      AbiParameter(name: 'epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: 'ftso', type: AbiType.parse('address')),
      AbiParameter(
        name: 'priceEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: 'currentRewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: 'priceEpochEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: 'votePowerBlock', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `enableClaims()`.
  static final AbiFunction enableClaimsFn = AbiFunction(
    name: 'enableClaims',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `firstClaimableRewardEpoch()`.
  static final AbiFunction firstClaimableRewardEpochFn = AbiFunction(
    name: 'firstClaimableRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
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

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpoch()`.
  static final AbiFunction getCurrentRewardEpochFn = AbiFunction(
    name: 'getCurrentRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
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
      AbiParameter(
        name: '_votePowerIgnoringRevocation',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDataProviderScheduledFeePercentageChanges(address)`.
  static final AbiFunction getDataProviderScheduledFeePercentageChangesFn =
      AbiFunction(
        name: 'getDataProviderScheduledFeePercentageChanges',
        inputs: [
          AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
        ],
        outputs: [
          AbiParameter(
            name: '_feePercentageBIPS',
            type: AbiType.parse('uint256[]'),
          ),
          AbiParameter(
            name: '_validFromEpoch',
            type: AbiType.parse('uint256[]'),
          ),
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
    inputs: [],
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

  /// ABI descriptor for `getInflationAddress()`.
  static final AbiFunction getInflationAddressFn = AbiFunction(
    name: 'getInflationAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getInitialRewardEpoch()`.
  static final AbiFunction getInitialRewardEpochFn = AbiFunction(
    name: 'getInitialRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochToExpireNext()`.
  static final AbiFunction getRewardEpochToExpireNextFn = AbiFunction(
    name: 'getRewardEpochToExpireNext',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochVotePowerBlock(uint256)`.
  static final AbiFunction getRewardEpochVotePowerBlockFn = AbiFunction(
    name: 'getRewardEpochVotePowerBlock',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
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

  /// ABI descriptor for `getUnclaimedReward(uint256,address)`.
  static final AbiFunction getUnclaimedRewardFn = AbiFunction(
    name: 'getUnclaimedReward',
    inputs: [
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
      AbiParameter(name: '_dataProvider', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
      AbiParameter(name: '_weight', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextClaimableRewardEpoch(address)`.
  static final AbiFunction nextClaimableRewardEpochFn = AbiFunction(
    name: 'nextClaimableRewardEpoch',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `receiveInflation()`.
  static final AbiFunction receiveInflationFn = AbiFunction(
    name: 'receiveInflation',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.payable,
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

  /// ABI descriptor for `setDataProviderFeePercentage(uint256)`.
  static final AbiFunction setDataProviderFeePercentageFn = AbiFunction(
    name: 'setDataProviderFeePercentage',
    inputs: [
      AbiParameter(name: '_feePercentageBIPS', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_validFromEpoch', type: AbiType.parse('uint256')),
    ],
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

  /// Calls `firstClaimableRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> firstClaimableRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: firstClaimableRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getClaimedReward(uint256,address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool claimed, BigInt amount})> getClaimedReward(
    BigInt rewardEpoch,
    EthAddress dataProvider,
    EthAddress claimer,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getClaimedRewardFn,
      args: [rewardEpoch, dataProvider, claimer],
    );
    return (claimed: out[0]! as bool, amount: out[1]! as BigInt);
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
  Future<BigInt> getDataProviderCurrentFeePercentage(
    EthAddress dataProvider,
  ) async {
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
  Future<BigInt> getDataProviderFeePercentage(
    EthAddress dataProvider,
    BigInt rewardEpoch,
  ) async {
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
  Future<({BigInt rewardAmount, BigInt votePowerIgnoringRevocation})>
  getDataProviderPerformanceInfo(
    BigInt rewardEpoch,
    EthAddress dataProvider,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderPerformanceInfoFn,
      args: [rewardEpoch, dataProvider],
    );
    return (
      rewardAmount: out[0]! as BigInt,
      votePowerIgnoringRevocation: out[1]! as BigInt,
    );
  }

  /// Calls `getDataProviderScheduledFeePercentageChanges(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<BigInt> feePercentageBIPS,
      List<BigInt> validFromEpoch,
      List<bool> fixed,
    })
  >
  getDataProviderScheduledFeePercentageChanges(EthAddress dataProvider) async {
    final out = await client.callFunction(
      contract: address,
      function: getDataProviderScheduledFeePercentageChangesFn,
      args: [dataProvider],
    );
    return (
      feePercentageBIPS: (out[0]! as List).cast<BigInt>(),
      validFromEpoch: (out[1]! as List).cast<BigInt>(),
      fixed: (out[2]! as List).cast<bool>(),
    );
  }

  /// Calls `getEpochReward(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt totalReward, BigInt claimedReward})> getEpochReward(
    BigInt rewardEpoch,
  ) async {
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
  Future<({BigInt startEpochId, BigInt endEpochId})>
  getEpochsWithClaimableRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochsWithClaimableRewardsFn,
    );
    return (startEpochId: out[0]! as BigInt, endEpochId: out[1]! as BigInt);
  }

  /// Calls `getEpochsWithUnclaimedRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> getEpochsWithUnclaimedRewards(
    EthAddress beneficiary,
  ) async {
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
  Future<
    ({
      List<EthAddress> dataProviders,
      List<BigInt> rewardAmounts,
      List<bool> claimed,
      bool claimable,
    })
  >
  getStateOfRewards(EthAddress beneficiary, BigInt rewardEpoch) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [beneficiary, rewardEpoch],
    );
    return (
      dataProviders: (out[0]! as List).cast<EthAddress>(),
      rewardAmounts: (out[1]! as List).cast<BigInt>(),
      claimed: (out[2]! as List).cast<bool>(),
      claimable: out[3]! as bool,
    );
  }

  /// Calls `getStateOfRewardsFromDataProviders(address,uint256,address[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> rewardAmounts, List<bool> claimed, bool claimable})>
  getStateOfRewardsFromDataProviders(
    EthAddress beneficiary,
    BigInt rewardEpoch,
    List<EthAddress> dataProviders,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFromDataProvidersFn,
      args: [beneficiary, rewardEpoch, dataProviders],
    );
    return (
      rewardAmounts: (out[0]! as List).cast<BigInt>(),
      claimed: (out[1]! as List).cast<bool>(),
      claimable: out[2]! as bool,
    );
  }

  /// Calls `getUnclaimedReward(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt amount, BigInt weight})> getUnclaimedReward(
    BigInt rewardEpoch,
    EthAddress dataProvider,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getUnclaimedRewardFn,
      args: [rewardEpoch, dataProvider],
    );
    return (amount: out[0]! as BigInt, weight: out[1]! as BigInt);
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

  /// Builds an unsigned `accrueUnearnedRewards(uint256,uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest accrueUnearnedRewardsTx(
    BigInt epochId,
    BigInt priceEpochDurationSeconds,
    BigInt priceEpochEndTime, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: accrueUnearnedRewardsFn,
    args: [epochId, priceEpochDurationSeconds, priceEpochEndTime],
    from: from,
  );

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

  /// Builds an unsigned `autoClaim(address[],uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest autoClaimTx(
    List<EthAddress> rewardOwners,
    BigInt rewardEpoch, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: autoClaimFn,
    args: [rewardOwners, rewardEpoch],
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
    BigInt rewardEpoch,
    bool wrap, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimFn,
    args: [rewardOwner, recipient, rewardEpoch, wrap],
    from: from,
  );

  /// Builds an unsigned `claimFromDataProviders(address,address,uint256[],address[],bool)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest claimFromDataProvidersTx(
    EthAddress rewardOwner,
    EthAddress recipient,
    List<BigInt> rewardEpochs,
    List<EthAddress> dataProviders,
    bool wrap, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimFromDataProvidersFn,
    args: [rewardOwner, recipient, rewardEpochs, dataProviders, wrap],
    from: from,
  );

  /// Builds an unsigned `claimReward(address,uint256[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest claimRewardTx(
    EthAddress recipient,
    List<BigInt> rewardEpochs, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimRewardFn,
    args: [recipient, rewardEpochs],
    from: from,
  );

  /// Builds an unsigned `claimRewardFromDataProviders(address,uint256[],address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest claimRewardFromDataProvidersTx(
    EthAddress recipient,
    List<BigInt> rewardEpochs,
    List<EthAddress> dataProviders, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: claimRewardFromDataProvidersFn,
    args: [recipient, rewardEpochs, dataProviders],
    from: from,
  );

  /// Builds an unsigned `closeExpiredRewardEpoch(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest closeExpiredRewardEpochTx(
    BigInt rewardEpochId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: closeExpiredRewardEpochFn,
    args: [rewardEpochId],
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

  /// Builds an unsigned `distributeRewards(address[],uint256[],uint256,uint256,address,uint256,uint256,uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest distributeRewardsTx(
    List<EthAddress> addresses,
    List<BigInt> weights,
    BigInt totalWeight,
    BigInt epochId,
    EthAddress ftso,
    BigInt priceEpochDurationSeconds,
    BigInt currentRewardEpoch,
    BigInt priceEpochEndTime,
    BigInt votePowerBlock, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: distributeRewardsFn,
    args: [
      addresses,
      weights,
      totalWeight,
      epochId,
      ftso,
      priceEpochDurationSeconds,
      currentRewardEpoch,
      priceEpochEndTime,
      votePowerBlock,
    ],
    from: from,
  );

  /// Builds an unsigned `enableClaims()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest enableClaimsTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: enableClaimsFn,
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

  /// Builds an unsigned `setDataProviderFeePercentage(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDataProviderFeePercentageTx(
    BigInt feePercentageBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDataProviderFeePercentageFn,
    args: [feePercentageBIPS],
    from: from,
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

  /// `FeePercentageChanged(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `feePercentageChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent feePercentageChangedEvent = AbiEvent(
    name: 'FeePercentageChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'dataProvider',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'validFromEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FtsoRewardManagerActivated(address)`
  ///
  /// Decode a matching log with
  /// `ftsoRewardManagerActivatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoRewardManagerActivatedEvent = AbiEvent(
    name: 'FtsoRewardManagerActivated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftsoRewardManager',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `FtsoRewardManagerDeactivated(address)`
  ///
  /// Decode a matching log with
  /// `ftsoRewardManagerDeactivatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ftsoRewardManagerDeactivatedEvent = AbiEvent(
    name: 'FtsoRewardManagerDeactivated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftsoRewardManager',
        type: AbiType.parse('address'),
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

  /// `RewardClaimed(address,address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `rewardClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardClaimedEvent = AbiEvent(
    name: 'RewardClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'dataProvider',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'whoClaimed',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sentTo',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardClaimsEnabled(uint256)`
  ///
  /// Decode a matching log with
  /// `rewardClaimsEnabledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardClaimsEnabledEvent = AbiEvent(
    name: 'RewardClaimsEnabled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardClaimsExpired(uint256)`
  ///
  /// Decode a matching log with
  /// `rewardClaimsExpiredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardClaimsExpiredEvent = AbiEvent(
    name: 'RewardClaimsExpired',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsBurned(uint256)`
  ///
  /// Decode a matching log with
  /// `rewardsBurnedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsBurnedEvent = AbiEvent(
    name: 'RewardsBurned',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amountBurnedWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RewardsDistributed(address,uint256,address[],uint256[])`
  ///
  /// Decode a matching log with
  /// `rewardsDistributedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent rewardsDistributedEvent = AbiEvent(
    name: 'RewardsDistributed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'ftso',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
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

  /// `UnearnedRewardsAccrued(uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `unearnedRewardsAccruedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unearnedRewardsAccruedEvent = AbiEvent(
    name: 'UnearnedRewardsAccrued',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'reward',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    dailyAuthorizedInflationSetEvent,
    feePercentageChangedEvent,
    ftsoRewardManagerActivatedEvent,
    ftsoRewardManagerDeactivatedEvent,
    inflationReceivedEvent,
    rewardClaimedEvent,
    rewardClaimsEnabledEvent,
    rewardClaimsExpiredEvent,
    rewardsBurnedEvent,
    rewardsDistributedEvent,
    unearnedRewardsAccruedEvent,
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
