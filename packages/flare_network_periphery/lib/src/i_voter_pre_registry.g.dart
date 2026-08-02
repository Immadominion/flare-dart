// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVoterPreRegistry
// Functions: 4 — 3 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IVoterPreRegistry` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVoterPreRegistryContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVoterPreRegistryContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IVoterPreRegistry` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IVoterPreRegistryContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IVoterPreRegistryContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getPreRegisteredVoters(uint256)`.
  static final AbiFunction getPreRegisteredVotersFn = AbiFunction(
    name: 'getPreRegisteredVoters',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterSignature(uint256,address)`.
  static final AbiFunction getVoterSignatureFn = AbiFunction(
    name: 'getVoterSignature',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('(uint8,bytes32,bytes32)')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isVoterPreRegistered(uint256,address)`.
  static final AbiFunction isVoterPreRegisteredFn = AbiFunction(
    name: 'isVoterPreRegistered',
    inputs: [
      AbiParameter(name: '_rewardEpochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `preRegisterVoter(address,(uint8,bytes32,bytes32))`.
  static final AbiFunction preRegisterVoterFn = AbiFunction(
    name: 'preRegisterVoter',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(
        name: '_signature',
        type: AbiType.parse('(uint8,bytes32,bytes32)'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getPreRegisteredVoters(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getPreRegisteredVoters(BigInt rewardEpochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getPreRegisteredVotersFn,
      args: [rewardEpochId],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getVoterSignature(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getVoterSignature(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterSignatureFn,
      args: [rewardEpochId, voter],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `isVoterPreRegistered(uint256,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isVoterPreRegistered(
    BigInt rewardEpochId,
    EthAddress voter,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isVoterPreRegisteredFn,
      args: [rewardEpochId, voter],
    );
    return out[0]! as bool;
  }

  /// Builds an unsigned `preRegisterVoter(address,(uint8,bytes32,bytes32))`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest preRegisterVoterTx(
    EthAddress voter,
    List<Object?> signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: preRegisterVoterFn,
    args: [voter, signature],
    from: from,
  );

  /// `VoterPreRegistered(address,uint32)`
  ///
  /// Decode a matching log with
  /// `voterPreRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterPreRegisteredEvent = AbiEvent(
    name: 'VoterPreRegistered',
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

  /// `VoterRegistrationFailed(address,uint32)`
  ///
  /// Decode a matching log with
  /// `voterRegistrationFailedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRegistrationFailedEvent = AbiEvent(
    name: 'VoterRegistrationFailed',
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
    voterPreRegisteredEvent,
    voterRegistrationFailedEvent,
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
