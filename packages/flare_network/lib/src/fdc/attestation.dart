import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/hex.dart';
import '../network/flare_chain.dart';
import '../rpc/flare_exception.dart';

/// An attestation type the Flare Data Connector can prove.
///
/// The name is encoded as a right-padded `bytes32` when talking to the FDC
/// contracts — that padding is what [encoded] produces.
enum AttestationType {
  /// A payment on an external chain.
  payment('Payment'),

  /// A transaction on an EVM chain.
  evmTransaction('EVMTransaction'),

  /// That an address is valid on a given chain.
  addressValidity('AddressValidity'),

  /// That a block at a given height exists and is confirmed.
  confirmedBlockHeightExists('ConfirmedBlockHeightExists'),

  /// That a referenced payment did *not* happen.
  referencedPaymentNonexistence('ReferencedPaymentNonexistence'),

  /// That an address's balance decreased.
  balanceDecreasingTransaction('BalanceDecreasingTransaction'),

  /// A JSON response from a public Web2 API.
  web2Json('Web2Json'),

  /// An XRP Ledger payment.
  xrpPayment('XRPPayment'),

  /// That an XRP Ledger payment did *not* happen.
  xrpPaymentNonexistence('XRPPaymentNonexistence');

  const AttestationType(this.id);

  /// The identifier as Flare spells it, e.g. `EVMTransaction`.
  final String id;

  /// The identifier as a right-padded `bytes32`.
  Uint8List get encoded => _padded32(id);

  @override
  String toString() => id;
}

/// A data source an attestation can be requested against.
///
/// **Source identifiers differ between mainnet and testnets.** Coston2 and
/// Coston expect `test`-prefixed names — `testXRP`, `testBTC`, `testETH` — while
/// Flare and Songbird expect the bare names. Calling `getRequestFee` with a
/// mainnet source on a testnet reverts with
/// *"Type and source combination not supported"*, which is a confusing way to
/// discover a naming rule. Use [AttestationSource.forChain] and let it pick.
@immutable
final class AttestationSource {
  /// The raw identifier sent on chain, e.g. `testXRP`.
  final String id;

  const AttestationSource(this.id);

  /// XRP Ledger.
  static const xrp = _SourceFamily('XRP');

  /// Bitcoin.
  static const btc = _SourceFamily('BTC');

  /// Dogecoin.
  static const doge = _SourceFamily('DOGE');

  /// Ethereum.
  static const eth = _SourceFamily('ETH');

  /// Flare.
  static const flr = _SourceFamily('FLR');

  /// Songbird.
  static const sgb = _SourceFamily('SGB');

  /// The source used by [AttestationType.web2Json].
  ///
  /// Not chain-specific: the same identifier is used on every network,
  /// verified live on Coston2.
  static const publicWeb2 = AttestationSource('PublicWeb2');

  /// The identifier as a right-padded `bytes32`.
  Uint8List get encoded => _padded32(id);

  @override
  String toString() => id;

  @override
  bool operator ==(Object other) =>
      other is AttestationSource && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

/// A chain that has different identifiers on mainnet and testnet.
///
/// Resolve it for a network with [forChain] rather than picking by hand.
@immutable
final class _SourceFamily {
  final String base;

  const _SourceFamily(this.base);

  /// The identifier for [chain]: `test`-prefixed on Coston2 and Coston, bare
  /// on Flare and Songbird.
  AttestationSource forChain(FlareChain chain) => AttestationSource(
        chain.isTestnet ? 'test$base' : base,
      );

  /// The mainnet identifier, e.g. `XRP`.
  AttestationSource get mainnet => AttestationSource(base);

  /// The testnet identifier, e.g. `testXRP`.
  AttestationSource get testnet => AttestationSource('test$base');

  @override
  String toString() => base;
}

/// Encodes a `bytes32` argument for the FDC fee and request calls.
///
/// The pair is the concatenation of the two right-padded 32-byte values, which
/// is what `getRequestFee(bytes)` expects.
Uint8List encodeTypeAndSource(
  AttestationType type,
  AttestationSource source,
) =>
    Uint8List.fromList([...type.encoded, ...source.encoded]);

Uint8List _padded32(String value) {
  final bytes = utf8.encode(value);
  if (bytes.length > 32) {
    throw FlareAbiException(
      'Identifier "$value" is ${bytes.length} bytes; bytes32 holds at most 32',
      solidityType: 'bytes32',
    );
  }
  final out = Uint8List(32)..setRange(0, bytes.length, bytes);
  return out;
}

/// A finalised attestation response with the Merkle proof that authenticates
/// it against the on-chain root.
@immutable
final class AttestationProof {
  /// The voting round the response was finalised in.
  final int votingRoundId;

  /// Ordered Merkle proof nodes.
  final List<Uint8List> proof;

  /// The ABI-encoded response body, as returned by the DA Layer.
  final Object? response;

  const AttestationProof({
    required this.votingRoundId,
    required this.proof,
    required this.response,
  });

  @override
  String toString() =>
      'AttestationProof(round $votingRoundId, ${proof.length} nodes)';
}

/// Voting round timing, read from the `ProtocolsV2` contract.
///
/// Both values must be read at runtime rather than hardcoded. They are
/// currently identical on Coston2 and Flare mainnet (1658430000 and 90 seconds,
/// verified 2026-08-01), but that is an observation, not a guarantee.
@immutable
final class VotingEpochTiming {
  /// Unix timestamp at which voting round 0 began.
  final int firstVotingRoundStartTs;

  /// Length of a voting round, in seconds.
  final int votingEpochDurationSeconds;

  const VotingEpochTiming({
    required this.firstVotingRoundStartTs,
    required this.votingEpochDurationSeconds,
  });

  /// The voting round covering [timestamp] (Unix seconds).
  int votingRoundIdAt(int timestamp) {
    if (votingEpochDurationSeconds <= 0) {
      throw const FlareContractException(
        'ProtocolsV2 reported a voting epoch duration of zero',
      );
    }
    return (timestamp - firstVotingRoundStartTs) ~/ votingEpochDurationSeconds;
  }

  /// The voting round covering [when].
  int votingRoundIdAtTime(DateTime when) =>
      votingRoundIdAt(when.toUtc().millisecondsSinceEpoch ~/ 1000);

  /// When [votingRoundId] began.
  DateTime startOf(int votingRoundId) => DateTime.fromMillisecondsSinceEpoch(
        (firstVotingRoundStartTs +
                votingRoundId * votingEpochDurationSeconds) *
            1000,
        isUtc: true,
      );

  @override
  String toString() => 'VotingEpochTiming(start $firstVotingRoundStartTs, '
      '${votingEpochDurationSeconds}s)';
}

/// Debug helper: the hex form of a right-padded `bytes32` identifier.
String bytes32Hex(String value) => bytesToHex(_padded32(value));
