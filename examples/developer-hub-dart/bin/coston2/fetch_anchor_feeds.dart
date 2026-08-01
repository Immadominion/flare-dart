// Fetches Scaling anchor feeds with their Merkle proofs from the Data
// Availability Layer on Coston2.
//
// Anchor feeds are published every 90 seconds by ~100 independent data
// providers. Only a commitment lives on chain; the DA Layer serves the body
// plus the proof that authenticates it against the on-chain Merkle root.
//
//   dart run bin/coston2/fetch_anchor_feeds.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final da = DaLayerClient(FlareChain.coston2);
  try {
    final status = await da.getStatus();
    print('Active voting round : ${status.activeVotingRoundId}');
    print('Latest FTSO round   : ${status.latestFtsoVotingRoundId}');
    print('');

    final feeds = await da.getAnchorFeedsWithProof([
      Feeds.flrUsd,
      Feeds.btcUsd,
    ]);

    for (final feed in feeds) {
      print(
        '${feed.feedId.name.padRight(9)} '
        '${feed.toDecimalString().padLeft(16)}  (${feed.decimals} dp)',
      );
      print('  round   : ${feed.votingRoundId}');
      print('  turnout : ${feed.turnoutPercent.toStringAsFixed(2)}%');
      print(
        '  proof   : ${feed.proof.length} nodes, '
        'root path starts ${bytesToHex(feed.proof.first).substring(0, 18)}…',
      );
    }

    // Anchor decimals are not the same as block-latency decimals for the same
    // pair — they are different products. Never carry a scale across.
  } finally {
    da.close();
  }
}
