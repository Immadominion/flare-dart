import 'dart:convert';
import 'dart:typed_data';

import 'package:flare_network/src/abi/hex.dart';
import 'package:flare_network/src/abi/keccak.dart';
import 'package:test/test.dart';

void main() {
  group('keccak256', () {
    // The canonical distinguishing vector: SHA3-256 of the empty string is
    // a7ffc6f8..., Keccak-256 is c5d24601.... If this test ever reports the
    // SHA3 digest, the digest constructor is wrong and every selector the SDK
    // produces will be silently invalid.
    test('empty input matches the Keccak-256 vector, not SHA3-256', () {
      expect(
        bytesToHex(keccak256(Uint8List(0))),
        '0xc5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470',
      );
    });

    test('"abc" matches the published Keccak-256 vector', () {
      expect(
        bytesToHex(keccak256Utf8('abc')),
        '0x4e03657aea45a94fc7d47ba826c8d667c0d1e6e33a64a036ec44f58fa12d6c45',
      );
    });

    test('is deterministic across repeated calls on a reused digest', () {
      final a = bytesToHex(keccak256Utf8('flare'));
      final b = bytesToHex(keccak256Utf8('flare'));
      expect(a, b);
    });
  });

  group('functionSelector', () {
    // Both selectors were produced independently by `cast sig` (Foundry) on
    // 2026-07-31 and are pinned here as an external cross-check.
    test('getFeedsById(bytes21[]) == 0x4c375745 (cross-checked with cast sig)',
        () {
      expect(bytesToHex(functionSelector('getFeedsById(bytes21[])')),
          '0x4c375745');
    });

    test('getContractAddressByName(string) == 0x82760fca', () {
      expect(
        bytesToHex(functionSelector('getContractAddressByName(string)')),
        '0x82760fca',
      );
    });

    test('transfer(address,uint256) == 0xa9059cbb (well-known ERC-20)', () {
      expect(
        bytesToHex(functionSelector('transfer(address,uint256)')),
        '0xa9059cbb',
      );
    });

    test('returns exactly 4 bytes', () {
      expect(functionSelector('totalSupply()').length, 4);
    });
  });

  group('hex', () {
    test('round-trips arbitrary bytes', () {
      final bytes = Uint8List.fromList([0, 1, 0x7f, 0x80, 0xff]);
      expect(hexToBytes(bytesToHex(bytes)), bytes);
    });

    test('accepts input with and without a 0x prefix', () {
      expect(hexToBytes('0xdead'), hexToBytes('dead'));
    });

    test('left-pads odd-length input rather than throwing', () {
      // JSON-RPC returns quantities in minimal form, so "0x1" is legal.
      expect(hexToBytes('0x1'), Uint8List.fromList([1]));
    });

    test('rejects non-hex characters with the offending offset', () {
      expect(() => hexToBytes('0xzz'), throwsFormatException);
    });

    test('decodes an empty body as zero bytes', () {
      expect(hexToBytes('0x'), isEmpty);
    });

    test('hexToBigInt parses JSON-RPC quantities', () {
      expect(hexToBigInt('0x72'), BigInt.from(114));
      expect(hexToBigInt('0x'), BigInt.zero);
    });

    test('bigIntToHex emits minimal form', () {
      expect(bigIntToHex(BigInt.from(114)), '0x72');
    });

    test('bigIntToHex rejects negatives', () {
      expect(() => bigIntToHex(BigInt.from(-1)), throwsArgumentError);
    });

    test('padLeft32 right-aligns into a 32-byte word', () {
      final padded = padLeft32(Uint8List.fromList([0xff]));
      expect(padded.length, 32);
      expect(padded[31], 0xff);
      expect(padded[30], 0);
    });

    test('padLeft32 rejects oversized input', () {
      expect(() => padLeft32(Uint8List(33)), throwsArgumentError);
    });

    test('padRight32 rounds up to a whole number of words', () {
      expect(padRight32(Uint8List(1)).length, 32);
      expect(padRight32(Uint8List(32)).length, 32);
      expect(padRight32(Uint8List(33)).length, 64);
    });

    test('padRight32 left-aligns the payload', () {
      final padded = padRight32(Uint8List.fromList(utf8.encode('hi')));
      expect(padded[0], utf8.encode('h').first);
      expect(padded[31], 0);
    });
  });
}
