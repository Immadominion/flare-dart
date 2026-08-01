// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IRelay
// Functions: 13 readable of 16 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IRelay` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IRelayContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IRelayContract({required this.client, required this.address});

  /// Resolves `IRelay` through the [ContractRegistry].
  static Future<IRelayContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IRelay',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IRelayContract(client: client, address: resolved);
  }

  /// ABI descriptor for `feeCollectionAddress()`.
  static final AbiFunction feeCollectionAddressFn = AbiFunction(
    name: 'feeCollectionAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandomNumber()`.
  static final AbiFunction getRandomNumberFn = AbiFunction(
    name: 'getRandomNumber',
    inputs: [],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandomNumberHistorical(uint256)`.
  static final AbiFunction getRandomNumberHistoricalFn = AbiFunction(
    name: 'getRandomNumberHistorical',
    inputs: [
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
      AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotingRoundId(uint256)`.
  static final AbiFunction getVotingRoundIdFn = AbiFunction(
    name: 'getVotingRoundId',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isFinalized(uint256,uint256)`.
  static final AbiFunction isFinalizedFn = AbiFunction(
    name: 'isFinalized',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `lastInitializedRewardEpochData()`.
  static final AbiFunction lastInitializedRewardEpochDataFn = AbiFunction(
    name: 'lastInitializedRewardEpochData',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_lastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: '_startingVotingRoundIdForLastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `merkleRoots(uint256,uint256)`.
  static final AbiFunction merkleRootsFn = AbiFunction(
    name: 'merkleRoots',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_merkleRoot', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `protocolFeeInWei(uint256)`.
  static final AbiFunction protocolFeeInWeiFn = AbiFunction(
    name: 'protocolFeeInWei',
    inputs: [AbiParameter(name: '_protocolId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `signingPolicySetter()`.
  static final AbiFunction signingPolicySetterFn = AbiFunction(
    name: 'signingPolicySetter',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `startingVotingRoundIds(uint256)`.
  static final AbiFunction startingVotingRoundIdsFn = AbiFunction(
    name: 'startingVotingRoundIds',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_startingVotingRoundId',
        type: AbiType.parse('uint256'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `stateData()`.
  static final AbiFunction stateDataFn = AbiFunction(
    name: 'stateData',
    inputs: [],
    outputs: [
      AbiParameter(
        name: 'randomNumberProtocolId',
        type: AbiType.parse('uint8'),
      ),
      AbiParameter(
        name: 'firstVotingRoundStartTs',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: 'votingEpochDurationSeconds',
        type: AbiType.parse('uint8'),
      ),
      AbiParameter(
        name: 'firstRewardEpochStartVotingRoundId',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(
        name: 'rewardEpochDurationInVotingEpochs',
        type: AbiType.parse('uint16'),
      ),
      AbiParameter(
        name: 'thresholdIncreaseBIPS',
        type: AbiType.parse('uint16'),
      ),
      AbiParameter(name: 'randomVotingRoundId', type: AbiType.parse('uint32')),
      AbiParameter(name: 'isSecureRandom', type: AbiType.parse('bool')),
      AbiParameter(
        name: 'lastInitializedRewardEpoch',
        type: AbiType.parse('uint32'),
      ),
      AbiParameter(name: 'noSigningPolicyRelay', type: AbiType.parse('bool')),
      AbiParameter(
        name: 'messageFinalizationWindowInRewardEpochs',
        type: AbiType.parse('uint32'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `toSigningPolicyHash(uint256)`.
  static final AbiFunction toSigningPolicyHashFn = AbiFunction(
    name: 'toSigningPolicyHash',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_signingPolicyHash', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `verify(uint256,uint256,bytes32,bytes32[])`.
  static final AbiFunction verifyFn = AbiFunction(
    name: 'verify',
    inputs: [
      AbiParameter(name: '_protocolId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_votingRoundId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_leaf', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_proof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.payable,
  );

  /// Calls `feeCollectionAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> feeCollectionAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: feeCollectionAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getRandomNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getRandomNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberFn,
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getRandomNumberHistorical(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt randomNumber, bool isSecureRandom, BigInt randomTimestamp})>
  getRandomNumberHistorical(BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomNumberHistoricalFn,
      args: [votingRoundId],
    );
    return (
      randomNumber: out[0]! as BigInt,
      isSecureRandom: out[1]! as bool,
      randomTimestamp: out[2]! as BigInt,
    );
  }

  /// Calls `getVotingRoundId(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotingRoundId(BigInt timestamp) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotingRoundIdFn,
      args: [timestamp],
    );
    return out[0]! as BigInt;
  }

  /// Calls `isFinalized(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isFinalized(BigInt protocolId, BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: isFinalizedFn,
      args: [protocolId, votingRoundId],
    );
    return out[0]! as bool;
  }

  /// Calls `lastInitializedRewardEpochData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt lastInitializedRewardEpoch,
      BigInt startingVotingRoundIdForLastInitializedRewardEpoch,
    })
  >
  lastInitializedRewardEpochData() async {
    final out = await client.callFunction(
      contract: address,
      function: lastInitializedRewardEpochDataFn,
    );
    return (
      lastInitializedRewardEpoch: out[0]! as BigInt,
      startingVotingRoundIdForLastInitializedRewardEpoch: out[1]! as BigInt,
    );
  }

  /// Calls `merkleRoots(uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> merkleRoots(BigInt protocolId, BigInt votingRoundId) async {
    final out = await client.callFunction(
      contract: address,
      function: merkleRootsFn,
      args: [protocolId, votingRoundId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `protocolFeeInWei(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> protocolFeeInWei(BigInt protocolId) async {
    final out = await client.callFunction(
      contract: address,
      function: protocolFeeInWeiFn,
      args: [protocolId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `signingPolicySetter()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> signingPolicySetter() async {
    final out = await client.callFunction(
      contract: address,
      function: signingPolicySetterFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `startingVotingRoundIds(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> startingVotingRoundIds(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: startingVotingRoundIdsFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `stateData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt randomNumberProtocolId,
      BigInt firstVotingRoundStartTs,
      BigInt votingEpochDurationSeconds,
      BigInt firstRewardEpochStartVotingRoundId,
      BigInt rewardEpochDurationInVotingEpochs,
      BigInt thresholdIncreaseBIPS,
      BigInt randomVotingRoundId,
      bool isSecureRandom,
      BigInt lastInitializedRewardEpoch,
      bool noSigningPolicyRelay,
      BigInt messageFinalizationWindowInRewardEpochs,
    })
  >
  stateData() async {
    final out = await client.callFunction(
      contract: address,
      function: stateDataFn,
    );
    return (
      randomNumberProtocolId: out[0]! as BigInt,
      firstVotingRoundStartTs: out[1]! as BigInt,
      votingEpochDurationSeconds: out[2]! as BigInt,
      firstRewardEpochStartVotingRoundId: out[3]! as BigInt,
      rewardEpochDurationInVotingEpochs: out[4]! as BigInt,
      thresholdIncreaseBIPS: out[5]! as BigInt,
      randomVotingRoundId: out[6]! as BigInt,
      isSecureRandom: out[7]! as bool,
      lastInitializedRewardEpoch: out[8]! as BigInt,
      noSigningPolicyRelay: out[9]! as bool,
      messageFinalizationWindowInRewardEpochs: out[10]! as BigInt,
    );
  }

  /// Calls `toSigningPolicyHash(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> toSigningPolicyHash(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: toSigningPolicyHashFn,
      args: [rewardEpochId],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `verify(uint256,uint256,bytes32,bytes32[])`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<bool> verify(
    BigInt protocolId,
    BigInt votingRoundId,
    Uint8List leaf,
    List<Uint8List> proof,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: verifyFn,
      args: [protocolId, votingRoundId, leaf, proof],
    );
    return out[0]! as bool;
  }
}
