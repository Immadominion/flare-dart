// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRNatAccount
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRNatAccount` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRNatAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRNatAccountContract({required this.client, required this.address});

  /// Resolves `IRNatAccount` through the [ContractRegistry].
  static Future<IRNatAccountContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IRNatAccount',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IRNatAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rNat()`.
  static final AbiFunction rNatFn = AbiFunction(
    name: 'rNat',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `receivedRewards()`.
  static final AbiFunction receivedRewardsFn = AbiFunction(
    name: 'receivedRewards',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint128')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `withdrawnRewards()`.
  static final AbiFunction withdrawnRewardsFn = AbiFunction(
    name: 'withdrawnRewards',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint128')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(
      contract: address,
      function: ownerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `rNat()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> rNat() async {
    final out = await client.callFunction(
      contract: address,
      function: rNatFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `receivedRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> receivedRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: receivedRewardsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `withdrawnRewards()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> withdrawnRewards() async {
    final out = await client.callFunction(
      contract: address,
      function: withdrawnRewardsFn,
    );
    return out[0]! as BigInt;
  }

}
