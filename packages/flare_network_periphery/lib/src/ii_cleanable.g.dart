// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IICleanable
// Functions: 1 readable of 3 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IICleanable` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IICleanableContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IICleanableContract({required this.client, required this.address});

  /// Resolves `IICleanable` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IICleanableContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IICleanableContract(client: client, address: resolved);
  }

  /// ABI descriptor for `cleanupBlockNumber()`.
  static final AbiFunction cleanupBlockNumberFn = AbiFunction(
    name: 'cleanupBlockNumber',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

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
}
