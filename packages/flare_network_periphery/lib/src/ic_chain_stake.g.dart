// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICChainStake
// Functions: 13 readable of 15 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `ICChainStake` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICChainStakeContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICChainStakeContract({required this.client, required this.address});

  /// Resolves `ICChainStake` through the [ContractRegistry].
  static Future<ICChainStakeContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'ICChainStake',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICChainStakeContract(client: client, address: resolved);
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

  /// ABI descriptor for `batchVotePowerOfAt(address[],uint256)`.
  static final AbiFunction batchVotePowerOfAtFn = AbiFunction(
    name: 'batchVotePowerOfAt',
    inputs: [
      AbiParameter(name: '_accounts', type: AbiType.parse('address[]')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `stakesOf(address)`.
  static final AbiFunction stakesOfFn = AbiFunction(
    name: 'stakesOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_accounts', type: AbiType.parse('address[]')),
      AbiParameter(name: '_amounts', type: AbiType.parse('uint256[]')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `stakesOfAt(address,uint256)`.
  static final AbiFunction stakesOfAtFn = AbiFunction(
    name: 'stakesOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '_accounts', type: AbiType.parse('address[]')),
      AbiParameter(name: '_amounts', type: AbiType.parse('uint256[]')),
    ],
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

  /// ABI descriptor for `totalVotePower()`.
  static final AbiFunction totalVotePowerFn = AbiFunction(
    name: 'totalVotePower',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalVotePowerAt(uint256)`.
  static final AbiFunction totalVotePowerAtFn = AbiFunction(
    name: 'totalVotePowerAt',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromTo(address,address)`.
  static final AbiFunction votePowerFromToFn = AbiFunction(
    name: 'votePowerFromTo',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_account', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromToAt(address,address,uint256)`.
  static final AbiFunction votePowerFromToAtFn = AbiFunction(
    name: 'votePowerFromToAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_account', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOf(address)`.
  static final AbiFunction votePowerOfFn = AbiFunction(
    name: 'votePowerOf',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_account', type: AbiType.parse('address')),
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

  /// Calls `batchVotePowerOfAt(address[],uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> batchVotePowerOfAt(
    List<EthAddress> accounts,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: batchVotePowerOfAtFn,
      args: [accounts, blockNumber],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `stakesOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> accounts, List<BigInt> amounts})> stakesOf(
    EthAddress owner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: stakesOfFn,
      args: [owner],
    );
    return (
      accounts: (out[0]! as List).cast<EthAddress>(),
      amounts: (out[1]! as List).cast<BigInt>(),
    );
  }

  /// Calls `stakesOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<EthAddress> accounts, List<BigInt> amounts})> stakesOfAt(
    EthAddress owner,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: stakesOfAtFn,
      args: [owner, blockNumber],
    );
    return (
      accounts: (out[0]! as List).cast<EthAddress>(),
      amounts: (out[1]! as List).cast<BigInt>(),
    );
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

  /// Calls `totalVotePower()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalVotePower() async {
    final out = await client.callFunction(
      contract: address,
      function: totalVotePowerFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `totalVotePowerAt(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalVotePowerAt(BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: totalVotePowerAtFn,
      args: [blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromTo(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromTo(EthAddress owner, EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToFn,
      args: [owner, account],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromToAt(address,address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromToAt(
    EthAddress owner,
    EthAddress account,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToAtFn,
      args: [owner, account, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOf(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfFn,
      args: [account],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(EthAddress account, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [account, blockNumber],
    );
    return out[0]! as BigInt;
  }
}
