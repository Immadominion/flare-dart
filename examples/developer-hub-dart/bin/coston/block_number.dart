// Reads the latest block number from coston.
//
//   dart run bin/coston/block_number.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston);
  try {
    print(await client.getBlockNumber());
  } finally {
    client.close();
  }
}
