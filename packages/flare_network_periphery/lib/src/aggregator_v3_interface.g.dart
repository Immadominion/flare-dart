// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: AggregatorV3Interface
// Functions: 5 — 5 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `AggregatorV3Interface` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class AggregatorV3InterfaceContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const AggregatorV3InterfaceContract({
    required this.client,
    required this.address,
  });

  /// Resolves `AggregatorV3Interface` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<AggregatorV3InterfaceContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return AggregatorV3InterfaceContract(client: client, address: resolved);
  }

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `description()`.
  static final AbiFunction descriptionFn = AbiFunction(
    name: 'description',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRoundData(uint80)`.
  static final AbiFunction getRoundDataFn = AbiFunction(
    name: 'getRoundData',
    inputs: [AbiParameter(name: '_roundId', type: AbiType.parse('uint80'))],
    outputs: [
      AbiParameter(name: 'roundId', type: AbiType.parse('uint80')),
      AbiParameter(name: 'answer', type: AbiType.parse('int256')),
      AbiParameter(name: 'startedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: 'updatedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: 'answeredInRound', type: AbiType.parse('uint80')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `latestRoundData()`.
  static final AbiFunction latestRoundDataFn = AbiFunction(
    name: 'latestRoundData',
    inputs: [],
    outputs: [
      AbiParameter(name: 'roundId', type: AbiType.parse('uint80')),
      AbiParameter(name: 'answer', type: AbiType.parse('int256')),
      AbiParameter(name: 'startedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: 'updatedAt', type: AbiType.parse('uint256')),
      AbiParameter(name: 'answeredInRound', type: AbiType.parse('uint80')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `version()`.
  static final AbiFunction versionFn = AbiFunction(
    name: 'version',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `decimals()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> decimals() async {
    final out = await client.callFunction(
      contract: address,
      function: decimalsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `description()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> description() async {
    final out = await client.callFunction(
      contract: address,
      function: descriptionFn,
    );
    return out[0]! as String;
  }

  /// Calls `getRoundData(uint80)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt roundId,
      BigInt answer,
      BigInt startedAt,
      BigInt updatedAt,
      BigInt answeredInRound,
    })
  >
  getRoundData(BigInt roundId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRoundDataFn,
      args: [roundId],
    );
    return (
      roundId: out[0]! as BigInt,
      answer: out[1]! as BigInt,
      startedAt: out[2]! as BigInt,
      updatedAt: out[3]! as BigInt,
      answeredInRound: out[4]! as BigInt,
    );
  }

  /// Calls `latestRoundData()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      BigInt roundId,
      BigInt answer,
      BigInt startedAt,
      BigInt updatedAt,
      BigInt answeredInRound,
    })
  >
  latestRoundData() async {
    final out = await client.callFunction(
      contract: address,
      function: latestRoundDataFn,
    );
    return (
      roundId: out[0]! as BigInt,
      answer: out[1]! as BigInt,
      startedAt: out[2]! as BigInt,
      updatedAt: out[3]! as BigInt,
      answeredInRound: out[4]! as BigInt,
    );
  }

  /// Calls `version()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> version() async {
    final out = await client.callFunction(
      contract: address,
      function: versionFn,
    );
    return out[0]! as BigInt;
  }
}
