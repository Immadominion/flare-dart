// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IISupply
// Functions: 5 — 2 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IISupply` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IISupplyContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IISupplyContract({required this.client, required this.address});

  /// Resolves `IISupply` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IISupplyContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IISupplyContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCirculatingSupplyAt(uint256)`.
  static final AbiFunction getCirculatingSupplyAtFn = AbiFunction(
    name: 'getCirculatingSupplyAt',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_circulatingSupplyWei',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCirculatingSupplyAtCached(uint256)`.
  static final AbiFunction getCirculatingSupplyAtCachedFn = AbiFunction(
    name: 'getCirculatingSupplyAtCached',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_circulatingSupplyWei',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getInflatableBalance()`.
  static final AbiFunction getInflatableBalanceFn = AbiFunction(
    name: 'getInflatableBalance',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_inflatableBalanceWei',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `updateAuthorizedInflationAndCirculatingSupply(uint256)`.
  static final AbiFunction updateAuthorizedInflationAndCirculatingSupplyFn =
      AbiFunction(
        name: 'updateAuthorizedInflationAndCirculatingSupply',
        inputs: [
          AbiParameter(
            name: '_inflationAuthorizedWei',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `updateCirculatingSupply()`.
  static final AbiFunction updateCirculatingSupplyFn = AbiFunction(
    name: 'updateCirculatingSupply',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getCirculatingSupplyAt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCirculatingSupplyAt(BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getCirculatingSupplyAtFn,
      args: [blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getInflatableBalance()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInflatableBalance() async {
    final out = await client.callFunction(
      contract: address,
      function: getInflatableBalanceFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `getCirculatingSupplyAtCached(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest getCirculatingSupplyAtCachedTx(
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: getCirculatingSupplyAtCachedFn,
    args: [blockNumber],
    from: from,
  );

  /// Builds an unsigned `updateAuthorizedInflationAndCirculatingSupply(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateAuthorizedInflationAndCirculatingSupplyTx(
    BigInt inflationAuthorizedWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: updateAuthorizedInflationAndCirculatingSupplyFn,
    args: [inflationAuthorizedWei],
    from: from,
  );

  /// Builds an unsigned `updateCirculatingSupply()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateCirculatingSupplyTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: updateCirculatingSupplyFn,
        from: from,
      );
}
