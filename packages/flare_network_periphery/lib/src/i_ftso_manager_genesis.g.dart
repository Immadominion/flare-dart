// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoManagerGenesis
// Functions: 1 readable of 1 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFtsoManagerGenesis` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoManagerGenesisContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoManagerGenesisContract({required this.client, required this.address});

  /// Resolves `IFtsoManagerGenesis` through the [ContractRegistry].
  static Future<IFtsoManagerGenesisContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFtsoManagerGenesis',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IFtsoManagerGenesisContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentPriceEpochId()`.
  static final AbiFunction getCurrentPriceEpochIdFn = AbiFunction(
    name: 'getCurrentPriceEpochId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_priceEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentPriceEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentPriceEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceEpochIdFn,
    );
    return out[0]! as BigInt;
  }

}
