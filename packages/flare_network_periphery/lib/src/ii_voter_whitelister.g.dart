// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIVoterWhitelister
// Functions: 13 — 5 readable via eth_call, 8 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIVoterWhitelister` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIVoterWhitelisterContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIVoterWhitelisterContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIVoterWhitelister` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIVoterWhitelisterContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIVoterWhitelisterContract(client: client, address: resolved);
  }

  /// ABI descriptor for `addFtso(uint256)`.
  static final AbiFunction addFtsoFn = AbiFunction(
    name: 'addFtso',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `chillVoter(address,uint256,uint256[])`.
  static final AbiFunction chillVoterFn = AbiFunction(
    name: 'chillVoter',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_noOfRewardEpochs', type: AbiType.parse('uint256')),
      AbiParameter(name: '_ftsoIndices', type: AbiType.parse('uint256[]')),
    ],
    outputs: [
      AbiParameter(name: '_removed', type: AbiType.parse('bool[]')),
      AbiParameter(name: '_untilRewardEpoch', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `chilledUntilRewardEpoch(address)`.
  static final AbiFunction chilledUntilRewardEpochFn = AbiFunction(
    name: 'chilledUntilRewardEpoch',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `defaultMaxVotersForFtso()`.
  static final AbiFunction defaultMaxVotersForFtsoFn = AbiFunction(
    name: 'defaultMaxVotersForFtso',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProviders(uint256)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersFn = AbiFunction(
    name: 'getFtsoWhitelistedPriceProviders',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  static final AbiFunction getFtsoWhitelistedPriceProvidersBySymbolFn =
      AbiFunction(
        name: 'getFtsoWhitelistedPriceProvidersBySymbol',
        inputs: [AbiParameter(name: '_symbol', type: AbiType.parse('string'))],
        outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `maxVotersForFtso(uint256)`.
  static final AbiFunction maxVotersForFtsoFn = AbiFunction(
    name: 'maxVotersForFtso',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `removeFtso(uint256)`.
  static final AbiFunction removeFtsoFn = AbiFunction(
    name: 'removeFtso',
    inputs: [AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `removeTrustedAddressFromWhitelist(address,uint256)`.
  static final AbiFunction removeTrustedAddressFromWhitelistFn = AbiFunction(
    name: 'removeTrustedAddressFromWhitelist',
    inputs: [
      AbiParameter(name: '_trustedAddress', type: AbiType.parse('address')),
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `requestFullVoterWhitelisting(address)`.
  static final AbiFunction requestFullVoterWhitelistingFn = AbiFunction(
    name: 'requestFullVoterWhitelisting',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_supportedIndices', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_success', type: AbiType.parse('bool[]')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `requestWhitelistingVoter(address,uint256)`.
  static final AbiFunction requestWhitelistingVoterFn = AbiFunction(
    name: 'requestWhitelistingVoter',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDefaultMaxVotersForFtso(uint256)`.
  static final AbiFunction setDefaultMaxVotersForFtsoFn = AbiFunction(
    name: 'setDefaultMaxVotersForFtso',
    inputs: [
      AbiParameter(
        name: '_defaultMaxVotersForFtso',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setMaxVotersForFtso(uint256,uint256)`.
  static final AbiFunction setMaxVotersForFtsoFn = AbiFunction(
    name: 'setMaxVotersForFtso',
    inputs: [
      AbiParameter(name: '_ftsoIndex', type: AbiType.parse('uint256')),
      AbiParameter(name: '_newMaxVoters', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `chilledUntilRewardEpoch(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> chilledUntilRewardEpoch(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: chilledUntilRewardEpochFn,
      args: [voter],
    );
    return out[0]! as BigInt;
  }

  /// Calls `defaultMaxVotersForFtso()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> defaultMaxVotersForFtso() async {
    final out = await client.callFunction(
      contract: address,
      function: defaultMaxVotersForFtsoFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getFtsoWhitelistedPriceProviders(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProviders(
    BigInt ftsoIndex,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersFn,
      args: [ftsoIndex],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `getFtsoWhitelistedPriceProvidersBySymbol(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> getFtsoWhitelistedPriceProvidersBySymbol(
    String symbol,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getFtsoWhitelistedPriceProvidersBySymbolFn,
      args: [symbol],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Calls `maxVotersForFtso(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> maxVotersForFtso(BigInt ftsoIndex) async {
    final out = await client.callFunction(
      contract: address,
      function: maxVotersForFtsoFn,
      args: [ftsoIndex],
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `addFtso(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest addFtsoTx(BigInt ftsoIndex, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: addFtsoFn,
        args: [ftsoIndex],
        from: from,
      );

  /// Builds an unsigned `chillVoter(address,uint256,uint256[])`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest chillVoterTx(
    EthAddress voter,
    BigInt noOfRewardEpochs,
    List<BigInt> ftsoIndices, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: chillVoterFn,
    args: [voter, noOfRewardEpochs, ftsoIndices],
    from: from,
  );

  /// Builds an unsigned `removeFtso(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest removeFtsoTx(BigInt ftsoIndex, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: removeFtsoFn,
        args: [ftsoIndex],
        from: from,
      );

  /// Builds an unsigned `removeTrustedAddressFromWhitelist(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest removeTrustedAddressFromWhitelistTx(
    EthAddress trustedAddress,
    BigInt ftsoIndex, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: removeTrustedAddressFromWhitelistFn,
    args: [trustedAddress, ftsoIndex],
    from: from,
  );

  /// Builds an unsigned `requestFullVoterWhitelisting(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest requestFullVoterWhitelistingTx(
    EthAddress voter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: requestFullVoterWhitelistingFn,
    args: [voter],
    from: from,
  );

  /// Builds an unsigned `requestWhitelistingVoter(address,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest requestWhitelistingVoterTx(
    EthAddress voter,
    BigInt ftsoIndex, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: requestWhitelistingVoterFn,
    args: [voter, ftsoIndex],
    from: from,
  );

  /// Builds an unsigned `setDefaultMaxVotersForFtso(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDefaultMaxVotersForFtsoTx(
    BigInt defaultMaxVotersForFtso, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDefaultMaxVotersForFtsoFn,
    args: [defaultMaxVotersForFtso],
    from: from,
  );

  /// Builds an unsigned `setMaxVotersForFtso(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setMaxVotersForFtsoTx(
    BigInt ftsoIndex,
    BigInt newMaxVoters, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setMaxVotersForFtsoFn,
    args: [ftsoIndex, newMaxVoters],
    from: from,
  );

  /// `VoterChilled(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterChilledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterChilledEvent = AbiEvent(
    name: 'VoterChilled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'untilRewardEpoch',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VoterRemovedFromWhitelist(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterRemovedFromWhitelistEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterRemovedFromWhitelistEvent = AbiEvent(
    name: 'VoterRemovedFromWhitelist',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'ftsoIndex',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `VoterWhitelisted(address,uint256)`
  ///
  /// Decode a matching log with
  /// `voterWhitelistedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent voterWhitelistedEvent = AbiEvent(
    name: 'VoterWhitelisted',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'ftsoIndex',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    voterChilledEvent,
    voterRemovedFromWhitelistEvent,
    voterWhitelistedEvent,
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
