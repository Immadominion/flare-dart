// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPauseFacet
// Functions: 5 readable of 7 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IPauseFacet` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPauseFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPauseFacetContract({required this.client, required this.address});

  /// Resolves `IPauseFacet` through the [ContractRegistry].
  static Future<IPauseFacetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IPauseFacet',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IPauseFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPausers()`.
  static final AbiFunction getPausersFn = AbiFunction(
    name: 'getPausers',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getUnpausers()`.
  static final AbiFunction getUnpausersFn = AbiFunction(
    name: 'getUnpausers',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPaused()`.
  static final AbiFunction isPausedFn = AbiFunction(
    name: 'isPaused',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPauser(address)`.
  static final AbiFunction isPauserFn = AbiFunction(
    name: 'isPauser',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isUnpauser(address)`.
  static final AbiFunction isUnpauserFn = AbiFunction(
    name: 'isUnpauser',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getPausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getPausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getPausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getUnpausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getUnpausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnpausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `isPaused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPaused() async {
    final out = await client.callFunction(
      contract: address,
      function: isPausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `isPauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isPauserFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `isUnpauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isUnpauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isUnpauserFn,
      args: [account],
    );
    return out[0]! as bool;
  }

}
