// Reads the latest block number from flare.
//
//   dart run bin/flare/block_number.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.flare);
  try {
    print(await client.getBlockNumber());
  } finally {
    client.close();
  }
}
