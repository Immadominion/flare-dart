// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIRewardManager
// Functions: 15 readable of 21 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIRewardManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIRewardManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIRewardManagerContract({required this.client, required this.address});

  /// Resolves `IIRewardManager` through the [ContractRegistry].
  static Future<IIRewardManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIRewardManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIRewardManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `cleanupBlockNumber()`.
  static final AbiFunction cleanupBlockNumberFn = AbiFunction(
    name: 'cleanupBlockNumber',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `firstClaimableRewardEpochId()`.
  static final AbiFunction firstClaimableRewardEpochIdFn = AbiFunction(
    name: 'firstClaimableRewardEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRewardEpochId()`.
  static final AbiFunction getCurrentRewardEpochIdFn = AbiFunction(
    name: 'getCurrentRewardEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInitialRewardEpochId()`.
  static final AbiFunction getInitialRewardEpochIdFn = AbiFunction(
    name: 'getInitialRewardEpochId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNextClaimableRewardEpochId(address)`.
  static final AbiFunction getNextClaimableRewardEpochIdFn = AbiFunction(
    name: 'getNextClaimableRewardEpochId',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochIdToExpireNext()`.
  static final AbiFunction getRewardEpochIdToExpireNextFn = AbiFunction(
    name: 'getRewardEpochIdToExpireNext',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRewardEpochIdsWithClaimableRewards()`.
  static final AbiFunction getRewardEpochIdsWithClaimableRewardsFn =
      AbiFunction(
        name: 'getRewardEpochIdsWithClaimableRewards',
        inputs: [],
        outputs: [
          AbiParameter(name: '_startEpochId', type: AbiType.parse('uint24')),
          AbiParameter(name: '_endEpochId', type: AbiType.parse('uint24')),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getRewardEpochTotals(uint24)`.
  static final AbiFunction getRewardEpochTotalsFn = AbiFunction(
    name: 'getRewardEpochTotals',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(name: '_totalRewardsWei', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_totalInflationRewardsWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_initialisedRewardsWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_claimedRewardsWei', type: AbiType.parse('uint256')),
      AbiParameter(name: '_burnedRewardsWei', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getStateOfRewards(address)`.
  static final AbiFunction getStateOfRewardsFn = AbiFunction(
    name: 'getStateOfRewards',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(
        name: '_rewardStates',
        type: AbiType.parse('(uint24,bytes20,uint120,uint8,bool)[][]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getStateOfRewardsAt(address,uint24)`.
  static final AbiFunction getStateOfRewardsAtFn = AbiFunction(
    name: 'getStateOfRewardsAt',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
    ],
    outputs: [
      AbiParameter(
        name: '_rewardStates',
        type: AbiType.parse('(uint24,bytes20,uint120,uint8,bool)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTotals()`.
  static final AbiFunction getTotalsFn = AbiFunction(
    name: 'getTotals',
    inputs: [],
    outputs: [
      AbiParameter(name: '_totalRewardsWei', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_totalInflationRewardsWei',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_totalClaimedWei', type: AbiType.parse('uint256')),
      AbiParameter(name: '_totalBurnedWei', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnclaimedRewardState(address,uint24,uint8)`.
  static final AbiFunction getUnclaimedRewardStateFn = AbiFunction(
    name: 'getUnclaimedRewardState',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint24')),
      AbiParameter(name: '_claimType', type: AbiType.parse('uint8')),
    ],
    outputs: [
      AbiParameter(
        name: '_state',
        type: AbiType.parse('(bool,uint120,uint128)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `noOfInitialisedWeightBasedClaims(uint256)`.
  static final AbiFunction noOfInitialisedWeightBasedClaimsFn = AbiFunction(
    name: 'noOfInitialisedWeightBasedClaims',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardManagerId()`.
  static final AbiFunction rewardManagerIdFn = AbiFunction(
    name: 'rewardManagerId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
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

  /// Calls `cleanupBlockNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> cleanupBlockNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: cleanupBlockNumberFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `firstClaimableRewardEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> firstClaimableRewardEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: firstClaimableRewardEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentRewardEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getInitialRewardEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInitialRewardEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getInitialRewardEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNextClaimableRewardEpochId(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNextClaimableRewardEpochId(EthAddress rewardOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getNextClaimableRewardEpochIdFn,
      args: [rewardOwner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochIdToExpireNext()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRewardEpochIdToExpireNext() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochIdToExpireNextFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRewardEpochIdsWithClaimableRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt startEpochId, BigInt endEpochId})>
  getRewardEpochIdsWithClaimableRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochIdsWithClaimableRewardsFn,
    );
    return (startEpochId: out[0]! as BigInt, endEpochId: out[1]! as BigInt);
  }

  /// Calls `getRewardEpochTotals(uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt totalRewardsWei,
      BigInt totalInflationRewardsWei,
      BigInt initialisedRewardsWei,
      BigInt claimedRewardsWei,
      BigInt burnedRewardsWei,
    })
  >
  getRewardEpochTotals(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRewardEpochTotalsFn,
      args: [rewardEpochId],
    );
    return (
      totalRewardsWei: out[0]! as BigInt,
      totalInflationRewardsWei: out[1]! as BigInt,
      initialisedRewardsWei: out[2]! as BigInt,
      claimedRewardsWei: out[3]! as BigInt,
      burnedRewardsWei: out[4]! as BigInt,
    );
  }

  /// Calls `getStateOfRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<List<Object?>>>> getStateOfRewards(
    EthAddress rewardOwner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [rewardOwner],
    );
    return (out[0]! as List).cast<List<List<Object?>>>();
  }

  /// Calls `getStateOfRewardsAt(address,uint24)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getStateOfRewardsAt(
    EthAddress rewardOwner,
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsAtFn,
      args: [rewardOwner, rewardEpochId],
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getTotals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt totalRewardsWei,
      BigInt totalInflationRewardsWei,
      BigInt totalClaimedWei,
      BigInt totalBurnedWei,
    })
  >
  getTotals() async {
    final out = await client.callFunction(
      contract: address,
      function: getTotalsFn,
    );
    return (
      totalRewardsWei: out[0]! as BigInt,
      totalInflationRewardsWei: out[1]! as BigInt,
      totalClaimedWei: out[2]! as BigInt,
      totalBurnedWei: out[3]! as BigInt,
    );
  }

  /// Calls `getUnclaimedRewardState(address,uint24,uint8)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getUnclaimedRewardState(
    EthAddress beneficiary,
    BigInt rewardEpochId,
    BigInt claimType,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getUnclaimedRewardStateFn,
      args: [beneficiary, rewardEpochId, claimType],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `noOfInitialisedWeightBasedClaims(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> noOfInitialisedWeightBasedClaims(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: noOfInitialisedWeightBasedClaimsFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `rewardManagerId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardManagerId() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardManagerIdFn,
    );
    return out[0]! as BigInt;
  }
}
