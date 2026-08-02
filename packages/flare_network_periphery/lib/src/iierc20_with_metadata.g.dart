// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IIERC20WithMetadata
// Functions: 9 — 6 readable via eth_call, 3 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IIERC20WithMetadata` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IIERC20WithMetadataContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IIERC20WithMetadataContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IIERC20WithMetadata` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IIERC20WithMetadataContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IIERC20WithMetadataContract(client: client, address: resolved);
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

  /// ABI descriptor for `decimals()`.
  static final AbiFunction decimalsFn = AbiFunction(
    name: 'decimals',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `name()`.
  static final AbiFunction nameFn = AbiFunction(
    name: 'name',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('string'))],
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

  /// Calls `name()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<String> name() async {
    final out = await client.callFunction(contract: address, function: nameFn);
    return out[0]! as String;
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
