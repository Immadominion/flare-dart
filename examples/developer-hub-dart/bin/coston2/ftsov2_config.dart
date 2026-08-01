// Inspects FTSOv2 feed configuration on Coston2: which feeds exist, what they
// cost to read, and how a feed ID maps to its on-chain index.
//
//   dart run bin/coston2/ftsov2_config.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final ftso = await FtsoV2.resolve(client);
    print('FtsoV2: ${ftso.address}');

    // Confirm rather than assume that reading is free.
    final fee = await ftso.calculateFeeByIds([Feeds.flrUsd, Feeds.btcUsd]);
    print('Fee to read 2 feeds: $fee wei');

    // Feed IDs and indices are interchangeable; the index is what the
    // block-latency read path uses internally.
    final index = await ftso.getFeedIndex(Feeds.flrUsd);
    final roundTripped = await ftso.getFeedId(index);
    print('FLR/USD -> index $index -> ${roundTripped.name}');
  } finally {
    client.close();
  }
}
