// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IGovernanceSettings
// Functions: 4 — 4 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IGovernanceSettings` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IGovernanceSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IGovernanceSettingsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IGovernanceSettings` through the [ContractRegistry].
  ///
  /// Registered as `GovernanceSettings`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IGovernanceSettingsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'GovernanceSettings',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IGovernanceSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getExecutors()`.
  static final AbiFunction getExecutorsFn = AbiFunction(
    name: 'getExecutors',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getGovernanceAddress()`.
  static final AbiFunction getGovernanceAddressFn = AbiFunction(
    name: 'getGovernanceAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTimelock()`.
  static final AbiFunction getTimelockFn = AbiFunction(
    name: 'getTimelock',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isExecutor(address)`.
  static final AbiFunction isExecutorFn = AbiFunction(
    name: 'isExecutor',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getExecutors()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getExecutors() async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorsFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getGovernanceAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getGovernanceAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: getGovernanceAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getTimelock()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getTimelock() async {
    final out = await client.callFunction(
      contract: address,
      function: getTimelockFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `isExecutor(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isExecutor(EthAddress address_) async {
    final out = await client.callFunction(
      contract: address,
      function: isExecutorFn,
      args: [address_],
    );
    return out[0]! as bool;
  }
}
