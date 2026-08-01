// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentOwnerRegistry
// Functions: 7 readable of 7 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAgentOwnerRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentOwnerRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentOwnerRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAgentOwnerRegistry` through the [ContractRegistry].
  static Future<IAgentOwnerRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IAgentOwnerRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAgentOwnerRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAgentDescription(address)`.
  static final AbiFunction getAgentDescriptionFn = AbiFunction(
    name: 'getAgentDescription',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentIconUrl(address)`.
  static final AbiFunction getAgentIconUrlFn = AbiFunction(
    name: 'getAgentIconUrl',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentName(address)`.
  static final AbiFunction getAgentNameFn = AbiFunction(
    name: 'getAgentName',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentTermsOfUseUrl(address)`.
  static final AbiFunction getAgentTermsOfUseUrlFn = AbiFunction(
    name: 'getAgentTermsOfUseUrl',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getManagementAddress(address)`.
  static final AbiFunction getManagementAddressFn = AbiFunction(
    name: 'getManagementAddress',
    inputs: [
      AbiParameter(name: '_workAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getWorkAddress(address)`.
  static final AbiFunction getWorkAddressFn = AbiFunction(
    name: 'getWorkAddress',
    inputs: [
      AbiParameter(name: '_managementAddress', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isWhitelisted(address)`.
  static final AbiFunction isWhitelistedFn = AbiFunction(
    name: 'isWhitelisted',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAgentDescription(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentDescription(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentDescriptionFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentIconUrl(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentIconUrl(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentIconUrlFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentName(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentName(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentNameFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getAgentTermsOfUseUrl(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getAgentTermsOfUseUrl(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentTermsOfUseUrlFn,
      args: [managementAddress],
    );
    return out[0]! as String;
  }

  /// Calls `getManagementAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getManagementAddress(EthAddress workAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getManagementAddressFn,
      args: [workAddress],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getWorkAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getWorkAddress(EthAddress managementAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: getWorkAddressFn,
      args: [managementAddress],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isWhitelisted(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isWhitelisted(EthAddress address_) async {
    final out = await client.callFunction(
      contract: address,
      function: isWhitelistedFn,
      args: [address_],
    );
    return out[0]! as bool;
  }
}
