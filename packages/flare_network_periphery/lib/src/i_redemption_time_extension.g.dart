// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedemptionTimeExtension
// Functions: 2 — 1 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRedemptionTimeExtension` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRedemptionTimeExtensionContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRedemptionTimeExtensionContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IRedemptionTimeExtension` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRedemptionTimeExtensionContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRedemptionTimeExtensionContract(client: client, address: resolved);
  }

  /// ABI descriptor for `redemptionPaymentExtensionSeconds()`.
  static final AbiFunction redemptionPaymentExtensionSecondsFn = AbiFunction(
    name: 'redemptionPaymentExtensionSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `setRedemptionPaymentExtensionSeconds(uint256)`.
  static final AbiFunction setRedemptionPaymentExtensionSecondsFn = AbiFunction(
    name: 'setRedemptionPaymentExtensionSeconds',
    inputs: [AbiParameter(name: '_value', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `redemptionPaymentExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> redemptionPaymentExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionPaymentExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `setRedemptionPaymentExtensionSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setRedemptionPaymentExtensionSecondsTx(
    BigInt value_, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setRedemptionPaymentExtensionSecondsFn,
    args: [value_],
    from: from,
  );
}
