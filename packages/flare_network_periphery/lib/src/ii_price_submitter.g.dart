// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIPriceSubmitter
// Functions: 7 readable of 12 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIPriceSubmitter` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIPriceSubmitterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIPriceSubmitterContract({required this.client, required this.address});

  /// Resolves `IIPriceSubmitter` through the [ContractRegistry].
  static Future<IIPriceSubmitterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIPriceSubmitter',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIPriceSubmitterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoManager()`.
  static final AbiFunction getFtsoManagerFn = AbiFunction(
    name: 'getFtsoManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoRegistry()`.
  static final AbiFunction getFtsoRegistryFn = AbiFunction(
    name: 'getFtsoRegistry',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandom(uint256)`.
  static final AbiFunction getRandomFn = AbiFunction(
    name: 'getRandom',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTrustedAddresses()`.
  static final AbiFunction getTrustedAddressesFn = AbiFunction(
    name: 'getTrustedAddresses',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterWhitelister()`.
  static final AbiFunction getVoterWhitelisterFn = AbiFunction(
    name: 'getVoterWhitelister',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `voterWhitelistBitmap(address)`.
  static final AbiFunction voterWhitelistBitmapFn = AbiFunction(
    name: 'voterWhitelistBitmap',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentRandom()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRandom() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtsoManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getFtsoRegistry()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtsoRegistry() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoRegistryFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getRandom(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRandom(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomFn,
      args: [epochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getTrustedAddresses()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getTrustedAddresses() async {
    final out = await client.callFunction(
      contract: address,
      function: getTrustedAddressesFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getVoterWhitelister()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterWhitelister() async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterWhitelisterFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `voterWhitelistBitmap(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> voterWhitelistBitmap(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: voterWhitelistBitmapFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

}
