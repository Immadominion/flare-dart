// Builds a 21-byte FTSO feed ID from a category and a feed name.
//
// Layout: one category byte, then the UTF-8 bytes of the name, right-padded
// with zeros to 21 bytes.
//
//   dart run bin/get_feed_id.dart
import 'package:flare_network/flare_network.dart';

void main() {
  // Category 0x01 is crypto.
  final flrUsd = FeedId.crypto('FLR/USD');
  print(flrUsd.hex);
  // 0x01464c522f55534400000000000000000000000000

  // The encoding is reversible, so a feed ID read from chain can be named.
  print(flrUsd.name); // FLR/USD
  print(flrUsd.category); // FeedCategory.crypto

  for (final name in ['BTC/USD', 'ETH/USD', 'XRP/USD']) {
    print('${name.padRight(9)} ${FeedId.crypto(name).hex}');
  }
}
