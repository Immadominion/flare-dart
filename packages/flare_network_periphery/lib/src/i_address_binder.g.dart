// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAddressBinder
// Functions: 4 — 2 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAddressBinder` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAddressBinderContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAddressBinderContract({required this.client, required this.address});

  /// Resolves `IAddressBinder` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAddressBinderContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAddressBinderContract(client: client, address: resolved);
  }

  /// ABI descriptor for `cAddressToPAddress(address)`.
  static final AbiFunction cAddressToPAddressFn = AbiFunction(
    name: 'cAddressToPAddress',
    inputs: [AbiParameter(name: '_cAddress', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pAddressToCAddress(bytes20)`.
  static final AbiFunction pAddressToCAddressFn = AbiFunction(
    name: 'pAddressToCAddress',
    inputs: [AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20'))],
    outputs: [AbiParameter(name: '_cAddress', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `registerAddresses(bytes,bytes20,address)`.
  static final AbiFunction registerAddressesFn = AbiFunction(
    name: 'registerAddresses',
    inputs: [
      AbiParameter(name: '_publicKey', type: AbiType.parse('bytes')),
      AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_cAddress', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `registerPublicKey(bytes)`.
  static final AbiFunction registerPublicKeyFn = AbiFunction(
    name: 'registerPublicKey',
    inputs: [AbiParameter(name: '_publicKey', type: AbiType.parse('bytes'))],
    outputs: [
      AbiParameter(name: '_pAddress', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_cAddress', type: AbiType.parse('address')),
    ],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `cAddressToPAddress(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<Uint8List> cAddressToPAddress(EthAddress cAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: cAddressToPAddressFn,
      args: [cAddress],
    );
    return out[0]! as Uint8List;
  }

  /// Calls `pAddressToCAddress(bytes20)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> pAddressToCAddress(Uint8List pAddress) async {
    final out = await client.callFunction(
      contract: address,
      function: pAddressToCAddressFn,
      args: [pAddress],
    );
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `registerAddresses(bytes,bytes20,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest registerAddressesTx(
    Uint8List publicKey,
    Uint8List pAddress,
    EthAddress cAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: registerAddressesFn,
    args: [publicKey, pAddress, cAddress],
    from: from,
  );

  /// Builds an unsigned `registerPublicKey(bytes)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest registerPublicKeyTx(
    Uint8List publicKey, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: registerPublicKeyFn,
    args: [publicKey],
    from: from,
  );

  /// `AddressesRegistered(bytes,bytes20,address)`
  ///
  /// Decode a matching log with
  /// `addressesRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent addressesRegisteredEvent = AbiEvent(
    name: 'AddressesRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'publicKey',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'pAddress',
        type: AbiType.parse('bytes20'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'cAddress',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [addressesRegisteredEvent];

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
