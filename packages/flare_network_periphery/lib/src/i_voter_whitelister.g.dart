// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVoterWhitelister
// Functions: 5 readable of 7 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IVoterWhitelister` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVoterWhitelisterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVoterWhitelisterContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IVoterWhitelister` through the [ContractRegistry].
  ///
  /// Registered as `VoterWhitelister`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IVoterWhitelisterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'VoterWhitelister',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IVoterWhitelisterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `chilledUntilRewardEpoch(address)`.
  static final AbiFunction chilledUntilRewardEpochFn = AbiFunction(
    name: 'chilledUntilRewardEpoch',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultMaxVotersForFtso()`.
  static final AbiFunction defaultMaxVotersForFtsoFn = AbiFunction(
    name: 'defaultMaxVotersForFtso',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProviders(uint256)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersFn = AbiFunction(
    name: 'getFtsoWhitelistedPriceProviders',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersBySymbolFn =
      AbiFunction(
        name: 'getFtsoWhitelistedPriceProvidersBySymbol',
        inputs: [AbiParameter(name: '_symbol', type: AbiType.parse('string'))],
        outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `maxVotersForFtso(uint256)`.
  static final AbiFunction maxVotersForFtsoFn = AbiFunction(
    name: 'maxVotersForFtso',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `chilledUntilRewardEpoch(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> chilledUntilRewardEpoch(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: chilledUntilRewardEpochFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `defaultMaxVotersForFtso()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultMaxVotersForFtso() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultMaxVotersForFtsoFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoWhitelistedPriceProviders(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProviders(
    BigInt ftsoIndex,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersFn,
      args: [ftsoIndex],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProvidersBySymbol(
    String symbol,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersBySymbolFn,
      args: [symbol],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `maxVotersForFtso(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxVotersForFtso(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: maxVotersForFtsoFn,
      args: [ftsoIndex],
    );
    return out[0]! as BigInt;
  }
}
