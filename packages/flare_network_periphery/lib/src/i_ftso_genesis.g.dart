// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFtsoGenesis
// Functions: 2 — 0 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFtsoGenesis` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFtsoGenesisContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFtsoGenesisContract({required this.client, required this.address});

  /// Resolves `IFtsoGenesis` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFtsoGenesisContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFtsoGenesisContract(client: client, address: resolved);
  }

  /// ABI descriptor for `revealPriceSubmitter(address,uint256,uint256,uint256)`.
  static final AbiFunction revealPriceSubmitterFn = AbiFunction(
    name: 'revealPriceSubmitter',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_price', type: AbiType.parse('uint256')),
      AbiParameter(name: '_wNatVP', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `wNatVotePowerCached(address,uint256)`.
  static final AbiFunction wNatVotePowerCachedFn = AbiFunction(
    name: 'wNatVotePowerCached',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `revealPriceSubmitter(address,uint256,uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest revealPriceSubmitterTx(
    EthAddress voter,
    BigInt epochId,
    BigInt price,
    BigInt wNatVP, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: revealPriceSubmitterFn,
    args: [voter, epochId, price, wNatVP],
    from: from,
  );

  /// Builds an unsigned `wNatVotePowerCached(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest wNatVotePowerCachedTx(
    EthAddress voter,
    BigInt epochId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: wNatVotePowerCachedFn,
    args: [voter, epochId],
    from: from,
  );
}
