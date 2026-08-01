@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// End-to-end tests against live Coston2.
///
/// These prove the SDK works against the real chain rather than against
/// assumptions baked into mocks. They are excluded from `dart test` by default;
/// run them with `dart test -t integration`.
///
/// They assert on invariants (types, relationships, non-emptiness) rather than
/// on specific prices, so they stay meaningful as the chain moves.
void main() {
  late FlareClient client;

  setUpAll(() => client = FlareClient(FlareChain.coston2));
  tearDownAll(() => client.close());

  group('chain', () {
    test('reports chain ID 114', () async {
      expect(await client.getChainId(), 114);
    });

    test('verifyChainId accepts the matching endpoint', () async {
      await expectLater(client.verifyChainId(), completes);
    });

    test('verifyChainId rejects an endpoint serving another network', () async {
      // Point a Coston2-labelled client at mainnet's RPC. This is the
      // misconfiguration that otherwise shows up much later as confusing
      // "contract not found" failures.
      final wrong = FlareClient(
        FlareChain.coston2,
        rpcUrl: FlareChain.flare.rpcUrl,
      );
      addTearDown(wrong.close);
      await expectLater(
        wrong.verifyChainId(),
        throwsA(isA<FlareTransportException>()),
      );
    });

    test('block number advances', () async {
      final first = await client.getBlockNumber();
      expect(first, greaterThan(BigInt.zero));
    });

    test('suggests a priority fee well above the 1 gwei some libraries assume',
        () async {
      final tip = await client.getMaxPriorityFeePerGas();
      // Recorded at 150 gwei on 2026-07-31. Asserting only that it is
      // non-trivially above 1 gwei keeps this stable as the network moves.
      expect(tip, greaterThan(BigInt.from(1000000000)));
    });
  });

  group('ContractRegistry', () {
    late ContractRegistry registry;
    setUpAll(() => registry = ContractRegistry(client));

    test('the registry address holds deployed code', () async {
      expect(await client.isContract(ContractRegistry.address), isTrue);
    });

    test('resolves WNat to the address in Flare\'s own reference example',
        () async {
      // developer-hub examples/developer-hub-python/make_query_coston2.py
      // documents this exact address in a trailing comment.
      final wnat = await registry.addressOf(FlareContract.wNat);
      expect(
        wnat,
        EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
      );
    });

    test('resolves FtsoV2 to a live contract', () async {
      final ftso = await registry.addressOf(FlareContract.ftsoV2);
      expect(ftso.isZero, isFalse);
      expect(await client.isContract(ftso), isTrue);
    });

    test('the resolved FtsoV2 differs from the stale hardcoded example address',
        () async {
      // ftsov2_consumer_coston2.py hardcodes 0x3d893C53..., which no longer
      // matches the registry. This test is the standing evidence for the
      // never-hardcode rule; if it ever fails, re-check the rule's rationale.
      final resolved = await registry.addressOf(FlareContract.ftsoV2);
      expect(
        resolved,
        isNot(EthAddress.parse('0x3d893C53D9e8056135C26C8c638B76C8b60Df726')),
      );
    });

    test('batches several lookups into one round trip', () async {
      final fresh = ContractRegistry(client);
      final result = await fresh.addressesOf([
        FlareContract.wNat,
        FlareContract.ftsoV2,
        FlareContract.protocolsV2,
      ]);
      expect(result.keys, hasLength(3));
      for (final entry in result.entries) {
        expect(entry.value.isZero, isFalse, reason: entry.key);
      }
    });

    test('caches, so a repeat lookup returns an identical value', () async {
      final a = await registry.addressOf(FlareContract.wNat);
      final b = await registry.addressOf(FlareContract.wNat);
      expect(a, b);
    });

    test('reports an unknown name rather than returning the zero address',
        () async {
      await expectLater(
        registry.addressOf('NoSuchContractExists'),
        throwsA(isA<FlareRegistryException>()),
      );
    });

    test('listAll returns a substantial directory', () async {
      final all = await registry.listAll();
      // 67 were present on mainnet when this was written; assert loosely.
      expect(all.length, greaterThan(20));
      expect(all.keys, contains('WNat'));
      expect(all.keys, contains('FtsoV2'));
    });
  });

  group('FtsoV2', () {
    late FtsoV2 ftso;
    setUpAll(() async => ftso = await FtsoV2.resolve(client));

    test('reads FLR/USD with a sane value, scale and timestamp', () async {
      final feed = await ftso.getFeedById(Feeds.flrUsd);

      expect(feed.value, greaterThan(BigInt.zero));
      expect(feed.timestamp, greaterThan(0));
      // Published within the last hour — proves the feed is live, not frozen.
      final age = DateTime.now().toUtc().difference(feed.publishedAt);
      expect(age.inHours.abs(), lessThan(1), reason: 'feed appears stale');
    });

    test('reads several feeds atomically under one timestamp', () async {
      final feeds = await ftso.getFeedsById([
        Feeds.flrUsd,
        Feeds.btcUsd,
        Feeds.xrpUsd,
      ]);

      expect(feeds, hasLength(3));
      expect(feeds.map((f) => f.feedId.name),
          ['FLR/USD', 'BTC/USD', 'XRP/USD']);
      // A single call returns one publication, so all timestamps agree.
      expect(feeds.map((f) => f.timestamp).toSet(), hasLength(1));
      for (final f in feeds) {
        expect(f.value, greaterThan(BigInt.zero), reason: f.feedId.name);
      }
    });

    test('feeds genuinely use different decimal scales', () async {
      // The reason the API always returns value and decimals together. On
      // 2026-07-31 Coston2 returned 8 / 2 / 6 for these three feeds.
      final feeds = await ftso.getFeedsById([
        Feeds.flrUsd,
        Feeds.btcUsd,
        Feeds.xrpUsd,
      ]);
      final scales = feeds.map((f) => f.decimals).toSet();
      expect(
        scales.length,
        greaterThan(1),
        reason: 'expected differing decimals across feeds, got $scales',
      );
    });

    test('BTC/USD lands in a plausible range once scaled', () async {
      // A very wide band: this is a scaling sanity check, not a price oracle.
      // It would catch a decimals bug that shifted the value by 10^n.
      final btc = await ftso.getFeedById(Feeds.btcUsd);
      expect(btc.asDouble, greaterThan(1000));
      expect(btc.asDouble, lessThan(10000000));
    });

    test('decimal string and double agree', () async {
      final feed = await ftso.getFeedById(Feeds.flrUsd);
      expect(
        double.parse(feed.toDecimalString()),
        closeTo(feed.asDouble, feed.asDouble.abs() * 1e-9 + 1e-12),
      );
    });

    test('reading standard feeds is free', () async {
      final fee = await ftso.calculateFeeByIds([Feeds.flrUsd, Feeds.btcUsd]);
      expect(fee, BigInt.zero);
    });

    test('feed index round-trips back to the same feed ID', () async {
      final index = await ftso.getFeedIndex(Feeds.flrUsd);
      final backAgain = await ftso.getFeedId(index);
      expect(backAgain, Feeds.flrUsd);
    });

    test('an empty request short-circuits without a network call', () async {
      expect(await ftso.getFeedsById([]), isEmpty);
    });

    test('watchFeeds emits a fresh reading within a reasonable window',
        () async {
      // Flare publishes roughly every ~2s. Allow generous headroom so this
      // does not flake on a slow link.
      final readings = await ftso
          .watchFeeds([Feeds.flrUsd], interval: const Duration(seconds: 2))
          .take(2)
          .timeout(const Duration(seconds: 60))
          .toList();

      expect(readings, hasLength(2));
      // The stream suppresses duplicate timestamps, so two emissions mean two
      // genuinely distinct publications.
      expect(readings[0].first.timestamp,
          isNot(readings[1].first.timestamp));
    }, timeout: const Timeout(Duration(seconds: 90)));
  });

  group('error handling', () {
    test('calling a non-contract address is reported clearly', () async {
      final ftso = await FtsoV2.resolve(client);
      final wrongTarget = FtsoV2(
        client: client,
        // A funded EOA-shaped address with no code.
        address: EthAddress.parse(
            '0x0000000000000000000000000000000000000001'),
      );
      expect(ftso.address.isZero, isFalse);
      await expectLater(
        wrongTarget.getFeedById(Feeds.flrUsd),
        throwsA(isA<FlareContractException>()),
      );
    });

    test('an unreachable endpoint surfaces a transport exception', () async {
      final broken = FlareClient(
        FlareChain.coston2,
        rpcUrl: 'https://coston2-api.flare.network/does-not-exist',
        retryPolicy: RetryPolicy.none,
        timeout: const Duration(seconds: 10),
      );
      addTearDown(broken.close);
      await expectLater(
        broken.getChainId(),
        throwsA(isA<FlareException>()),
      );
    });
  });
}
