// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IISupply
// Functions: 2 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IISupply` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IISupplyContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IISupplyContract({required this.client, required this.address});

  /// Resolves `IISupply` through the [ContractRegistry].
  static Future<IISupplyContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IISupply',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IISupplyContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCirculatingSupplyAt(uint256)`.
  static final AbiFunction getCirculatingSupplyAtFn = AbiFunction(
    name: 'getCirculatingSupplyAt',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_circulatingSupplyWei', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInflatableBalance()`.
  static final AbiFunction getInflatableBalanceFn = AbiFunction(
    name: 'getInflatableBalance',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_inflatableBalanceWei', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCirculatingSupplyAt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCirculatingSupplyAt(BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getCirculatingSupplyAtFn,
      args: [blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getInflatableBalance()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInflatableBalance() async {
    final out = await client.callFunction(
      contract: address,
      function: getInflatableBalanceFn,
    );
    return out[0]! as BigInt;
  }

}
