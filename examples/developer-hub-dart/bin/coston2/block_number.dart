// Reads the latest block number from coston2.
//
//   dart run bin/coston2/block_number.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    print(await client.getBlockNumber());
  } finally {
    client.close();
  }
}
