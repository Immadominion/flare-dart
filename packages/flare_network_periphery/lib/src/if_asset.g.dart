// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFAsset
// Functions: 9 readable of 12 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFAsset` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFAssetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFAssetContract({required this.client, required this.address});

  /// Resolves `IFAsset` through the [ContractRegistry].
  static Future<IFAssetContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IFAsset',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IFAssetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `allowance(address,address)`.
  static final AbiFunction allowanceFn = AbiFunction(
    name: 'allowance',
    inputs: [
      AbiParameter(name: 'owner', type: AbiType.parse('address')),
      AbiParameter(name: 'spender', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetManager()`.
  static final AbiFunction assetManagerFn = AbiFunction(
    name: 'assetManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetName()`.
  static final AbiFunction assetNameFn = AbiFunction(
    name: 'assetName',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetSymbol()`.
  static final AbiFunction assetSymbolFn = AbiFunction(
    name: 'assetSymbol',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [
      AbiParameter(name: 'account', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint8')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `name()`.
  static final AbiFunction nameFn = AbiFunction(
    name: 'name',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `symbol()`.
  static final AbiFunction symbolFn = AbiFunction(
    name: 'symbol',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalSupply()`.
  static final AbiFunction totalSupplyFn = AbiFunction(
    name: 'totalSupply',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `allowance(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> allowance(EthAddress owner, EthAddress spender) async {
    final out = await client.callFunction(
      contract: address,
      function: allowanceFn,
      args: [owner, spender],
    );
    return out[0]! as BigInt;
  }

  /// Calls `assetManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> assetManager() async {
    final out = await client.callFunction(
      contract: address,
      function: assetManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `assetName()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> assetName() async {
    final out = await client.callFunction(
      contract: address,
      function: assetNameFn,
    );
    return out[0]! as String;
  }

  /// Calls `assetSymbol()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> assetSymbol() async {
    final out = await client.callFunction(
      contract: address,
      function: assetSymbolFn,
    );
    return out[0]! as String;
  }

  /// Calls `balanceOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOf(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfFn,
      args: [account],
    );
    return out[0]! as BigInt;
  }

  /// Calls `decimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> decimals() async {
    final out = await client.callFunction(
      contract: address,
      function: decimalsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `name()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> name() async {
    final out = await client.callFunction(
      contract: address,
      function: nameFn,
    );
    return out[0]! as String;
  }

  /// Calls `symbol()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> symbol() async {
    final out = await client.callFunction(
      contract: address,
      function: symbolFn,
    );
    return out[0]! as String;
  }

  /// Calls `totalSupply()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalSupply() async {
    final out = await client.callFunction(
      contract: address,
      function: totalSupplyFn,
    );
    return out[0]! as BigInt;
  }

}
