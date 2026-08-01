// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoRewardOffersManager
// Functions: 1 readable of 2 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoRewardOffersManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoRewardOffersManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoRewardOffersManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFtsoRewardOffersManager` through the [ContractRegistry].
  ///
  /// Registered as `FtsoRewardOffersManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFtsoRewardOffersManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FtsoRewardOffersManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoRewardOffersManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `minimalRewardsOfferValueWei()`.
  static final AbiFunction minimalRewardsOfferValueWeiFn = AbiFunction(
    name: 'minimalRewardsOfferValueWei',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `minimalRewardsOfferValueWei()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> minimalRewardsOfferValueWei() async {
    final out = await client.callFunction(
      contract: address,
      function: minimalRewardsOfferValueWeiFn,
    );
    return out[0]! as BigInt;
  }
}
