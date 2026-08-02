// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICChainVotePower
// Functions: 11 — 9 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ICChainVotePower` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICChainVotePowerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICChainVotePowerContract({required this.client, required this.address});

  /// Resolves `ICChainVotePower` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ICChainVotePowerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICChainVotePowerContract(client: client, address: resolved);
  }

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

  /// `VotePowerCacheCreated(address,uint256)`
  ///
  /// Decode a matching log with
  /// `votePowerCacheCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent votePowerCacheCreatedEvent = AbiEvent(
    name: 'VotePowerCacheCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'blockNumber',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VotePowerChanged(address,address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `votePowerChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent votePowerChangedEvent = AbiEvent(
    name: 'VotePowerChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'account',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'priorVotePower',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'newVotePower',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    votePowerCacheCreatedEvent,
    votePowerChangedEvent,
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
