// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IInflationGenesis
// Functions: 1 — 0 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IInflationGenesis` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IInflationGenesisContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IInflationGenesisContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IInflationGenesis` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IInflationGenesisContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IInflationGenesisContract(client: client, address: resolved);
  }

  /// ABI descriptor for `receiveMinting()`.
  static final AbiFunction receiveMintingFn = AbiFunction(
    name: 'receiveMinting',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// Builds an unsigned `receiveMinting()`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest receiveMintingTx({EthAddress? from, BigInt? value}) =>
      TransactionRequest.callFunction(
        to: address,
        function: receiveMintingFn,
        from: from,
        value: value,
      );
}
