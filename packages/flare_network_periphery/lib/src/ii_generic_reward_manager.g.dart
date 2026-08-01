// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIGenericRewardManager
// Functions: 6 readable of 16 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIGenericRewardManager` contract.
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
  static Future<IIGenericRewardManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIGenericRewardManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIGenericRewardManagerContract(client: client, address: resolved);
  }

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

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
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
}
