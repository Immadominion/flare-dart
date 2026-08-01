// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IWNatDelegationFee
// Functions: 5 readable of 6 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IWNatDelegationFee` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IWNatDelegationFeeContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IWNatDelegationFeeContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IWNatDelegationFee` through the [ContractRegistry].
  static Future<IWNatDelegationFeeContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IWNatDelegationFee',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IWNatDelegationFeeContract(client: client, address: resolved);
  }

  /// ABI descriptor for `defaultFeePercentageBIPS()`.
  static final AbiFunction defaultFeePercentageBIPSFn = AbiFunction(
    name: 'defaultFeePercentageBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint16'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `feePercentageUpdateOffset()`.
  static final AbiFunction feePercentageUpdateOffsetFn = AbiFunction(
    name: 'feePercentageUpdateOffset',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint24'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterCurrentFeePercentage(address)`.
  static final AbiFunction getVoterCurrentFeePercentageFn = AbiFunction(
    name: 'getVoterCurrentFeePercentage',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint16'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterFeePercentage(address,uint256)`.
  static final AbiFunction getVoterFeePercentageFn = AbiFunction(
    name: 'getVoterFeePercentage',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint16'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterScheduledFeePercentageChanges(address)`.
  static final AbiFunction getVoterScheduledFeePercentageChangesFn =
      AbiFunction(
        name: 'getVoterScheduledFeePercentageChanges',
        inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
        outputs: [
          AbiParameter(
            name: '_feePercentageBIPS',
            type: AbiType.parse('uint256[]'),
          ),
          AbiParameter(
            name: '_validFromEpochId',
            type: AbiType.parse('uint256[]'),
          ),
          AbiParameter(name: '_fixed', type: AbiType.parse('bool[]')),
        ],
        stateMutability: StateMutability.view,
      );

  /// Calls `defaultFeePercentageBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultFeePercentageBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultFeePercentageBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `feePercentageUpdateOffset()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> feePercentageUpdateOffset() async {
    final out = await client.callFunction(
      contract: address,
      function: feePercentageUpdateOffsetFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterCurrentFeePercentage(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVoterCurrentFeePercentage(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterCurrentFeePercentageFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterFeePercentage(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVoterFeePercentage(
    EthAddress voter,
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterFeePercentageFn,
      args: [voter, rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterScheduledFeePercentageChanges(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<BigInt> feePercentageBIPS,
      List<BigInt> validFromEpochId,
      List<bool> fixed,
    })
  >
  getVoterScheduledFeePercentageChanges(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterScheduledFeePercentageChangesFn,
      args: [voter],
    );
    return (
      feePercentageBIPS: (out[0]! as List).cast<BigInt>(),
      validFromEpochId: (out[1]! as List).cast<BigInt>(),
      fixed: (out[2]! as List).cast<bool>(),
    );
  }
}
