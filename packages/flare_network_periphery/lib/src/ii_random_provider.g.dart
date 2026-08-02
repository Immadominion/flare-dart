// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIRandomProvider
// Functions: 3 — 2 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIRandomProvider` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIRandomProviderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIRandomProviderContract({required this.client, required this.address});

  /// Resolves `IIRandomProvider` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIRandomProviderContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIRandomProviderContract(client: client, address: resolved);
  }

  /// ABI descriptor for `chillNonrevealingDataProviders(uint256,uint256)`.
  static final AbiFunction chillNonrevealingDataProvidersFn = AbiFunction(
    name: 'chillNonrevealingDataProviders',
    inputs: [
      AbiParameter(
        name: '_finalizingPriceEpochId',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(
        name: '_currentPriceEpochId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [
      AbiParameter(name: '_currentRandom', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCurrentRandomWithQuality()`.
  static final AbiFunction getCurrentRandomWithQualityFn = AbiFunction(
    name: 'getCurrentRandomWithQuality',
    inputs: [],
    outputs: [
      AbiParameter(name: '_currentRandom', type: AbiType.parse('uint256')),
      AbiParameter(name: '_goodRandom', type: AbiType.parse('bool')),
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

  /// Calls `getCurrentRandomWithQuality()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt currentRandom, bool goodRandom})>
  getCurrentRandomWithQuality() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomWithQualityFn,
    );
    return (currentRandom: out[0]! as BigInt, goodRandom: out[1]! as bool);
  }

  /// Builds an unsigned `chillNonrevealingDataProviders(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest chillNonrevealingDataProvidersTx(
    BigInt finalizingPriceEpochId,
    BigInt currentPriceEpochId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: chillNonrevealingDataProvidersFn,
    args: [finalizingPriceEpochId, currentPriceEpochId],
    from: from,
  );
}
