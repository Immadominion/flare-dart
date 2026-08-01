@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live tests against Coston2's Data Availability Layer.
///
/// The public endpoint allows only ~20 requests per window and sends no
/// `Retry-After`, so these tests are deliberately few and share one client.
/// Adding chatty tests here will rate-limit the whole file.
///
/// Run with: `dart test -P integration`
void main() {
  late DaLayerClient da;

  setUpAll(() => da = DaLayerClient(FlareChain.coston2));
  tearDownAll(() => da.close());

  test('reports protocol status with sane, related round numbers', () async {
    final status = await da.getStatus();

    expect(status.activeVotingRoundId, greaterThan(0));
    expect(status.latestFtsoVotingRoundId, greaterThan(0));
    // Finalised rounds necessarily trail the round being voted on.
    expect(
      status.latestFtsoVotingRoundId,
      lessThanOrEqualTo(status.activeVotingRoundId),
    );
    // The active round should have started recently — anchor rounds are 90s.
    final age = DateTime.now().toUtc().difference(status.activeRoundStart);
    expect(age.inMinutes.abs(), lessThan(30));
  });

  test('returns anchor feeds with Merkle proofs, in the requested order',
      () async {
    // Deliberately requested BTC-last: the API returned BTC *first* when this
    // was written, so a client trusting positional order would mislabel every
    // price. This asserts the reordering works.
    final requested = [Feeds.flrUsd, Feeds.xrpUsd, Feeds.btcUsd];
    final feeds = await da.getAnchorFeedsWithProof(requested);

    expect(feeds, hasLength(3));
    expect(
      feeds.map((f) => f.feedId.name).toList(),
      ['FLR/USD', 'XRP/USD', 'BTC/USD'],
      reason: 'results must follow the requested order, not the API order',
    );

    for (final feed in feeds) {
      expect(feed.proof, isNotEmpty, reason: '${feed.feedId.name} has no proof');
      // Every proof element is a 32-byte hash.
      for (final node in feed.proof) {
        expect(node, hasLength(32));
      }
      expect(feed.votingRoundId, greaterThan(0));
      expect(feed.turnoutBips, greaterThan(0));
      expect(feed.turnoutBips, lessThanOrEqualTo(10000));
    }

    // All feeds in one response share a voting round.
    expect(feeds.map((f) => f.votingRoundId).toSet(), hasLength(1));
  });

  test('anchor decimals are independent of block-latency decimals', () async {
    // The same feed is published by two different products at two different
    // scales. On 2026-08-01 FLR/USD was 6 dp from the DA Layer and 8 dp from
    // FTSOv2. Carrying a scale across the two is a real, silent bug.
    final client = FlareClient(FlareChain.coston2);
    addTearDown(client.close);

    final ftso = await FtsoV2.resolve(client);
    final blockLatency = await ftso.getFeedById(Feeds.flrUsd);
    final anchor = (await da.getAnchorFeedsWithProof([Feeds.flrUsd])).single;

    // Both must describe the same price to within a loose tolerance, despite
    // using different scales — that is the real invariant worth asserting.
    final a = blockLatency.asDouble;
    final b = anchor.asDouble;
    expect(a, greaterThan(0));
    expect(b, greaterThan(0));
    expect(
      (a - b).abs() / a,
      lessThan(0.2),
      reason: 'anchor $b and block-latency $a disagree beyond 20%, which '
          'suggests a decimals bug rather than normal drift',
    );
  });

  test('reports a missing feed instead of silently dropping it', () async {
    // A syntactically valid feed ID that is not a supported anchor feed.
    final bogus = FeedId.crypto('NOTAFEED/USD');
    await expectLater(
      da.getAnchorFeedsWithProof([bogus]),
      throwsA(isA<FlareException>()),
    );
  });

  test('an empty request short-circuits without a network call', () async {
    expect(await da.getAnchorFeedsWithProof([]), isEmpty);
  });

  test('rejects a network with no known DA Layer endpoint', () {
    const unknown = FlareChain(
      name: 'Nowhere',
      chainId: 999999,
      rpcUrl: 'https://example.invalid',
      explorerUrl: 'https://example.invalid',
      nativeSymbol: 'NON',
      isTestnet: true,
    );
    expect(() => DaLayerClient(unknown), throwsArgumentError);
  });
}
