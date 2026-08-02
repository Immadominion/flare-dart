// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFAssetRedeemerAccount
// Functions: 4 — 2 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 5
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IFAssetRedeemerAccount` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFAssetRedeemerAccountContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFAssetRedeemerAccountContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IFAssetRedeemerAccount` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IFAssetRedeemerAccountContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFAssetRedeemerAccountContract(client: client, address: resolved);
  }

  /// ABI descriptor for `composer()`.
  static final AbiFunction composerFn = AbiFunction(
    name: 'composer',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redemptionPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))),uint256)`.
  static final AbiFunction redemptionPaymentDefaultFn = AbiFunction(
    name: 'redemptionPaymentDefault',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64)))',
        ),
      ),
      AbiParameter(
        name: '_redemptionRequestId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `xrpRedemptionPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64))),uint256)`.
  static final AbiFunction xrpRedemptionPaymentDefaultFn = AbiFunction(
    name: 'xrpRedemptionPaymentDefault',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64)))',
        ),
      ),
      AbiParameter(
        name: '_redemptionRequestId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `composer()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> composer() async {
    final out = await client.callFunction(
      contract: address,
      function: composerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(contract: address, function: ownerFn);
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `redemptionPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest redemptionPaymentDefaultTx(
    List<Object?> proof,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: redemptionPaymentDefaultFn,
    args: [proof, redemptionRequestId],
    from: from,
  );

  /// Builds an unsigned `xrpRedemptionPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bool,bytes32,bool,uint256,address),(uint64,uint64,uint64))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest xrpRedemptionPaymentDefaultTx(
    List<Object?> proof,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: xrpRedemptionPaymentDefaultFn,
    args: [proof, redemptionRequestId],
    from: from,
  );

  /// `AlreadyInitialized()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError alreadyInitializedError = AbiError(
    name: 'AlreadyInitialized',
    inputs: [],
  );

  /// `ComposerOnly()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError composerOnlyError = AbiError(
    name: 'ComposerOnly',
    inputs: [],
  );

  /// `InvalidAddress()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError invalidAddressError = AbiError(
    name: 'InvalidAddress',
    inputs: [],
  );

  /// `OwnerOnly()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError ownerOnlyError = AbiError(
    name: 'OwnerOnly',
    inputs: [],
  );

  /// `RedeemWithTagNotSupported()`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError redeemWithTagNotSupportedError = AbiError(
    name: 'RedeemWithTagNotSupported',
    inputs: [],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [
    alreadyInitializedError,
    composerOnlyError,
    invalidAddressError,
    ownerOnlyError,
    redeemWithTagNotSupportedError,
  ];

  /// Explains why a call to this contract reverted.
  ///
  /// ```dart
  /// try {
  ///   await client.estimateGas(request.toCallRequest());
  /// } on FlareRpcException catch (e) {
  ///   print(decodeRevert(e)?.description);
  /// }
  /// ```
  ///
  /// Returns null when the node attached no revert data,
  /// which is how Flare reports a bare `revert()`.
  static RevertReason? decodeRevert(FlareRpcException e) =>
      e.revertReasonWith(allErrors);

  /// `FAssetRedeemed(uint256,string,bool,uint256,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `fAssetRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fAssetRedeemedEvent = AbiEvent(
    name: 'FAssetRedeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amountToRedeemUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemerUnderlyingAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemWithTag',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'destinationTag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MaxAllowancesSet(address,address,address,address)`
  ///
  /// Decode a matching log with
  /// `maxAllowancesSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maxAllowancesSetEvent = AbiEvent(
    name: 'MaxAllowancesSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fAsset',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'stableCoin',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'wNat',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPaymentDefaulted(uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionPaymentDefaultedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPaymentDefaultedEvent = AbiEvent(
    name: 'RedemptionPaymentDefaulted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `XrpRedemptionPaymentDefaulted(uint256)`
  ///
  /// Decode a matching log with
  /// `xrpRedemptionPaymentDefaultedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrpRedemptionPaymentDefaultedEvent = AbiEvent(
    name: 'XrpRedemptionPaymentDefaulted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    fAssetRedeemedEvent,
    maxAllowancesSetEvent,
    redemptionPaymentDefaultedEvent,
    xrpRedemptionPaymentDefaultedEvent,
  ];

  /// Decodes [log] into whichever of [allEvents] it matches.
  ///
  /// Returns null when the log belongs to a different event,
  /// which is normal: one address emits many event types and
  /// an address-only filter returns all of them.
  static DecodedLog? decodeLog(FlareLog log) {
    for (final event in allEvents) {
      if (!event.matches(log.topics)) continue;
      return DecodedLog(
        log: log,
        event: event,
        values: event.decode(topics: log.topics, data: log.data),
      );
    }
    return null;
  }
}
