// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IPriceSubmitter
// Functions: 8 — 6 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IPriceSubmitter` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IPriceSubmitterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IPriceSubmitterContract({required this.client, required this.address});

  /// Resolves `IPriceSubmitter` through the [ContractRegistry].
  ///
  /// Registered as `PriceSubmitter`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IPriceSubmitterContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'PriceSubmitter',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IPriceSubmitterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCurrentRandom()`.
  static final AbiFunction getCurrentRandomFn = AbiFunction(
    name: 'getCurrentRandom',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoManager()`.
  static final AbiFunction getFtsoManagerFn = AbiFunction(
    name: 'getFtsoManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoRegistry()`.
  static final AbiFunction getFtsoRegistryFn = AbiFunction(
    name: 'getFtsoRegistry',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getRandom(uint256)`.
  static final AbiFunction getRandomFn = AbiFunction(
    name: 'getRandom',
    inputs: [AbiParameter(name: '_epochId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterWhitelister()`.
  static final AbiFunction getVoterWhitelisterFn = AbiFunction(
    name: 'getVoterWhitelister',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `revealPrices(uint256,uint256[],uint256[],uint256)`.
  static final AbiFunction revealPricesFn = AbiFunction(
    name: 'revealPrices',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_ftsoIndices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_prices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_random', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `submitHash(uint256,bytes32)`.
  static final AbiFunction submitHashFn = AbiFunction(
    name: 'submitHash',
    inputs: [
      AbiParameter(name: '_epochId', type: AbiType.parse('uint256')),
      AbiParameter(name: '_hash', type: AbiType.parse('bytes32')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `voterWhitelistBitmap(address)`.
  static final AbiFunction voterWhitelistBitmapFn = AbiFunction(
    name: 'voterWhitelistBitmap',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getCurrentRandom()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCurrentRandom() async {
    final out = await client.callFunction(
      contract: address,
      function: getCurrentRandomFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtsoManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getFtsoRegistry()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getFtsoRegistry() async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoRegistryFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getRandom(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getRandom(BigInt epochId) async {
    final out = await client.callFunction(
      contract: address,
      function: getRandomFn,
      args: [epochId],
    );
    return out[0]! as BigInt;
  }

  /// Calls `getVoterWhitelister()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterWhitelister() async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterWhitelisterFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `voterWhitelistBitmap(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> voterWhitelistBitmap(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: voterWhitelistBitmapFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `revealPrices(uint256,uint256[],uint256[],uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest revealPricesTx(
    BigInt epochId,
    List<BigInt> ftsoIndices,
    List<BigInt> prices,
    BigInt random, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: revealPricesFn,
    args: [epochId, ftsoIndices, prices, random],
    from: from,
  );

  /// Builds an unsigned `submitHash(uint256,bytes32)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest submitHashTx(
    BigInt epochId,
    Uint8List hash, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: submitHashFn,
    args: [epochId, hash],
    from: from,
  );

  /// `HashSubmitted(address,uint256,bytes32,uint256)`
  ///
  /// Decode a matching log with
  /// `hashSubmittedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent hashSubmittedEvent = AbiEvent(
    name: 'HashSubmitted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'submitter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'hash',
        type: AbiType.parse('bytes32'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `PricesRevealed(address,uint256,address[],uint256[],uint256,uint256)`
  ///
  /// Decode a matching log with
  /// `pricesRevealedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent pricesRevealedEvent = AbiEvent(
    name: 'PricesRevealed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'epochId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'ftsos',
        type: AbiType.parse('address[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'prices',
        type: AbiType.parse('uint256[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'random',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'timestamp',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    hashSubmittedEvent,
    pricesRevealedEvent,
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
