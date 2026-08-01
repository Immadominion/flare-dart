// Resolves the WNat contract address through the Flare Contract Registry.
//
// The registry is the only address worth hardcoding: it is identical on every
// Flare network, and everything else is redeployed over time.
//
//   dart run bin/coston2/make_query.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final registry = ContractRegistry(client);
    final wnat = await registry.addressOf(FlareContract.wNat);
    print('WNat address: $wnat');
  } finally {
    client.close();
  }
}
