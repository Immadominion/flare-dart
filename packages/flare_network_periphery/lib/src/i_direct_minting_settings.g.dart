// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDirectMintingSettings
// Functions: 14 readable of 24 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IDirectMintingSettings` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDirectMintingSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDirectMintingSettingsContract({required this.client, required this.address});

  /// Resolves `IDirectMintingSettings` through the [ContractRegistry].
  static Future<IDirectMintingSettingsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IDirectMintingSettings',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(registryName);
    return IDirectMintingSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDirectMintingDailyLimitUBA()`.
  static final AbiFunction getDirectMintingDailyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingDailyLimitUBA',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingDailyLimiterState()`.
  static final AbiFunction getDirectMintingDailyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingDailyLimiterState',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_windowStartTimestamp', type: AbiType.parse('uint64')),
      AbiParameter(name: '_mintedInCurrentWindow', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingExecutorFeeUBA()`.
  static final AbiFunction getDirectMintingExecutorFeeUBAFn = AbiFunction(
    name: 'getDirectMintingExecutorFeeUBA',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeBIPS()`.
  static final AbiFunction getDirectMintingFeeBIPSFn = AbiFunction(
    name: 'getDirectMintingFeeBIPS',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeReceiver()`.
  static final AbiFunction getDirectMintingFeeReceiverFn = AbiFunction(
    name: 'getDirectMintingFeeReceiver',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimitUBA()`.
  static final AbiFunction getDirectMintingHourlyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingHourlyLimitUBA',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimiterState()`.
  static final AbiFunction getDirectMintingHourlyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingHourlyLimiterState',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '_windowStartTimestamp', type: AbiType.parse('uint64')),
      AbiParameter(name: '_mintedInCurrentWindow', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingLargeMintingDelaySeconds()`.
  static final AbiFunction getDirectMintingLargeMintingDelaySecondsFn = AbiFunction(
    name: 'getDirectMintingLargeMintingDelaySeconds',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingLargeMintingThresholdUBA()`.
  static final AbiFunction getDirectMintingLargeMintingThresholdUBAFn = AbiFunction(
    name: 'getDirectMintingLargeMintingThresholdUBA',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingMinimumFeeUBA()`.
  static final AbiFunction getDirectMintingMinimumFeeUBAFn = AbiFunction(
    name: 'getDirectMintingMinimumFeeUBA',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingOthersCanExecuteAfterSeconds()`.
  static final AbiFunction getDirectMintingOthersCanExecuteAfterSecondsFn = AbiFunction(
    name: 'getDirectMintingOthersCanExecuteAfterSeconds',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingsUnblockUntilTimestamp()`.
  static final AbiFunction getDirectMintingsUnblockUntilTimestampFn = AbiFunction(
    name: 'getDirectMintingsUnblockUntilTimestamp',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getMintingTagManager()`.
  static final AbiFunction getMintingTagManagerFn = AbiFunction(
    name: 'getMintingTagManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSmartAccountManager()`.
  static final AbiFunction getSmartAccountManagerFn = AbiFunction(
    name: 'getSmartAccountManager',
    inputs: [
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `getDirectMintingDailyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingDailyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingDailyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})> getDirectMintingDailyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimiterStateFn,
    );
    return (windowStartTimestamp: out[0]! as BigInt, mintedInCurrentWindow: out[1]! as BigInt);
  }

  /// Calls `getDirectMintingExecutorFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingExecutorFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingExecutorFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeReceiver()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDirectMintingFeeReceiver() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeReceiverFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDirectMintingHourlyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingHourlyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingHourlyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})> getDirectMintingHourlyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimiterStateFn,
    );
    return (windowStartTimestamp: out[0]! as BigInt, mintedInCurrentWindow: out[1]! as BigInt);
  }

  /// Calls `getDirectMintingLargeMintingDelaySeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingDelaySeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingDelaySecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingLargeMintingThresholdUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingThresholdUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingThresholdUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingMinimumFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingMinimumFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingMinimumFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingOthersCanExecuteAfterSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingOthersCanExecuteAfterSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingOthersCanExecuteAfterSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingsUnblockUntilTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingsUnblockUntilTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingsUnblockUntilTimestampFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getMintingTagManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getMintingTagManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getMintingTagManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getSmartAccountManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getSmartAccountManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getSmartAccountManagerFn,
    );
    return out[0]! as EthAddress;
  }

}
