// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFastUpdaterView
// Functions: 1 — 1 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIFastUpdaterView` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFastUpdaterViewContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFastUpdaterViewContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIFastUpdaterView` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFastUpdaterViewContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFastUpdaterViewContract(client: client, address: resolved);
  }

  /// ABI descriptor for `fetchCurrentFeeds(uint256[])`.
  static final AbiFunction fetchCurrentFeedsFn = AbiFunction(
    name: 'fetchCurrentFeeds',
    inputs: [AbiParameter(name: '_indices', type: AbiType.parse('uint256[]'))],
    outputs: [
      AbiParameter(name: '_feeds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `fetchCurrentFeeds(uint256[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> feeds, List<BigInt> decimals, BigInt timestamp})>
  fetchCurrentFeeds(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: fetchCurrentFeedsFn,
      args: [indices],
    );
    return (
      feeds: (out[0]! as List).cast<BigInt>(),
      decimals: (out[1]! as List).cast<BigInt>(),
      timestamp: out[2]! as BigInt,
    );
  }
}
