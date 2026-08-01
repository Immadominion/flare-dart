// Reads FTSOv2 block-latency price feeds from Coston2.
//
// Reads are free: the getters are declared `payable` in Solidity but resolve
// through `eth_call` at no cost, so no account, funds or signing are needed.
//
//   dart run bin/coston2/ftsov2_consumer.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    // Resolve through the registry rather than hardcoding — the address in
    // some published examples is already stale.
    final ftso = await FtsoV2.resolve(client);

    final feeds = await ftso.getFeedsById([
      Feeds.flrUsd,
      Feeds.btcUsd,
      Feeds.ethUsd,
    ]);

    for (final feed in feeds) {
      // Always print value with its own decimals: the scale differs per feed.
      print('${feed.feedId.name.padRight(9)} '
          '${feed.toDecimalString().padLeft(16)}  (${feed.decimals} dp)');
    }
    print('Published at ${feeds.first.publishedAt.toIso8601String()}');
  } finally {
    client.close();
  }
}
