import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

void main() {
  group('bytes32 identifier encoding', () {
    test('right-pads to 32 bytes, matching cast format-bytes32-string', () {
      // Every expected value below came from `cast format-bytes32-string`,
      // not from this implementation.
      const vectors = {
        'EVMTransaction':
            '0x45564d5472616e73616374696f6e000000000000000000000000000000000000',
        'Payment':
            '0x5061796d656e7400000000000000000000000000000000000000000000000000',
        'testXRP':
            '0x7465737458525000000000000000000000000000000000000000000000000000',
        'PublicWeb2':
            '0x5075626c69635765623200000000000000000000000000000000000000000000',
      };

      vectors.forEach((input, expected) {
        expect(bytes32Hex(input), expected, reason: input);
        // 0x plus 64 hex characters — a stray digit here silently shifts the
        // whole encoded pair.
        expect(bytes32Hex(input).length, 66, reason: input);
      });
    });

    test('encodes each attestation type to 32 bytes', () {
      for (final type in AttestationType.values) {
        expect(type.encoded, hasLength(32), reason: type.id);
      }
    });

    test('encodes a type and source pair as 64 bytes', () {
      final data = encodeTypeAndSource(
        AttestationType.payment,
        const AttestationSource('testXRP'),
      );
      // getRequestFee(bytes) expects two concatenated bytes32 values.
      expect(data, hasLength(64));
      expect(data.sublist(0, 32), AttestationType.payment.encoded);
    });

    test('rejects an identifier longer than 32 bytes', () {
      expect(() => bytes32Hex('A' * 33), throwsA(isA<FlareAbiException>()));
    });
  });

  group('AttestationSource network naming', () {
    // Verified live on 2026-08-01: Coston2 accepts testXRP/testBTC/testETH at
    // 1000 wei and reverts on the bare mainnet names.
    test('prefixes testnet sources with "test"', () {
      expect(AttestationSource.xrp.forChain(FlareChain.coston2).id, 'testXRP');
      expect(AttestationSource.btc.forChain(FlareChain.coston).id, 'testBTC');
      expect(AttestationSource.eth.forChain(FlareChain.coston2).id, 'testETH');
    });

    test('uses bare names on production networks', () {
      expect(AttestationSource.xrp.forChain(FlareChain.flare).id, 'XRP');
      expect(AttestationSource.sgb.forChain(FlareChain.songbird).id, 'SGB');
    });

    test('exposes explicit mainnet and testnet variants', () {
      expect(AttestationSource.doge.mainnet.id, 'DOGE');
      expect(AttestationSource.doge.testnet.id, 'testDOGE');
    });

    test('PublicWeb2 is the same on every network', () {
      // Web2Json is not chain-specific, so it has no test- variant.
      expect(AttestationSource.publicWeb2.id, 'PublicWeb2');
    });

    test('equality is by identifier', () {
      expect(
        AttestationSource.xrp.forChain(FlareChain.coston2),
        const AttestationSource('testXRP'),
      );
    });
  });

  group('VotingEpochTiming', () {
    // Values read live from ProtocolsV2 on both Coston2 and Flare mainnet.
    const timing = VotingEpochTiming(
      firstVotingRoundStartTs: 1658430000,
      votingEpochDurationSeconds: 90,
    );

    test('derives the round covering a timestamp', () {
      expect(timing.votingRoundIdAt(1658430000), 0);
      expect(timing.votingRoundIdAt(1658430089), 0);
      expect(timing.votingRoundIdAt(1658430090), 1);
      expect(timing.votingRoundIdAt(1658430180), 2);
    });

    test('round start times invert votingRoundIdAt', () {
      for (final round in [0, 1, 1000, 1412345]) {
        final start = timing.startOf(round);
        expect(timing.votingRoundIdAtTime(start), round, reason: '$round');
      }
    });

    test('agrees with a round observed live on Coston2', () {
      // getCurrentVotingEpochId() returned 1412321 while
      // /api/v0/fsp/status reported active round 1412347 shortly after.
      final start = timing.startOf(1412321);
      expect(timing.votingRoundIdAtTime(start), 1412321);
      expect(start.isUtc, isTrue);
    });

    test('reports a zero-length epoch instead of dividing by zero', () {
      const broken = VotingEpochTiming(
        firstVotingRoundStartTs: 0,
        votingEpochDurationSeconds: 0,
      );
      expect(
        () => broken.votingRoundIdAt(100),
        throwsA(isA<FlareContractException>()),
      );
    });
  });

  group('requestAttestation calldata', () {
    test('encodes with the payable requestAttestation selector', () {
      final data = FdcClient.encodeRequestAttestation(
        hexToBytes('0xdeadbeef'),
      );
      // Selector, then an offset word, a length word, and the padded payload.
      expect(data.length, greaterThanOrEqualTo(4 + 32 * 3));
      expect(bytesToHex(data.sublist(0, 4)).length, 10);
    });
  });
}
