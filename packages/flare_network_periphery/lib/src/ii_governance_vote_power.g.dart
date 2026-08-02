// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIGovernanceVotePower
// Functions: 12 — 7 readable via eth_call, 5 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIGovernanceVotePower` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIGovernanceVotePowerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIGovernanceVotePowerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIGovernanceVotePower` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIGovernanceVotePowerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIGovernanceVotePowerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `delegate(address)`.
  static final AbiFunction delegateFn = AbiFunction(
    name: 'delegate',
    inputs: [AbiParameter(name: '_to', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getCleanupBlockNumber()`.
  static final AbiFunction getCleanupBlockNumberFn = AbiFunction(
    name: 'getCleanupBlockNumber',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAt(address,uint256)`.
  static final AbiFunction getDelegateOfAtFn = AbiFunction(
    name: 'getDelegateOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAtNow(address)`.
  static final AbiFunction getDelegateOfAtNowFn = AbiFunction(
    name: 'getDelegateOfAtNow',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ownerToken()`.
  static final AbiFunction ownerTokenFn = AbiFunction(
    name: 'ownerToken',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pChainStakeMirror()`.
  static final AbiFunction pChainStakeMirrorFn = AbiFunction(
    name: 'pChainStakeMirror',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
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

  /// ABI descriptor for `undelegate()`.
  static final AbiFunction undelegateFn = AbiFunction(
    name: 'undelegate',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `updateAtTokenTransfer(address,address,uint256,uint256,uint256)`.
  static final AbiFunction updateAtTokenTransferFn = AbiFunction(
    name: 'updateAtTokenTransfer',
    inputs: [
      AbiParameter(name: '_from', type: AbiType.parse('address')),
      AbiParameter(name: '_to', type: AbiType.parse('address')),
      AbiParameter(name: '_fromBalance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_toBalance', type: AbiType.parse('uint256')),
      AbiParameter(name: '_amount', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
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

  /// Calls `getCleanupBlockNumber()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCleanupBlockNumber() async {
    final out = await client.callFunction(
      contract: address,
      function: getCleanupBlockNumberFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDelegateOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDelegateOfAtNow(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAtNow(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtNowFn,
      args: [who],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVotes(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotes(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [who],
    );
    return out[0]! as BigInt;
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

  /// Calls `pChainStakeMirror()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> pChainStakeMirror() async {
    final out = await client.callFunction(
      contract: address,
      function: pChainStakeMirrorFn,
    );
    return out[0]! as EthAddress;
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

  /// Builds an unsigned `delegate(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateTx(EthAddress to, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: delegateFn,
        args: [to],
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

  /// Builds an unsigned `undelegate()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: undelegateFn,
        from: from,
      );

  /// Builds an unsigned `updateAtTokenTransfer(address,address,uint256,uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest updateAtTokenTransferTx(
    EthAddress from_,
    EthAddress to,
    BigInt fromBalance,
    BigInt toBalance,
    BigInt amount, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: updateAtTokenTransferFn,
    args: [from_, to, fromBalance, toBalance, amount],
    from: from,
  );

  /// `DelegateChanged(address,address,address)`
  ///
  /// Decode a matching log with
  /// `delegateChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegateChangedEvent = AbiEvent(
    name: 'DelegateChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'delegator',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'fromDelegate',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'toDelegate',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `DelegateVotesChanged(address,uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `delegateVotesChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegateVotesChangedEvent = AbiEvent(
    name: 'DelegateVotesChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'delegate',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'previousBalance',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'newBalance',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    delegateChangedEvent,
    delegateVotesChangedEvent,
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
