// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPChainStakeMirror
// Functions: 17 — 14 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPChainStakeMirror` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPChainStakeMirrorContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPChainStakeMirrorContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IPChainStakeMirror` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IPChainStakeMirrorContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPChainStakeMirrorContract(client: client, address: resolved);
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

  /// ABI descriptor for `batchVotePowerOfAt(bytes20[],uint256)`.
  static final AbiFunction batchVotePowerOfAtFn = AbiFunction(
    name: 'batchVotePowerOfAt',
    inputs: [
      AbiParameter(name: '_nodeIds', type: AbiType.parse('bytes20[]')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isActiveStakeMirrored(bytes32,bytes20)`.
  static final AbiFunction isActiveStakeMirroredFn = AbiFunction(
    name: 'isActiveStakeMirrored',
    inputs: [
      AbiParameter(name: '_txId', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_inputAddress', type: AbiType.parse('bytes20')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `mirrorStake((bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64),bytes32[])`.
  static final AbiFunction mirrorStakeFn = AbiFunction(
    name: 'mirrorStake',
    inputs: [
      AbiParameter(
        name: '_stakeData',
        type: AbiType.parse(
          '(bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64)',
        ),
      ),
      AbiParameter(name: '_merkleProof', type: AbiType.parse('bytes32[]')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `stakesOf(address)`.
  static final AbiFunction stakesOfFn = AbiFunction(
    name: 'stakesOf',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_nodeIds', type: AbiType.parse('bytes20[]')),
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
      AbiParameter(name: '_nodeIds', type: AbiType.parse('bytes20[]')),
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

  /// ABI descriptor for `totalVotePowerAtCached(uint256)`.
  static final AbiFunction totalVotePowerAtCachedFn = AbiFunction(
    name: 'totalVotePowerAtCached',
    inputs: [
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `votePowerFromTo(address,bytes20)`.
  static final AbiFunction votePowerFromToFn = AbiFunction(
    name: 'votePowerFromTo',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerFromToAt(address,bytes20,uint256)`.
  static final AbiFunction votePowerFromToAtFn = AbiFunction(
    name: 'votePowerFromToAt',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('address')),
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOf(bytes20)`.
  static final AbiFunction votePowerOfFn = AbiFunction(
    name: 'votePowerOf',
    inputs: [AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAt(bytes20,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `votePowerOfAtCached(bytes20,uint256)`.
  static final AbiFunction votePowerOfAtCachedFn = AbiFunction(
    name: 'votePowerOfAtCached',
    inputs: [
      AbiParameter(name: '_owner', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.nonpayable,
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

  /// Calls `batchVotePowerOfAt(bytes20[],uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> batchVotePowerOfAt(
    List<Uint8List> nodeIds,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: batchVotePowerOfAtFn,
      args: [nodeIds, blockNumber],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `isActiveStakeMirrored(bytes32,bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isActiveStakeMirrored(
    Uint8List txId,
    Uint8List inputAddress,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isActiveStakeMirroredFn,
      args: [txId, inputAddress],
    );
    return out[0]! as bool;
  }

  /// Calls `stakesOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<Uint8List> nodeIds, List<BigInt> amounts})> stakesOf(
    EthAddress owner,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: stakesOfFn,
      args: [owner],
    );
    return (
      nodeIds: (out[0]! as List).cast<Uint8List>(),
      amounts: (out[1]! as List).cast<BigInt>(),
    );
  }

  /// Calls `stakesOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({List<Uint8List> nodeIds, List<BigInt> amounts})> stakesOfAt(
    EthAddress owner,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: stakesOfAtFn,
      args: [owner, blockNumber],
    );
    return (
      nodeIds: (out[0]! as List).cast<Uint8List>(),
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

  /// Calls `votePowerFromTo(address,bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromTo(EthAddress owner, Uint8List nodeId) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToFn,
      args: [owner, nodeId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerFromToAt(address,bytes20,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerFromToAt(
    EthAddress owner,
    Uint8List nodeId,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerFromToAtFn,
      args: [owner, nodeId, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOf(bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOf(Uint8List nodeId) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfFn,
      args: [nodeId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAt(bytes20,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(Uint8List nodeId, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [nodeId, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `mirrorStake((bytes32,uint8,bytes20,bytes20,uint64,uint64,uint64),bytes32[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest mirrorStakeTx(
    List<Object?> stakeData,
    List<Uint8List> merkleProof, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: mirrorStakeFn,
    args: [stakeData, merkleProof],
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

  /// Builds an unsigned `votePowerOfAtCached(bytes20,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest votePowerOfAtCachedTx(
    Uint8List owner,
    BigInt blockNumber, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: votePowerOfAtCachedFn,
    args: [owner, blockNumber],
    from: from,
  );

  /// `MaxUpdatesPerBlockSet(uint256)`
  ///
  /// Decode a matching log with
  /// `maxUpdatesPerBlockSetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maxUpdatesPerBlockSetEvent = AbiEvent(
    name: 'MaxUpdatesPerBlockSet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'maxUpdatesPerBlock',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `StakeConfirmed(address,bytes20,bytes32,uint256,bytes32)`
  ///
  /// Decode a matching log with
  /// `stakeConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent stakeConfirmedEvent = AbiEvent(
    name: 'StakeConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'txHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'pChainTxId',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
    ],
  );

  /// `StakeEnded(address,bytes20,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `stakeEndedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent stakeEndedEvent = AbiEvent(
    name: 'StakeEnded',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'txHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `StakeRevoked(address,bytes20,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `stakeRevokedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent stakeRevokedEvent = AbiEvent(
    name: 'StakeRevoked',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'txHash',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'amountWei',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VotePowerCacheCreated(bytes20,uint256)`
  ///
  /// Decode a matching log with
  /// `votePowerCacheCreatedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent votePowerCacheCreatedEvent = AbiEvent(
    name: 'VotePowerCacheCreated',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'blockNumber',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VotePowerChanged(address,bytes20,uint256,uint256)`
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
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
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
    maxUpdatesPerBlockSetEvent,
    stakeConfirmedEvent,
    stakeEndedEvent,
    stakeRevokedEvent,
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
