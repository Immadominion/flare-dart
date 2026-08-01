// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IICombinedNatBalance
// Functions: 4 readable of 4 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IICombinedNatBalance` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IICombinedNatBalanceContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IICombinedNatBalanceContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IICombinedNatBalance` through the [ContractRegistry].
  static Future<IICombinedNatBalanceContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'IICombinedNatBalance',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IICombinedNatBalanceContract(client: client, address: resolved);
  }

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `balanceOfAt(address,uint256)`.
  static final AbiFunction balanceOfAtFn = AbiFunction(
    name: 'balanceOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalSupply()`.
  static final AbiFunction totalSupplyFn = AbiFunction(
    name: 'totalSupply',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalSupplyAt(uint256)`.
  static final AbiFunction totalSupplyAtFn = AbiFunction(
    name: 'totalSupplyAt',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `balanceOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfFn,
      args: [owner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `balanceOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOfAt(EthAddress owner, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfAtFn,
      args: [owner, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `totalSupply()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalSupply() async {
    final out = await client.callFunction(
      contract: address,
      function: totalSupplyFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `totalSupplyAt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalSupplyAt(BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: totalSupplyAtFn,
      args: [blockNumber],
    );
    return out[0]! as BigInt;
  }
}
