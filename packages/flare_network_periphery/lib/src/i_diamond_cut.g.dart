// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDiamondCut
// Functions: 1 — 0 readable via eth_call, 1 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IDiamondCut` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDiamondCutContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDiamondCutContract({required this.client, required this.address});

  /// Resolves `IDiamondCut` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDiamondCutContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDiamondCutContract(client: client, address: resolved);
  }

  /// ABI descriptor for `diamondCut((address,uint8,bytes4[])[],address,bytes)`.
  static final AbiFunction diamondCutFn = AbiFunction(
    name: 'diamondCut',
    inputs: [
      AbiParameter(
        name: '_diamondCut',
        type: AbiType.parse('(address,uint8,bytes4[])[]'),
      ),
      AbiParameter(name: '_init', type: AbiType.parse('address')),
      AbiParameter(name: '_calldata', type: AbiType.parse('bytes')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Builds an unsigned `diamondCut((address,uint8,bytes4[])[],address,bytes)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest diamondCutTx(
    List<List<Object?>> diamondCut,
    EthAddress init,
    Uint8List calldata, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: diamondCutFn,
    args: [diamondCut, init, calldata],
    from: from,
  );

  /// `DiamondCut((address,uint8,bytes4[])[],address,bytes)`
  ///
  /// Decode a matching log with
  /// `diamondCutEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent diamondCutEvent = AbiEvent(
    name: 'DiamondCut',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: '_diamondCut',
        type: AbiType.parse('(address,uint8,bytes4[])[]'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_init',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: '_calldata',
        type: AbiType.parse('bytes'),
        indexed: false,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [diamondCutEvent];

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
