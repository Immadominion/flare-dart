// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IVPToken
// Functions: 23 readable of 32 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IVPToken` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IVPTokenContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IVPTokenContract({required this.client, required this.address});

  /// Resolves `IVPToken` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IVPTokenContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IVPTokenContract(client: client, address: resolved);
  }

  /// ABI descriptor for `allowance(address,address)`.
  static final AbiFunction allowanceFn = AbiFunction(
    name: 'allowance',
    inputs: [
      AbiParameter(name: 'owner', type: AbiType.parse('address')),
      AbiParameter(name: 'spender', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
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

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegatesOf(address)`.
  static final AbiFunction delegatesOfFn = AbiFunction(
    name: 'delegatesOf',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
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
      AbiParameter(name: '_who', type: AbiType.parse('address')),
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

  /// ABI descriptor for `governanceVotePower()`.
  static final AbiFunction governanceVotePowerFn = AbiFunction(
    name: 'governanceVotePower',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `name()`.
  static final AbiFunction nameFn = AbiFunction(
    name: 'name',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `readVotePowerContract()`.
  static final AbiFunction readVotePowerContractFn = AbiFunction(
    name: 'readVotePowerContract',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `symbol()`.
  static final AbiFunction symbolFn = AbiFunction(
    name: 'symbol',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
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

  /// ABI descriptor for `undelegatedVotePowerOf(address)`.
  static final AbiFunction undelegatedVotePowerOfFn = AbiFunction(
    name: 'undelegatedVotePowerOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `undelegatedVotePowerOfAt(address,uint256)`.
  static final AbiFunction undelegatedVotePowerOfAtFn = AbiFunction(
    name: 'undelegatedVotePowerOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromTo(address,address)`.
  static final AbiFunction votePowerFromToFn = AbiFunction(
    name: 'votePowerFromTo',
    inputs: [
      AbiParameter(name: '_from', type: AbiType.parse('address')),
      AbiParameter(name: '_to', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromToAt(address,address,uint256)`.
  static final AbiFunction votePowerFromToAtFn = AbiFunction(
    name: 'votePowerFromToAt',
    inputs: [
      AbiParameter(name: '_from', type: AbiType.parse('address')),
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOf(address)`.
  static final AbiFunction votePowerOfFn = AbiFunction(
    name: 'votePowerOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAtIgnoringRevocation(address,uint256)`.
  static final AbiFunction votePowerOfAtIgnoringRevocationFn = AbiFunction(
    name: 'votePowerOfAtIgnoringRevocation',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `writeVotePowerContract()`.
  static final AbiFunction writeVotePowerContractFn = AbiFunction(
    name: 'writeVotePowerContract',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `allowance(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> allowance(EthAddress owner, EthAddress spender) async {
    final out = await client.callFunction(
      contract: address,
      function: allowanceFn,
      args: [owner, spender],
    );
    return out[0]! as BigInt;
  }

  /// Calls `balanceOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOf(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfFn,
      args: [account],
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
  delegatesOf(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: delegatesOfFn,
      args: [who],
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
  delegatesOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: delegatesOfAtFn,
      args: [who, blockNumber],
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

  /// Calls `governanceVotePower()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> governanceVotePower() async {
    final out = await client.callFunction(
      contract: address,
      function: governanceVotePowerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `name()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> name() async {
    final out = await client.callFunction(contract: address, function: nameFn);
    return out[0]! as String;
  }

  /// Calls `readVotePowerContract()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> readVotePowerContract() async {
    final out = await client.callFunction(
      contract: address,
      function: readVotePowerContractFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `symbol()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> symbol() async {
    final out = await client.callFunction(
      contract: address,
      function: symbolFn,
    );
    return out[0]! as String;
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

  /// Calls `undelegatedVotePowerOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> undelegatedVotePowerOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: undelegatedVotePowerOfFn,
      args: [owner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `undelegatedVotePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> undelegatedVotePowerOfAt(
    EthAddress owner,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: undelegatedVotePowerOfAtFn,
      args: [owner, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromTo(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromTo(EthAddress from, EthAddress to) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToFn,
      args: [from, to],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromToAt(address,address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromToAt(
    EthAddress from,
    EthAddress to,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToAtFn,
      args: [from, to, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfFn,
      args: [owner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(EthAddress owner, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [owner, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAtIgnoringRevocation(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAtIgnoringRevocation(
    EthAddress owner,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtIgnoringRevocationFn,
      args: [owner, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `writeVotePowerContract()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> writeVotePowerContract() async {
    final out = await client.callFunction(
      contract: address,
      function: writeVotePowerContractFn,
    );
    return out[0]! as EthAddress;
  }
}
