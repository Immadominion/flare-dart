// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIVoterRegistry
// Functions: 20 readable of 23 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIVoterRegistry` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIVoterRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIVoterRegistryContract({required this.client, required this.address});

  /// Resolves `IIVoterRegistry` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIVoterRegistryContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIVoterRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `chilledUntilRewardEpochId(bytes20)`.
  static final AbiFunction chilledUntilRewardEpochIdFn = AbiFunction(
    name: 'chilledUntilRewardEpochId',
    inputs: [
      AbiParameter(name: '_beneficiary', type: AbiType.parse('bytes20')),
    ],
    outputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNumberOfRegisteredVoters(uint256)`.
  static final AbiFunction getNumberOfRegisteredVotersFn = AbiFunction(
    name: 'getNumberOfRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPublicKeyAndNormalisedWeight(uint256,address)`.
  static final AbiFunction getPublicKeyAndNormalisedWeightFn = AbiFunction(
    name: 'getPublicKeyAndNormalisedWeight',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_signingPolicyAddress',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [
      AbiParameter(name: '_publicKeyPart1', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_publicKeyPart2', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_normalisedWeight', type: AbiType.parse('uint16')),
      AbiParameter(
        name: '_normalisedWeightsSumOfVotersWithPublicKeys',
        type: AbiType.parse('uint16'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredDelegationAddresses(uint256)`.
  static final AbiFunction getRegisteredDelegationAddressesFn = AbiFunction(
    name: 'getRegisteredDelegationAddresses',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_delegationAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredNodeIds(uint256)`.
  static final AbiFunction getRegisteredNodeIdsFn = AbiFunction(
    name: 'getRegisteredNodeIds',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_nodeIds', type: AbiType.parse('bytes20[][]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredPublicKeys(uint256)`.
  static final AbiFunction getRegisteredPublicKeysFn = AbiFunction(
    name: 'getRegisteredPublicKeys',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_parts1', type: AbiType.parse('bytes32[]')),
      AbiParameter(name: '_parts2', type: AbiType.parse('bytes32[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredSigningPolicyAddresses(uint256)`.
  static final AbiFunction getRegisteredSigningPolicyAddressesFn = AbiFunction(
    name: 'getRegisteredSigningPolicyAddresses',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_signingPolicyAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredSubmitAddresses(uint256)`.
  static final AbiFunction getRegisteredSubmitAddressesFn = AbiFunction(
    name: 'getRegisteredSubmitAddresses',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredSubmitSignaturesAddresses(uint256)`.
  static final AbiFunction getRegisteredSubmitSignaturesAddressesFn =
      AbiFunction(
        name: 'getRegisteredSubmitSignaturesAddresses',
        inputs: [
          AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
        ],
        outputs: [
          AbiParameter(
            name: '_signingPolicyAddresses',
            type: AbiType.parse('address[]'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getRegisteredVoters(uint256)`.
  static final AbiFunction getRegisteredVotersFn = AbiFunction(
    name: 'getRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRegisteredVotersAndNormalisedWeights(uint256)`.
  static final AbiFunction getRegisteredVotersAndNormalisedWeightsFn =
      AbiFunction(
        name: 'getRegisteredVotersAndNormalisedWeights',
        inputs: [
          AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
        ],
        outputs: [
          AbiParameter(name: '_voters', type: AbiType.parse('address[]')),
          AbiParameter(
            name: '_normalisedWeights',
            type: AbiType.parse('uint16[]'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getRegisteredVotersAndRegistrationWeights(uint256)`.
  static final AbiFunction getRegisteredVotersAndRegistrationWeightsFn =
      AbiFunction(
        name: 'getRegisteredVotersAndRegistrationWeights',
        inputs: [
          AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
        ],
        outputs: [
          AbiParameter(name: '_voters', type: AbiType.parse('address[]')),
          AbiParameter(
            name: '_registrationWeights',
            type: AbiType.parse('uint256[]'),
          ),
        ],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getVoterNormalisedWeight(address,uint256)`.
  static final AbiFunction getVoterNormalisedWeightFn = AbiFunction(
    name: 'getVoterNormalisedWeight',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_normalisedWeight', type: AbiType.parse('uint16')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterRegistrationWeight(address,uint256)`.
  static final AbiFunction getVoterRegistrationWeightFn = AbiFunction(
    name: 'getVoterRegistrationWeight',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_registrationWeight', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterWithNormalisedWeight(uint256,address)`.
  static final AbiFunction getVoterWithNormalisedWeightFn = AbiFunction(
    name: 'getVoterWithNormalisedWeight',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_signingPolicyAddress',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_normalisedWeight', type: AbiType.parse('uint16')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getWeightsSums(uint256)`.
  static final AbiFunction getWeightsSumsFn = AbiFunction(
    name: 'getWeightsSums',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_weightsSum', type: AbiType.parse('uint128')),
      AbiParameter(
        name: '_normalisedWeightsSum',
        type: AbiType.parse('uint16'),
      ),
      AbiParameter(
        name: '_normalisedWeightsSumOfVotersWithPublicKeys',
        type: AbiType.parse('uint16'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isVoterRegistered(address,uint256)`.
  static final AbiFunction isVoterRegisteredFn = AbiFunction(
    name: 'isVoterRegistered',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `maxVoters()`.
  static final AbiFunction maxVotersFn = AbiFunction(
    name: 'maxVoters',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `newSigningPolicyInitializationStartBlockNumber(uint256)`.
  static final AbiFunction newSigningPolicyInitializationStartBlockNumberFn =
      AbiFunction(
        name: 'newSigningPolicyInitializationStartBlockNumber',
        inputs: [
          AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
        ],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `publicKeyRequired()`.
  static final AbiFunction publicKeyRequiredFn = AbiFunction(
    name: 'publicKeyRequired',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `chilledUntilRewardEpochId(bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> chilledUntilRewardEpochId(Uint8List beneficiary) async {
    final out = await client.callFunction(
      contract: address,
      function: chilledUntilRewardEpochIdFn,
      args: [beneficiary],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getNumberOfRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getNumberOfRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getNumberOfRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getPublicKeyAndNormalisedWeight(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      Uint8List publicKeyPart1,
      Uint8List publicKeyPart2,
      BigInt normalisedWeight,
      BigInt normalisedWeightsSumOfVotersWithPublicKeys,
    })
  >
  getPublicKeyAndNormalisedWeight(
    BigInt rewardEpochId,
    EthAddress signingPolicyAddress,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getPublicKeyAndNormalisedWeightFn,
      args: [rewardEpochId, signingPolicyAddress],
    );
    return (
      publicKeyPart1: out[0]! as Uint8List,
      publicKeyPart2: out[1]! as Uint8List,
      normalisedWeight: out[2]! as BigInt,
      normalisedWeightsSumOfVotersWithPublicKeys: out[3]! as BigInt,
    );
  }

  /// Calls `getRegisteredDelegationAddresses(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredDelegationAddresses(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredDelegationAddressesFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getRegisteredNodeIds(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Uint8List>>> getRegisteredNodeIds(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredNodeIdsFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<List<Uint8List>>();
  }

  /// Calls `getRegisteredPublicKeys(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<Uint8List> parts1, List<Uint8List> parts2})>
  getRegisteredPublicKeys(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredPublicKeysFn,
      args: [rewardEpochId],
    );
    return (
      parts1: (out[0]! as List).cast<Uint8List>(),
      parts2: (out[1]! as List).cast<Uint8List>(),
    );
  }

  /// Calls `getRegisteredSigningPolicyAddresses(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredSigningPolicyAddresses(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredSigningPolicyAddressesFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getRegisteredSubmitAddresses(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredSubmitAddresses(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredSubmitAddressesFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getRegisteredSubmitSignaturesAddresses(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredSubmitSignaturesAddresses(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredSubmitSignaturesAddressesFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getRegisteredVotersAndNormalisedWeights(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> voters, List<BigInt> normalisedWeights})>
  getRegisteredVotersAndNormalisedWeights(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredVotersAndNormalisedWeightsFn,
      args: [rewardEpochId],
    );
    return (
      voters: (out[0]! as List).cast<EthAddress>(),
      normalisedWeights: (out[1]! as List).cast<BigInt>(),
    );
  }

  /// Calls `getRegisteredVotersAndRegistrationWeights(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> voters, List<BigInt> registrationWeights})>
  getRegisteredVotersAndRegistrationWeights(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRegisteredVotersAndRegistrationWeightsFn,
      args: [rewardEpochId],
    );
    return (
      voters: (out[0]! as List).cast<EthAddress>(),
      registrationWeights: (out[1]! as List).cast<BigInt>(),
    );
  }

  /// Calls `getVoterNormalisedWeight(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVoterNormalisedWeight(
    EthAddress voter,
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterNormalisedWeightFn,
      args: [voter, rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterRegistrationWeight(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVoterRegistrationWeight(
    EthAddress voter,
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterRegistrationWeightFn,
      args: [voter, rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterWithNormalisedWeight(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({EthAddress voter, BigInt normalisedWeight})>
  getVoterWithNormalisedWeight(
    BigInt rewardEpochId,
    EthAddress signingPolicyAddress,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterWithNormalisedWeightFn,
      args: [rewardEpochId, signingPolicyAddress],
    );
    return (voter: out[0]! as EthAddress, normalisedWeight: out[1]! as BigInt);
  }

  /// Calls `getWeightsSums(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt weightsSum,
      BigInt normalisedWeightsSum,
      BigInt normalisedWeightsSumOfVotersWithPublicKeys,
    })
  >
  getWeightsSums(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getWeightsSumsFn,
      args: [rewardEpochId],
    );
    return (
      weightsSum: out[0]! as BigInt,
      normalisedWeightsSum: out[1]! as BigInt,
      normalisedWeightsSumOfVotersWithPublicKeys: out[2]! as BigInt,
    );
  }

  /// Calls `isVoterRegistered(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isVoterRegistered(EthAddress voter, BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: isVoterRegisteredFn,
      args: [voter, rewardEpochId],
    );
    return out[0]! as bool;
  }

  /// Calls `maxVoters()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxVoters() async {
    final out = await client.callFunction(
      contract: address,
      function: maxVotersFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `newSigningPolicyInitializationStartBlockNumber(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> newSigningPolicyInitializationStartBlockNumber(
    BigInt rewardEpochId,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: newSigningPolicyInitializationStartBlockNumberFn,
      args: [rewardEpochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `publicKeyRequired()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> publicKeyRequired() async {
    final out = await client.callFunction(
      contract: address,
      function: publicKeyRequiredFn,
    );
    return out[0]! as bool;
  }

  /// `BeneficiaryChilled(bytes20,uint32)`
  ///
  /// Decode a matching log with
  /// `beneficiaryChilledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent beneficiaryChilledEvent = AbiEvent(
    name: 'BeneficiaryChilled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'beneficiary',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'untilRewardEpochId',
        type: AbiType.parse('uint32'),
        indexed: false,
      ),
    ],
  );

  /// `VoterRegistered(address,uint32,address,address,address,(bytes32,bytes32),uint256,(uint8,bytes32,bytes32))`
  ///
  /// Decode a matching log with
  /// `voterRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRegisteredEvent = AbiEvent(
    name: 'VoterRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'submitAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'submitSignaturesAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'publicKey',
        type: AbiType.parse('(bytes32,bytes32)'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'registrationWeight',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
        indexed: false,
      ),
    ],
  );

  /// `VoterRemoved(address,uint32)`
  ///
  /// Decode a matching log with
  /// `voterRemovedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRemovedEvent = AbiEvent(
    name: 'VoterRemoved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint32'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    beneficiaryChilledEvent,
    voterRegisteredEvent,
    voterRemovedEvent,
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
