import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/digests/keccak.dart';

/// Keccak-256, the hash Ethereum and Flare use for function selectors,
/// event topics and address checksums.
///
/// This is the original Keccak padding, **not** the NIST SHA3-256 variant.
/// The two produce different digests for the same input, and using SHA3-256
/// here would yield selectors that no contract responds to.
Uint8List keccak256(Uint8List input) =>
    (KeccakDigest(256)..reset()).process(input);

/// Keccak-256 over the UTF-8 encoding of [input].
Uint8List keccak256Utf8(String input) =>
    keccak256(Uint8List.fromList(utf8.encode(input)));

/// The 4-byte selector for a canonical function signature such as
/// `getFeedsById(bytes21[])`.
///
/// [signature] must already be canonical: no parameter names, no spaces, and
/// aliases resolved (`uint` written as `uint256`). Use
/// [AbiFunction.canonicalSignature] rather than hand-writing these.
Uint8List functionSelector(String signature) =>
    Uint8List.sublistView(keccak256Utf8(signature), 0, 4);
