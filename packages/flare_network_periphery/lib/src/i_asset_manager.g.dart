// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAssetManager
// Functions: 147 — 76 readable via eth_call, 75 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAssetManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAssetManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAssetManagerContract({required this.client, required this.address});

  /// Resolves `IAssetManager` through the [ContractRegistry].
  ///
  /// Registered as `AssetManagerFXRP`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IAssetManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'AssetManagerFXRP',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAssetManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `addAlwaysAllowedMinterForAgent(address,address)`.
  static final AbiFunction addAlwaysAllowedMinterForAgentFn = AbiFunction(
    name: 'addAlwaysAllowedMinterForAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_minter', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `agentPing(address,uint256)`.
  static final AbiFunction agentPingFn = AbiFunction(
    name: 'agentPing',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_query', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `agentPingResponse(address,uint256,string)`.
  static final AbiFunction agentPingResponseFn = AbiFunction(
    name: 'agentPingResponse',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_query', type: AbiType.parse('uint256')),
      AbiParameter(name: '_response', type: AbiType.parse('string')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `agentRedemptionQueue(address,uint256,uint256)`.
  static final AbiFunction agentRedemptionQueueFn = AbiFunction(
    name: 'agentRedemptionQueue',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(
        name: '_firstRedemptionTicketId',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_pageSize', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_queue',
        type: AbiType.parse('(uint256,address,uint256)[]'),
      ),
      AbiParameter(
        name: '_nextRedemptionTicketId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `alwaysAllowedMintersForAgent(address)`.
  static final AbiFunction alwaysAllowedMintersForAgentFn = AbiFunction(
    name: 'alwaysAllowedMintersForAgent',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `announceAgentPoolTokenRedemption(address,uint256)`.
  static final AbiFunction announceAgentPoolTokenRedemptionFn = AbiFunction(
    name: 'announceAgentPoolTokenRedemption',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_valuePoolTokenWei', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_redemptionAllowedAt',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `announceAgentSettingUpdate(address,string,uint256)`.
  static final AbiFunction announceAgentSettingUpdateFn = AbiFunction(
    name: 'announceAgentSettingUpdate',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_name', type: AbiType.parse('string')),
      AbiParameter(name: '_value', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_updateAllowedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `announceDestroyAgent(address)`.
  static final AbiFunction announceDestroyAgentFn = AbiFunction(
    name: 'announceDestroyAgent',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_destroyAllowedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `announceExitAvailableAgentList(address)`.
  static final AbiFunction announceExitAvailableAgentListFn = AbiFunction(
    name: 'announceExitAvailableAgentList',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_exitAllowedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `announceUnderlyingWithdrawal(address)`.
  static final AbiFunction announceUnderlyingWithdrawalFn = AbiFunction(
    name: 'announceUnderlyingWithdrawal',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `announceVaultCollateralWithdrawal(address,uint256)`.
  static final AbiFunction announceVaultCollateralWithdrawalFn = AbiFunction(
    name: 'announceVaultCollateralWithdrawal',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_valueNATWei', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_withdrawalAllowedAt',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `assetManagerController()`.
  static final AbiFunction assetManagerControllerFn = AbiFunction(
    name: 'assetManagerController',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetMintingDecimals()`.
  static final AbiFunction assetMintingDecimalsFn = AbiFunction(
    name: 'assetMintingDecimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `assetMintingGranularityUBA()`.
  static final AbiFunction assetMintingGranularityUBAFn = AbiFunction(
    name: 'assetMintingGranularityUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `cancelReturnFromCoreVault(address)`.
  static final AbiFunction cancelReturnFromCoreVaultFn = AbiFunction(
    name: 'cancelReturnFromCoreVault',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `cancelUnderlyingWithdrawal(address)`.
  static final AbiFunction cancelUnderlyingWithdrawalFn = AbiFunction(
    name: 'cancelUnderlyingWithdrawal',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `collateralReservationFee(uint256)`.
  static final AbiFunction collateralReservationFeeFn = AbiFunction(
    name: 'collateralReservationFee',
    inputs: [AbiParameter(name: '_lots', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(
        name: '_reservationFeeNATWei',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `collateralReservationInfo(uint256)`.
  static final AbiFunction collateralReservationInfoFn = AbiFunction(
    name: 'collateralReservationInfo',
    inputs: [
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint64,address,address,string,bytes32,uint256,uint128,uint128,uint16,uint64,uint64,uint64,address,uint256,uint8)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `confirmClosedMintingPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`.
  static final AbiFunction confirmClosedMintingPaymentFn = AbiFunction(
    name: 'confirmClosedMintingPayment',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
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

  /// ABI descriptor for `confirmRedemptionPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`.
  static final AbiFunction confirmRedemptionPaymentFn = AbiFunction(
    name: 'confirmRedemptionPayment',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
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

  /// ABI descriptor for `confirmTopupPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`.
  static final AbiFunction confirmTopupPaymentFn = AbiFunction(
    name: 'confirmTopupPayment',
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

  /// ABI descriptor for `confirmUnderlyingWithdrawal((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`.
  static final AbiFunction confirmUnderlyingWithdrawalFn = AbiFunction(
    name: 'confirmUnderlyingWithdrawal',
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

  /// ABI descriptor for `consolidateSmallTickets(uint256)`.
  static final AbiFunction consolidateSmallTicketsFn = AbiFunction(
    name: 'consolidateSmallTickets',
    inputs: [
      AbiParameter(name: '_firstTicketId', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `controllerAttached()`.
  static final AbiFunction controllerAttachedFn = AbiFunction(
    name: 'controllerAttached',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `convertDustToTicket(address)`.
  static final AbiFunction convertDustToTicketFn = AbiFunction(
    name: 'convertDustToTicket',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
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

  /// ABI descriptor for `createAgentVault((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))),(address,string,uint256,uint256,uint256,uint256,uint256,uint256,uint256))`.
  static final AbiFunction createAgentVaultFn = AbiFunction(
    name: 'createAgentVault',
    inputs: [
      AbiParameter(
        name: '_addressProof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32)))',
        ),
      ),
      AbiParameter(
        name: '_settings',
        type: AbiType.parse(
          '(address,string,uint256,uint256,uint256,uint256,uint256,uint256,uint256)',
        ),
      ),
    ],
    outputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `currentUnderlyingBlock()`.
  static final AbiFunction currentUnderlyingBlockFn = AbiFunction(
    name: 'currentUnderlyingBlock',
    inputs: [],
    outputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_blockTimestamp', type: AbiType.parse('uint256')),
      AbiParameter(name: '_lastUpdateTs', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `destroyAgent(address,address)`.
  static final AbiFunction destroyAgentFn = AbiFunction(
    name: 'destroyAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_recipient', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `directMintingDelayState(bytes32)`.
  static final AbiFunction directMintingDelayStateFn = AbiFunction(
    name: 'directMintingDelayState',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [
      AbiParameter(name: '_delayState', type: AbiType.parse('uint8')),
      AbiParameter(name: '_allowedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: '_startedAt', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `directMintingPaymentAddress()`.
  static final AbiFunction directMintingPaymentAddressFn = AbiFunction(
    name: 'directMintingPaymentAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `doublePaymentChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),address)`.
  static final AbiFunction doublePaymentChallengeFn = AbiFunction(
    name: 'doublePaymentChallenge',
    inputs: [
      AbiParameter(
        name: '_payment1',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))',
        ),
      ),
      AbiParameter(
        name: '_payment2',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))',
        ),
      ),
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `emergencyPauseLevel()`.
  static final AbiFunction emergencyPauseLevelFn = AbiFunction(
    name: 'emergencyPauseLevel',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `emergencyPaused()`.
  static final AbiFunction emergencyPausedFn = AbiFunction(
    name: 'emergencyPaused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `emergencyPausedUntil()`.
  static final AbiFunction emergencyPausedUntilFn = AbiFunction(
    name: 'emergencyPausedUntil',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `endLiquidation(address)`.
  static final AbiFunction endLiquidationFn = AbiFunction(
    name: 'endLiquidation',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `executeAgentSettingUpdate(address,string)`.
  static final AbiFunction executeAgentSettingUpdateFn = AbiFunction(
    name: 'executeAgentSettingUpdate',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_name', type: AbiType.parse('string')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `executeDirectMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`.
  static final AbiFunction executeDirectMintingFn = AbiFunction(
    name: 'executeDirectMinting',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))',
        ),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `executeDirectMintingWithData((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))),bytes)`.
  static final AbiFunction executeDirectMintingWithDataFn = AbiFunction(
    name: 'executeDirectMintingWithData',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8)))',
        ),
      ),
      AbiParameter(name: '_data', type: AbiType.parse('bytes')),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `executeMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`.
  static final AbiFunction executeMintingFn = AbiFunction(
    name: 'executeMinting',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `exitAvailableAgentList(address)`.
  static final AbiFunction exitAvailableAgentListFn = AbiFunction(
    name: 'exitAvailableAgentList',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `fAsset()`.
  static final AbiFunction fAssetFn = AbiFunction(
    name: 'fAsset',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facetAddress(bytes4)`.
  static final AbiFunction facetAddressFn = AbiFunction(
    name: 'facetAddress',
    inputs: [
      AbiParameter(name: '_functionSelector', type: AbiType.parse('bytes4')),
    ],
    outputs: [
      AbiParameter(name: 'facetAddress_', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facetAddresses()`.
  static final AbiFunction facetAddressesFn = AbiFunction(
    name: 'facetAddresses',
    inputs: [],
    outputs: [
      AbiParameter(name: 'facetAddresses_', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facetFunctionSelectors(address)`.
  static final AbiFunction facetFunctionSelectorsFn = AbiFunction(
    name: 'facetFunctionSelectors',
    inputs: [AbiParameter(name: '_facet', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: 'facetFunctionSelectors_',
        type: AbiType.parse('bytes4[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `facets()`.
  static final AbiFunction facetsFn = AbiFunction(
    name: 'facets',
    inputs: [],
    outputs: [
      AbiParameter(
        name: 'facets_',
        type: AbiType.parse('(address,bytes4[])[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `finishRedemptionWithoutPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))),uint256)`.
  static final AbiFunction finishRedemptionWithoutPaymentFn = AbiFunction(
    name: 'finishRedemptionWithoutPayment',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64)))',
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

  /// ABI descriptor for `freeBalanceNegativeChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))[],address)`.
  static final AbiFunction freeBalanceNegativeChallengeFn = AbiFunction(
    name: 'freeBalanceNegativeChallenge',
    inputs: [
      AbiParameter(
        name: '_payments',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))[]',
        ),
      ),
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getAgentFullPoolCollateral(address)`.
  static final AbiFunction getAgentFullPoolCollateralFn = AbiFunction(
    name: 'getAgentFullPoolCollateral',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentFullVaultCollateral(address)`.
  static final AbiFunction getAgentFullVaultCollateralFn = AbiFunction(
    name: 'getAgentFullVaultCollateral',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentInfo(address)`.
  static final AbiFunction getAgentInfoFn = AbiFunction(
    name: 'getAgentInfo',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint8,address,address,address,address,string,bool,uint256,uint256,address,uint256,uint256,uint256,uint256,uint256,uint256,address,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,uint256,int256,uint256,int256,uint256,uint256,uint256,uint256)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentLiquidationFactorsAndMaxAmount(address)`.
  static final AbiFunction getAgentLiquidationFactorsAndMaxAmountFn =
      AbiFunction(
        name: 'getAgentLiquidationFactorsAndMaxAmount',
        inputs: [
          AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
        ],
        outputs: [
          AbiParameter(
            name: 'liquidationPaymentFactorVaultBIPS',
            type: AbiType.parse('uint256'),
          ),
          AbiParameter(
            name: 'liquidationPaymentFactorPoolBIPS',
            type: AbiType.parse('uint256'),
          ),
          AbiParameter(
            name: 'maxLiquidationAmountUBA',
            type: AbiType.parse('uint256'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getAgentMinPoolCollateralRatioBIPS(address)`.
  static final AbiFunction getAgentMinPoolCollateralRatioBIPSFn = AbiFunction(
    name: 'getAgentMinPoolCollateralRatioBIPS',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentMinVaultCollateralRatioBIPS(address)`.
  static final AbiFunction getAgentMinVaultCollateralRatioBIPSFn = AbiFunction(
    name: 'getAgentMinVaultCollateralRatioBIPS',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentSetting(address,string)`.
  static final AbiFunction getAgentSettingFn = AbiFunction(
    name: 'getAgentSetting',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_name', type: AbiType.parse('string')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentVaultCollateralToken(address)`.
  static final AbiFunction getAgentVaultCollateralTokenFn = AbiFunction(
    name: 'getAgentVaultCollateralToken',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAgentVaultOwner(address)`.
  static final AbiFunction getAgentVaultOwnerFn = AbiFunction(
    name: 'getAgentVaultOwner',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_ownerManagementAddress',
        type: AbiType.parse('address'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAllAgents(uint256,uint256)`.
  static final AbiFunction getAllAgentsFn = AbiFunction(
    name: 'getAllAgents',
    inputs: [
      AbiParameter(name: '_start', type: AbiType.parse('uint256')),
      AbiParameter(name: '_end', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_agents', type: AbiType.parse('address[]')),
      AbiParameter(name: '_totalLength', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAvailableAgentsDetailedList(uint256,uint256)`.
  static final AbiFunction getAvailableAgentsDetailedListFn = AbiFunction(
    name: 'getAvailableAgentsDetailedList',
    inputs: [
      AbiParameter(name: '_start', type: AbiType.parse('uint256')),
      AbiParameter(name: '_end', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_agents',
        type: AbiType.parse(
          '(address,address,uint256,uint256,uint256,uint256,uint8)[]',
        ),
      ),
      AbiParameter(name: '_totalLength', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getAvailableAgentsList(uint256,uint256)`.
  static final AbiFunction getAvailableAgentsListFn = AbiFunction(
    name: 'getAvailableAgentsList',
    inputs: [
      AbiParameter(name: '_start', type: AbiType.parse('uint256')),
      AbiParameter(name: '_end', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_agents', type: AbiType.parse('address[]')),
      AbiParameter(name: '_totalLength', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCollateralPool(address)`.
  static final AbiFunction getCollateralPoolFn = AbiFunction(
    name: 'getCollateralPool',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCollateralType(uint8,address)`.
  static final AbiFunction getCollateralTypeFn = AbiFunction(
    name: 'getCollateralType',
    inputs: [
      AbiParameter(name: '_collateralClass', type: AbiType.parse('uint8')),
      AbiParameter(name: '_token', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint8,address,uint256,uint256,bool,string,string,uint256,uint256)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCollateralTypes()`.
  static final AbiFunction getCollateralTypesFn = AbiFunction(
    name: 'getCollateralTypes',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(uint8,address,uint256,uint256,bool,string,string,uint256,uint256)[]',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultDonationTag()`.
  static final AbiFunction getCoreVaultDonationTagFn = AbiFunction(
    name: 'getCoreVaultDonationTag',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultManager()`.
  static final AbiFunction getCoreVaultManagerFn = AbiFunction(
    name: 'getCoreVaultManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumAmountLeftBIPS()`.
  static final AbiFunction getCoreVaultMinimumAmountLeftBIPSFn = AbiFunction(
    name: 'getCoreVaultMinimumAmountLeftBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumRedeemLots()`.
  static final AbiFunction getCoreVaultMinimumRedeemLotsFn = AbiFunction(
    name: 'getCoreVaultMinimumRedeemLots',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultNativeAddress()`.
  static final AbiFunction getCoreVaultNativeAddressFn = AbiFunction(
    name: 'getCoreVaultNativeAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultRedemptionFeeBIPS()`.
  static final AbiFunction getCoreVaultRedemptionFeeBIPSFn = AbiFunction(
    name: 'getCoreVaultRedemptionFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultTransferDefaultPenaltyBIPS()`.
  static final AbiFunction getCoreVaultTransferDefaultPenaltyBIPSFn =
      AbiFunction(
        name: 'getCoreVaultTransferDefaultPenaltyBIPS',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getCoreVaultTransferTimeExtensionSeconds()`.
  static final AbiFunction getCoreVaultTransferTimeExtensionSecondsFn =
      AbiFunction(
        name: 'getCoreVaultTransferTimeExtensionSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingDailyLimitUBA()`.
  static final AbiFunction getDirectMintingDailyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingDailyLimitUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingDailyLimiterState()`.
  static final AbiFunction getDirectMintingDailyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingDailyLimiterState',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_windowStartTimestamp',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_mintedInCurrentWindow',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingExecutorFeeUBA()`.
  static final AbiFunction getDirectMintingExecutorFeeUBAFn = AbiFunction(
    name: 'getDirectMintingExecutorFeeUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeBIPS()`.
  static final AbiFunction getDirectMintingFeeBIPSFn = AbiFunction(
    name: 'getDirectMintingFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeReceiver()`.
  static final AbiFunction getDirectMintingFeeReceiverFn = AbiFunction(
    name: 'getDirectMintingFeeReceiver',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimitUBA()`.
  static final AbiFunction getDirectMintingHourlyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingHourlyLimitUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimiterState()`.
  static final AbiFunction getDirectMintingHourlyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingHourlyLimiterState',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_windowStartTimestamp',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_mintedInCurrentWindow',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingLargeMintingDelaySeconds()`.
  static final AbiFunction getDirectMintingLargeMintingDelaySecondsFn =
      AbiFunction(
        name: 'getDirectMintingLargeMintingDelaySeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingLargeMintingThresholdUBA()`.
  static final AbiFunction getDirectMintingLargeMintingThresholdUBAFn =
      AbiFunction(
        name: 'getDirectMintingLargeMintingThresholdUBA',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingMinimumFeeUBA()`.
  static final AbiFunction getDirectMintingMinimumFeeUBAFn = AbiFunction(
    name: 'getDirectMintingMinimumFeeUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingOthersCanExecuteAfterSeconds()`.
  static final AbiFunction getDirectMintingOthersCanExecuteAfterSecondsFn =
      AbiFunction(
        name: 'getDirectMintingOthersCanExecuteAfterSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingsUnblockUntilTimestamp()`.
  static final AbiFunction getDirectMintingsUnblockUntilTimestampFn =
      AbiFunction(
        name: 'getDirectMintingsUnblockUntilTimestamp',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getMintingTagManager()`.
  static final AbiFunction getMintingTagManagerFn = AbiFunction(
    name: 'getMintingTagManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSettings()`.
  static final AbiFunction getSettingsFn = AbiFunction(
    name: 'getSettings',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '',
        type: AbiType.parse(
          '(address,address,address,address,address,string,address,address,address,address,address,uint8,uint8,bytes32,uint32,uint32,uint16,uint64,uint64,uint64,uint16,bool,uint64,uint64,uint64,uint16,uint32,uint32,uint64,uint128,uint16,uint16,uint128,uint64,uint64,uint64,uint64,uint64,uint64,uint64,uint64,uint32,uint64,uint64,uint64,uint64,uint64,uint32,uint64,uint256[],uint256[],uint64,uint64,uint64,uint64,uint16,uint64,uint64,uint32,uint32)',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSmartAccountManager()`.
  static final AbiFunction getSmartAccountManagerFn = AbiFunction(
    name: 'getSmartAccountManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `illegalPaymentChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),address)`.
  static final AbiFunction illegalPaymentChallengeFn = AbiFunction(
    name: 'illegalPaymentChallenge',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))',
        ),
      ),
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `isPoolTokenSuffixReserved(string)`.
  static final AbiFunction isPoolTokenSuffixReservedFn = AbiFunction(
    name: 'isPoolTokenSuffixReserved',
    inputs: [AbiParameter(name: '_suffix', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `liquidate(address,uint256)`.
  static final AbiFunction liquidateFn = AbiFunction(
    name: 'liquidate',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_liquidatedAmountUBA',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_amountPaidVault', type: AbiType.parse('uint256')),
      AbiParameter(name: '_amountPaidPool', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `lotSize()`.
  static final AbiFunction lotSizeFn = AbiFunction(
    name: 'lotSize',
    inputs: [],
    outputs: [
      AbiParameter(name: '_lotSizeUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `makeAgentAvailable(address)`.
  static final AbiFunction makeAgentAvailableFn = AbiFunction(
    name: 'makeAgentAvailable',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `markUnblockedDirectMintingAllowed(bytes32)`.
  static final AbiFunction markUnblockedDirectMintingAllowedFn = AbiFunction(
    name: 'markUnblockedDirectMintingAllowed',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `minimumRedeemAmountUBA()`.
  static final AbiFunction minimumRedeemAmountUBAFn = AbiFunction(
    name: 'minimumRedeemAmountUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `mintFromFreeUnderlying(address,uint64)`.
  static final AbiFunction mintFromFreeUnderlyingFn = AbiFunction(
    name: 'mintFromFreeUnderlying',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_lots', type: AbiType.parse('uint64')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `mintingPaused()`.
  static final AbiFunction mintingPausedFn = AbiFunction(
    name: 'mintingPaused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `mintingPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))),uint256)`.
  static final AbiFunction mintingPaymentDefaultFn = AbiFunction(
    name: 'mintingPaymentDefault',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64)))',
        ),
      ),
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `priceReader()`.
  static final AbiFunction priceReaderFn = AbiFunction(
    name: 'priceReader',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redeem(uint256,string,address)`.
  static final AbiFunction redeemFn = AbiFunction(
    name: 'redeem',
    inputs: [
      AbiParameter(name: '_lots', type: AbiType.parse('uint256')),
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

  /// ABI descriptor for `redemptionPaymentExtensionSeconds()`.
  static final AbiFunction redemptionPaymentExtensionSecondsFn = AbiFunction(
    name: 'redemptionPaymentExtensionSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redemptionQueue(uint256,uint256)`.
  static final AbiFunction redemptionQueueFn = AbiFunction(
    name: 'redemptionQueue',
    inputs: [
      AbiParameter(
        name: '_firstRedemptionTicketId',
        type: AbiType.parse('uint256'),
      ),
      AbiParameter(name: '_pageSize', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_queue',
        type: AbiType.parse('(uint256,address,uint256)[]'),
      ),
      AbiParameter(
        name: '_nextRedemptionTicketId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `redemptionRequestInfo(uint256)`.
  static final AbiFunction redemptionRequestInfoFn = AbiFunction(
    name: 'redemptionRequestInfo',
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
          '(uint64,uint8,address,address,string,bytes32,uint128,uint128,uint16,uint64,uint64,uint64,uint64,bool,bool,address,uint256)',
        ),
      ),
    ],
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

  /// ABI descriptor for `rejectInvalidRedemption((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))),uint256)`.
  static final AbiFunction rejectInvalidRedemptionFn = AbiFunction(
    name: 'rejectInvalidRedemption',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32)))',
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

  /// ABI descriptor for `removeAlwaysAllowedMinterForAgent(address,address)`.
  static final AbiFunction removeAlwaysAllowedMinterForAgentFn = AbiFunction(
    name: 'removeAlwaysAllowedMinterForAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_minter', type: AbiType.parse('address')),
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

  /// ABI descriptor for `reserveCollateral(address,uint256,uint256,address)`.
  static final AbiFunction reserveCollateralFn = AbiFunction(
    name: 'reserveCollateral',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_lots', type: AbiType.parse('uint256')),
      AbiParameter(name: '_maxMintingFeeBIPS', type: AbiType.parse('uint256')),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `selfClose(address,uint256)`.
  static final AbiFunction selfCloseFn = AbiFunction(
    name: 'selfClose',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_amountUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_closedAmountUBA', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `selfMint((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address,uint256)`.
  static final AbiFunction selfMintFn = AbiFunction(
    name: 'selfMint',
    inputs: [
      AbiParameter(
        name: '_payment',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8)))',
        ),
      ),
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_lots', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultManager(address)`.
  static final AbiFunction setCoreVaultManagerFn = AbiFunction(
    name: 'setCoreVaultManager',
    inputs: [
      AbiParameter(name: '_coreVaultManager', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultMinimumAmountLeftBIPS(uint256)`.
  static final AbiFunction setCoreVaultMinimumAmountLeftBIPSFn = AbiFunction(
    name: 'setCoreVaultMinimumAmountLeftBIPS',
    inputs: [
      AbiParameter(
        name: '_minimumAmountLeftBIPS',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultMinimumRedeemLots(uint256)`.
  static final AbiFunction setCoreVaultMinimumRedeemLotsFn = AbiFunction(
    name: 'setCoreVaultMinimumRedeemLots',
    inputs: [
      AbiParameter(name: '_minimumRedeemLots', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultNativeAddress(address)`.
  static final AbiFunction setCoreVaultNativeAddressFn = AbiFunction(
    name: 'setCoreVaultNativeAddress',
    inputs: [
      AbiParameter(name: '_nativeAddress', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultRedemptionFeeBIPS(uint256)`.
  static final AbiFunction setCoreVaultRedemptionFeeBIPSFn = AbiFunction(
    name: 'setCoreVaultRedemptionFeeBIPS',
    inputs: [
      AbiParameter(name: '_redemptionFeeBIPS', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultTransferDefaultPenaltyBIPS(uint256)`.
  static final AbiFunction setCoreVaultTransferDefaultPenaltyBIPSFn =
      AbiFunction(
        name: 'setCoreVaultTransferDefaultPenaltyBIPS',
        inputs: [
          AbiParameter(
            name: '_transferDefaultPenaltyBIPS',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setCoreVaultTransferTimeExtensionSeconds(uint256)`.
  static final AbiFunction setCoreVaultTransferTimeExtensionSecondsFn =
      AbiFunction(
        name: 'setCoreVaultTransferTimeExtensionSeconds',
        inputs: [
          AbiParameter(
            name: '_transferTimeExtensionSeconds',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setDirectMintingDailyLimitUBA(uint256)`.
  static final AbiFunction setDirectMintingDailyLimitUBAFn = AbiFunction(
    name: 'setDirectMintingDailyLimitUBA',
    inputs: [
      AbiParameter(name: '_dailyLimitUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingExecutorFee(uint256)`.
  static final AbiFunction setDirectMintingExecutorFeeFn = AbiFunction(
    name: 'setDirectMintingExecutorFee',
    inputs: [
      AbiParameter(name: '_executorFeeUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingFee(uint256,uint256)`.
  static final AbiFunction setDirectMintingFeeFn = AbiFunction(
    name: 'setDirectMintingFee',
    inputs: [
      AbiParameter(name: '_mintingFeeBIPS', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_minimumMintingFeeUBA',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingFeeReceiver(address)`.
  static final AbiFunction setDirectMintingFeeReceiverFn = AbiFunction(
    name: 'setDirectMintingFeeReceiver',
    inputs: [
      AbiParameter(name: '_mintingFeeReceiver', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingHourlyLimitUBA(uint256)`.
  static final AbiFunction setDirectMintingHourlyLimitUBAFn = AbiFunction(
    name: 'setDirectMintingHourlyLimitUBA',
    inputs: [
      AbiParameter(name: '_hourlyLimitUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingLargeMintingThrottling(uint256,uint256)`.
  static final AbiFunction setDirectMintingLargeMintingThrottlingFn =
      AbiFunction(
        name: 'setDirectMintingLargeMintingThrottling',
        inputs: [
          AbiParameter(
            name: '_largeMintingThresholdUBA',
            type: AbiType.parse('uint256'),
          ),
          AbiParameter(
            name: '_largeMintingDelaySeconds',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setDirectMintingOthersCanExecuteAfterSeconds(uint256)`.
  static final AbiFunction setDirectMintingOthersCanExecuteAfterSecondsFn =
      AbiFunction(
        name: 'setDirectMintingOthersCanExecuteAfterSeconds',
        inputs: [
          AbiParameter(name: '_seconds', type: AbiType.parse('uint256')),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setMinimumRedeemAmountUBA(uint256)`.
  static final AbiFunction setMinimumRedeemAmountUBAFn = AbiFunction(
    name: 'setMinimumRedeemAmountUBA',
    inputs: [AbiParameter(name: '_valueUBA', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setMintingTagManager(address)`.
  static final AbiFunction setMintingTagManagerFn = AbiFunction(
    name: 'setMintingTagManager',
    inputs: [
      AbiParameter(name: '_mintingTagManager', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setRedemptionPaymentExtensionSeconds(uint256)`.
  static final AbiFunction setRedemptionPaymentExtensionSecondsFn = AbiFunction(
    name: 'setRedemptionPaymentExtensionSeconds',
    inputs: [AbiParameter(name: '_value', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSmartAccountManager(address)`.
  static final AbiFunction setSmartAccountManagerFn = AbiFunction(
    name: 'setSmartAccountManager',
    inputs: [
      AbiParameter(
        name: '_smartAccountManager',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSystemRedemptionFeeBIPS(uint256)`.
  static final AbiFunction setSystemRedemptionFeeBIPSFn = AbiFunction(
    name: 'setSystemRedemptionFeeBIPS',
    inputs: [AbiParameter(name: '_feeBIPS', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSystemRedemptionFeeReceiver(address)`.
  static final AbiFunction setSystemRedemptionFeeReceiverFn = AbiFunction(
    name: 'setSystemRedemptionFeeReceiver',
    inputs: [AbiParameter(name: '_receiver', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `startLiquidation(address)`.
  static final AbiFunction startLiquidationFn = AbiFunction(
    name: 'startLiquidation',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_liquidationStartTs', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `supportsInterface(bytes4)`.
  static final AbiFunction supportsInterfaceFn = AbiFunction(
    name: 'supportsInterface',
    inputs: [AbiParameter(name: 'interfaceId', type: AbiType.parse('bytes4'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `systemRedemptionFeeBIPS()`.
  static final AbiFunction systemRedemptionFeeBIPSFn = AbiFunction(
    name: 'systemRedemptionFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `systemRedemptionFeeReceiver()`.
  static final AbiFunction systemRedemptionFeeReceiverFn = AbiFunction(
    name: 'systemRedemptionFeeReceiver',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `unblockDirectMintingsUntil(uint256)`.
  static final AbiFunction unblockDirectMintingsUntilFn = AbiFunction(
    name: 'unblockDirectMintingsUntil',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unstickMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))),uint256)`.
  static final AbiFunction unstickMintingFn = AbiFunction(
    name: 'unstickMinting',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64)))',
        ),
      ),
      AbiParameter(
        name: '_collateralReservationId',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `updateCurrentBlock((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`.
  static final AbiFunction updateCurrentBlockFn = AbiFunction(
    name: 'updateCurrentBlock',
    inputs: [
      AbiParameter(
        name: '_proof',
        type: AbiType.parse(
          '(bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64)))',
        ),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `upgradeAgentVaultAndPool(address)`.
  static final AbiFunction upgradeAgentVaultAndPoolFn = AbiFunction(
    name: 'upgradeAgentVaultAndPool',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
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

  /// Calls `agentRedemptionQueue(address,uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<List<Object?>> queue, BigInt nextRedemptionTicketId})>
  agentRedemptionQueue(
    EthAddress agentVault,
    BigInt firstRedemptionTicketId,
    BigInt pageSize,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: agentRedemptionQueueFn,
      args: [agentVault, firstRedemptionTicketId, pageSize],
    );
    return (
      queue: (out[0]! as List).cast<List<Object?>>(),
      nextRedemptionTicketId: out[1]! as BigInt,
    );
  }

  /// Calls `alwaysAllowedMintersForAgent(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> alwaysAllowedMintersForAgent(
    EthAddress agentVault,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: alwaysAllowedMintersForAgentFn,
      args: [agentVault],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `assetManagerController()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> assetManagerController() async {
    final out = await client.callFunction(
      contract: address,
      function: assetManagerControllerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `assetMintingDecimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> assetMintingDecimals() async {
    final out = await client.callFunction(
      contract: address,
      function: assetMintingDecimalsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `assetMintingGranularityUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> assetMintingGranularityUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: assetMintingGranularityUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `collateralReservationFee(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> collateralReservationFee(BigInt lots) async {
    final out = await client.callFunction(
      contract: address,
      function: collateralReservationFeeFn,
      args: [lots],
    );
    return out[0]! as BigInt;
  }

  /// Calls `collateralReservationInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> collateralReservationInfo(
    BigInt collateralReservationId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: collateralReservationInfoFn,
      args: [collateralReservationId],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `controllerAttached()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> controllerAttached() async {
    final out = await client.callFunction(
      contract: address,
      function: controllerAttachedFn,
    );
    return out[0]! as bool;
  }

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

  /// Calls `currentUnderlyingBlock()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt blockNumber, BigInt blockTimestamp, BigInt lastUpdateTs})>
  currentUnderlyingBlock() async {
    final out = await client.callFunction(
      contract: address,
      function: currentUnderlyingBlockFn,
    );
    return (
      blockNumber: out[0]! as BigInt,
      blockTimestamp: out[1]! as BigInt,
      lastUpdateTs: out[2]! as BigInt,
    );
  }

  /// Calls `directMintingDelayState(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt delayState, BigInt allowedAt, BigInt startedAt})>
  directMintingDelayState(Uint8List transactionId) async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingDelayStateFn,
      args: [transactionId],
    );
    return (
      delayState: out[0]! as BigInt,
      allowedAt: out[1]! as BigInt,
      startedAt: out[2]! as BigInt,
    );
  }

  /// Calls `directMintingPaymentAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> directMintingPaymentAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: directMintingPaymentAddressFn,
    );
    return out[0]! as String;
  }

  /// Calls `emergencyPauseLevel()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> emergencyPauseLevel() async {
    final out = await client.callFunction(
      contract: address,
      function: emergencyPauseLevelFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `emergencyPaused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> emergencyPaused() async {
    final out = await client.callFunction(
      contract: address,
      function: emergencyPausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `emergencyPausedUntil()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> emergencyPausedUntil() async {
    final out = await client.callFunction(
      contract: address,
      function: emergencyPausedUntilFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `fAsset()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fAsset() async {
    final out = await client.callFunction(
      contract: address,
      function: fAssetFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `facetAddress(bytes4)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> facetAddress(Uint8List functionSelector) async {
    final out = await client.callFunction(
      contract: address,
      function: facetAddressFn,
      args: [functionSelector],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `facetAddresses()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> facetAddresses() async {
    final out = await client.callFunction(
      contract: address,
      function: facetAddressesFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `facetFunctionSelectors(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> facetFunctionSelectors(EthAddress facet) async {
    final out = await client.callFunction(
      contract: address,
      function: facetFunctionSelectorsFn,
      args: [facet],
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `facets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> facets() async {
    final out = await client.callFunction(
      contract: address,
      function: facetsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getAgentFullPoolCollateral(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getAgentFullPoolCollateral(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentFullPoolCollateralFn,
      args: [agentVault],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAgentFullVaultCollateral(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getAgentFullVaultCollateral(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentFullVaultCollateralFn,
      args: [agentVault],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAgentInfo(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getAgentInfo(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentInfoFn,
      args: [agentVault],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getAgentLiquidationFactorsAndMaxAmount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt liquidationPaymentFactorVaultBIPS,
      BigInt liquidationPaymentFactorPoolBIPS,
      BigInt maxLiquidationAmountUBA,
    })
  >
  getAgentLiquidationFactorsAndMaxAmount(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentLiquidationFactorsAndMaxAmountFn,
      args: [agentVault],
    );
    return (
      liquidationPaymentFactorVaultBIPS: out[0]! as BigInt,
      liquidationPaymentFactorPoolBIPS: out[1]! as BigInt,
      maxLiquidationAmountUBA: out[2]! as BigInt,
    );
  }

  /// Calls `getAgentMinPoolCollateralRatioBIPS(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getAgentMinPoolCollateralRatioBIPS(
    EthAddress agentVault,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentMinPoolCollateralRatioBIPSFn,
      args: [agentVault],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAgentMinVaultCollateralRatioBIPS(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getAgentMinVaultCollateralRatioBIPS(
    EthAddress agentVault,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentMinVaultCollateralRatioBIPSFn,
      args: [agentVault],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAgentSetting(address,string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getAgentSetting(EthAddress agentVault, String name) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentSettingFn,
      args: [agentVault, name],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getAgentVaultCollateralToken(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getAgentVaultCollateralToken(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentVaultCollateralTokenFn,
      args: [agentVault],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getAgentVaultOwner(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getAgentVaultOwner(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentVaultOwnerFn,
      args: [agentVault],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getAllAgents(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> agents, BigInt totalLength})> getAllAgents(
    BigInt start,
    BigInt end,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getAllAgentsFn,
      args: [start, end],
    );
    return (
      agents: (out[0]! as List).cast<EthAddress>(),
      totalLength: out[1]! as BigInt,
    );
  }

  /// Calls `getAvailableAgentsDetailedList(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<List<Object?>> agents, BigInt totalLength})>
  getAvailableAgentsDetailedList(BigInt start, BigInt end) async {
    final out = await client.callFunction(
      contract: address,
      function: getAvailableAgentsDetailedListFn,
      args: [start, end],
    );
    return (
      agents: (out[0]! as List).cast<List<Object?>>(),
      totalLength: out[1]! as BigInt,
    );
  }

  /// Calls `getAvailableAgentsList(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> agents, BigInt totalLength})>
  getAvailableAgentsList(BigInt start, BigInt end) async {
    final out = await client.callFunction(
      contract: address,
      function: getAvailableAgentsListFn,
      args: [start, end],
    );
    return (
      agents: (out[0]! as List).cast<EthAddress>(),
      totalLength: out[1]! as BigInt,
    );
  }

  /// Calls `getCollateralPool(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCollateralPool(EthAddress agentVault) async {
    final out = await client.callFunction(
      contract: address,
      function: getCollateralPoolFn,
      args: [agentVault],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCollateralType(uint8,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getCollateralType(
    BigInt collateralClass,
    EthAddress token,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getCollateralTypeFn,
      args: [collateralClass, token],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getCollateralTypes()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> getCollateralTypes() async {
    final out = await client.callFunction(
      contract: address,
      function: getCollateralTypesFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getCoreVaultDonationTag()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultDonationTag() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultDonationTagFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultMinimumAmountLeftBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumAmountLeftBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumAmountLeftBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultMinimumRedeemLots()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumRedeemLots() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumRedeemLotsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultNativeAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultNativeAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultNativeAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultRedemptionFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultRedemptionFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultRedemptionFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferDefaultPenaltyBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferDefaultPenaltyBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferDefaultPenaltyBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferTimeExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferTimeExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferTimeExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingDailyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingDailyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingDailyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})>
  getDirectMintingDailyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimiterStateFn,
    );
    return (
      windowStartTimestamp: out[0]! as BigInt,
      mintedInCurrentWindow: out[1]! as BigInt,
    );
  }

  /// Calls `getDirectMintingExecutorFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingExecutorFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingExecutorFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeReceiver()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDirectMintingFeeReceiver() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeReceiverFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDirectMintingHourlyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingHourlyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingHourlyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})>
  getDirectMintingHourlyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimiterStateFn,
    );
    return (
      windowStartTimestamp: out[0]! as BigInt,
      mintedInCurrentWindow: out[1]! as BigInt,
    );
  }

  /// Calls `getDirectMintingLargeMintingDelaySeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingDelaySeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingDelaySecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingLargeMintingThresholdUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingThresholdUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingThresholdUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingMinimumFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingMinimumFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingMinimumFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingOthersCanExecuteAfterSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingOthersCanExecuteAfterSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingOthersCanExecuteAfterSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingsUnblockUntilTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingsUnblockUntilTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingsUnblockUntilTimestampFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getMintingTagManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getMintingTagManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getMintingTagManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getSettings()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getSettings() async {
    final out = await client.callFunction(
      contract: address,
      function: getSettingsFn,
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getSmartAccountManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getSmartAccountManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getSmartAccountManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isPoolTokenSuffixReserved(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPoolTokenSuffixReserved(String suffix) async {
    final out = await client.callFunction(
      contract: address,
      function: isPoolTokenSuffixReservedFn,
      args: [suffix],
    );
    return out[0]! as bool;
  }

  /// Calls `lotSize()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> lotSize() async {
    final out = await client.callFunction(
      contract: address,
      function: lotSizeFn,
    );
    return out[0]! as BigInt;
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

  /// Calls `minimumRedeemAmountUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> minimumRedeemAmountUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: minimumRedeemAmountUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `mintingPaused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> mintingPaused() async {
    final out = await client.callFunction(
      contract: address,
      function: mintingPausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `priceReader()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> priceReader() async {
    final out = await client.callFunction(
      contract: address,
      function: priceReaderFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `redeem(uint256,string,address)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> redeem(
    BigInt lots,
    String redeemerUnderlyingAddressString,
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redeemFn,
      args: [lots, redeemerUnderlyingAddressString, executor],
    );
    return out[0]! as BigInt;
  }

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

  /// Calls `redemptionPaymentExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> redemptionPaymentExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionPaymentExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `redemptionQueue(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<List<Object?>> queue, BigInt nextRedemptionTicketId})>
  redemptionQueue(BigInt firstRedemptionTicketId, BigInt pageSize) async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionQueueFn,
      args: [firstRedemptionTicketId, pageSize],
    );
    return (
      queue: (out[0]! as List).cast<List<Object?>>(),
      nextRedemptionTicketId: out[1]! as BigInt,
    );
  }

  /// Calls `redemptionRequestInfo(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> redemptionRequestInfo(
    BigInt redemptionRequestId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: redemptionRequestInfoFn,
      args: [redemptionRequestId],
    );
    return (out[0]! as List).cast<Object?>();
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

  /// Calls `reserveCollateral(address,uint256,uint256,address)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> reserveCollateral(
    EthAddress agentVault,
    BigInt lots,
    BigInt maxMintingFeeBIPS,
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: reserveCollateralFn,
      args: [agentVault, lots, maxMintingFeeBIPS, executor],
    );
    return out[0]! as BigInt;
  }

  /// Calls `supportsInterface(bytes4)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> supportsInterface(Uint8List interfaceId) async {
    final out = await client.callFunction(
      contract: address,
      function: supportsInterfaceFn,
      args: [interfaceId],
    );
    return out[0]! as bool;
  }

  /// Calls `systemRedemptionFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> systemRedemptionFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: systemRedemptionFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `systemRedemptionFeeReceiver()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> systemRedemptionFeeReceiver() async {
    final out = await client.callFunction(
      contract: address,
      function: systemRedemptionFeeReceiverFn,
    );
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `addAlwaysAllowedMinterForAgent(address,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest addAlwaysAllowedMinterForAgentTx(
    EthAddress agentVault,
    EthAddress minter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: addAlwaysAllowedMinterForAgentFn,
    args: [agentVault, minter],
    from: from,
  );

  /// Builds an unsigned `agentPing(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest agentPingTx(
    EthAddress agentVault,
    BigInt query, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: agentPingFn,
    args: [agentVault, query],
    from: from,
  );

  /// Builds an unsigned `agentPingResponse(address,uint256,string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest agentPingResponseTx(
    EthAddress agentVault,
    BigInt query,
    String response, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: agentPingResponseFn,
    args: [agentVault, query, response],
    from: from,
  );

  /// Builds an unsigned `announceAgentPoolTokenRedemption(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceAgentPoolTokenRedemptionTx(
    EthAddress agentVault,
    BigInt valuePoolTokenWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceAgentPoolTokenRedemptionFn,
    args: [agentVault, valuePoolTokenWei],
    from: from,
  );

  /// Builds an unsigned `announceAgentSettingUpdate(address,string,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceAgentSettingUpdateTx(
    EthAddress agentVault,
    String name,
    BigInt value_, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceAgentSettingUpdateFn,
    args: [agentVault, name, value_],
    from: from,
  );

  /// Builds an unsigned `announceDestroyAgent(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceDestroyAgentTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceDestroyAgentFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `announceExitAvailableAgentList(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceExitAvailableAgentListTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceExitAvailableAgentListFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `announceUnderlyingWithdrawal(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceUnderlyingWithdrawalTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceUnderlyingWithdrawalFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `announceVaultCollateralWithdrawal(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest announceVaultCollateralWithdrawalTx(
    EthAddress agentVault,
    BigInt valueNATWei, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: announceVaultCollateralWithdrawalFn,
    args: [agentVault, valueNATWei],
    from: from,
  );

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

  /// Builds an unsigned `cancelUnderlyingWithdrawal(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest cancelUnderlyingWithdrawalTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: cancelUnderlyingWithdrawalFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `confirmClosedMintingPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmClosedMintingPaymentTx(
    List<Object?> payment,
    BigInt collateralReservationId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmClosedMintingPaymentFn,
    args: [payment, collateralReservationId],
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

  /// Builds an unsigned `confirmRedemptionPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmRedemptionPaymentTx(
    List<Object?> payment,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmRedemptionPaymentFn,
    args: [payment, redemptionRequestId],
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

  /// Builds an unsigned `confirmTopupPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmTopupPaymentTx(
    List<Object?> payment,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmTopupPaymentFn,
    args: [payment, agentVault],
    from: from,
  );

  /// Builds an unsigned `confirmUnderlyingWithdrawal((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmUnderlyingWithdrawalTx(
    List<Object?> payment,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmUnderlyingWithdrawalFn,
    args: [payment, agentVault],
    from: from,
  );

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

  /// Builds an unsigned `consolidateSmallTickets(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest consolidateSmallTicketsTx(
    BigInt firstTicketId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: consolidateSmallTicketsFn,
    args: [firstTicketId],
    from: from,
  );

  /// Builds an unsigned `convertDustToTicket(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest convertDustToTicketTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: convertDustToTicketFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `createAgentVault((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))),(address,string,uint256,uint256,uint256,uint256,uint256,uint256,uint256))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest createAgentVaultTx(
    List<Object?> addressProof,
    List<Object?> settings, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: createAgentVaultFn,
    args: [addressProof, settings],
    from: from,
  );

  /// Builds an unsigned `destroyAgent(address,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest destroyAgentTx(
    EthAddress agentVault,
    EthAddress recipient, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: destroyAgentFn,
    args: [agentVault, recipient],
    from: from,
  );

  /// Builds an unsigned `doublePaymentChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),(bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest doublePaymentChallengeTx(
    List<Object?> payment1,
    List<Object?> payment2,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: doublePaymentChallengeFn,
    args: [payment1, payment2, agentVault],
    from: from,
  );

  /// Builds an unsigned `endLiquidation(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest endLiquidationTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: endLiquidationFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `executeAgentSettingUpdate(address,string)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest executeAgentSettingUpdateTx(
    EthAddress agentVault,
    String name, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeAgentSettingUpdateFn,
    args: [agentVault, name],
    from: from,
  );

  /// Builds an unsigned `executeDirectMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))))`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest executeDirectMintingTx(
    List<Object?> payment, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeDirectMintingFn,
    args: [payment],
    from: from,
    value: value,
  );

  /// Builds an unsigned `executeDirectMintingWithData((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,address),(uint64,uint64,string,bytes32,bytes32,bytes32,int256,int256,int256,int256,bool,bytes,bool,uint256,uint8))),bytes)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest executeDirectMintingWithDataTx(
    List<Object?> payment,
    Uint8List data, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeDirectMintingWithDataFn,
    args: [payment, data],
    from: from,
    value: value,
  );

  /// Builds an unsigned `executeMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest executeMintingTx(
    List<Object?> payment,
    BigInt collateralReservationId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: executeMintingFn,
    args: [payment, collateralReservationId],
    from: from,
  );

  /// Builds an unsigned `exitAvailableAgentList(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest exitAvailableAgentListTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: exitAvailableAgentListFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `finishRedemptionWithoutPayment((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest finishRedemptionWithoutPaymentTx(
    List<Object?> proof,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: finishRedemptionWithoutPaymentFn,
    args: [proof, redemptionRequestId],
    from: from,
  );

  /// Builds an unsigned `freeBalanceNegativeChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32)))[],address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest freeBalanceNegativeChallengeTx(
    List<List<Object?>> payments,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: freeBalanceNegativeChallengeFn,
    args: [payments, agentVault],
    from: from,
  );

  /// Builds an unsigned `illegalPaymentChallenge((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,bytes32),(uint64,uint64,bytes32,int256,bytes32))),address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest illegalPaymentChallengeTx(
    List<Object?> payment,
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: illegalPaymentChallengeFn,
    args: [payment, agentVault],
    from: from,
  );

  /// Builds an unsigned `liquidate(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest liquidateTx(
    EthAddress agentVault,
    BigInt amountUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: liquidateFn,
    args: [agentVault, amountUBA],
    from: from,
  );

  /// Builds an unsigned `makeAgentAvailable(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest makeAgentAvailableTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: makeAgentAvailableFn,
    args: [agentVault],
    from: from,
  );

  /// Builds an unsigned `markUnblockedDirectMintingAllowed(bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest markUnblockedDirectMintingAllowedTx(
    Uint8List transactionId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: markUnblockedDirectMintingAllowedFn,
    args: [transactionId],
    from: from,
  );

  /// Builds an unsigned `mintFromFreeUnderlying(address,uint64)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest mintFromFreeUnderlyingTx(
    EthAddress agentVault,
    BigInt lots, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: mintFromFreeUnderlyingFn,
    args: [agentVault, lots],
    from: from,
  );

  /// Builds an unsigned `mintingPaymentDefault((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64,uint64,bytes32,uint256,bytes32,bool,bytes32),(uint64,uint64,uint64))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest mintingPaymentDefaultTx(
    List<Object?> proof,
    BigInt collateralReservationId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: mintingPaymentDefaultFn,
    args: [proof, collateralReservationId],
    from: from,
  );

  /// Builds an unsigned `redeem(uint256,string,address)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest redeemTx(
    BigInt lots,
    String redeemerUnderlyingAddressString,
    EthAddress executor, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: redeemFn,
    args: [lots, redeemerUnderlyingAddressString, executor],
    from: from,
    value: value,
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

  /// Builds an unsigned `rejectInvalidRedemption((bytes32[],(bytes32,bytes32,uint64,uint64,(string),(bool,string,bytes32))),uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest rejectInvalidRedemptionTx(
    List<Object?> proof,
    BigInt redemptionRequestId, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: rejectInvalidRedemptionFn,
    args: [proof, redemptionRequestId],
    from: from,
  );

  /// Builds an unsigned `removeAlwaysAllowedMinterForAgent(address,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest removeAlwaysAllowedMinterForAgentTx(
    EthAddress agentVault,
    EthAddress minter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: removeAlwaysAllowedMinterForAgentFn,
    args: [agentVault, minter],
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

  /// Builds an unsigned `reserveCollateral(address,uint256,uint256,address)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest reserveCollateralTx(
    EthAddress agentVault,
    BigInt lots,
    BigInt maxMintingFeeBIPS,
    EthAddress executor, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: reserveCollateralFn,
    args: [agentVault, lots, maxMintingFeeBIPS, executor],
    from: from,
    value: value,
  );

  /// Builds an unsigned `selfClose(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest selfCloseTx(
    EthAddress agentVault,
    BigInt amountUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: selfCloseFn,
    args: [agentVault, amountUBA],
    from: from,
  );

  /// Builds an unsigned `selfMint((bytes32[],(bytes32,bytes32,uint64,uint64,(bytes32,uint256,uint256),(uint64,uint64,bytes32,bytes32,bytes32,bytes32,int256,int256,int256,int256,bytes32,bool,uint8))),address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest selfMintTx(
    List<Object?> payment,
    EthAddress agentVault,
    BigInt lots, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: selfMintFn,
    args: [payment, agentVault, lots],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultManagerTx(
    EthAddress coreVaultManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultManagerFn,
    args: [coreVaultManager],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultMinimumAmountLeftBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultMinimumAmountLeftBIPSTx(
    BigInt minimumAmountLeftBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultMinimumAmountLeftBIPSFn,
    args: [minimumAmountLeftBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultMinimumRedeemLots(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultMinimumRedeemLotsTx(
    BigInt minimumRedeemLots, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultMinimumRedeemLotsFn,
    args: [minimumRedeemLots],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultNativeAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultNativeAddressTx(
    EthAddress nativeAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultNativeAddressFn,
    args: [nativeAddress],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultRedemptionFeeBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultRedemptionFeeBIPSTx(
    BigInt redemptionFeeBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultRedemptionFeeBIPSFn,
    args: [redemptionFeeBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultTransferDefaultPenaltyBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultTransferDefaultPenaltyBIPSTx(
    BigInt transferDefaultPenaltyBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultTransferDefaultPenaltyBIPSFn,
    args: [transferDefaultPenaltyBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultTransferTimeExtensionSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultTransferTimeExtensionSecondsTx(
    BigInt transferTimeExtensionSeconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultTransferTimeExtensionSecondsFn,
    args: [transferTimeExtensionSeconds],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingDailyLimitUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingDailyLimitUBATx(
    BigInt dailyLimitUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingDailyLimitUBAFn,
    args: [dailyLimitUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingExecutorFee(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingExecutorFeeTx(
    BigInt executorFeeUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingExecutorFeeFn,
    args: [executorFeeUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingFee(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingFeeTx(
    BigInt mintingFeeBIPS,
    BigInt minimumMintingFeeUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingFeeFn,
    args: [mintingFeeBIPS, minimumMintingFeeUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingFeeReceiver(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingFeeReceiverTx(
    EthAddress mintingFeeReceiver, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingFeeReceiverFn,
    args: [mintingFeeReceiver],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingHourlyLimitUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingHourlyLimitUBATx(
    BigInt hourlyLimitUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingHourlyLimitUBAFn,
    args: [hourlyLimitUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingLargeMintingThrottling(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingLargeMintingThrottlingTx(
    BigInt largeMintingThresholdUBA,
    BigInt largeMintingDelaySeconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingLargeMintingThrottlingFn,
    args: [largeMintingThresholdUBA, largeMintingDelaySeconds],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingOthersCanExecuteAfterSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingOthersCanExecuteAfterSecondsTx(
    BigInt seconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingOthersCanExecuteAfterSecondsFn,
    args: [seconds],
    from: from,
  );

  /// Builds an unsigned `setMinimumRedeemAmountUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setMinimumRedeemAmountUBATx(
    BigInt valueUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setMinimumRedeemAmountUBAFn,
    args: [valueUBA],
    from: from,
  );

  /// Builds an unsigned `setMintingTagManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setMintingTagManagerTx(
    EthAddress mintingTagManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setMintingTagManagerFn,
    args: [mintingTagManager],
    from: from,
  );

  /// Builds an unsigned `setRedemptionPaymentExtensionSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setRedemptionPaymentExtensionSecondsTx(
    BigInt value_, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setRedemptionPaymentExtensionSecondsFn,
    args: [value_],
    from: from,
  );

  /// Builds an unsigned `setSmartAccountManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSmartAccountManagerTx(
    EthAddress smartAccountManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSmartAccountManagerFn,
    args: [smartAccountManager],
    from: from,
  );

  /// Builds an unsigned `setSystemRedemptionFeeBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSystemRedemptionFeeBIPSTx(
    BigInt feeBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSystemRedemptionFeeBIPSFn,
    args: [feeBIPS],
    from: from,
  );

  /// Builds an unsigned `setSystemRedemptionFeeReceiver(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSystemRedemptionFeeReceiverTx(
    EthAddress receiver, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSystemRedemptionFeeReceiverFn,
    args: [receiver],
    from: from,
  );

  /// Builds an unsigned `startLiquidation(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest startLiquidationTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: startLiquidationFn,
    args: [agentVault],
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

  /// Builds an unsigned `unblockDirectMintingsUntil(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unblockDirectMintingsUntilTx(
    BigInt timestamp, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: unblockDirectMintingsUntilFn,
    args: [timestamp],
    from: from,
  );

  /// Builds an unsigned `unstickMinting((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))),uint256)`
  /// transaction.
  ///
  /// Declared `payable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  ///
  /// Payable: [value] is attached in wei.
  TransactionRequest unstickMintingTx(
    List<Object?> proof,
    BigInt collateralReservationId, {
    EthAddress? from,
    BigInt? value,
  }) => TransactionRequest.callFunction(
    to: address,
    function: unstickMintingFn,
    args: [proof, collateralReservationId],
    from: from,
    value: value,
  );

  /// Builds an unsigned `updateCurrentBlock((bytes32[],(bytes32,bytes32,uint64,uint64,(uint64,uint64),(uint64,uint64,uint64,uint64))))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateCurrentBlockTx(
    List<Object?> proof, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: updateCurrentBlockFn,
    args: [proof],
    from: from,
  );

  /// Builds an unsigned `upgradeAgentVaultAndPool(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest upgradeAgentVaultAndPoolTx(
    EthAddress agentVault, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: upgradeAgentVaultAndPoolFn,
    args: [agentVault],
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

  /// `AgentPing(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `agentPingEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentPingEvent = AbiEvent(
    name: 'AgentPing',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sender',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'query',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AgentPingResponse(address,address,uint256,string)`
  ///
  /// Decode a matching log with
  /// `agentPingResponseEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentPingResponseEvent = AbiEvent(
    name: 'AgentPingResponse',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'query',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'response',
        type: AbiType.parse('string'),
        indexed: false,
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

  /// `DirectMintingDelayed(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingDelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingDelayedEvent = AbiEvent(
    name: 'DirectMintingDelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executionAllowedAt',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingExecuted(bytes32,address,address,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedEvent = AbiEvent(
    name: 'DirectMintingExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'targetAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingExecutedToSmartAccount(bytes32,string,address,uint256,uint256,bytes)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedToSmartAccountEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedToSmartAccountEvent = AbiEvent(
    name: 'DirectMintingExecutedToSmartAccount',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'sourceAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'mintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'memoData',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingPaymentTooSmallForFee(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingPaymentTooSmallForFeeEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingPaymentTooSmallForFeeEvent = AbiEvent(
    name: 'DirectMintingPaymentTooSmallForFee',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'receivedAmountUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'minimumMintingFeeUBA',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingsUnblocked(uint256)`
  ///
  /// Decode a matching log with
  /// `directMintingsUnblockedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingsUnblockedEvent = AbiEvent(
    name: 'DirectMintingsUnblocked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'startedUntilTimestamp',
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

  /// `LargeDirectMintingDelayed(bytes32,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `largeDirectMintingDelayedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent largeDirectMintingDelayedEvent = AbiEvent(
    name: 'LargeDirectMintingDelayed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executionAllowedAt',
        type: AbiType.parse('uint256'),
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
    agentPingEvent,
    agentPingResponseEvent,
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
    coreVaultFundsAddedEvent,
    coreVaultRedemptionRequestedEvent,
    currentUnderlyingBlockUpdatedEvent,
    directMintingDelayedEvent,
    directMintingExecutedEvent,
    directMintingExecutedToSmartAccountEvent,
    directMintingPaymentTooSmallForFeeEvent,
    directMintingsUnblockedEvent,
    duplicatePaymentConfirmedEvent,
    dustChangedEvent,
    emergencyPauseCanceledEvent,
    emergencyPauseTotalDurationResetEvent,
    emergencyPauseTriggeredEvent,
    fullLiquidationStartedEvent,
    illegalPaymentConfirmedEvent,
    largeDirectMintingDelayedEvent,
    liquidationEndedEvent,
    liquidationPerformedEvent,
    liquidationStartedEvent,
    mintingExecutedEvent,
    mintingPausedEvent,
    mintingPaymentDefaultEvent,
    poolTokenRedemptionAnnouncedEvent,
    redeemedInCollateralEvent,
    redemptionAmountIncompleteEvent,
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
    redemptionWithTagRequestedEvent,
    returnFromCoreVaultCancelledEvent,
    returnFromCoreVaultConfirmedEvent,
    returnFromCoreVaultRequestedEvent,
    selfCloseEvent,
    selfMintEvent,
    settingArrayChangedEvent,
    settingChangedEvent,
    systemRedemptionFeePaidEvent,
    transferToCoreVaultDefaultedEvent,
    transferToCoreVaultStartedEvent,
    transferToCoreVaultSuccessfulEvent,
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
