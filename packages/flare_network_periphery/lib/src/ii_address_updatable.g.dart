// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIAddressUpdatable
// Functions: 1 — 0 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIAddressUpdatable` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIAddressUpdatableContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIAddressUpdatableContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIAddressUpdatable` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIAddressUpdatableContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIAddressUpdatableContract(client: client, address: resolved);
  }

  /// ABI descriptor for `updateContractAddresses(bytes32[],address[])`.
  static final AbiFunction updateContractAddressesFn = AbiFunction(
    name: 'updateContractAddresses',
    inputs: [
      AbiParameter(
        name: '_contractNameHashes',
        type: AbiType.parse('bytes32[]'),
      ),
      AbiParameter(
        name: '_contractAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `updateContractAddresses(bytes32[],address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateContractAddressesTx(
    List<Uint8List> contractNameHashes,
    List<EthAddress> contractAddresses, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: updateContractAddressesFn,
    args: [contractNameHashes, contractAddresses],
    from: from,
  );
}
