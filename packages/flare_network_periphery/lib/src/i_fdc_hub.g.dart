// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IFdcHub
// Functions: 3 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IFdcHub` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IFdcHubContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IFdcHubContract({required this.client, required this.address});

  /// Resolves `IFdcHub` through the [ContractRegistry].
  ///
  /// Registered as `FdcHub`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IFdcHubContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'FdcHub',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IFdcHubContract(client: client, address: resolved);
  }

  /// ABI descriptor for `fdcInflationConfigurations()`.
  static final AbiFunction fdcInflationConfigurationsFn = AbiFunction(
    name: 'fdcInflationConfigurations',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `fdcRequestFeeConfigurations()`.
  static final AbiFunction fdcRequestFeeConfigurationsFn = AbiFunction(
    name: 'fdcRequestFeeConfigurations',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `requestsOffsetSeconds()`.
  static final AbiFunction requestsOffsetSecondsFn = AbiFunction(
    name: 'requestsOffsetSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `fdcInflationConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fdcInflationConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: fdcInflationConfigurationsFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `fdcRequestFeeConfigurations()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> fdcRequestFeeConfigurations() async {
    final out = await client.callFunction(
      contract: address,
      function: fdcRequestFeeConfigurationsFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `requestsOffsetSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> requestsOffsetSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: requestsOffsetSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// `AttestationRequest(bytes,uint256)`
  ///
  /// Decode a matching log with
  /// `attestationRequestEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent attestationRequestEvent = AbiEvent(
    name: 'AttestationRequest',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'data',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'fee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `InflationRewardsOffered(uint24,(bytes32,bytes32,uint24,uint8,uint224)[],uint256)`
  ///
  /// Decode a matching log with
  /// `inflationRewardsOfferedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent inflationRewardsOfferedEvent = AbiEvent(
    name: 'InflationRewardsOffered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'rewardEpochId',
        type: AbiType.parse('uint24'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fdcConfigurations',
        type: AbiType.parse('(bytes32,bytes32,uint24,uint8,uint224)[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'amount',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `RequestsOffsetSet(uint8)`
  ///
  /// Decode a matching log with
  /// `requestsOffsetSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent requestsOffsetSetEvent = AbiEvent(
    name: 'RequestsOffsetSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'requestsOffsetSeconds',
        type: AbiType.parse('uint8'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    attestationRequestEvent,
    inflationRewardsOfferedEvent,
    requestsOffsetSetEvent,
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
