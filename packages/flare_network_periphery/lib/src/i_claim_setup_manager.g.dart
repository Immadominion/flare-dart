// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IClaimSetupManager
// Functions: 11 readable of 26 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IClaimSetupManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IClaimSetupManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IClaimSetupManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IClaimSetupManager` through the [ContractRegistry].
  static Future<IClaimSetupManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IClaimSetupManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IClaimSetupManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `accountToDelegationAccount(address)`.
  static final AbiFunction accountToDelegationAccountFn = AbiFunction(
    name: 'accountToDelegationAccount',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `allowedClaimRecipients(address)`.
  static final AbiFunction allowedClaimRecipientsFn = AbiFunction(
    name: 'allowedClaimRecipients',
    inputs: [
      AbiParameter(name: '_rewardOwner', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `claimExecutors(address)`.
  static final AbiFunction claimExecutorsFn = AbiFunction(
    name: 'claimExecutors',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegationAccountData(address)`.
  static final AbiFunction getDelegationAccountDataFn = AbiFunction(
    name: 'getDelegationAccountData',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_delegationAccount', type: AbiType.parse('address')),
      AbiParameter(name: '_enabled', type: AbiType.parse('bool')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorCurrentFeeValue(address)`.
  static final AbiFunction getExecutorCurrentFeeValueFn = AbiFunction(
    name: 'getExecutorCurrentFeeValue',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorFeeValue(address,uint256)`.
  static final AbiFunction getExecutorFeeValueFn = AbiFunction(
    name: 'getExecutorFeeValue',
    inputs: [
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpoch', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorInfo(address)`.
  static final AbiFunction getExecutorInfoFn = AbiFunction(
    name: 'getExecutorInfo',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_registered', type: AbiType.parse('bool')),
      AbiParameter(name: '_currentFeeValue', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getExecutorScheduledFeeValueChanges(address)`.
  static final AbiFunction getExecutorScheduledFeeValueChangesFn = AbiFunction(
    name: 'getExecutorScheduledFeeValueChanges',
    inputs: [AbiParameter(name: '_executor', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_feeValue', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_validFromEpoch', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_fixed', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredExecutors(uint256,uint256)`.
  static final AbiFunction getRegisteredExecutorsFn = AbiFunction(
    name: 'getRegisteredExecutors',
    inputs: [
      AbiParameter(name: '_start', type: AbiType.parse('uint256')),
      AbiParameter(name: '_end', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_registeredExecutors',
        type: AbiType.parse('address[]'),
      ),
      AbiParameter(name: '_totalLength', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isClaimExecutor(address,address)`.
  static final AbiFunction isClaimExecutorFn = AbiFunction(
    name: 'isClaimExecutor',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_executor', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `registerExecutor(uint256)`.
  static final AbiFunction registerExecutorFn = AbiFunction(
    name: 'registerExecutor',
    inputs: [AbiParameter(name: '_feeValue', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// Calls `accountToDelegationAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> accountToDelegationAccount(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: accountToDelegationAccountFn,
      args: [owner],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `allowedClaimRecipients(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> allowedClaimRecipients(
    EthAddress rewardOwner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: allowedClaimRecipientsFn,
      args: [rewardOwner],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `claimExecutors(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> claimExecutors(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: claimExecutorsFn,
      args: [owner],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getDelegationAccountData(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({EthAddress delegationAccount, bool enabled})>
  getDelegationAccountData(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegationAccountDataFn,
      args: [owner],
    );
    return (delegationAccount: out[0]! as EthAddress, enabled: out[1]! as bool);
  }

  /// Calls `getExecutorCurrentFeeValue(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecutorCurrentFeeValue(EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorCurrentFeeValueFn,
      args: [executor],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecutorFeeValue(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getExecutorFeeValue(
    EthAddress executor,
    BigInt rewardEpoch,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorFeeValueFn,
      args: [executor, rewardEpoch],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getExecutorInfo(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool registered, BigInt currentFeeValue})> getExecutorInfo(
    EthAddress executor,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorInfoFn,
      args: [executor],
    );
    return (registered: out[0]! as bool, currentFeeValue: out[1]! as BigInt);
  }

  /// Calls `getExecutorScheduledFeeValueChanges(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({List<BigInt> feeValue, List<BigInt> validFromEpoch, List<bool> fixed})
  >
  getExecutorScheduledFeeValueChanges(EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: getExecutorScheduledFeeValueChangesFn,
      args: [executor],
    );
    return (
      feeValue: (out[0]! as List).cast<BigInt>(),
      validFromEpoch: (out[1]! as List).cast<BigInt>(),
      fixed: (out[2]! as List).cast<bool>(),
    );
  }

  /// Calls `getRegisteredExecutors(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> registeredExecutors, BigInt totalLength})>
  getRegisteredExecutors(BigInt start, BigInt end) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredExecutorsFn,
      args: [start, end],
    );
    return (
      registeredExecutors: (out[0]! as List).cast<EthAddress>(),
      totalLength: out[1]! as BigInt,
    );
  }

  /// Calls `isClaimExecutor(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isClaimExecutor(EthAddress owner, EthAddress executor) async {
    final out = await client.callFunction(
      contract: address,
      function: isClaimExecutorFn,
      args: [owner, executor],
    );
    return out[0]! as bool;
  }

  /// Calls `registerExecutor(uint256)`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> registerExecutor(BigInt feeValue) async {
    final out = await client.callFunction(
      contract: address,
      function: registerExecutorFn,
      args: [feeValue],
    );
    return out[0]! as BigInt;
  }
}
