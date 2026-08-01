// Reads live FTSOv2 price feeds from Flare's Coston2 testnet.
//
//   dart run example/flare_network_example.dart
//
// No account, no funds and no signing: FTSO reads go through `eth_call` and
// cost nothing.
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);

  try {
    // Confirm the endpoint really serves the network we think it does. Worth
    // doing once at startup — otherwise a wrong RPC URL surfaces much later as
    // confusing "contract not found" errors.
    await client.verifyChainId();
    print('Connected to ${client.chain} @ block ${await client.getBlockNumber()}');

    // Resolve FTSOv2 through the registry rather than hardcoding it. Flare
    // redeploys contracts; the registry is the only stable address.
    final registry = ContractRegistry(client);
    final ftso = await FtsoV2.resolve(client, registry: registry);
    print('FTSOv2 resolved to ${ftso.address}\n');

    final feeds = [Feeds.flrUsd, Feeds.btcUsd, Feeds.ethUsd, Feeds.xrpUsd];

    // Reading standard feeds is free — check rather than assume.
    final fee = await ftso.calculateFeeByIds(feeds);
    print('Read fee: $fee wei\n');

    // One call returns every feed under a single timestamp.
    final readings = await ftso.getFeedsById(feeds);
    for (final r in readings) {
      // Always print value with its own decimals: the scale differs per feed.
      print('${r.feedId.name.padRight(9)} ${r.toDecimalString().padLeft(16)}'
          '   (${r.decimals} dp)');
    }
    print('\nPublished at ${readings.first.publishedAt.toIso8601String()}');

    // Follow the feed live. Flare publishes roughly every ~2s, and the stream
    // suppresses repeats, so each event is a genuinely new publication.
    print('\nWatching FLR/USD for 3 updates...');
    var seen = 0;
    await for (final tick in ftso.watchFeeds([Feeds.flrUsd])) {
      print('  ${tick.first.publishedAt.toIso8601String()}  '
          '${tick.first.toDecimalString()}');
      if (++seen == 3) break;
    }
  } finally {
    // Always release the HTTP client, or the process will not exit.
    client.close();
  }
}
