// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIIncentivePoolReceiver
// Functions: 4 — 1 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIIncentivePoolReceiver` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIIncentivePoolReceiverContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIIncentivePoolReceiverContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIIncentivePoolReceiver` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIIncentivePoolReceiverContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIIncentivePoolReceiverContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getContractName()`.
  static final AbiFunction getContractNameFn = AbiFunction(
    name: 'getContractName',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getIncentivePoolAddress()`.
  static final AbiFunction getIncentivePoolAddressFn = AbiFunction(
    name: 'getIncentivePoolAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `receiveIncentive()`.
  static final AbiFunction receiveIncentiveFn = AbiFunction(
    name: 'receiveIncentive',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `setDailyAuthorizedIncentive(uint256)`.
  static final AbiFunction setDailyAuthorizedIncentiveFn = AbiFunction(
    name: 'setDailyAuthorizedIncentive',
    inputs: [
      AbiParameter(name: '_toAuthorizeWei', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getContractName()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> getContractName() async {
    final out = await client.callFunction(
      contract: address,
      function: getContractNameFn,
    );
    return out[0]! as String;
  }

  /// Builds an unsigned `getIncentivePoolAddress()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest getIncentivePoolAddressTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: getIncentivePoolAddressFn,
        from: from,
      );

  /// Builds an unsigned `receiveIncentive()`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest receiveIncentiveTx({EthAddress? from, BigInt? value}) =>
      TransactionRequest.callFunction(
        to: address,
        function: receiveIncentiveFn,
        from: from,
        value: value,
      );

  /// Builds an unsigned `setDailyAuthorizedIncentive(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDailyAuthorizedIncentiveTx(
    BigInt toAuthorizeWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDailyAuthorizedIncentiveFn,
    args: [toAuthorizeWei],
    from: from,
  );
}
