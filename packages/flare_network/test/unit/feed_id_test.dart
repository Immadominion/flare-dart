import 'dart:convert';
import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

void main() {
  group('FeedId encoding', () {
    // The reference implementation, from developer-hub's get_feed_id.py:
    //   hex_name = name.encode("utf-8").hex()
    //   (category + hex_name).ljust(42, "0")
    String reference(String category, String name) =>
        '0x${(category + utf8.encode(name).map((b) => b.toRadixString(16).padLeft(2, '0')).join()).padRight(42, '0')}';

    test('matches Flare\'s Python reference byte for byte', () {
      for (final name in ['FLR/USD', 'BTC/USD', 'ETH/USD', 'XRP/USD', 'SGB/USD']) {
        expect(
          FeedId.crypto(name).hex,
          reference('01', name),
          reason: name,
        );
      }
    });

    test('produces the documented FLR/USD identifier', () {
      expect(
        FeedId.crypto('FLR/USD').hex,
        '0x01464c522f55534400000000000000000000000000',
      );
    });

    test('is always exactly 21 bytes', () {
      for (final name in ['A', 'FLR/USD', 'A' * 20]) {
        expect(FeedId.crypto(name).bytes, hasLength(21), reason: name);
      }
    });

    test('round-trips back to the original name', () {
      for (final name in ['FLR/USD', 'DOGE/USD', 'A', 'A' * 20]) {
        expect(FeedId.crypto(name).name, name, reason: name);
      }
    });

    test('exposes the category', () {
      final feed = FeedId.crypto('FLR/USD');
      expect(feed.categoryByte, 0x01);
      expect(feed.category, FeedCategory.crypto);
    });

    test('supports category bytes outside the named enum', () {
      final feed = FeedId.fromCategoryByte(0x7f, 'CUSTOM');
      expect(feed.categoryByte, 0x7f);
      // Unknown categories report null rather than guessing.
      expect(feed.category, isNull);
      expect(feed.name, 'CUSTOM');
    });

    test('rejects a name too long to fit after the category byte', () {
      // 20 bytes fit; 21 do not.
      expect(() => FeedId.crypto('A' * 20), returnsNormally);
      expect(
        () => FeedId.crypto('A' * 21),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('rejects a category byte outside a single byte', () {
      expect(
        () => FeedId.fromCategoryByte(256, 'X'),
        throwsA(isA<FlareAbiException>()),
      );
      expect(
        () => FeedId.fromCategoryByte(-1, 'X'),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('FeedId parsing', () {
    test('parses a hex identifier back into a feed', () {
      final feed =
          FeedId.parse('0x01464c522f55534400000000000000000000000000');
      expect(feed.name, 'FLR/USD');
      expect(feed, Feeds.flrUsd);
    });

    test('accepts input without a 0x prefix', () {
      expect(
        FeedId.parse('01464c522f55534400000000000000000000000000'),
        Feeds.flrUsd,
      );
    });

    test('rejects the wrong length', () {
      expect(() => FeedId.parse('0xdeadbeef'), throwsA(isA<FlareAbiException>()));
      expect(
        () => FeedId.fromBytes(Uint8List(20)),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('equality and hashCode are by value', () {
      final a = FeedId.crypto('FLR/USD');
      final b = FeedId.parse('0x01464c522f55534400000000000000000000000000');
      expect(a, b);
      expect(a.hashCode, b.hashCode);
      expect({a, b}, hasLength(1));
    });
  });

  group('FtsoFeedValue formatting', () {
    FtsoFeedValue value(int raw, int decimals) => FtsoFeedValue(
          feedId: Feeds.flrUsd,
          value: BigInt.from(raw),
          decimals: decimals,
          timestamp: 1785528109,
        );

    test('formats the four scales observed in one live call', () {
      // FLR/USD 8dp, BTC/USD 2dp, ETH/USD 3dp, XRP/USD 6dp — all from a single
      // getFeedsById response on Coston2.
      expect(value(626973, 8).toDecimalString(), '0.00626973');
      expect(value(6288717, 2).toDecimalString(), '62887.17');
      expect(value(1861608, 3).toDecimalString(), '1861.608');
      expect(value(1061849, 6).toDecimalString(), '1.061849');
    });

    test('handles zero decimals', () {
      expect(value(42, 0).toDecimalString(), '42');
    });

    test('handles negative decimals, which scale up', () {
      // `decimals` is a signed int8, so this is legal.
      expect(value(42, -2).toDecimalString(), '4200');
    });

    test('pads when the value has fewer digits than the scale', () {
      expect(value(5, 8).toDecimalString(), '0.00000005');
    });

    test('handles very large values without precision loss', () {
      final huge = FtsoFeedValue(
        feedId: Feeds.btcUsd,
        value: BigInt.parse('123456789012345678901234567890'),
        decimals: 10,
        timestamp: 0,
      );
      // A double could not represent this; the string form must still be exact.
      expect(huge.toDecimalString(), '12345678901234567890.1234567890');
    });

    test('asDouble agrees with the exact string for ordinary values', () {
      for (final (raw, dp) in [(626973, 8), (6288717, 2), (1061849, 6)]) {
        final v = value(raw, dp);
        expect(
          double.parse(v.toDecimalString()),
          closeTo(v.asDouble, v.asDouble.abs() * 1e-12 + 1e-15),
        );
      }
    });

    test('converts the timestamp to UTC', () {
      final v = value(1, 0);
      expect(v.publishedAt.isUtc, isTrue);
      expect(v.publishedAt.millisecondsSinceEpoch, 1785528109 * 1000);
    });
  });

  group('FlareChain', () {
    test('exposes the four networks with correct chain IDs', () {
      expect(FlareChain.flare.chainId, 14);
      expect(FlareChain.coston2.chainId, 114);
      expect(FlareChain.songbird.chainId, 19);
      expect(FlareChain.coston.chainId, 16);
    });

    test('looks a network up by chain ID', () {
      expect(FlareChain.fromChainId(114), FlareChain.coston2);
      expect(FlareChain.fromChainId(999), isNull);
    });

    test('flags testnets and provides faucets for them', () {
      expect(FlareChain.coston2.isTestnet, isTrue);
      expect(FlareChain.coston2.faucetUrl, isNotNull);
      expect(FlareChain.flare.isTestnet, isFalse);
      expect(FlareChain.flare.faucetUrl, isNull);
    });

    test('groups networks into the two published ABI profiles', () {
      // Verified against artifacts 0.1.52: the Flare and Coston2 ABI sets are
      // byte-identical, as are Songbird and Coston.
      expect(FlareChain.flare.abiProfile, AbiProfile.flare);
      expect(FlareChain.coston2.abiProfile, AbiProfile.flare);
      expect(FlareChain.songbird.abiProfile, AbiProfile.songbird);
      expect(FlareChain.coston.abiProfile, AbiProfile.songbird);
    });

    test('withRpcUrl overrides only the endpoint', () {
      final custom = FlareChain.coston2.withRpcUrl('https://private.example');
      expect(custom.rpcUrl, 'https://private.example');
      expect(custom.chainId, FlareChain.coston2.chainId);
      expect(custom.name, FlareChain.coston2.name);
    });
  });

  group('ContractRegistry', () {
    test('hardcodes the one address that is stable across all networks', () {
      expect(
        ContractRegistry.address,
        EthAddress.parse('0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019'),
      );
    });

    test('the registry ABI produces the expected selector', () {
      // Cross-checked with `cast sig "getContractAddressByName(string)"`.
      expect(
        ContractRegistry.getContractAddressByName.selectorHex,
        '0x82760fca',
      );
    });
  });
}
