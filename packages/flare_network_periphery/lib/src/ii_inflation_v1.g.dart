// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIInflationV1
// Functions: 3 — 1 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIInflationV1` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIInflationV1Contract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIInflationV1Contract({required this.client, required this.address});

  /// Resolves `IIInflationV1` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIInflationV1Contract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIInflationV1Contract(client: client, address: resolved);
  }

  /// ABI descriptor for `getAnnum(uint256)`.
  static final AbiFunction getAnnumFn = AbiFunction(
    name: 'getAnnum',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint256,uint256,uint256,((address,uint256,uint256,uint256,uint256,uint256)[],uint256,uint256,uint256,uint256))',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `lastAuthorizationTs()`.
  static final AbiFunction lastAuthorizationTsFn = AbiFunction(
    name: 'lastAuthorizationTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `rewardEpochStartedTs()`.
  static final AbiFunction rewardEpochStartedTsFn = AbiFunction(
    name: 'rewardEpochStartedTs',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getAnnum(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getAnnum(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: getAnnumFn,
      args: [index],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Builds an unsigned `lastAuthorizationTs()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest lastAuthorizationTsTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: lastAuthorizationTsFn,
        from: from,
      );

  /// Builds an unsigned `rewardEpochStartedTs()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest rewardEpochStartedTsTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: rewardEpochStartedTsFn,
        from: from,
      );
}
