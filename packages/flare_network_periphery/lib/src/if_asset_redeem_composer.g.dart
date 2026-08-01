// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFAssetRedeemComposer
// Functions: 17 readable of 21 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFAssetRedeemComposer` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFAssetRedeemComposerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFAssetRedeemComposerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFAssetRedeemComposer` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFAssetRedeemComposerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFAssetRedeemComposerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `assetManager()`.
  static final AbiFunction assetManagerFn = AbiFunction(
    name: 'assetManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `composerFeeRecipient()`.
  static final AbiFunction composerFeeRecipientFn = AbiFunction(
    name: 'composerFeeRecipient',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultComposerFeePPM()`.
  static final AbiFunction defaultComposerFeePPMFn = AbiFunction(
    name: 'defaultComposerFeePPM',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultExecutor()`.
  static final AbiFunction defaultExecutorFn = AbiFunction(
    name: 'defaultExecutor',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `endpoint()`.
  static final AbiFunction endpointFn = AbiFunction(
    name: 'endpoint',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `fAsset()`.
  static final AbiFunction fAssetFn = AbiFunction(
    name: 'fAsset',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalances(address)`.
  static final AbiFunction getBalancesFn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_balances',
        type: AbiType.parse(
          '((address,uint256),(address,uint256),(address,uint256))',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getComposerFeePPM(uint32)`.
  static final AbiFunction getComposerFeePPMFn = AbiFunction(
    name: 'getComposerFeePPM',
    inputs: [AbiParameter(name: '_srcEid', type: AbiType.parse('uint32'))],
    outputs: [
      AbiParameter(name: '_composerFeePPM', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecuteTimelockedCallTimestamp(bytes)`.
  static final AbiFunction getExecuteTimelockedCallTimestampFn = AbiFunction(
    name: 'getExecuteTimelockedCallTimestamp',
    inputs: [AbiParameter(name: '_encodedCall', type: AbiType.parse('bytes'))],
    outputs: [
      AbiParameter(
        name: '_allowedAfterTimestamp',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRedeemerAccountAddress(address)`.
  static final AbiFunction getRedeemerAccountAddressFn = AbiFunction(
    name: 'getRedeemerAccountAddress',
    inputs: [AbiParameter(name: '_redeemer', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTimelockDurationSeconds()`.
  static final AbiFunction getTimelockDurationSecondsFn = AbiFunction(
    name: 'getTimelockDurationSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isRedeemerAccount(address)`.
  static final AbiFunction isRedeemerAccountFn = AbiFunction(
    name: 'isRedeemerAccount',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_isRedeemerAccount', type: AbiType.parse('bool')),
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redeemerAccountImplementation()`.
  static final AbiFunction redeemerAccountImplementationFn = AbiFunction(
    name: 'redeemerAccountImplementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `stableCoin()`.
  static final AbiFunction stableCoinFn = AbiFunction(
    name: 'stableCoin',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `trustedSourceOApp()`.
  static final AbiFunction trustedSourceOAppFn = AbiFunction(
    name: 'trustedSourceOApp',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `wNat()`.
  static final AbiFunction wNatFn = AbiFunction(
    name: 'wNat',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

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

  /// Calls `composerFeeRecipient()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> composerFeeRecipient() async {
    final out = await client.callFunction(
      contract: address,
      function: composerFeeRecipientFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `defaultComposerFeePPM()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultComposerFeePPM() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultComposerFeePPMFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `defaultExecutor()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> defaultExecutor() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultExecutorFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `endpoint()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> endpoint() async {
    final out = await client.callFunction(
      contract: address,
      function: endpointFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `fAsset()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fAsset() async {
    final out = await client.callFunction(
      contract: address,
      function: fAssetFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getBalances(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getBalances(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalancesFn,
      args: [account],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getComposerFeePPM(uint32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getComposerFeePPM(BigInt srcEid) async {
    final out = await client.callFunction(
      contract: address,
      function: getComposerFeePPMFn,
      args: [srcEid],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecuteTimelockedCallTimestamp(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecuteTimelockedCallTimestamp(
    Uint8List encodedCall,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecuteTimelockedCallTimestampFn,
      args: [encodedCall],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getRedeemerAccountAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getRedeemerAccountAddress(EthAddress redeemer) async {
    final out = await client.callFunction(
      contract: address,
      function: getRedeemerAccountAddressFn,
      args: [redeemer],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getTimelockDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getTimelockDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getTimelockDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `implementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> implementation() async {
    final out = await client.callFunction(
      contract: address,
      function: implementationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isRedeemerAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool isRedeemerAccount, EthAddress owner})> isRedeemerAccount(
    EthAddress address_,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isRedeemerAccountFn,
      args: [address_],
    );
    return (isRedeemerAccount: out[0]! as bool, owner: out[1]! as EthAddress);
  }

  /// Calls `redeemerAccountImplementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> redeemerAccountImplementation() async {
    final out = await client.callFunction(
      contract: address,
      function: redeemerAccountImplementationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `stableCoin()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> stableCoin() async {
    final out = await client.callFunction(
      contract: address,
      function: stableCoinFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `trustedSourceOApp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> trustedSourceOApp() async {
    final out = await client.callFunction(
      contract: address,
      function: trustedSourceOAppFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `wNat()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> wNat() async {
    final out = await client.callFunction(contract: address, function: wNatFn);
    return out[0]! as EthAddress;
  }
}
