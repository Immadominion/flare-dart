// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIVoterWhitelister
// Functions: 5 readable of 13 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIVoterWhitelister` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIVoterWhitelisterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIVoterWhitelisterContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIVoterWhitelister` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIVoterWhitelisterContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIVoterWhitelisterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `chilledUntilRewardEpoch(address)`.
  static final AbiFunction chilledUntilRewardEpochFn = AbiFunction(
    name: 'chilledUntilRewardEpoch',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultMaxVotersForFtso()`.
  static final AbiFunction defaultMaxVotersForFtsoFn = AbiFunction(
    name: 'defaultMaxVotersForFtso',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProviders(uint256)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersFn = AbiFunction(
    name: 'getFtsoWhitelistedPriceProviders',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersBySymbolFn =
      AbiFunction(
        name: 'getFtsoWhitelistedPriceProvidersBySymbol',
        inputs: [AbiParameter(name: '_symbol', type: AbiType.parse('string'))],
        outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `maxVotersForFtso(uint256)`.
  static final AbiFunction maxVotersForFtsoFn = AbiFunction(
    name: 'maxVotersForFtso',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `chilledUntilRewardEpoch(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> chilledUntilRewardEpoch(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: chilledUntilRewardEpochFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `defaultMaxVotersForFtso()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultMaxVotersForFtso() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultMaxVotersForFtsoFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoWhitelistedPriceProviders(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProviders(
    BigInt ftsoIndex,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersFn,
      args: [ftsoIndex],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProvidersBySymbol(
    String symbol,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersBySymbolFn,
      args: [symbol],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `maxVotersForFtso(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxVotersForFtso(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: maxVotersForFtsoFn,
      args: [ftsoIndex],
    );
    return out[0]! as BigInt;
  }

  /// `VoterChilled(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterChilledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterChilledEvent = AbiEvent(
    name: 'VoterChilled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'untilRewardEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VoterRemovedFromWhitelist(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterRemovedFromWhitelistEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRemovedFromWhitelistEvent = AbiEvent(
    name: 'VoterRemovedFromWhitelist',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'ftsoIndex',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VoterWhitelisted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterWhitelistedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterWhitelistedEvent = AbiEvent(
    name: 'VoterWhitelisted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'ftsoIndex',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    voterChilledEvent,
    voterRemovedFromWhitelistEvent,
    voterWhitelistedEvent,
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
