// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRedeemExtended
// Functions: 6 — 4 readable via eth_call, 4 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IRedeemExtended` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRedeemExtendedContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRedeemExtendedContract({required this.client, required this.address});

  /// Resolves `IRedeemExtended` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IRedeemExtendedContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRedeemExtendedContract(client: client, address: resolved);
  }

  /// ABI descriptor for `confirmXRPRedemptionPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))),uint256)`.
  static final AbiFunction confirmXRPRedemptionPaymentFn = AbiFunction(
    name: 'confirmXRPRedemptionPayment',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))',
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

  /// ABI descriptor for `redeemAmount(uint256,string,address)`.
  static final AbiFunction redeemAmountFn = AbiFunction(
    name: 'redeemAmount',
    inputs: [
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_redeemerUnderlyingAddressString',
        type: AbiType.parse('string'),
      ),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '_redeemedAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `redeemWithTag(uint256,string,address,uint256)`.
  static final AbiFunction redeemWithTagFn = AbiFunction(
    name: 'redeemWithTag',
    inputs: [
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_redeemerUnderlyingAddressString',
        type: AbiType.parse('string'),
      ),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_destinationTag', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_redeemedAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `redeemWithTagSupported()`.
  static final AbiFunction redeemWithTagSupportedFn = AbiFunction(
    name: 'redeemWithTagSupported',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redemptionRequestInfoExt(uint256)`.
  static final AbiFunction redemptionRequestInfoExtFn = AbiFunction(
    name: 'redemptionRequestInfoExt',
    inputs: [
      AbiParameter(
        name: '_redemptionRequestId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint64,uint8,address,address,string,bytes32,uint128,uint128,uint16,uint64,uint64,uint64,uint64,bool,bool,address,uint256,bool,uint256)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
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

  /// Calls `redeemAmount(uint256,string,address)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> redeemAmount(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redeemAmountFn,
      args: [amountUBA, redeemerUnderlyingAddressString, executor],
    );
    return out[0]! as BigInt;
  }

  /// Calls `redeemWithTag(uint256,string,address,uint256)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> redeemWithTag(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
    BigInt destinationTag,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redeemWithTagFn,
      args: [
        amountUBA,
        redeemerUnderlyingAddressString,
        executor,
        destinationTag,
      ],
    );
    return out[0]! as BigInt;
  }

  /// Calls `redeemWithTagSupported()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> redeemWithTagSupported() async {
    final out = await client.callFunction(
      contract: address,
      function: redeemWithTagSupportedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `redemptionRequestInfoExt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> redemptionRequestInfoExt(
    BigInt redemptionRequestId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionRequestInfoExtFn,
      args: [redemptionRequestId],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Builds an unsigned `confirmXRPRedemptionPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmXRPRedemptionPaymentTx(
    List<Object?> payment,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmXRPRedemptionPaymentFn,
    args: [payment, redemptionRequestId],
    from: from,
  );

  /// Builds an unsigned `redeemAmount(uint256,string,address)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest redeemAmountTx(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: redeemAmountFn,
    args: [amountUBA, redeemerUnderlyingAddressString, executor],
    from: from,
    value: value,
  );

  /// Builds an unsigned `redeemWithTag(uint256,string,address,uint256)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest redeemWithTagTx(
    BigInt amountUBA,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
    BigInt destinationTag, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: redeemWithTagFn,
    args: [
      amountUBA,
      redeemerUnderlyingAddressString,
      executor,
      destinationTag,
    ],
    from: from,
    value: value,
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

  /// `RedemptionAmountIncomplete(address,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionAmountIncompleteEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionAmountIncompleteEvent = AbiEvent(
    name: 'RedemptionAmountIncomplete',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redeemer',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'remainingAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionWithTagRequested(address,address,uint256,string,uint256,uint256,uint256,uint256,uint256,bytes32,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionWithTagRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionWithTagRequestedEvent = AbiEvent(
    name: 'RedemptionWithTagRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'redeemer',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'requestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'feeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'firstUnderlyingBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lastUnderlyingBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lastUnderlyingTimestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFeeNatWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'destinationTag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    redemptionAmountIncompleteEvent,
    redemptionWithTagRequestedEvent,
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
