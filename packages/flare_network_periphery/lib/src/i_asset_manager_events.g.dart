// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAssetManagerEvents
// Functions: 0 readable of 0 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAssetManagerEvents` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAssetManagerEventsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAssetManagerEventsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAssetManagerEvents` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAssetManagerEventsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAssetManagerEventsContract(client: client, address: resolved);
  }

  /// `AgentAvailable(address,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `agentAvailableEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentAvailableEvent = AbiEvent(
    name: 'AgentAvailable',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'feeBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingVaultCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingPoolCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'freeCollateralLots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentCollateralTypeChanged(address,uint8,address)`
  ///
  /// Decode a matching log with
  /// `agentCollateralTypeChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentCollateralTypeChangedEvent = AbiEvent(
    name: 'AgentCollateralTypeChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'collateralClass',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'token',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `AgentDestroyAnnounced(address,uint256)`
  ///
  /// Decode a matching log with
  /// `agentDestroyAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentDestroyAnnouncedEvent = AbiEvent(
    name: 'AgentDestroyAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'destroyAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentDestroyed(address)`
  ///
  /// Decode a matching log with
  /// `agentDestroyedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentDestroyedEvent = AbiEvent(
    name: 'AgentDestroyed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `AgentSettingChangeAnnounced(address,string,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `agentSettingChangeAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentSettingChangeAnnouncedEvent = AbiEvent(
    name: 'AgentSettingChangeAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'validAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentSettingChanged(address,string,uint256)`
  ///
  /// Decode a matching log with
  /// `agentSettingChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentSettingChangedEvent = AbiEvent(
    name: 'AgentSettingChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentVaultCreated(address,address,(address,address,string,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256))`
  ///
  /// Decode a matching log with
  /// `agentVaultCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentVaultCreatedEvent = AbiEvent(
    name: 'AgentVaultCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'creationData',
        type: AbiType.parse(
          '(address,address,string,address,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256)',
        ),
        indexed: false,
      ),
    ],
  );

  /// `AvailableAgentExitAnnounced(address,uint256)`
  ///
  /// Decode a matching log with
  /// `availableAgentExitAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent availableAgentExitAnnouncedEvent = AbiEvent(
    name: 'AvailableAgentExitAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'exitAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AvailableAgentExited(address)`
  ///
  /// Decode a matching log with
  /// `availableAgentExitedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent availableAgentExitedEvent = AbiEvent(
    name: 'AvailableAgentExited',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `CollateralRatiosChanged(uint8,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralRatiosChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralRatiosChangedEvent = AbiEvent(
    name: 'CollateralRatiosChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'collateralClass',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'collateralToken',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'safetyMinCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralReservationDeleted(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservationDeletedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservationDeletedEvent = AbiEvent(
    name: 'CollateralReservationDeleted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'minter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'reservedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralReserved(address,address,uint256,uint256,uint256,uint256,uint256,uint256,string,bytes32,address,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservedEvent = AbiEvent(
    name: 'CollateralReserved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'minter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: true,
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
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFeeNatWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralTypeAdded(uint8,address,uint256,bool,string,string,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralTypeAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralTypeAddedEvent = AbiEvent(
    name: 'CollateralTypeAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'collateralClass',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'token',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'decimals',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'directPricePair',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'assetFtsoSymbol',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'tokenFtsoSymbol',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'safetyMinCollateralRatioBIPS',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ConfirmedClosedMintingPayment(address,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `confirmedClosedMintingPaymentEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent confirmedClosedMintingPaymentEvent = AbiEvent(
    name: 'ConfirmedClosedMintingPayment',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'depositedUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ContractChanged(string,address)`
  ///
  /// Decode a matching log with
  /// `contractChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent contractChangedEvent = AbiEvent(
    name: 'ContractChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `CurrentUnderlyingBlockUpdated(uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `currentUnderlyingBlockUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent currentUnderlyingBlockUpdatedEvent = AbiEvent(
    name: 'CurrentUnderlyingBlockUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'underlyingBlockNumber',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'underlyingBlockTimestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'updatedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DuplicatePaymentConfirmed(address,bytes32,bytes32)`
  ///
  /// Decode a matching log with
  /// `duplicatePaymentConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent duplicatePaymentConfirmedEvent = AbiEvent(
    name: 'DuplicatePaymentConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionHash1',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'transactionHash2',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `DustChanged(address,uint256)`
  ///
  /// Decode a matching log with
  /// `dustChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent dustChangedEvent = AbiEvent(
    name: 'DustChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'dustUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `EmergencyPauseCanceled()`
  ///
  /// Decode a matching log with
  /// `emergencyPauseCanceledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyPauseCanceledEvent = AbiEvent(
    name: 'EmergencyPauseCanceled',
    anonymous: false,
    parameters: [],
  );

  /// `EmergencyPauseTotalDurationReset()`
  ///
  /// Decode a matching log with
  /// `emergencyPauseTotalDurationResetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyPauseTotalDurationResetEvent = AbiEvent(
    name: 'EmergencyPauseTotalDurationReset',
    anonymous: false,
    parameters: [],
  );

  /// `EmergencyPauseTriggered(uint8,uint256,uint8,uint256)`
  ///
  /// Decode a matching log with
  /// `emergencyPauseTriggeredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent emergencyPauseTriggeredEvent = AbiEvent(
    name: 'EmergencyPauseTriggered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'externalLevel',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'externalPausedUntil',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'governanceLevel',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'governancePausedUntil',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `FullLiquidationStarted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `fullLiquidationStartedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fullLiquidationStartedEvent = AbiEvent(
    name: 'FullLiquidationStarted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `IllegalPaymentConfirmed(address,bytes32)`
  ///
  /// Decode a matching log with
  /// `illegalPaymentConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent illegalPaymentConfirmedEvent = AbiEvent(
    name: 'IllegalPaymentConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `LiquidationEnded(address)`
  ///
  /// Decode a matching log with
  /// `liquidationEndedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent liquidationEndedEvent = AbiEvent(
    name: 'LiquidationEnded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `LiquidationPerformed(address,address,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `liquidationPerformedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent liquidationPerformedEvent = AbiEvent(
    name: 'LiquidationPerformed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'liquidator',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paidVaultCollateralWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paidPoolCollateralWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `LiquidationStarted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `liquidationStartedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent liquidationStartedEvent = AbiEvent(
    name: 'LiquidationStarted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MintingExecuted(address,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `mintingExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent mintingExecutedEvent = AbiEvent(
    name: 'MintingExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'agentFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'poolFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MintingPaused(bool)`
  ///
  /// Decode a matching log with
  /// `mintingPausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent mintingPausedEvent = AbiEvent(
    name: 'MintingPaused',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'paused',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `MintingPaymentDefault(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `mintingPaymentDefaultEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent mintingPaymentDefaultEvent = AbiEvent(
    name: 'MintingPaymentDefault',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'minter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'reservedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PoolTokenRedemptionAnnounced(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `poolTokenRedemptionAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent poolTokenRedemptionAnnouncedEvent = AbiEvent(
    name: 'PoolTokenRedemptionAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'withdrawalAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedeemedInCollateral(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemedInCollateralEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemedInCollateralEvent = AbiEvent(
    name: 'RedeemedInCollateral',
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
        name: 'redemptionAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'paidVaultCollateralWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionDefault(address,address,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionDefaultEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionDefaultEvent = AbiEvent(
    name: 'RedemptionDefault',
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
        name: 'redemptionAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemedVaultCollateralWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redeemedPoolCollateralWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPaymentBlocked(address,address,uint256,bytes32,uint256,int256)`
  ///
  /// Decode a matching log with
  /// `redemptionPaymentBlockedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPaymentBlockedEvent = AbiEvent(
    name: 'RedemptionPaymentBlocked',
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
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redemptionAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'spentUnderlyingUBA',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPaymentFailed(address,address,uint256,bytes32,int256,string)`
  ///
  /// Decode a matching log with
  /// `redemptionPaymentFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPaymentFailedEvent = AbiEvent(
    name: 'RedemptionPaymentFailed',
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
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'spentUnderlyingUBA',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'failureReason',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPerformed(address,address,uint256,bytes32,uint256,int256)`
  ///
  /// Decode a matching log with
  /// `redemptionPerformedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPerformedEvent = AbiEvent(
    name: 'RedemptionPerformed',
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
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'redemptionAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'spentUnderlyingUBA',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionPoolFeeMinted(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionPoolFeeMintedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionPoolFeeMintedEvent = AbiEvent(
    name: 'RedemptionPoolFeeMinted',
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
        name: 'poolFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionRejected(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionRejectedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionRejectedEvent = AbiEvent(
    name: 'RedemptionRejected',
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
        name: 'redemptionAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionRequestIncomplete(address,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionRequestIncompleteEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionRequestIncompleteEvent = AbiEvent(
    name: 'RedemptionRequestIncomplete',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'redeemer',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'remainingLots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionRequested(address,address,uint256,string,uint256,uint256,uint256,uint256,uint256,bytes32,address,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionRequestedEvent = AbiEvent(
    name: 'RedemptionRequested',
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
    ],
  );

  /// `RedemptionTicketCreated(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionTicketCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionTicketCreatedEvent = AbiEvent(
    name: 'RedemptionTicketCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'redemptionTicketId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'ticketValueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionTicketDeleted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionTicketDeletedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionTicketDeletedEvent = AbiEvent(
    name: 'RedemptionTicketDeleted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'redemptionTicketId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `RedemptionTicketUpdated(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionTicketUpdatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionTicketUpdatedEvent = AbiEvent(
    name: 'RedemptionTicketUpdated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'redemptionTicketId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'ticketValueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RedemptionTicketsConsolidated(uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redemptionTicketsConsolidatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redemptionTicketsConsolidatedEvent = AbiEvent(
    name: 'RedemptionTicketsConsolidated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'firstTicketId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'nextTicketId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SelfClose(address,uint256)`
  ///
  /// Decode a matching log with
  /// `selfCloseEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent selfCloseEvent = AbiEvent(
    name: 'SelfClose',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'valueUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SelfMint(address,bool,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `selfMintEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent selfMintEvent = AbiEvent(
    name: 'SelfMint',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'mintFromFreeUnderlying',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'depositedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'poolFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SettingArrayChanged(string,uint256[])`
  ///
  /// Decode a matching log with
  /// `settingArrayChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent settingArrayChangedEvent = AbiEvent(
    name: 'SettingArrayChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
    ],
  );

  /// `SettingChanged(string,uint256)`
  ///
  /// Decode a matching log with
  /// `settingChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent settingChangedEvent = AbiEvent(
    name: 'SettingChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'name',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `SystemRedemptionFeePaid(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `systemRedemptionFeePaidEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent systemRedemptionFeePaidEvent = AbiEvent(
    name: 'SystemRedemptionFeePaid',
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
        name: 'feeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UnderlyingBalanceChanged(address,int256)`
  ///
  /// Decode a matching log with
  /// `underlyingBalanceChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingBalanceChangedEvent = AbiEvent(
    name: 'UnderlyingBalanceChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'underlyingBalanceUBA',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
    ],
  );

  /// `UnderlyingBalanceTooLow(address,int256,uint256)`
  ///
  /// Decode a matching log with
  /// `underlyingBalanceTooLowEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingBalanceTooLowEvent = AbiEvent(
    name: 'UnderlyingBalanceTooLow',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'balance',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'requiredBalance',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UnderlyingBalanceToppedUp(address,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `underlyingBalanceToppedUpEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingBalanceToppedUpEvent = AbiEvent(
    name: 'UnderlyingBalanceToppedUp',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'depositedUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `UnderlyingWithdrawalAnnounced(address,uint256,bytes32)`
  ///
  /// Decode a matching log with
  /// `underlyingWithdrawalAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingWithdrawalAnnouncedEvent = AbiEvent(
    name: 'UnderlyingWithdrawalAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'announcementId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `UnderlyingWithdrawalCancelled(address,uint256)`
  ///
  /// Decode a matching log with
  /// `underlyingWithdrawalCancelledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingWithdrawalCancelledEvent = AbiEvent(
    name: 'UnderlyingWithdrawalCancelled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'announcementId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `UnderlyingWithdrawalConfirmed(address,uint256,int256,bytes32)`
  ///
  /// Decode a matching log with
  /// `underlyingWithdrawalConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent underlyingWithdrawalConfirmedEvent = AbiEvent(
    name: 'UnderlyingWithdrawalConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'announcementId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'spentUBA',
        type: AbiType.parse('int256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'transactionHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `VaultCollateralWithdrawalAnnounced(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `vaultCollateralWithdrawalAnnouncedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent vaultCollateralWithdrawalAnnouncedEvent = AbiEvent(
    name: 'VaultCollateralWithdrawalAnnounced',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'withdrawalAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    agentAvailableEvent,
    agentCollateralTypeChangedEvent,
    agentDestroyAnnouncedEvent,
    agentDestroyedEvent,
    agentSettingChangeAnnouncedEvent,
    agentSettingChangedEvent,
    agentVaultCreatedEvent,
    availableAgentExitAnnouncedEvent,
    availableAgentExitedEvent,
    collateralRatiosChangedEvent,
    collateralReservationDeletedEvent,
    collateralReservedEvent,
    collateralTypeAddedEvent,
    confirmedClosedMintingPaymentEvent,
    contractChangedEvent,
    currentUnderlyingBlockUpdatedEvent,
    duplicatePaymentConfirmedEvent,
    dustChangedEvent,
    emergencyPauseCanceledEvent,
    emergencyPauseTotalDurationResetEvent,
    emergencyPauseTriggeredEvent,
    fullLiquidationStartedEvent,
    illegalPaymentConfirmedEvent,
    liquidationEndedEvent,
    liquidationPerformedEvent,
    liquidationStartedEvent,
    mintingExecutedEvent,
    mintingPausedEvent,
    mintingPaymentDefaultEvent,
    poolTokenRedemptionAnnouncedEvent,
    redeemedInCollateralEvent,
    redemptionDefaultEvent,
    redemptionPaymentBlockedEvent,
    redemptionPaymentFailedEvent,
    redemptionPerformedEvent,
    redemptionPoolFeeMintedEvent,
    redemptionRejectedEvent,
    redemptionRequestIncompleteEvent,
    redemptionRequestedEvent,
    redemptionTicketCreatedEvent,
    redemptionTicketDeletedEvent,
    redemptionTicketUpdatedEvent,
    redemptionTicketsConsolidatedEvent,
    selfCloseEvent,
    selfMintEvent,
    settingArrayChangedEvent,
    settingChangedEvent,
    systemRedemptionFeePaidEvent,
    underlyingBalanceChangedEvent,
    underlyingBalanceTooLowEvent,
    underlyingBalanceToppedUpEvent,
    underlyingWithdrawalAnnouncedEvent,
    underlyingWithdrawalCancelledEvent,
    underlyingWithdrawalConfirmedEvent,
    vaultCollateralWithdrawalAnnouncedEvent,
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
