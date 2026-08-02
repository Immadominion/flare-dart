// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICollateralizable
// Functions: 6 — 0 readable via eth_call, 6 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ICollateralizable` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICollateralizableContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICollateralizableContract({
    required this.client,
    required this.address,
  });

  /// Resolves `ICollateralizable` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ICollateralizableContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICollateralizableContract(client: client, address: resolved);
  }

  /// ABI descriptor for `addRewardToAgentPosition(uint256)`.
  static final AbiFunction addRewardToAgentPositionFn = AbiFunction(
    name: 'addRewardToAgentPosition',
    inputs: [AbiParameter(name: 'epochID', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: 'succeess', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `assetRedemptionRequest(uint256,bytes32)`.
  static final AbiFunction assetRedemptionRequestFn = AbiFunction(
    name: 'assetRedemptionRequest',
    inputs: [
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
      AbiParameter(name: 'assetAddress', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: 'redemptionId', type: AbiType.parse('uint256')),
      AbiParameter(name: 'agents', type: AbiType.parse('address[]')),
      AbiParameter(name: 'assetAmounts', type: AbiType.parse('uint256[]')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `deposit(uint256,uint256,uint256,uint256,address,uint8)`.
  static final AbiFunction depositFn = AbiFunction(
    name: 'deposit',
    inputs: [
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
      AbiParameter(name: 'freshMint', type: AbiType.parse('uint256')),
      AbiParameter(name: 'agentPosition', type: AbiType.parse('uint256')),
      AbiParameter(name: 'freshMintMinRatio', type: AbiType.parse('uint256')),
      AbiParameter(name: 'natAddress', type: AbiType.parse('address')),
      AbiParameter(name: 'handling', type: AbiType.parse('uint8')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `mintRequest(uint256,address,bytes32)`.
  static final AbiFunction mintRequestFn = AbiFunction(
    name: 'mintRequest',
    inputs: [
      AbiParameter(name: 'mintAmountTwei', type: AbiType.parse('uint256')),
      AbiParameter(name: 'mintDestination', type: AbiType.parse('address')),
      AbiParameter(name: 'underlyingAddress', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: 'mintRequestId', type: AbiType.parse('uint256')),
      AbiParameter(name: 'agents', type: AbiType.parse('address[]')),
      AbiParameter(name: 'assetAmounts', type: AbiType.parse('uint256[]')),
      AbiParameter(name: 'assetAddress', type: AbiType.parse('bytes32[]')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `proveMintPayment(uint256,bytes32,bytes32,bytes32,uint256,bytes32[])`.
  static final AbiFunction proveMintPaymentFn = AbiFunction(
    name: 'proveMintPayment',
    inputs: [
      AbiParameter(name: 'mintRequestId', type: AbiType.parse('uint256')),
      AbiParameter(name: 'minterSourceAddress', type: AbiType.parse('bytes32')),
      AbiParameter(name: 'agentAssetAddress', type: AbiType.parse('bytes32')),
      AbiParameter(name: 'destinationTag', type: AbiType.parse('bytes32')),
      AbiParameter(name: 'assetAmount', type: AbiType.parse('uint256')),
      AbiParameter(name: 'merkleProof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [
      AbiParameter(name: 'mintedAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `proveRedemptionPayment(uint256,bytes32,bytes32,bytes32,uint256,bytes32[])`.
  static final AbiFunction proveRedemptionPaymentFn = AbiFunction(
    name: 'proveRedemptionPayment',
    inputs: [
      AbiParameter(name: 'redemptionRequestId', type: AbiType.parse('uint256')),
      AbiParameter(
        name: 'agentSourceAssetAddress',
        type: AbiType.parse('bytes32'),
      ),
      AbiParameter(
        name: 'redeemerAssetAddress',
        type: AbiType.parse('bytes32'),
      ),
      AbiParameter(name: 'destinationTag', type: AbiType.parse('bytes32')),
      AbiParameter(name: 'assetAmount', type: AbiType.parse('uint256')),
      AbiParameter(name: 'merkleProof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [
      AbiParameter(name: 'redeemedAmount', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `addRewardToAgentPosition(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest addRewardToAgentPositionTx(
    BigInt epochID, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: addRewardToAgentPositionFn,
    args: [epochID],
    from: from,
  );

  /// Builds an unsigned `assetRedemptionRequest(uint256,bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest assetRedemptionRequestTx(
    BigInt amount,
    Uint8List assetAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: assetRedemptionRequestFn,
    args: [amount, assetAddress],
    from: from,
  );

  /// Builds an unsigned `deposit(uint256,uint256,uint256,uint256,address,uint8)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest depositTx(
    BigInt amount,
    BigInt freshMint,
    BigInt agentPosition,
    BigInt freshMintMinRatio,
    EthAddress natAddress,
    BigInt handling, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: depositFn,
    args: [
      amount,
      freshMint,
      agentPosition,
      freshMintMinRatio,
      natAddress,
      handling,
    ],
    from: from,
  );

  /// Builds an unsigned `mintRequest(uint256,address,bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest mintRequestTx(
    BigInt mintAmountTwei,
    EthAddress mintDestination,
    Uint8List underlyingAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: mintRequestFn,
    args: [mintAmountTwei, mintDestination, underlyingAddress],
    from: from,
  );

  /// Builds an unsigned `proveMintPayment(uint256,bytes32,bytes32,bytes32,uint256,bytes32[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proveMintPaymentTx(
    BigInt mintRequestId,
    Uint8List minterSourceAddress,
    Uint8List agentAssetAddress,
    Uint8List destinationTag,
    BigInt assetAmount,
    List<Uint8List> merkleProof, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proveMintPaymentFn,
    args: [
      mintRequestId,
      minterSourceAddress,
      agentAssetAddress,
      destinationTag,
      assetAmount,
      merkleProof,
    ],
    from: from,
  );

  /// Builds an unsigned `proveRedemptionPayment(uint256,bytes32,bytes32,bytes32,uint256,bytes32[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proveRedemptionPaymentTx(
    BigInt redemptionRequestId,
    Uint8List agentSourceAssetAddress,
    Uint8List redeemerAssetAddress,
    Uint8List destinationTag,
    BigInt assetAmount,
    List<Uint8List> merkleProof, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proveRedemptionPaymentFn,
    args: [
      redemptionRequestId,
      agentSourceAssetAddress,
      redeemerAssetAddress,
      destinationTag,
      assetAmount,
      merkleProof,
    ],
    from: from,
  );
}
