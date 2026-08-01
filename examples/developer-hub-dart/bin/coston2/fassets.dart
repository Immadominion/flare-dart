// Reads FAssets on Coston2 — Flare's trustless wrappers for assets from chains
// without smart contracts (XRP, BTC, DOGE).
//
// Minting requires signing a payment on the underlying chain, which this SDK
// does not do. Everything below is a free read.
//
//   dart run bin/coston2/fassets.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final fassets = await FAssetsClient.resolve(client);
    print('AssetManagerController: ${fassets.controller}\n');

    final assets = await fassets.listAssets();
    print('${assets.length} FAsset(s) deployed on ${client.chain.name}:\n');

    for (final asset in assets) {
      final paused = await fassets.isEmergencyPaused(asset.assetManager);
      print('  ${asset.symbol}  (${asset.name})');
      print('    token         : ${asset.token}');
      print('    asset manager : ${asset.assetManager}');
      print('    decimals      : ${asset.decimals}');
      print('    total minted  : ${asset.totalSupplyFormatted}');
      print('    paused        : $paused');
    }
  } finally {
    client.close();
  }
}
