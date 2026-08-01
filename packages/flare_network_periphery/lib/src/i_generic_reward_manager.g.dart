// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IGenericRewardManager
// Functions: 4 readable of 7 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IGenericRewardManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IGenericRewardManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IGenericRewardManagerContract({required this.client, required this.address});

  /// Resolves `IGenericRewardManager` through the [ContractRegistry].
  static Future<IGenericRewardManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IGenericRewardManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IGenericRewardManagerContract(client: client, address: resolved);
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

  /// ABI descriptor for `allowedClaimRecipients(address)`.
  static final AbiFunction allowedClaimRecipientsFn = AbiFunction(
    name: 'allowedClaimRecipients',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
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
  Future<List<EthAddress>> allowedClaimRecipients(EthAddress rewardOwner) async {
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

  /// Calls `getStateOfRewards(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt totalReward, BigInt claimedReward})> getStateOfRewards(EthAddress beneficiary) async {
    final out = await client.callFunction(
      contract: address,
      function: getStateOfRewardsFn,
      args: [beneficiary],
    );
    return (totalReward: out[0]! as BigInt, claimedReward: out[1]! as BigInt);
  }

}
