import 'dart:typed_data';

const _hexDigits = '0123456789abcdef';

/// Encodes [bytes] as a lowercase hex string, `0x`-prefixed unless
/// [include0x] is false.
String bytesToHex(Uint8List bytes, {bool include0x = true}) {
  final buf = StringBuffer(include0x ? '0x' : '');
  for (final b in bytes) {
    buf
      ..write(_hexDigits[(b >> 4) & 0x0f])
      ..write(_hexDigits[b & 0x0f]);
  }
  return buf.toString();
}

/// Decodes a hex string, with or without a `0x` prefix.
///
/// An odd-length body is left-padded with a single `0` so that `0x1` decodes
/// as one byte rather than throwing — JSON-RPC quantities are returned in
/// minimal form and routinely have odd length.
Uint8List hexToBytes(String hex) {
  var s = hex.startsWith('0x') || hex.startsWith('0X') ? hex.substring(2) : hex;
  if (s.isEmpty) return Uint8List(0);
  if (s.length.isOdd) s = '0$s';
  final out = Uint8List(s.length ~/ 2);
  for (var i = 0; i < out.length; i++) {
    final byte = int.tryParse(s.substring(i * 2, i * 2 + 2), radix: 16);
    if (byte == null) {
      throw FormatException('Invalid hex character in "$hex"', hex, i * 2);
    }
    out[i] = byte;
  }
  return out;
}

/// Parses a JSON-RPC quantity (`0x1a`) into a [BigInt].
BigInt hexToBigInt(String hex) {
  final s =
      hex.startsWith('0x') || hex.startsWith('0X') ? hex.substring(2) : hex;
  if (s.isEmpty) return BigInt.zero;
  return BigInt.parse(s, radix: 16);
}

/// Encodes [value] as a minimal JSON-RPC quantity, e.g. `0x1a`.
///
/// Negative values are rejected: the quantity encoding has no sign, so a
/// negative input signals a bug at the call site rather than a value to encode.
String bigIntToHex(BigInt value) {
  if (value.isNegative) {
    throw ArgumentError.value(value, 'value', 'Quantities cannot be negative');
  }
  return '0x${value.toRadixString(16)}';
}

/// Left-pads [bytes] to 32 bytes, the ABI word size.
Uint8List padLeft32(Uint8List bytes) {
  if (bytes.length > 32) {
    throw ArgumentError.value(
      bytes.length,
      'bytes',
      'Cannot pad ${bytes.length} bytes into a 32-byte word',
    );
  }
  final out = Uint8List(32);
  out.setRange(32 - bytes.length, 32, bytes);
  return out;
}

/// Right-pads [bytes] to a multiple of 32 bytes, as the ABI requires for
/// `bytes`, `string` and fixed-size `bytesN`.
Uint8List padRight32(Uint8List bytes) {
  final len = ((bytes.length + 31) ~/ 32) * 32;
  final out = Uint8List(len);
  out.setRange(0, bytes.length, bytes);
  return out;
}
