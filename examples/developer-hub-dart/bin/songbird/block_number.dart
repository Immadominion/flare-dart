// Reads the latest block number from songbird.
//
//   dart run bin/songbird/block_number.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.songbird);
  try {
    print(await client.getBlockNumber());
  } finally {
    client.close();
  }
}
