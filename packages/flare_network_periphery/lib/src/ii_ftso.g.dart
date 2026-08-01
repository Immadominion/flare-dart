// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtso
// Functions: 21 readable of 34 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFtso` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoContract({required this.client, required this.address});

  /// Resolves `IIFtso` through the [ContractRegistry].
  static Future<IIFtsoContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IIFtso',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IIFtsoContract(client: client, address: resolved);
  }

  /// ABI descriptor for `active()`.
  static final AbiFunction activeFn = AbiFunction(
    name: 'active',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `epochsConfiguration()`.
  static final AbiFunction epochsConfigurationFn = AbiFunction(
    name: 'epochsConfiguration',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_maxVotePowerNatThresholdFraction', type: AbiType.parse('uint256')),
      AbiParameter(name: '_maxVotePowerAssetThresholdFraction', type: AbiType.parse('uint256')),
      AbiParameter(name: '_lowAssetUSDThreshold', type: AbiType.parse('uint256')),
      AbiParameter(name: '_highAssetUSDThreshold', type: AbiType.parse('uint256')),
      AbiParameter(name: '_highAssetTurnoutThresholdBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_lowNatTurnoutThresholdBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_elasticBandRewardBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_elasticBandWidthPPM', type: AbiType.parse('uint256')),
      AbiParameter(name: '_trustedAddresses', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ftsoManager()`.
  static final AbiFunction ftsoManagerFn = AbiFunction(
    name: 'ftsoManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAsset()`.
  static final AbiFunction getAssetFn = AbiFunction(
    name: 'getAsset',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAssetFtsos()`.
  static final AbiFunction getAssetFtsosFn = AbiFunction(
    name: 'getAssetFtsos',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentEpochId()`.
  static final AbiFunction getCurrentEpochIdFn = AbiFunction(
    name: 'getCurrentEpochId',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPrice()`.
  static final AbiFunction getCurrentPriceFn = AbiFunction(
    name: 'getCurrentPrice',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceDetails()`.
  static final AbiFunction getCurrentPriceDetailsFn = AbiFunction(
    name: 'getCurrentPriceDetails',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_priceTimestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_priceFinalizationType', type: AbiType.parse('uint8')),
      AbiParameter(name: '_lastPriceEpochFinalizationTimestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_lastPriceEpochFinalizationType', type: AbiType.parse('uint8')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceFromTrustedProviders()`.
  static final AbiFunction getCurrentPriceFromTrustedProvidersFn = AbiFunction(
    name: 'getCurrentPriceFromTrustedProviders',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimals()`.
  static final AbiFunction getCurrentPriceWithDecimalsFn = AbiFunction(
    name: 'getCurrentPriceWithDecimals',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_assetPriceUsdDecimals', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentPriceWithDecimalsFromTrustedProviders()`.
  static final AbiFunction getCurrentPriceWithDecimalsFromTrustedProvidersFn = AbiFunction(
    name: 'getCurrentPriceWithDecimalsFromTrustedProviders',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_assetPriceUsdDecimals', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

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

  /// ABI descriptor for `getEpochId(uint256)`.
  static final AbiFunction getEpochIdFn = AbiFunction(
    name: 'getEpochId',
    inputs: [
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochPrice(uint256)`.
  static final AbiFunction getEpochPriceFn = AbiFunction(
    name: 'getEpochPrice',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getEpochPriceForVoter(uint256,address)`.
  static final AbiFunction getEpochPriceForVoterFn = AbiFunction(
    name: 'getEpochPriceForVoter',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochConfiguration()`.
  static final AbiFunction getPriceEpochConfigurationFn = AbiFunction(
    name: 'getPriceEpochConfiguration',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_firstEpochStartTs', type: AbiType.parse('uint256')),
      AbiParameter(name: '_submitPeriodSeconds', type: AbiType.parse('uint256')),
      AbiParameter(name: '_revealPeriodSeconds', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochData()`.
  static final AbiFunction getPriceEpochDataFn = AbiFunction(
    name: 'getPriceEpochData',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_epochSubmitEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_epochRevealEndTime', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_fallbackMode', type: AbiType.parse('bool')),
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

  /// ABI descriptor for `getVoteWeightingParameters()`.
  static final AbiFunction getVoteWeightingParametersFn = AbiFunction(
    name: 'getVoteWeightingParameters',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_assets', type: AbiType.parse('address[]')),
      AbiParameter(name: '_assetMultipliers', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_totalVotePowerNat', type: AbiType.parse('uint256')),
      AbiParameter(name: '_totalVotePowerAsset', type: AbiType.parse('uint256')),
      AbiParameter(name: '_assetWeightRatio', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votePowerBlock', type: AbiType.parse('uint256')),
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

  /// ABI descriptor for `wNat()`.
  static final AbiFunction wNatFn = AbiFunction(
    name: 'wNat',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `active()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> active() async {
    final out = await client.callFunction(
      contract: address,
      function: activeFn,
    );
    return out[0]! as bool;
  }

  /// Calls `epochsConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt maxVotePowerNatThresholdFraction, BigInt maxVotePowerAssetThresholdFraction, BigInt lowAssetUSDThreshold, BigInt highAssetUSDThreshold, BigInt highAssetTurnoutThresholdBIPS, BigInt lowNatTurnoutThresholdBIPS, BigInt elasticBandRewardBIPS, BigInt elasticBandWidthPPM, List<EthAddress> trustedAddresses})> epochsConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: epochsConfigurationFn,
    );
    return (maxVotePowerNatThresholdFraction: out[0]! as BigInt, maxVotePowerAssetThresholdFraction: out[1]! as BigInt, lowAssetUSDThreshold: out[2]! as BigInt, highAssetUSDThreshold: out[3]! as BigInt, highAssetTurnoutThresholdBIPS: out[4]! as BigInt, lowNatTurnoutThresholdBIPS: out[5]! as BigInt, elasticBandRewardBIPS: out[6]! as BigInt, elasticBandWidthPPM: out[7]! as BigInt, trustedAddresses: (out[8]! as List).cast<EthAddress>());
  }

  /// Calls `ftsoManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> ftsoManager() async {
    final out = await client.callFunction(
      contract: address,
      function: ftsoManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getAsset()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getAsset() async {
    final out = await client.callFunction(
      contract: address,
      function: getAssetFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getAssetFtsos()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getAssetFtsos() async {
    final out = await client.callFunction(
      contract: address,
      function: getAssetFtsosFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getCurrentEpochId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentEpochId() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentEpochIdFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCurrentPrice()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})> getCurrentPrice() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPriceDetails()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt priceTimestamp, BigInt priceFinalizationType, BigInt lastPriceEpochFinalizationTimestamp, BigInt lastPriceEpochFinalizationType})> getCurrentPriceDetails() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceDetailsFn,
    );
    return (price: out[0]! as BigInt, priceTimestamp: out[1]! as BigInt, priceFinalizationType: out[2]! as BigInt, lastPriceEpochFinalizationTimestamp: out[3]! as BigInt, lastPriceEpochFinalizationType: out[4]! as BigInt);
  }

  /// Calls `getCurrentPriceFromTrustedProviders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp})> getCurrentPriceFromTrustedProviders() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceFromTrustedProvidersFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt);
  }

  /// Calls `getCurrentPriceWithDecimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})> getCurrentPriceWithDecimals() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimalsFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt, assetPriceUsdDecimals: out[2]! as BigInt);
  }

  /// Calls `getCurrentPriceWithDecimalsFromTrustedProviders()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt price, BigInt timestamp, BigInt assetPriceUsdDecimals})> getCurrentPriceWithDecimalsFromTrustedProviders() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentPriceWithDecimalsFromTrustedProvidersFn,
    );
    return (price: out[0]! as BigInt, timestamp: out[1]! as BigInt, assetPriceUsdDecimals: out[2]! as BigInt);
  }

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

  /// Calls `getEpochId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochId(BigInt timestamp) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochIdFn,
      args: [timestamp],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochPrice(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochPrice(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochPriceFn,
      args: [epochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getEpochPriceForVoter(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getEpochPriceForVoter(BigInt epochId, EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getEpochPriceForVoterFn,
      args: [epochId, voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPriceEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt firstEpochStartTs, BigInt submitPeriodSeconds, BigInt revealPeriodSeconds})> getPriceEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochConfigurationFn,
    );
    return (firstEpochStartTs: out[0]! as BigInt, submitPeriodSeconds: out[1]! as BigInt, revealPeriodSeconds: out[2]! as BigInt);
  }

  /// Calls `getPriceEpochData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt epochId, BigInt epochSubmitEndTime, BigInt epochRevealEndTime, BigInt votePowerBlock, bool fallbackMode})> getPriceEpochData() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochDataFn,
    );
    return (epochId: out[0]! as BigInt, epochSubmitEndTime: out[1]! as BigInt, epochRevealEndTime: out[2]! as BigInt, votePowerBlock: out[3]! as BigInt, fallbackMode: out[4]! as bool);
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

  /// Calls `getVoteWeightingParameters()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> assets, List<BigInt> assetMultipliers, BigInt totalVotePowerNat, BigInt totalVotePowerAsset, BigInt assetWeightRatio, BigInt votePowerBlock})> getVoteWeightingParameters() async {
    final out = await client.callFunction(
      contract: address,
      function: getVoteWeightingParametersFn,
    );
    return (assets: (out[0]! as List).cast<EthAddress>(), assetMultipliers: (out[1]! as List).cast<BigInt>(), totalVotePowerNat: out[2]! as BigInt, totalVotePowerAsset: out[3]! as BigInt, assetWeightRatio: out[4]! as BigInt, votePowerBlock: out[5]! as BigInt);
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

  /// Calls `wNat()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> wNat() async {
    final out = await client.callFunction(
      contract: address,
      function: wNatFn,
    );
    return out[0]! as EthAddress;
  }

}
