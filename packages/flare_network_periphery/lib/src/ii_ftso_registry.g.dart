// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtsoRegistry
// Functions: 19 readable of 21 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFtsoRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoRegistryContract({required this.client, required this.address});

  /// Resolves `IIFtsoRegistry` through the [ContractRegistry].
  static Future<IIFtsoRegistryContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIFtsoRegistry',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIFtsoRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAllCurrentPrices()`.
  static final AbiFunction getAllCurrentPricesFn = AbiFunction(
    name: 'getAllCurrentPrices',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint256,uint256,uint256,uint256)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPrice(string)`.
  static final AbiFunction getCurrentPriceFn = AbiFunction(
    name: 'getCurrentPrice',
    inputs: [
      AbiParameter(name: '_symbol', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPrice(uint256)`.
  static final AbiFunction getCurrentPrice2Fn = AbiFunction(
    name: 'getCurrentPrice',
    inputs: [
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimals(uint256)`.
  static final AbiFunction getCurrentPriceWithDecimalsFn = AbiFunction(
    name: 'getCurrentPriceWithDecimals',
    inputs: [
      AbiParameter(name: '_assetIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_assetPriceUsdDecimals', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimals(string)`.
  static final AbiFunction getCurrentPriceWithDecimals2Fn = AbiFunction(
    name: 'getCurrentPriceWithDecimals',
    inputs: [
      AbiParameter(name: '_symbol', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_assetPriceUsdDecimals', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPricesByIndices(uint256[])`.
  static final AbiFunction getCurrentPricesByIndicesFn = AbiFunction(
    name: 'getCurrentPricesByIndices',
    inputs: [
      AbiParameter(name: '_indices', type: AbiType.parse('uint256[]')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint256,uint256,uint256,uint256)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPricesBySymbols(string[])`.
  static final AbiFunction getCurrentPricesBySymbolsFn = AbiFunction(
    name: 'getCurrentPricesBySymbols',
    inputs: [
      AbiParameter(name: '_symbols', type: AbiType.parse('string[]')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint256,uint256,uint256,uint256)[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtso(uint256)`.
  static final AbiFunction getFtsoFn = AbiFunction(
    name: 'getFtso',
    inputs: [
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_activeFtsoAddress', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoBySymbol(string)`.
  static final AbiFunction getFtsoBySymbolFn = AbiFunction(
    name: 'getFtsoBySymbol',
    inputs: [
      AbiParameter(name: '_symbol', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '_activeFtsoAddress', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoIndex(string)`.
  static final AbiFunction getFtsoIndexFn = AbiFunction(
    name: 'getFtsoIndex',
    inputs: [
      AbiParameter(name: '_symbol', type: AbiType.parse('string')),
    ],
    outputs: [
      AbiParameter(name: '_assetIndex', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoSymbol(uint256)`.
  static final AbiFunction getFtsoSymbolFn = AbiFunction(
    name: 'getFtsoSymbol',
    inputs: [
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_symbol', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsos(uint256[])`.
  static final AbiFunction getFtsosFn = AbiFunction(
    name: 'getFtsos',
    inputs: [
      AbiParameter(name: '_indices', type: AbiType.parse('uint256[]')),
    ],
    outputs: [
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedFtsos()`.
  static final AbiFunction getSupportedFtsosFn = AbiFunction(
    name: 'getSupportedFtsos',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedIndices()`.
  static final AbiFunction getSupportedIndicesFn = AbiFunction(
    name: 'getSupportedIndices',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedIndices', type: AbiType.parse('uint256[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedIndicesAndFtsos()`.
  static final AbiFunction getSupportedIndicesAndFtsosFn = AbiFunction(
    name: 'getSupportedIndicesAndFtsos',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedIndices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedIndicesAndSymbols()`.
  static final AbiFunction getSupportedIndicesAndSymbolsFn = AbiFunction(
    name: 'getSupportedIndicesAndSymbols',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedIndices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_supportedSymbols', type: AbiType.parse('string[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedIndicesSymbolsAndFtsos()`.
  static final AbiFunction getSupportedIndicesSymbolsAndFtsosFn = AbiFunction(
    name: 'getSupportedIndicesSymbolsAndFtsos',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedIndices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_supportedSymbols', type: AbiType.parse('string[]')),
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedSymbols()`.
  static final AbiFunction getSupportedSymbolsFn = AbiFunction(
    name: 'getSupportedSymbols',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedSymbols', type: AbiType.parse('string[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSupportedSymbolsAndFtsos()`.
  static final AbiFunction getSupportedSymbolsAndFtsosFn = AbiFunction(
    name: 'getSupportedSymbolsAndFtsos',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_supportedSymbols', type: AbiType.parse('string[]')),
      AbiParameter(name: '_ftsos', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getAllCurrentPrices()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getAllCurrentPrices() async {
    final out = await client.callFunction(
      contract: address,
      function: getAllCurrentPricesFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getCurrentPrice(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})> getCurrentPrice(String symbol) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceFn,
      args: [symbol],
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPrice(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})> getCurrentPrice2(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPrice2Fn,
      args: [ftsoIndex],
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPriceWithDecimals(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})> getCurrentPriceWithDecimals(BigInt assetIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimalsFn,
      args: [assetIndex],
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt, assetPriceUsdDecimals: out[2]! as BigInt);
  }

  /// Calls `getCurrentPriceWithDecimals(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})> getCurrentPriceWithDecimals2(String symbol) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimals2Fn,
      args: [symbol],
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt, assetPriceUsdDecimals: out[2]! as BigInt);
  }

  /// Calls `getCurrentPricesByIndices(uint256[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getCurrentPricesByIndices(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPricesByIndicesFn,
      args: [indices],
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getCurrentPricesBySymbols(string[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getCurrentPricesBySymbols(List<String> symbols) async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPricesBySymbolsFn,
      args: [symbols],
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getFtso(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtso(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoFn,
      args: [ftsoIndex],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getFtsoBySymbol(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtsoBySymbol(String symbol) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoBySymbolFn,
      args: [symbol],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getFtsoIndex(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getFtsoIndex(String symbol) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoIndexFn,
      args: [symbol],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoSymbol(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getFtsoSymbol(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoSymbolFn,
      args: [ftsoIndex],
    );
    return out[0]! as String;
  }

  /// Calls `getFtsos(uint256[])`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsos(List<BigInt> indices) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsosFn,
      args: [indices],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getSupportedFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getSupportedFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedFtsosFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getSupportedIndices()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> getSupportedIndices() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedIndicesFn,
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `getSupportedIndicesAndFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> supportedIndices, List<EthAddress> ftsos})> getSupportedIndicesAndFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedIndicesAndFtsosFn,
    );
    return (supportedIndices: (out[0]! as List).cast<BigInt>(), ftsos: (out[1]! as List).cast<EthAddress>());
  }

  /// Calls `getSupportedIndicesAndSymbols()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> supportedIndices, List<String> supportedSymbols})> getSupportedIndicesAndSymbols() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedIndicesAndSymbolsFn,
    );
    return (supportedIndices: (out[0]! as List).cast<BigInt>(), supportedSymbols: (out[1]! as List).cast<String>());
  }

  /// Calls `getSupportedIndicesSymbolsAndFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> supportedIndices, List<String> supportedSymbols, List<EthAddress> ftsos})> getSupportedIndicesSymbolsAndFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedIndicesSymbolsAndFtsosFn,
    );
    return (supportedIndices: (out[0]! as List).cast<BigInt>(), supportedSymbols: (out[1]! as List).cast<String>(), ftsos: (out[2]! as List).cast<EthAddress>());
  }

  /// Calls `getSupportedSymbols()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<String>> getSupportedSymbols() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedSymbolsFn,
    );
    return (out[0]! as List).cast<String>();
  }

  /// Calls `getSupportedSymbolsAndFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<String> supportedSymbols, List<EthAddress> ftsos})> getSupportedSymbolsAndFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getSupportedSymbolsAndFtsosFn,
    );
    return (supportedSymbols: (out[0]! as List).cast<String>(), ftsos: (out[1]! as List).cast<EthAddress>());
  }

}
