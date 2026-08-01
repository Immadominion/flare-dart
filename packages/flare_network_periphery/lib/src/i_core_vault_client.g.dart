// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultClient
// Functions: 2 readable of 8 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ICoreVaultClient` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICoreVaultClientContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICoreVaultClientContract({required this.client, required this.address});

  /// Resolves `ICoreVaultClient` through the [ContractRegistry].
  static Future<ICoreVaultClientContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ICoreVaultClient',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return ICoreVaultClientContract(client: client, address: resolved);
  }

  /// ABI descriptor for `coreVaultAvailableAmount()`.
  static final AbiFunction coreVaultAvailableAmountFn = AbiFunction(
    name: 'coreVaultAvailableAmount',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_immediatelyAvailableUBA', type: AbiType.parse('uint256')),
      AbiParameter(name: '_totalAvailableUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `maximumTransferToCoreVault(address)`.
  static final AbiFunction maximumTransferToCoreVaultFn = AbiFunction(
    name: 'maximumTransferToCoreVault',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_maximumTransferUBA', type: AbiType.parse('uint256')),
      AbiParameter(name: '_minimumLeftAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `coreVaultAvailableAmount()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt immediatelyAvailableUBA, BigInt totalAvailableUBA})> coreVaultAvailableAmount() async {
    final out = await client.callFunction(
      contract: address,
      function: coreVaultAvailableAmountFn,
    );
    return (immediatelyAvailableUBA: out[0]! as BigInt, totalAvailableUBA: out[1]! as BigInt);
  }

  /// Calls `maximumTransferToCoreVault(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt maximumTransferUBA, BigInt minimumLeftAmountUBA})> maximumTransferToCoreVault(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: maximumTransferToCoreVaultFn,
      args: [agentVault],
    );
    return (maximumTransferUBA: out[0]! as BigInt, minimumLeftAmountUBA: out[1]! as BigInt);
  }

}
