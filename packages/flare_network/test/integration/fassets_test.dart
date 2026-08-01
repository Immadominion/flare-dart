@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live FAssets tests against Coston2.
///
/// FAssets wrap assets from chains without smart contracts — XRP, BTC, DOGE —
/// so they can be used in Flare DeFi. Coston2 currently deploys one:
/// FTestXRP.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;
  late FAssetsClient fassets;

  setUpAll(() async {
    client = FlareClient(FlareChain.coston2);
    fassets = await FAssetsClient.resolve(client);
  });
  tearDownAll(() => client.close());

  test('resolves the AssetManagerController through the registry', () {
    expect(fassets.controller.isZero, isFalse);
  });

  test('lists at least one deployed asset manager', () async {
    final managers = await fassets.listAssetManagers();
    expect(managers, isNotEmpty);
    for (final m in managers) {
      expect(m.isZero, isFalse);
      // Every listed manager must be one the controller acknowledges.
      expect(await fassets.assetManagerExists(m), isTrue);
    }
  });

  test('reads the FXRP token metadata', () async {
    final assets = await fassets.listAssets();
    expect(assets, isNotEmpty);

    final fxrp = assets.first;
    // The testnet deployment names the token FXRP with symbol FTestXRP.
    expect(fxrp.name, contains('XRP'));
    expect(fxrp.symbol, contains('XRP'));
    // FXRP mirrors XRP's drops, so 6 decimals.
    expect(fxrp.decimals, 6);
    expect(fxrp.token.isZero, isFalse);
    expect(fxrp.totalSupply, greaterThan(BigInt.zero));
  });

  test('formats total supply at the token\'s own scale', () async {
    final fxrp = (await fassets.listAssets()).first;
    final formatted = fxrp.totalSupplyFormatted;

    // Six decimals means exactly six digits after the point.
    expect(formatted, contains('.'));
    expect(formatted.split('.').last.length, fxrp.decimals);
    expect(double.parse(formatted), greaterThan(0));
  });

  test('reports whether the asset manager is emergency paused', () async {
    final managers = await fassets.listAssetManagers();
    // Either value is valid; the point is that it reads and decodes as a bool.
    expect(await fassets.isEmergencyPaused(managers.first), isA<bool>());
  });

  test('balanceOf decodes and never exceeds total supply', () async {
    final fxrp = (await fassets.listAssets()).first;

    // Not asserting a specific balance: 0x…0001 turned out to hold 10.1 FXRP
    // on Coston2, so "an unused address is empty" is not a safe assumption on
    // a testnet. The invariant that actually holds is the accounting one.
    for (final address in [
      '0x0000000000000000000000000000000000000001',
      '0x000000000000000000000000000000000000dEaD',
    ]) {
      final balance = await fassets.balanceOf(
        fxrp.token,
        EthAddress.parse(address, validateChecksum: false),
      );
      expect(balance, isA<BigInt>());
      expect(balance.isNegative, isFalse, reason: address);
      expect(
        balance,
        lessThanOrEqualTo(fxrp.totalSupply),
        reason: 'a single holder cannot exceed total supply',
      );
    }
  });

  test('rejects an address that is not a registered asset manager', () async {
    expect(
      await fassets.assetManagerExists(
        EthAddress.parse('0x0000000000000000000000000000000000000001'),
      ),
      isFalse,
    );
  });
}
