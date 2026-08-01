// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultClientSettings
// Functions: 8 readable of 15 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ICoreVaultClientSettings` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICoreVaultClientSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICoreVaultClientSettingsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `ICoreVaultClientSettings` through the [ContractRegistry].
  static Future<ICoreVaultClientSettingsContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ICoreVaultClientSettings',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICoreVaultClientSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCoreVaultDonationTag()`.
  static final AbiFunction getCoreVaultDonationTagFn = AbiFunction(
    name: 'getCoreVaultDonationTag',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultManager()`.
  static final AbiFunction getCoreVaultManagerFn = AbiFunction(
    name: 'getCoreVaultManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumAmountLeftBIPS()`.
  static final AbiFunction getCoreVaultMinimumAmountLeftBIPSFn = AbiFunction(
    name: 'getCoreVaultMinimumAmountLeftBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumRedeemLots()`.
  static final AbiFunction getCoreVaultMinimumRedeemLotsFn = AbiFunction(
    name: 'getCoreVaultMinimumRedeemLots',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultNativeAddress()`.
  static final AbiFunction getCoreVaultNativeAddressFn = AbiFunction(
    name: 'getCoreVaultNativeAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultRedemptionFeeBIPS()`.
  static final AbiFunction getCoreVaultRedemptionFeeBIPSFn = AbiFunction(
    name: 'getCoreVaultRedemptionFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultTransferDefaultPenaltyBIPS()`.
  static final AbiFunction getCoreVaultTransferDefaultPenaltyBIPSFn =
      AbiFunction(
        name: 'getCoreVaultTransferDefaultPenaltyBIPS',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getCoreVaultTransferTimeExtensionSeconds()`.
  static final AbiFunction getCoreVaultTransferTimeExtensionSecondsFn =
      AbiFunction(
        name: 'getCoreVaultTransferTimeExtensionSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// Calls `getCoreVaultDonationTag()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultDonationTag() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultDonationTagFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultMinimumAmountLeftBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumAmountLeftBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumAmountLeftBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultMinimumRedeemLots()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumRedeemLots() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumRedeemLotsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultNativeAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultNativeAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultNativeAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultRedemptionFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultRedemptionFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultRedemptionFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferDefaultPenaltyBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferDefaultPenaltyBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferDefaultPenaltyBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferTimeExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferTimeExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferTimeExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }
}
