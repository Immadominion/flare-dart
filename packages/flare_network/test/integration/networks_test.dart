@Tags(['mainnet'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Cross-network tests covering Flare mainnet, Songbird and Coston as well as
/// Coston2.
///
/// The SDK claims all four networks work; this is what makes that claim
/// falsifiable. Songbird and Coston are especially worth covering because they
/// ship a different ABI set — 105 contracts rather than 112, missing the seven
/// P-chain ones.
///
/// Tagged `mainnet` because these hit production endpoints and are slower.
/// Run with: `dart test -P mainnet`
void main() {
  for (final chain in FlareChain.values) {
    group(chain.name, () {
      late FlareClient client;

      setUpAll(() => client = FlareClient(chain));
      tearDownAll(() => client.close());

      test('reports the expected chain ID', () async {
        expect(await client.getChainId(), chain.chainId);
      });

      test('has advanced past genesis', () async {
        expect(await client.getBlockNumber(), greaterThan(BigInt.zero));
      });

      test(
        'hosts the registry at the same address as every other network',
        () async {
          // The single hardcoded address in this SDK. If it ever differs on one
          // network, that assumption collapses and this test is how we find out.
          expect(await client.isContract(ContractRegistry.address), isTrue);
        },
      );

      test('resolves WNat, whose address differs per network', () async {
        final wnat = await ContractRegistry(
          client,
        ).addressOf(FlareContract.wNat);
        expect(wnat.isZero, isFalse);
        expect(await client.isContract(wnat), isTrue);
      });

      test('serves live FTSOv2 feeds', () async {
        final ftso = await FtsoV2.resolve(client);
        final feeds = await ftso.getFeedsById([Feeds.flrUsd, Feeds.btcUsd]);

        expect(feeds, hasLength(2));
        for (final feed in feeds) {
          expect(
            feed.value,
            greaterThan(BigInt.zero),
            reason: feed.feedId.name,
          );
        }
        // Published recently — proves the feed is live, not frozen.
        final age = DateTime.now().toUtc().difference(feeds.first.publishedAt);
        expect(age.inHours.abs(), lessThan(2));
      });

      test('suggests a priority fee above 1 gwei', () async {
        // Libraries that hardcode a 1 gwei tip under-tip on Flare by orders of
        // magnitude, and the transaction simply waits.
        expect(
          await client.getMaxPriorityFeePerGas(),
          greaterThan(BigInt.from(1000000000)),
        );
      });

      test('reports FDC voting epoch timing', () async {
        final fdc = await FdcClient.resolve(client);
        final timing = await fdc.timing();

        expect(timing.firstVotingRoundStartTs, greaterThan(1600000000));
        expect(timing.votingEpochDurationSeconds, greaterThan(0));

        // The derived round must track the contract's own view.
        final derived = await fdc.votingRoundIdAt(DateTime.now().toUtc());
        final reported = await fdc.currentVotingRoundId();
        expect((derived - reported).abs(), lessThanOrEqualTo(2));
      });
    });
  }

  group('cross-network invariants', () {
    test('WNat resolves to a different address on each network', () async {
      final addresses = <int, EthAddress>{};
      for (final chain in FlareChain.values) {
        final client = FlareClient(chain);
        addTearDown(client.close);
        addresses[chain.chainId] = await ContractRegistry(
          client,
        ).addressOf(FlareContract.wNat);
      }

      // Four distinct deployments. If two ever matched it would mean the
      // registry resolution silently fell through to the wrong network.
      expect(addresses.values.toSet(), hasLength(FlareChain.values.length));
    });

    test('mainnet FDC costs far more than testnet FDC', () async {
      final mainnet = FlareClient(FlareChain.flare);
      final testnet = FlareClient(FlareChain.coston2);
      addTearDown(mainnet.close);
      addTearDown(testnet.close);

      final mainnetFdc = await FdcClient.resolve(mainnet);
      final testnetFdc = await FdcClient.resolve(testnet);

      final mainnetFee = await mainnetFdc.getRequestFee(
        AttestationType.payment,
        AttestationSource.xrp.forChain(FlareChain.flare),
      );
      final testnetFee = await testnetFdc.getRequestFee(
        AttestationType.payment,
        AttestationSource.xrp.forChain(FlareChain.coston2),
      );

      // Measured 2026-08-01: 20 FLR on mainnet, 1000 wei on Coston2. Asserting
      // the relationship rather than the exact figures.
      expect(mainnetFee, greaterThan(testnetFee));
      expect(testnetFee, BigInt.from(1000));
    });
  });
}
