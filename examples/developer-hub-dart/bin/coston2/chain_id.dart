// Reads the EIP-155 chain ID from coston2.
//
//   dart run bin/coston2/chain_id.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    print(await client.getChainId()); // coston2
  } finally {
    client.close();
  }
}
