// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAssetManager
// Functions: 76 readable of 147 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IAssetManager` contract.
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

  /// ABI descriptor for `controllerAttached()`.
  static final AbiFunction controllerAttachedFn = AbiFunction(
    name: 'controllerAttached',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `isPoolTokenSuffixReserved(string)`.
  static final AbiFunction isPoolTokenSuffixReservedFn = AbiFunction(
    name: 'isPoolTokenSuffixReserved',
    inputs: [AbiParameter(name: '_suffix', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `mintingPaused()`.
  static final AbiFunction mintingPausedFn = AbiFunction(
    name: 'mintingPaused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
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
}
