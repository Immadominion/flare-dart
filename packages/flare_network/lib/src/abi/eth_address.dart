import 'dart:typed_data';

import 'package:meta/meta.dart';

import 'hex.dart';
import 'keccak.dart';

/// A 20-byte account or contract address.
///
/// Construction validates the EIP-55 checksum by default. Silently accepting a
/// mistyped address and then rewriting it to a valid-looking checksum is a
/// known way to lose funds, so [EthAddress.parse] rejects a mixed-case string
/// whose checksum does not verify. All-lowercase and all-uppercase input carries
/// no checksum information and is accepted.
@immutable
final class EthAddress {
  /// The raw 20 bytes.
  final Uint8List bytes;

  const EthAddress._(this.bytes);

  /// The zero address, `0x0000…0000`.
  static final EthAddress zero = EthAddress._(Uint8List(20));

  /// Parses a hex address.
  ///
  /// Throws [FormatException] if [value] is not 20 bytes, or if it is
  /// mixed-case and fails EIP-55. Pass `validateChecksum: false` only for input
  /// from a trusted machine source that you know is unchecksummed.
  factory EthAddress.parse(String value, {bool validateChecksum = true}) {
    final body = value.startsWith('0x') || value.startsWith('0X')
        ? value.substring(2)
        : value;
    if (body.length != 40) {
      throw FormatException(
        'An address must be 20 bytes (40 hex characters); got ${body.length}',
        value,
      );
    }
    final bytes = hexToBytes(body);

    final isMixedCase =
        body != body.toLowerCase() && body != body.toUpperCase();
    if (validateChecksum && isMixedCase) {
      final expected = _checksum(bytes);
      if ('0x$body' != expected) {
        throw FormatException(
          'EIP-55 checksum mismatch. Expected $expected. '
          'If this address came from an untrusted source, treat it as a typo.',
          value,
        );
      }
    }
    return EthAddress._(bytes);
  }

  /// Wraps exactly 20 bytes without any checksum considerations.
  factory EthAddress.fromBytes(Uint8List bytes) {
    if (bytes.length != 20) {
      throw ArgumentError.value(
        bytes.length,
        'bytes',
        'An address must be exactly 20 bytes',
      );
    }
    return EthAddress._(Uint8List.fromList(bytes));
  }

  /// Reads an address from a 32-byte ABI word, which stores it right-aligned.
  factory EthAddress.fromAbiWord(Uint8List word) {
    if (word.length != 32) {
      throw ArgumentError.value(
        word.length,
        'word',
        'An ABI word must be exactly 32 bytes',
      );
    }
    return EthAddress.fromBytes(Uint8List.sublistView(word, 12, 32));
  }

  static String _checksum(Uint8List bytes) {
    final lower = bytesToHex(bytes, include0x: false);
    final hash = keccak256Utf8(lower);
    final buf = StringBuffer('0x');
    for (var i = 0; i < lower.length; i++) {
      final nibble = i.isEven ? (hash[i ~/ 2] >> 4) : (hash[i ~/ 2] & 0x0f);
      final c = lower[i];
      buf.write(nibble >= 8 ? c.toUpperCase() : c);
    }
    return buf.toString();
  }

  /// This address in EIP-55 mixed-case form. Prefer this everywhere it is
  /// displayed or logged, so a corrupted value is visible rather than silent.
  String get checksummed => _checksum(bytes);

  /// This address as lowercase hex. Use for JSON-RPC parameters and map keys.
  String get hex => bytesToHex(bytes);

  /// This address right-aligned in a 32-byte ABI word.
  Uint8List toAbiWord() => padLeft32(bytes);

  bool get isZero => bytes.every((b) => b == 0);

  @override
  String toString() => checksummed;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EthAddress) return false;
    for (var i = 0; i < 20; i++) {
      if (bytes[i] != other.bytes[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hashAll(bytes);
}
