// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIVPToken
// Functions: 40 — 25 readable via eth_call, 15 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIVPToken` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIVPTokenContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIVPTokenContract({required this.client, required this.address});

  /// Resolves `IIVPToken` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIVPTokenContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIVPTokenContract(client: client, address: resolved);
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

  /// ABI descriptor for `approve(address,uint256)`.
  static final AbiFunction approveFn = AbiFunction(
    name: 'approve',
    inputs: [
      AbiParameter(name: 'spender', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `batchDelegate(address[],uint256[])`.
  static final AbiFunction batchDelegateFn = AbiFunction(
    name: 'batchDelegate',
    inputs: [
      AbiParameter(name: '_delegatees', type: AbiType.parse('address[]')),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

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

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `delegate(address,uint256)`.
  static final AbiFunction delegateFn = AbiFunction(
    name: 'delegate',
    inputs: [
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_bips', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `delegateExplicit(address,uint256)`.
  static final AbiFunction delegateExplicitFn = AbiFunction(
    name: 'delegateExplicit',
    inputs: [
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `revokeDelegationAt(address,uint256)`.
  static final AbiFunction revokeDelegationAtFn = AbiFunction(
    name: 'revokeDelegationAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCleanerContract(address)`.
  static final AbiFunction setCleanerContractFn = AbiFunction(
    name: 'setCleanerContract',
    inputs: [
      AbiParameter(name: '_cleanerContract', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCleanupBlockNumber(uint256)`.
  static final AbiFunction setCleanupBlockNumberFn = AbiFunction(
    name: 'setCleanupBlockNumber',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCleanupBlockNumberManager(address)`.
  static final AbiFunction setCleanupBlockNumberManagerFn = AbiFunction(
    name: 'setCleanupBlockNumberManager',
    inputs: [
      AbiParameter(
        name: '_cleanupBlockNumberManager',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setGovernanceVotePower(address)`.
  static final AbiFunction setGovernanceVotePowerFn = AbiFunction(
    name: 'setGovernanceVotePower',
    inputs: [
      AbiParameter(
        name: '_governanceVotePower',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `totalVotePowerAtCached(uint256)`.
  static final AbiFunction totalVotePowerAtCachedFn = AbiFunction(
    name: 'totalVotePowerAtCached',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `transfer(address,uint256)`.
  static final AbiFunction transferFn = AbiFunction(
    name: 'transfer',
    inputs: [
      AbiParameter(name: 'to', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `transferFrom(address,address,uint256)`.
  static final AbiFunction transferFromFn = AbiFunction(
    name: 'transferFrom',
    inputs: [
      AbiParameter(name: 'from', type: AbiType.parse('address')),
      AbiParameter(name: 'to', type: AbiType.parse('address')),
      AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `undelegateAll()`.
  static final AbiFunction undelegateAllFn = AbiFunction(
    name: 'undelegateAll',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `undelegateAllExplicit(address[])`.
  static final AbiFunction undelegateAllExplicitFn = AbiFunction(
    name: 'undelegateAllExplicit',
    inputs: [
      AbiParameter(
        name: '_delegateAddresses',
        type: AbiType.parse('address[]'),
      ),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
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

  /// ABI descriptor for `votePowerOfAtCached(address,uint256)`.
  static final AbiFunction votePowerOfAtCachedFn = AbiFunction(
    name: 'votePowerOfAtCached',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
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

  /// Builds an unsigned `approve(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest approveTx(
    EthAddress spender,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: approveFn,
    args: [spender, amount],
    from: from,
  );

  /// Builds an unsigned `batchDelegate(address[],uint256[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest batchDelegateTx(
    List<EthAddress> delegatees,
    List<BigInt> bips, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: batchDelegateFn,
    args: [delegatees, bips],
    from: from,
  );

  /// Builds an unsigned `delegate(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateTx(
    EthAddress to,
    BigInt bips, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: delegateFn,
    args: [to, bips],
    from: from,
  );

  /// Builds an unsigned `delegateExplicit(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateExplicitTx(
    EthAddress to,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: delegateExplicitFn,
    args: [to, amount],
    from: from,
  );

  /// Builds an unsigned `revokeDelegationAt(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest revokeDelegationAtTx(
    EthAddress who,
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: revokeDelegationAtFn,
    args: [who, blockNumber],
    from: from,
  );

  /// Builds an unsigned `setCleanerContract(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCleanerContractTx(
    EthAddress cleanerContract, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCleanerContractFn,
    args: [cleanerContract],
    from: from,
  );

  /// Builds an unsigned `setCleanupBlockNumber(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCleanupBlockNumberTx(
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCleanupBlockNumberFn,
    args: [blockNumber],
    from: from,
  );

  /// Builds an unsigned `setCleanupBlockNumberManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCleanupBlockNumberManagerTx(
    EthAddress cleanupBlockNumberManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCleanupBlockNumberManagerFn,
    args: [cleanupBlockNumberManager],
    from: from,
  );

  /// Builds an unsigned `setGovernanceVotePower(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setGovernanceVotePowerTx(
    EthAddress governanceVotePower, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setGovernanceVotePowerFn,
    args: [governanceVotePower],
    from: from,
  );

  /// Builds an unsigned `totalVotePowerAtCached(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest totalVotePowerAtCachedTx(
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: totalVotePowerAtCachedFn,
    args: [blockNumber],
    from: from,
  );

  /// Builds an unsigned `transfer(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferTx(
    EthAddress to,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferFn,
    args: [to, amount],
    from: from,
  );

  /// Builds an unsigned `transferFrom(address,address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest transferFromTx(
    EthAddress from_,
    EthAddress to,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: transferFromFn,
    args: [from_, to, amount],
    from: from,
  );

  /// Builds an unsigned `undelegateAll()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateAllTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: undelegateAllFn,
        from: from,
      );

  /// Builds an unsigned `undelegateAllExplicit(address[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateAllExplicitTx(
    List<EthAddress> delegateAddresses, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: undelegateAllExplicitFn,
    args: [delegateAddresses],
    from: from,
  );

  /// Builds an unsigned `votePowerOfAtCached(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest votePowerOfAtCachedTx(
    EthAddress owner,
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: votePowerOfAtCachedFn,
    args: [owner, blockNumber],
    from: from,
  );

  /// `Approval(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvalEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvalEvent = AbiEvent(
    name: 'Approval',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'spender',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Transfer(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `transferEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferEvent = AbiEvent(
    name: 'Transfer',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'from',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'value',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [approvalEvent, transferEvent];

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
