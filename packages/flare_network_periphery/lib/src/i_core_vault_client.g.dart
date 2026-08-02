// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultClient
// Functions: 8 — 2 readable via eth_call, 6 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ICoreVaultClient` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICoreVaultClientContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICoreVaultClientContract({required this.client, required this.address});

  /// Resolves `ICoreVaultClient` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ICoreVaultClientContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICoreVaultClientContract(client: client, address: resolved);
  }

  /// ABI descriptor for `cancelReturnFromCoreVault(address)`.
  static final AbiFunction cancelReturnFromCoreVaultFn = AbiFunction(
    name: 'cancelReturnFromCoreVault',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `confirmCoreVaultDonation((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`.
  static final AbiFunction confirmCoreVaultDonationFn = AbiFunction(
    name: 'confirmCoreVaultDonation',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))',
        ),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `confirmReturnFromCoreVault((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`.
  static final AbiFunction confirmReturnFromCoreVaultFn = AbiFunction(
    name: 'confirmReturnFromCoreVault',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `coreVaultAvailableAmount()`.
  static final AbiFunction coreVaultAvailableAmountFn = AbiFunction(
    name: 'coreVaultAvailableAmount',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_immediatelyAvailableUBA',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_totalAvailableUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `maximumTransferToCoreVault(address)`.
  static final AbiFunction maximumTransferToCoreVaultFn = AbiFunction(
    name: 'maximumTransferToCoreVault',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_maximumTransferUBA', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_minimumLeftAmountUBA',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redeemFromCoreVault(uint256,string)`.
  static final AbiFunction redeemFromCoreVaultFn = AbiFunction(
    name: 'redeemFromCoreVault',
    inputs: [
      AbiParameter(name: '_lots', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_redeemerUnderlyingAddress',
        type: AbiType.parse('string'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `requestReturnFromCoreVault(address,uint256)`.
  static final AbiFunction requestReturnFromCoreVaultFn = AbiFunction(
    name: 'requestReturnFromCoreVault',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_lots', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `transferToCoreVault(address,uint256)`.
  static final AbiFunction transferToCoreVaultFn = AbiFunction(
    name: 'transferToCoreVault',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `coreVaultAvailableAmount()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt immediatelyAvailableUBA, BigInt totalAvailableUBA})>
  coreVaultAvailableAmount() async {
    final out = await client.callFunction(
      contract: address,
      function: coreVaultAvailableAmountFn,
    );
    return (
      immediatelyAvailableUBA: out[0]! as BigInt,
      totalAvailableUBA: out[1]! as BigInt,
    );
  }

  /// Calls `maximumTransferToCoreVault(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt maximumTransferUBA, BigInt minimumLeftAmountUBA})>
  maximumTransferToCoreVault(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: maximumTransferToCoreVaultFn,
      args: [agentVault],
    );
    return (
      maximumTransferUBA: out[0]! as BigInt,
      minimumLeftAmountUBA: out[1]! as BigInt,
    );
  }

  /// Builds an unsigned `cancelReturnFromCoreVault(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest cancelReturnFromCoreVaultTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: cancelReturnFromCoreVaultFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `confirmCoreVaultDonation((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmCoreVaultDonationTx(
    List<Object?> payment, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmCoreVaultDonationFn,
    args: [payment],
    from: from,
  );

  /// Builds an unsigned `confirmReturnFromCoreVault((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmReturnFromCoreVaultTx(
    List<Object?> payment,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmReturnFromCoreVaultFn,
    args: [payment, agentVault],
    from: from,
  );

  /// Builds an unsigned `redeemFromCoreVault(uint256,string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest redeemFromCoreVaultTx(
    BigInt lots,
    String redeemerUnderlyingAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: redeemFromCoreVaultFn,
    args: [lots, redeemerUnderlyingAddress],
    from: from,
  );

  /// Builds an unsigned `requestReturnFromCoreVault(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest requestReturnFromCoreVaultTx(
    EthAddress agentVault,
    BigInt lots, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: requestReturnFromCoreVaultFn,
    args: [agentVault, lots],
    from: from,
  );

  /// Builds an unsigned `transferToCoreVault(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferToCoreVaultTx(
    EthAddress agentVault,
    BigInt amountUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferToCoreVaultFn,
    args: [agentVault, amountUBA],
    from: from,
  );

  /// `CoreVaultFundsAdded(uint256)`
  ///
  /// Decode a matching log with
  /// `coreVaultFundsAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent coreVaultFundsAddedEvent = AbiEvent(
    name: 'CoreVaultFundsAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'amountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CoreVaultRedemptionRequested(address,string,bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `coreVaultRedemptionRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent coreVaultRedemptionRequestedEvent = AbiEvent(
    name: 'CoreVaultRedemptionRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redeemer',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
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
    ],
  );

  /// `ReturnFromCoreVaultCancelled(address,uint256)`
  ///
  /// Decode a matching log with
  /// `returnFromCoreVaultCancelledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent returnFromCoreVaultCancelledEvent = AbiEvent(
    name: 'ReturnFromCoreVaultCancelled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'requestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `ReturnFromCoreVaultConfirmed(address,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `returnFromCoreVaultConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent returnFromCoreVaultConfirmedEvent = AbiEvent(
    name: 'ReturnFromCoreVaultConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'requestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'receivedUnderlyingUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'remintedUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ReturnFromCoreVaultRequested(address,uint256,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `returnFromCoreVaultRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent returnFromCoreVaultRequestedEvent = AbiEvent(
    name: 'ReturnFromCoreVaultRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'requestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TransferToCoreVaultDefaulted(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `transferToCoreVaultDefaultedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferToCoreVaultDefaultedEvent = AbiEvent(
    name: 'TransferToCoreVaultDefaulted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transferRedemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'remintedUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TransferToCoreVaultStarted(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `transferToCoreVaultStartedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferToCoreVaultStartedEvent = AbiEvent(
    name: 'TransferToCoreVaultStarted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transferRedemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TransferToCoreVaultSuccessful(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `transferToCoreVaultSuccessfulEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferToCoreVaultSuccessfulEvent = AbiEvent(
    name: 'TransferToCoreVaultSuccessful',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transferRedemptionRequestId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    coreVaultFundsAddedEvent,
    coreVaultRedemptionRequestedEvent,
    returnFromCoreVaultCancelledEvent,
    returnFromCoreVaultConfirmedEvent,
    returnFromCoreVaultRequestedEvent,
    transferToCoreVaultDefaultedEvent,
    transferToCoreVaultStartedEvent,
    transferToCoreVaultSuccessfulEvent,
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
