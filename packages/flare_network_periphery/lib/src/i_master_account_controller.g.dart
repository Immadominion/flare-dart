// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IMasterAccountController
// Functions: 33 readable of 41 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IMasterAccountController` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IMasterAccountControllerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IMasterAccountControllerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IMasterAccountController` through the [ContractRegistry].
  ///
  /// Registered as `MasterAccountController`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IMasterAccountControllerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'MasterAccountController',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IMasterAccountControllerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `agentVaults()`.
  static final AbiFunction agentVaultsFn = AbiFunction(
    name: 'agentVaults',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_agentVaults',
        type: AbiType.parse('(uint256,address)[]'),
      ),
    ],
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

  /// ABI descriptor for `getAgentVaults()`.
  static final AbiFunction getAgentVaultsFn = AbiFunction(
    name: 'getAgentVaults',
    inputs: [],
    outputs: [
      AbiParameter(name: '_agentVaultIds', type: AbiType.parse('uint256[]')),
      AbiParameter(
        name: '_agentVaultAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalances(string)`.
  static final AbiFunction getBalancesFn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiType.parse('string'))],
    outputs: [
      AbiParameter(
        name: '_balances',
        type: AbiType.parse(
          '(uint256,(address,uint256),(address,uint256),(uint256,address,uint8,uint256,uint256)[])',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalances(address)`.
  static final AbiFunction getBalances2Fn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_balances',
        type: AbiType.parse(
          '(uint256,(address,uint256),(address,uint256),(uint256,address,uint8,uint256,uint256)[])',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDefaultInstructionFee()`.
  static final AbiFunction getDefaultInstructionFeeFn = AbiFunction(
    name: 'getDefaultInstructionFee',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecuteTimelockedCallTimestamp(bytes)`.
  static final AbiFunction getExecuteTimelockedCallTimestampFn = AbiFunction(
    name: 'getExecuteTimelockedCallTimestamp',
    inputs: [AbiParameter(name: '_encodedCall', type: AbiType.parse('bytes'))],
    outputs: [
      AbiParameter(
        name: '_allowedAfterTimestamp',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutor(address)`.
  static final AbiFunction getExecutorFn = AbiFunction(
    name: 'getExecutor',
    inputs: [
      AbiParameter(name: '_personalAccount', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorInfo()`.
  static final AbiFunction getExecutorInfoFn = AbiFunction(
    name: 'getExecutorInfo',
    inputs: [],
    outputs: [
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_executorFee', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getInstructionFee(uint256)`.
  static final AbiFunction getInstructionFeeFn = AbiFunction(
    name: 'getInstructionFee',
    inputs: [
      AbiParameter(name: '_instructionId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNonce(address)`.
  static final AbiFunction getNonceFn = AbiFunction(
    name: 'getNonce',
    inputs: [
      AbiParameter(name: '_personalAccount', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPausers()`.
  static final AbiFunction getPausersFn = AbiFunction(
    name: 'getPausers',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPaymentProofValidityDurationSeconds()`.
  static final AbiFunction getPaymentProofValidityDurationSecondsFn =
      AbiFunction(
        name: 'getPaymentProofValidityDurationSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getPersonalAccount(string)`.
  static final AbiFunction getPersonalAccountFn = AbiFunction(
    name: 'getPersonalAccount',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSourceId()`.
  static final AbiFunction getSourceIdFn = AbiFunction(
    name: 'getSourceId',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes32'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTimelockDurationSeconds()`.
  static final AbiFunction getTimelockDurationSecondsFn = AbiFunction(
    name: 'getTimelockDurationSeconds',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_timelockDurationSeconds',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getTransactionIdForCollateralReservation(uint256)`.
  static final AbiFunction getTransactionIdForCollateralReservationFn =
      AbiFunction(
        name: 'getTransactionIdForCollateralReservation',
        inputs: [
          AbiParameter(
            name: '_collateralReservationId',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [
          AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getUnpausers()`.
  static final AbiFunction getUnpausersFn = AbiFunction(
    name: 'getUnpausers',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVaults()`.
  static final AbiFunction getVaultsFn = AbiFunction(
    name: 'getVaults',
    inputs: [],
    outputs: [
      AbiParameter(name: '_vaultIds', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_vaultAddresses', type: AbiType.parse('address[]')),
      AbiParameter(name: '_vaultTypes', type: AbiType.parse('uint8[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getXrplProviderWallets()`.
  static final AbiFunction getXrplProviderWalletsFn = AbiFunction(
    name: 'getXrplProviderWallets',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `implementation()`.
  static final AbiFunction implementationFn = AbiFunction(
    name: 'implementation',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPaused()`.
  static final AbiFunction isPausedFn = AbiFunction(
    name: 'isPaused',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isPauser(address)`.
  static final AbiFunction isPauserFn = AbiFunction(
    name: 'isPauser',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isSmartAccount(address)`.
  static final AbiFunction isSmartAccountFn = AbiFunction(
    name: 'isSmartAccount',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_isSmartAccount', type: AbiType.parse('bool')),
      AbiParameter(name: '_xrplOwner', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isTransactionIdUsed(bytes32)`.
  static final AbiFunction isTransactionIdUsedFn = AbiFunction(
    name: 'isTransactionIdUsed',
    inputs: [
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isUnpauser(address)`.
  static final AbiFunction isUnpauserFn = AbiFunction(
    name: 'isUnpauser',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `owner()`.
  static final AbiFunction ownerFn = AbiFunction(
    name: 'owner',
    inputs: [],
    outputs: [AbiParameter(name: 'owner_', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `reserveCollateral(string,bytes32,bytes32)`.
  static final AbiFunction reserveCollateralFn = AbiFunction(
    name: 'reserveCollateral',
    inputs: [
      AbiParameter(name: '_xrplAddress', type: AbiType.parse('string')),
      AbiParameter(name: '_paymentReference', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_transactionId', type: AbiType.parse('bytes32')),
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

  /// ABI descriptor for `vaults()`.
  static final AbiFunction vaultsFn = AbiFunction(
    name: 'vaults',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_vaults',
        type: AbiType.parse('(uint256,address,uint8)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `agentVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> agentVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: agentVaultsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
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

  /// Calls `getAgentVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<BigInt> agentVaultIds, List<EthAddress> agentVaultAddresses})>
  getAgentVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: getAgentVaultsFn,
    );
    return (
      agentVaultIds: (out[0]! as List).cast<BigInt>(),
      agentVaultAddresses: (out[1]! as List).cast<EthAddress>(),
    );
  }

  /// Calls `getBalances(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getBalances(String xrplOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalancesFn,
      args: [xrplOwner],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getBalances(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getBalances2(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalances2Fn,
      args: [account],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getDefaultInstructionFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDefaultInstructionFee() async {
    final out = await client.callFunction(
      contract: address,
      function: getDefaultInstructionFeeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecuteTimelockedCallTimestamp(bytes)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecuteTimelockedCallTimestamp(
    Uint8List encodedCall,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecuteTimelockedCallTimestampFn,
      args: [encodedCall],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecutor(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getExecutor(EthAddress personalAccount) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorFn,
      args: [personalAccount],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getExecutorInfo()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({EthAddress executor, BigInt executorFee})> getExecutorInfo() async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorInfoFn,
    );
    return (executor: out[0]! as EthAddress, executorFee: out[1]! as BigInt);
  }

  /// Calls `getInstructionFee(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getInstructionFee(BigInt instructionId) async {
    final out = await client.callFunction(
      contract: address,
      function: getInstructionFeeFn,
      args: [instructionId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNonce(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNonce(EthAddress personalAccount) async {
    final out = await client.callFunction(
      contract: address,
      function: getNonceFn,
      args: [personalAccount],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getPausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getPausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getPaymentProofValidityDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getPaymentProofValidityDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getPaymentProofValidityDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPersonalAccount(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getPersonalAccount(String xrplOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getPersonalAccountFn,
      args: [xrplOwner],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getSourceId()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getSourceId() async {
    final out = await client.callFunction(
      contract: address,
      function: getSourceIdFn,
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getTimelockDurationSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getTimelockDurationSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getTimelockDurationSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getTransactionIdForCollateralReservation(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> getTransactionIdForCollateralReservation(
    BigInt collateralReservationId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getTransactionIdForCollateralReservationFn,
      args: [collateralReservationId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `getUnpausers()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getUnpausers() async {
    final out = await client.callFunction(
      contract: address,
      function: getUnpausersFn,
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<BigInt> vaultIds,
      List<EthAddress> vaultAddresses,
      List<BigInt> vaultTypes,
    })
  >
  getVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: getVaultsFn,
    );
    return (
      vaultIds: (out[0]! as List).cast<BigInt>(),
      vaultAddresses: (out[1]! as List).cast<EthAddress>(),
      vaultTypes: (out[2]! as List).cast<BigInt>(),
    );
  }

  /// Calls `getXrplProviderWallets()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<String>> getXrplProviderWallets() async {
    final out = await client.callFunction(
      contract: address,
      function: getXrplProviderWalletsFn,
    );
    return (out[0]! as List).cast<String>();
  }

  /// Calls `implementation()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> implementation() async {
    final out = await client.callFunction(
      contract: address,
      function: implementationFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isPaused()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPaused() async {
    final out = await client.callFunction(
      contract: address,
      function: isPausedFn,
    );
    return out[0]! as bool;
  }

  /// Calls `isPauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isPauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isPauserFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `isSmartAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool isSmartAccount, String xrplOwner})> isSmartAccount(
    EthAddress address_,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isSmartAccountFn,
      args: [address_],
    );
    return (isSmartAccount: out[0]! as bool, xrplOwner: out[1]! as String);
  }

  /// Calls `isTransactionIdUsed(bytes32)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isTransactionIdUsed(Uint8List transactionId) async {
    final out = await client.callFunction(
      contract: address,
      function: isTransactionIdUsedFn,
      args: [transactionId],
    );
    return out[0]! as bool;
  }

  /// Calls `isUnpauser(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isUnpauser(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: isUnpauserFn,
      args: [account],
    );
    return out[0]! as bool;
  }

  /// Calls `owner()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> owner() async {
    final out = await client.callFunction(contract: address, function: ownerFn);
    return out[0]! as EthAddress;
  }

  /// Calls `reserveCollateral(string,bytes32,bytes32)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> reserveCollateral(
    String xrplAddress,
    Uint8List paymentReference,
    Uint8List transactionId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: reserveCollateralFn,
      args: [xrplAddress, paymentReference, transactionId],
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

  /// Calls `vaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> vaults() async {
    final out = await client.callFunction(
      contract: address,
      function: vaultsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// `AgentVaultAdded(uint256,address)`
  ///
  /// Decode a matching log with
  /// `agentVaultAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentVaultAddedEvent = AbiEvent(
    name: 'AgentVaultAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'agentVaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `AgentVaultRemoved(uint256,address)`
  ///
  /// Decode a matching log with
  /// `agentVaultRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent agentVaultRemovedEvent = AbiEvent(
    name: 'AgentVaultRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'agentVaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'agentVaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `Approved(address,address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvedEvent = AbiEvent(
    name: 'Approved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fxrp',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CallTimelocked(bytes,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `callTimelockedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent callTimelockedEvent = AbiEvent(
    name: 'CallTimelocked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCall',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'allowedAfterTimestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Claimed(address,address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `claimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent claimedEvent = AbiEvent(
    name: 'Claimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `CollateralReserved(address,bytes32,bytes32,string,uint256,address,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `collateralReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent collateralReservedEvent = AbiEvent(
    name: 'CollateralReserved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'collateralReservationId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'agentVault',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'lots',
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
    ],
  );

  /// `DefaultInstructionFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `defaultInstructionFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent defaultInstructionFeeSetEvent = AbiEvent(
    name: 'DefaultInstructionFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'defaultInstructionFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Deposited(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `depositedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent depositedEvent = AbiEvent(
    name: 'Deposited',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `DiamondCut((address,uint8,bytes4[])[],address,bytes)`
  ///
  /// Decode a matching log with
  /// `diamondCutEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent diamondCutEvent = AbiEvent(
    name: 'DiamondCut',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: '_diamondCut',
        type: AbiType.parse('(address,uint8,bytes4[])[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_init',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_calldata',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
    ],
  );

  /// `DirectMintingExecuted(address,bytes32,string,uint256,uint256,address)`
  ///
  /// Decode a matching log with
  /// `directMintingExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent directMintingExecutedEvent = AbiEvent(
    name: 'DirectMintingExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'sourceAddress',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorFeeSet(uint256)`
  ///
  /// Decode a matching log with
  /// `executorFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorFeeSetEvent = AbiEvent(
    name: 'ExecutorFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executorFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorRemoved(address)`
  ///
  /// Decode a matching log with
  /// `executorRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorRemovedEvent = AbiEvent(
    name: 'ExecutorRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `ExecutorSet(address)`
  ///
  /// Decode a matching log with
  /// `executorSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorSetEvent = AbiEvent(
    name: 'ExecutorSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorSet(address,address)`
  ///
  /// Decode a matching log with
  /// `executorSet2Event.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorSet2Event = AbiEvent(
    name: 'ExecutorSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `FXrpRedeemed(address,uint256,uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpRedeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpRedeemedEvent = AbiEvent(
    name: 'FXrpRedeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'lots',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
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
    ],
  );

  /// `FXrpTransferred(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `fXrpTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent fXrpTransferredEvent = AbiEvent(
    name: 'FXrpTransferred',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `IgnoreMemoSet(address,bytes32)`
  ///
  /// Decode a matching log with
  /// `ignoreMemoSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ignoreMemoSetEvent = AbiEvent(
    name: 'IgnoreMemoSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'targetTxId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
    ],
  );

  /// `InstructionExecuted(address,bytes32,bytes32,string,uint256)`
  ///
  /// Decode a matching log with
  /// `instructionExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionExecutedEvent = AbiEvent(
    name: 'InstructionExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'transactionId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'paymentReference',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InstructionFeeRemoved(uint256)`
  ///
  /// Decode a matching log with
  /// `instructionFeeRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionFeeRemovedEvent = AbiEvent(
    name: 'InstructionFeeRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `InstructionFeeSet(uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `instructionFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent instructionFeeSetEvent = AbiEvent(
    name: 'InstructionFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'instructionId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'instructionFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `NonceIncreased(address,uint256)`
  ///
  /// Decode a matching log with
  /// `nonceIncreasedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent nonceIncreasedEvent = AbiEvent(
    name: 'NonceIncreased',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'newNonce',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `OwnershipTransferred(address,address)`
  ///
  /// Decode a matching log with
  /// `ownershipTransferredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent ownershipTransferredEvent = AbiEvent(
    name: 'OwnershipTransferred',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'previousOwner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'newOwner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `Paused(address)`
  ///
  /// Decode a matching log with
  /// `pausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pausedEvent = AbiEvent(
    name: 'Paused',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `PauserAdded(address)`
  ///
  /// Decode a matching log with
  /// `pauserAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pauserAddedEvent = AbiEvent(
    name: 'PauserAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `PauserRemoved(address)`
  ///
  /// Decode a matching log with
  /// `pauserRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pauserRemovedEvent = AbiEvent(
    name: 'PauserRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `PaymentProofValidityDurationSecondsSet(uint256)`
  ///
  /// Decode a matching log with
  /// `paymentProofValidityDurationSecondsSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent paymentProofValidityDurationSecondsSetEvent = AbiEvent(
    name: 'PaymentProofValidityDurationSecondsSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'paymentProofValidityDurationSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PersonalAccountCreated(address,string)`
  ///
  /// Decode a matching log with
  /// `personalAccountCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent personalAccountCreatedEvent = AbiEvent(
    name: 'PersonalAccountCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'xrplOwner',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `PersonalAccountImplementationSet(address)`
  ///
  /// Decode a matching log with
  /// `personalAccountImplementationSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent personalAccountImplementationSetEvent = AbiEvent(
    name: 'PersonalAccountImplementationSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'newImplementation',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RedeemRequested(address,address,uint256,uint256,uint256,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemRequestedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemRequestedEvent = AbiEvent(
    name: 'RedeemRequested',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'claimableEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'year',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'month',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'day',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Redeemed(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `redeemedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent redeemedEvent = AbiEvent(
    name: 'Redeemed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'shares',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `ReplacementFeeSet(address,bytes32,uint64)`
  ///
  /// Decode a matching log with
  /// `replacementFeeSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent replacementFeeSetEvent = AbiEvent(
    name: 'ReplacementFeeSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'targetTxId',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'newFee',
        type: AbiType.parse('uint64'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockDurationSet(uint256)`
  ///
  /// Decode a matching log with
  /// `timelockDurationSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockDurationSetEvent = AbiEvent(
    name: 'TimelockDurationSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'timelockDurationSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockedCallCanceled(bytes32)`
  ///
  /// Decode a matching log with
  /// `timelockedCallCanceledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockedCallCanceledEvent = AbiEvent(
    name: 'TimelockedCallCanceled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `TimelockedCallExecuted(bytes32)`
  ///
  /// Decode a matching log with
  /// `timelockedCallExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent timelockedCallExecutedEvent = AbiEvent(
    name: 'TimelockedCallExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'encodedCallHash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `Unpaused(address)`
  ///
  /// Decode a matching log with
  /// `unpausedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpausedEvent = AbiEvent(
    name: 'Unpaused',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `UnpauserAdded(address)`
  ///
  /// Decode a matching log with
  /// `unpauserAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpauserAddedEvent = AbiEvent(
    name: 'UnpauserAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `UnpauserRemoved(address)`
  ///
  /// Decode a matching log with
  /// `unpauserRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent unpauserRemovedEvent = AbiEvent(
    name: 'UnpauserRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `UserOperationExecuted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `userOperationExecutedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent userOperationExecutedEvent = AbiEvent(
    name: 'UserOperationExecuted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nonce',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VaultAdded(uint256,address,uint8)`
  ///
  /// Decode a matching log with
  /// `vaultAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent vaultAddedEvent = AbiEvent(
    name: 'VaultAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'vaultId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vaultAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vaultType',
        type: AbiType.parse('uint8'),
        indexed: true,
      ),
    ],
  );

  /// `WithdrawalClaimed(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `withdrawalClaimedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent withdrawalClaimedEvent = AbiEvent(
    name: 'WithdrawalClaimed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'personalAccount',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'vault',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'period',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `XrplProviderWalletAdded(string)`
  ///
  /// Decode a matching log with
  /// `xrplProviderWalletAddedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrplProviderWalletAddedEvent = AbiEvent(
    name: 'XrplProviderWalletAdded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'xrplProviderWallet',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// `XrplProviderWalletRemoved(string)`
  ///
  /// Decode a matching log with
  /// `xrplProviderWalletRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent xrplProviderWalletRemovedEvent = AbiEvent(
    name: 'XrplProviderWalletRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'xrplProviderWallet',
        type: AbiType.parse('string'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    agentVaultAddedEvent,
    agentVaultRemovedEvent,
    approvedEvent,
    callTimelockedEvent,
    claimedEvent,
    collateralReservedEvent,
    defaultInstructionFeeSetEvent,
    depositedEvent,
    diamondCutEvent,
    directMintingExecutedEvent,
    executorFeeSetEvent,
    executorRemovedEvent,
    executorSetEvent,
    executorSet2Event,
    fXrpRedeemedEvent,
    fXrpTransferredEvent,
    ignoreMemoSetEvent,
    instructionExecutedEvent,
    instructionFeeRemovedEvent,
    instructionFeeSetEvent,
    nonceIncreasedEvent,
    ownershipTransferredEvent,
    pausedEvent,
    pauserAddedEvent,
    pauserRemovedEvent,
    paymentProofValidityDurationSecondsSetEvent,
    personalAccountCreatedEvent,
    personalAccountImplementationSetEvent,
    redeemRequestedEvent,
    redeemedEvent,
    replacementFeeSetEvent,
    timelockDurationSetEvent,
    timelockedCallCanceledEvent,
    timelockedCallExecutedEvent,
    unpausedEvent,
    unpauserAddedEvent,
    unpauserRemovedEvent,
    userOperationExecutedEvent,
    vaultAddedEvent,
    withdrawalClaimedEvent,
    xrplProviderWalletAddedEvent,
    xrplProviderWalletRemovedEvent,
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
