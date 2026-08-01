// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIFtsoManagerV1
// Functions: 5 readable of 5 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIFtsoManagerV1` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIFtsoManagerV1Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIFtsoManagerV1Contract({required this.client, required this.address});

  /// Resolves `IIFtsoManagerV1` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIFtsoManagerV1Contract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIFtsoManagerV1Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRewardEpoch()`.
  static final AbiFunction getCurrentRewardEpochFn = AbiFunction(
    name: 'getCurrentRewardEpoch',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPriceEpochConfiguration()`.
  static final AbiFunction getPriceEpochConfigurationFn = AbiFunction(
    name: 'getPriceEpochConfiguration',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_firstPriceEpochStartTs',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_priceEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_revealEpochDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochDurationSeconds()`.
  static final AbiFunction rewardEpochDurationSecondsFn = AbiFunction(
    name: 'rewardEpochDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochs(uint256)`.
  static final AbiFunction rewardEpochsFn = AbiFunction(
    name: 'rewardEpochs',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_votepowerBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_startBlock', type: AbiType.parse('uint256')),
      AbiParameter(name: '_startTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `rewardEpochsStartTs()`.
  static final AbiFunction rewardEpochsStartTsFn = AbiFunction(
    name: 'rewardEpochsStartTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentRewardEpoch()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRewardEpoch() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRewardEpochFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPriceEpochConfiguration()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt firstPriceEpochStartTs,
      BigInt priceEpochDurationSeconds,
      BigInt revealEpochDurationSeconds,
    })
  >
  getPriceEpochConfiguration() async {
    final out = await client.callFunction(
      contract: address,
      function: getPriceEpochConfigurationFn,
    );
    return (
      firstPriceEpochStartTs: out[0]! as BigInt,
      priceEpochDurationSeconds: out[1]! as BigInt,
      revealEpochDurationSeconds: out[2]! as BigInt,
    );
  }

  /// Calls `rewardEpochDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardEpochDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardEpochDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `rewardEpochs(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt votepowerBlock, BigInt startBlock, BigInt startTimestamp})>
  rewardEpochs(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: rewardEpochsFn,
      args: [rewardEpochId],
    );
    return (
      votepowerBlock: out[0]! as BigInt,
      startBlock: out[1]! as BigInt,
      startTimestamp: out[2]! as BigInt,
    );
  }

  /// Calls `rewardEpochsStartTs()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> rewardEpochsStartTs() async {
    final out = await client.callFunction(
      contract: address,
      function: rewardEpochsStartTsFn,
    );
    return out[0]! as BigInt;
  }
}
