import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// The decoder's threat model is a hostile or buggy RPC endpoint. A mobile app
/// often talks to whatever endpoint it is handed, so every length and offset in
/// a response is attacker-controlled.
///
/// Each case below was a working exploit before the fix. They are pinned here
/// so a refactor cannot quietly reopen them.
void main() {
  /// A 32-byte big-endian word holding [value].
  Uint8List word(BigInt value) {
    final hex = value.toRadixString(16).padLeft(64, '0');
    return hexToBytes(hex.substring(hex.length - 64));
  }

  Uint8List concat(List<Uint8List> parts) {
    final b = BytesBuilder();
    for (final p in parts) {
      b.add(p);
    }
    return b.toBytes();
  }

  group('declared length is bounded against bytes actually received', () {
    // Before the fix, the length prefix went straight to List.filled. A
    // 64-byte response declaring a billion elements drove peak RSS to 4.5 GB;
    // 2^32 elements threw OutOfMemoryError, which is not catchable as a
    // FlareException and would take the app down.
    test('a billion-element array in 64 bytes is rejected, not allocated', () {
      final payload = concat([
        word(BigInt.from(32)), // offset to the array body
        word(BigInt.from(1000000000)), // declared element count
      ]);

      expect(
        () => AbiCodec.decodeTypes(['uint256[]'], payload),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('a 2^32-element array does not exhaust the heap', () {
      final payload = concat([word(BigInt.from(32)), word(BigInt.two.pow(32))]);

      expect(
        () => AbiCodec.decodeTypes(['uint256[]'], payload),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('the same guard covers arrays of dynamic elements', () {
      final payload = concat([
        word(BigInt.from(32)),
        word(BigInt.from(500000000)),
      ]);

      expect(
        () => AbiCodec.decodeTypes(['string[]'], payload),
        throwsA(isA<FlareAbiException>()),
      );
      expect(
        () => AbiCodec.decodeTypes(['(uint256,bytes)[]'], payload),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('an honest array still decodes', () {
      final payload = concat([
        word(BigInt.from(32)),
        word(BigInt.from(2)),
        word(BigInt.from(7)),
        word(BigInt.from(9)),
      ]);

      expect(AbiCodec.decodeTypes(['uint256[]'], payload).single, [
        BigInt.from(7),
        BigInt.from(9),
      ]);
    });
  });

  group('offsets near the int64 boundary are rejected', () {
    // `BigInt.toInt()` saturates rather than throwing, so 2^256-1 became
    // 9223372036854775807. The old guard added 32 to that, overflowed to a
    // negative, and both halves of `offset < 0 || offset + 32 > length` were
    // false — so the read went through and surfaced as a RangeError from
    // sublistView instead of a FlareAbiException.
    for (final (label, value) in <(String, BigInt)>[
      ('2^256-1', BigInt.two.pow(256) - BigInt.one),
      ('2^63-1', BigInt.two.pow(63) - BigInt.one),
      ('2^64', BigInt.two.pow(64)),
    ]) {
      test('offset $label throws FlareAbiException, not RangeError', () {
        final payload = concat([word(value), word(BigInt.from(4))]);

        expect(
          () => AbiCodec.decodeTypes(['bytes'], payload),
          throwsA(isA<FlareAbiException>()),
          reason: label,
        );
      });
    }

    test('a bytes length past the end is rejected', () {
      final payload = concat([
        word(BigInt.from(32)),
        word(BigInt.two.pow(255)), // enormous declared length
      ]);

      expect(
        () => AbiCodec.decodeTypes(['bytes'], payload),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('integers must fit their declared width', () {
    // Solidity reverts on a word that is not a correct sign extension; masking
    // it instead yields a plausible wrong number. On the FTSO path a dirty
    // `decimals` word read as -1 rather than 8 moves the reported price by
    // nine orders of magnitude.
    test('int8 rejects a word carrying bits above the width', () {
      // 0x…00ff is 255, which is not a valid int8. Masking gave -1.
      expect(
        () => AbiCodec.decodeTypes(['int8'], word(BigInt.from(255))),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('uint8 rejects a word larger than 8 bits', () {
      expect(
        () => AbiCodec.decodeTypes(['uint8'], word(BigInt.from(256))),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('int8 accepts a correctly sign-extended negative', () {
      // -1 as int8 is 0xff…ff across the whole word.
      final minusOne = word(BigInt.two.pow(256) - BigInt.one);
      expect(AbiCodec.decodeTypes(['int8'], minusOne).single, BigInt.from(-1));
    });

    test('int8 accepts its full legal range', () {
      for (var v = -128; v <= 127; v++) {
        final encoded = AbiCodec.encodeTypes(['int8'], [BigInt.from(v)]);
        expect(
          AbiCodec.decodeTypes(['int8'], encoded).single,
          BigInt.from(v),
          reason: 'int8 $v',
        );
      }
    });

    test('a partially sign-extended negative is rejected', () {
      // Sign bit set for int8, but the upper bytes are zero rather than 0xff.
      expect(
        () => AbiCodec.decodeTypes(['int8'], word(BigInt.from(0x80))),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('uint256 still accepts the full range', () {
      final max = BigInt.two.pow(256) - BigInt.one;
      expect(AbiCodec.decodeTypes(['uint256'], word(max)).single, max);
    });

    test('the honest FTSO decimals word still decodes', () {
      // The real shape: (uint256 value, int8 decimals, uint64 timestamp).
      final payload = concat([
        word(BigInt.from(626973)),
        word(BigInt.from(8)),
        word(BigInt.from(1785528109)),
      ]);
      final out = AbiCodec.decodeTypes(['uint256', 'int8', 'uint64'], payload);
      expect(out[0], BigInt.from(626973));
      expect(out[1], BigInt.from(8));
      expect(out[2], BigInt.from(1785528109));
    });
  });

  group('nothing escapes the sealed exception hierarchy', () {
    // README and ARCHITECTURE both promise that a switch over FlareException
    // is exhaustive. A raw RangeError or FormatException from a malformed
    // response would silently break that for every caller — and
    // flare_pulse's error handler does exactly
    // `error is FlareException ? error.message : '$error'`.
    test('invalid UTF-8 in a string surfaces as FlareAbiException', () {
      final payload = concat([
        word(BigInt.from(32)),
        word(BigInt.from(4)),
        hexToBytes('0xfffefdfc${'00' * 28}'),
      ]);

      expect(
        () => AbiCodec.decodeTypes(['string'], payload),
        throwsA(isA<FlareException>()),
      );
    });

    test('every hostile vector throws a FlareException, never a raw error', () {
      final vectors = <String, Uint8List>{
        'huge offset': concat([
          word(BigInt.two.pow(256) - BigInt.one),
          word(BigInt.from(4)),
        ]),
        'huge length': concat([
          word(BigInt.from(32)),
          word(BigInt.two.pow(200)),
        ]),
        'truncated': Uint8List(8),
        'bad int8': word(BigInt.from(255)),
      };

      vectors.forEach((label, payload) {
        for (final type in ['bytes', 'string', 'uint256[]', 'int8']) {
          try {
            AbiCodec.decodeTypes([type], payload);
          } on FlareException {
            // Expected.
          } catch (e) {
            fail('$label as $type escaped as ${e.runtimeType}: $e');
          }
        }
      });
    });
  });

  group('truncated payloads', () {
    test('a short word is reported as truncated', () {
      expect(
        () => AbiCodec.decodeTypes(['uint256'], Uint8List(16)),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('empty data for a declared output is reported', () {
      expect(
        () => AbiCodec.decodeTypes(['uint256'], Uint8List(0)),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });
}
