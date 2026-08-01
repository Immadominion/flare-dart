// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIVPContract
// Functions: 14 readable of 23 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IIVPContract` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIVPContractContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIVPContractContract({required this.client, required this.address});

  /// Resolves `IIVPContract` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIVPContractContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIVPContractContract(client: client, address: resolved);
  }

  /// ABI descriptor for `batchVotePowerOfAt(address[],uint256)`.
  static final AbiFunction batchVotePowerOfAtFn = AbiFunction(
    name: 'batchVotePowerOfAt',
    inputs: [
      AbiParameter(name: '_owners', type: AbiType.parse('address[]')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `cleanupBlockNumber()`.
  static final AbiFunction cleanupBlockNumberFn = AbiFunction(
    name: 'cleanupBlockNumber',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegatesOf(address)`.
  static final AbiFunction delegatesOfFn = AbiFunction(
    name: 'delegatesOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_delegateAddresses',
        type: AbiType.parse('address[]'),
      ),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_count', type: AbiType.parse('uint256')),
      AbiParameter(name: '_delegationMode', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegatesOfAt(address,uint256)`.
  static final AbiFunction delegatesOfAtFn = AbiFunction(
    name: 'delegatesOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_delegateAddresses',
        type: AbiType.parse('address[]'),
      ),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_count', type: AbiType.parse('uint256')),
      AbiParameter(name: '_delegationMode', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegationModeOf(address)`.
  static final AbiFunction delegationModeOfFn = AbiFunction(
    name: 'delegationModeOf',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isReplacement()`.
  static final AbiFunction isReplacementFn = AbiFunction(
    name: 'isReplacement',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ownerToken()`.
  static final AbiFunction ownerTokenFn = AbiFunction(
    name: 'ownerToken',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `undelegatedVotePowerOf(address,uint256)`.
  static final AbiFunction undelegatedVotePowerOfFn = AbiFunction(
    name: 'undelegatedVotePowerOf',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_balance', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `undelegatedVotePowerOfAt(address,uint256,uint256)`.
  static final AbiFunction undelegatedVotePowerOfAtFn = AbiFunction(
    name: 'undelegatedVotePowerOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_balance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromTo(address,address,uint256)`.
  static final AbiFunction votePowerFromToFn = AbiFunction(
    name: 'votePowerFromTo',
    inputs: [
      AbiParameter(name: '_from', type: AbiType.parse('address')),
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_balance', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromToAt(address,address,uint256,uint256)`.
  static final AbiFunction votePowerFromToAtFn = AbiFunction(
    name: 'votePowerFromToAt',
    inputs: [
      AbiParameter(name: '_from', type: AbiType.parse('address')),
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_balance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOf(address)`.
  static final AbiFunction votePowerOfFn = AbiFunction(
    name: 'votePowerOf',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAtIgnoringRevocation(address,uint256)`.
  static final AbiFunction votePowerOfAtIgnoringRevocationFn = AbiFunction(
    name: 'votePowerOfAtIgnoringRevocation',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `batchVotePowerOfAt(address[],uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> batchVotePowerOfAt(
    List<EthAddress> owners,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: batchVotePowerOfAtFn,
      args: [owners, blockNumber],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `cleanupBlockNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> cleanupBlockNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: cleanupBlockNumberFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `delegatesOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<EthAddress> delegateAddresses,
      List<BigInt> bips,
      BigInt count,
      BigInt delegationMode,
    })
  >
  delegatesOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: delegatesOfFn,
      args: [owner],
    );
    return (
      delegateAddresses: (out[0]! as List).cast<EthAddress>(),
      bips: (out[1]! as List).cast<BigInt>(),
      count: out[2]! as BigInt,
      delegationMode: out[3]! as BigInt,
    );
  }

  /// Calls `delegatesOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<
    ({
      List<EthAddress> delegateAddresses,
      List<BigInt> bips,
      BigInt count,
      BigInt delegationMode,
    })
  >
  delegatesOfAt(EthAddress owner, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: delegatesOfAtFn,
      args: [owner, blockNumber],
    );
    return (
      delegateAddresses: (out[0]! as List).cast<EthAddress>(),
      bips: (out[1]! as List).cast<BigInt>(),
      count: out[2]! as BigInt,
      delegationMode: out[3]! as BigInt,
    );
  }

  /// Calls `delegationModeOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> delegationModeOf(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: delegationModeOfFn,
      args: [who],
    );
    return out[0]! as BigInt;
  }

  /// Calls `isReplacement()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isReplacement() async {
    final out = await client.callFunction(
      contract: address,
      function: isReplacementFn,
    );
    return out[0]! as bool;
  }

  /// Calls `ownerToken()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> ownerToken() async {
    final out = await client.callFunction(
      contract: address,
      function: ownerTokenFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `undelegatedVotePowerOf(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> undelegatedVotePowerOf(
    EthAddress owner,
    BigInt balance,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: undelegatedVotePowerOfFn,
      args: [owner, balance],
    );
    return out[0]! as BigInt;
  }

  /// Calls `undelegatedVotePowerOfAt(address,uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> undelegatedVotePowerOfAt(
    EthAddress owner,
    BigInt balance,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: undelegatedVotePowerOfAtFn,
      args: [owner, balance, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromTo(address,address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromTo(
    EthAddress from,
    EthAddress to,
    BigInt balance,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToFn,
      args: [from, to, balance],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromToAt(address,address,uint256,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromToAt(
    EthAddress from,
    EthAddress to,
    BigInt balance,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToAtFn,
      args: [from, to, balance, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOf(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfFn,
      args: [who],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAtIgnoringRevocation(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAtIgnoringRevocation(
    EthAddress who,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtIgnoringRevocationFn,
      args: [who, blockNumber],
    );
    return out[0]! as BigInt;
  }
}
