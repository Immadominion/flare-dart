@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:flare_network_periphery/src/ftso_v2_interface.g.dart';
import 'package:flare_network_periphery/src/protocols_v2_interface.g.dart';
import 'package:flare_network_periphery/src/random_number_v2_interface.g.dart';
import 'package:test/test.dart';

/// Proves the *generated* bindings work against live Coston2.
///
/// `dart analyze` only proves the generated code type-checks. These prove the
/// selectors, argument encoding and return decoding are right — against real
/// contracts.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;
  late ContractRegistry registry;

  setUpAll(() {
    client = FlareClient(FlareChain.coston2);
    registry = ContractRegistry(client);
  });
  tearDownAll(() => client.close());

  group('generated FtsoV2Interface binding', () {
    late FtsoV2InterfaceContract ftso;

    setUpAll(() async {
      // The generated `resolve` defaults to the contract's own name, but this
      // interface is registered under `FtsoV2`. Overriding the registry name is
      // exactly why that parameter exists.
      final address = await registry.addressOf(FlareContract.ftsoV2);
      ftso = FtsoV2InterfaceContract(client: client, address: address);
    });

    test(
      'getFeedsById returns a named record of values, decimals, timestamp',
      () async {
        final result = await ftso.getFeedsById([
          FeedId.crypto('FLR/USD').bytes,
          FeedId.crypto('BTC/USD').bytes,
          FeedId.crypto('XRP/USD').bytes,
        ]);

        // Multi-output functions generate a NAMED record, so these read as
        // fields rather than positional $1/$2/$3.
        expect(result.values, hasLength(3));
        expect(result.decimals, hasLength(3));
        expect(result.timestamp, greaterThan(BigInt.zero));
        for (final v in result.values) {
          expect(v, greaterThan(BigInt.zero));
        }
        // The decimals-vary invariant, seen through the generated path too.
        expect(result.decimals.toSet().length, greaterThan(1));
      },
    );

    test('agrees with the hand-written FtsoV2 client on scale', () async {
      final handWritten = FtsoV2(client: client, address: ftso.address);
      final viaHand = await handWritten.getFeedById(Feeds.flrUsd);
      final viaGenerated = await ftso.getFeedById(
        FeedId.crypto('FLR/USD').bytes,
      );

      // Two independent code paths against one contract must agree on scale.
      // Values may differ by a tick between calls; decimals must not.
      expect(viaGenerated.decimals, BigInt.from(viaHand.decimals));
      expect(viaGenerated.value, greaterThan(BigInt.zero));
    });

    test('calculateFeeById reports standard feeds as free', () async {
      expect(
        await ftso.calculateFeeById(FeedId.crypto('FLR/USD').bytes),
        BigInt.zero,
      );
    });

    test('getSupportedFeedIds returns decodable 21-byte IDs', () async {
      final ids = await ftso.getSupportedFeedIds();
      expect(ids, isNotEmpty);
      // Every entry must round-trip through FeedId, which validates the
      // bytes21 array decoding end to end.
      final decoded = ids.take(5).map(FeedId.fromBytes).toList();
      for (final feed in decoded) {
        expect(feed.bytes, hasLength(21));
        expect(feed.name, isNotEmpty);
      }
    });

    test('getFtsoProtocolId returns the protocol identifier', () async {
      expect(await ftso.getFtsoProtocolId(), greaterThan(BigInt.zero));
    });
  });

  group('generated ProtocolsV2Interface binding', () {
    late ProtocolsV2InterfaceContract protocols;

    setUpAll(() async {
      final address = await registry.addressOf(FlareContract.protocolsV2);
      protocols = ProtocolsV2InterfaceContract(
        client: client,
        address: address,
      );
    });

    test(
      'exposes the voting-epoch parameters FDC round IDs derive from',
      () async {
        final start = await protocols.firstVotingRoundStartTs();
        final duration = await protocols.votingEpochDurationSeconds();

        // Read these live, never hardcode: Flare's own TypeScript example ships
        // a Coston value that is wrong for mainnet by 45 seconds.
        expect(start, greaterThan(BigInt.zero));
        expect(duration, greaterThan(BigInt.zero));
        expect(duration, lessThanOrEqualTo(BigInt.from(3600)));
      },
    );

    test(
      'the current voting epoch is consistent with wall-clock time',
      () async {
        final start = await protocols.firstVotingRoundStartTs();
        final duration = await protocols.votingEpochDurationSeconds();
        final reported = await protocols.getCurrentVotingEpochId();

        final now = BigInt.from(
          DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000,
        );
        final derived = (now - start) ~/ duration;

        // This is the exact arithmetic an FDC client uses to compute a round ID.
        // Allow a couple of epochs of slack for clock skew and block lag.
        expect((derived - reported).abs(), lessThanOrEqualTo(BigInt.from(2)));
      },
    );
  });

  group('generated RandomNumberV2Interface binding', () {
    test('returns a random number, a security flag and a timestamp', () async {
      final address = await registry.addressOf(FlareContract.randomNumberV2);
      final rng = RandomNumberV2InterfaceContract(
        client: client,
        address: address,
      );

      final result = await rng.getRandomNumber();

      // Proves mixed-type multi-output decoding: uint256, bool, uint256.
      expect(result.randomNumber, isA<BigInt>());
      expect(result.isSecureRandom, isA<bool>());
      expect(result.randomTimestamp, greaterThan(BigInt.zero));
    });
  });
}
