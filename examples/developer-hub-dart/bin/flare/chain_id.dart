// Reads the EIP-155 chain ID from flare.
//
//   dart run bin/flare/chain_id.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.flare);
  try {
    print(await client.getChainId()); // flare
  } finally {
    client.close();
  }
}
