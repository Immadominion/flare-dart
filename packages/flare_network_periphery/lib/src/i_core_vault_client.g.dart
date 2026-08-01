// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultClient
// Functions: 2 readable of 8 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ICoreVaultClient` contract.
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
