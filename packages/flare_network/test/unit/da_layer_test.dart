import 'dart:convert';

import 'package:flare_network/flare_network.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// Hermetic tests for DA Layer response handling.
///
/// The payloads below are verbatim from a live Coston2 response captured on
/// 2026-08-01, so the parser is tested against the shape the API actually
/// returns rather than the shape the docs describe.
void main() {
  /// Real response body, with FLR/USD requested first but returned second —
  /// which is exactly the ordering hazard this client exists to absorb.
  const liveBody = '''
[
  {
    "body": {
      "votingRoundId": 1412345,
      "id": "0x014254432f55534400000000000000000000000000",
      "value": 6291963,
      "turnoutBIPS": 9999,
      "decimals": 2
    },
    "proof": [
      "0x818d182b049ea260fcf8aa9b05b915e3462537d927da80aa16137cb1d5f52479",
      "0x085d673a63f1e4cf2969e4349d4e677acc85d8d2d58562583254b6cdfe1f998c"
    ]
  },
  {
    "body": {
      "votingRoundId": 1412345,
      "id": "0x01464c522f55534400000000000000000000000000",
      "value": 6280,
      "turnoutBIPS": 9999,
      "decimals": 6
    },
    "proof": [
      "0x6451c6e26d98555c3b03b209eb2c710752cd8857e77dac3cc9302b367bb294e1"
    ]
  }
]
''';

  DaLayerClient clientFor(
    Future<http.Response> Function(http.Request) handler, {
    String? apiKey,
  }) =>
      DaLayerClient(
        FlareChain.coston2,
        apiKey: apiKey,
        retryPolicy: const RetryPolicy(
          maxRetries: 2,
          initialDelay: Duration.zero,
          maxDelay: Duration.zero,
        ),
        httpClient: MockClient(handler),
      );

  group('anchor feeds', () {
    test('returns results in the requested order, not the API order', () async {
      final da = clientFor((_) async => http.Response(liveBody, 200));

      // Requested FLR first; the payload has BTC first.
      final feeds = await da.getAnchorFeedsWithProof([
        Feeds.flrUsd,
        Feeds.btcUsd,
      ]);

      expect(
        feeds.map((f) => f.feedId.name).toList(),
        ['FLR/USD', 'BTC/USD'],
        reason: 'trusting positional order would mislabel every price',
      );
    });

    test('parses value, decimals, round and turnout', () async {
      final da = clientFor((_) async => http.Response(liveBody, 200));
      final flr = (await da.getAnchorFeedsWithProof([Feeds.flrUsd])).single;

      expect(flr.value, 6280);
      expect(flr.decimals, 6);
      expect(flr.votingRoundId, 1412345);
      expect(flr.turnoutBips, 9999);
      expect(flr.turnoutPercent, closeTo(99.99, 0.001));
      expect(flr.toDecimalString(), '0.006280');
    });

    test('decodes Merkle proof nodes as 32-byte hashes', () async {
      final da = clientFor((_) async => http.Response(liveBody, 200));
      final btc = (await da.getAnchorFeedsWithProof([Feeds.btcUsd])).single;

      expect(btc.proof, hasLength(2));
      for (final node in btc.proof) {
        expect(node, hasLength(32));
      }
    });

    test('reports a requested feed the API omitted', () async {
      final da = clientFor((_) async => http.Response(liveBody, 200));

      // ETH/USD is not in the payload; silently dropping it would surface much
      // later as a missing price.
      await expectLater(
        da.getAnchorFeedsWithProof([Feeds.flrUsd, Feeds.ethUsd]),
        throwsA(isA<FlareContractException>()),
      );
    });

    test('sends the feed IDs as hex in the request body', () async {
      late Map<String, Object?> sent;
      final da = clientFor((req) async {
        sent = jsonDecode(req.body) as Map<String, Object?>;
        return http.Response(liveBody, 200);
      });

      await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
      expect(sent['feed_ids'], ['0x01464c522f55534400000000000000000000000000']);
    });

    test('passes a voting round as a query parameter when given', () async {
      late Uri requested;
      final da = clientFor((req) async {
        requested = req.url;
        return http.Response(liveBody, 200);
      });

      await da.getAnchorFeedsWithProof([Feeds.flrUsd], votingRoundId: 1412345);
      expect(requested.queryParameters['voting_round_id'], '1412345');
    });

    test('an empty request makes no network call', () async {
      var called = false;
      final da = clientFor((_) async {
        called = true;
        return http.Response(liveBody, 200);
      });

      expect(await da.getAnchorFeedsWithProof([]), isEmpty);
      expect(called, isFalse);
    });
  });

  group('status', () {
    test('parses the round numbers and active round start', () async {
      const body = '{"active":{"voting_round_id":1412347,'
          '"start_timestamp":1785541230},'
          '"latest_fdc":{"voting_round_id":1412345},'
          '"latest_ftso":{"voting_round_id":1412345}}';
      final da = clientFor((_) async => http.Response(body, 200));

      final status = await da.getStatus();
      expect(status.activeVotingRoundId, 1412347);
      expect(status.latestFtsoVotingRoundId, 1412345);
      expect(status.latestFdcVotingRoundId, 1412345);
      expect(status.activeRoundStart.isUtc, isTrue);
    });
  });

  group('rate limiting', () {
    test('retries a 429 and succeeds', () async {
      var attempts = 0;
      final da = clientFor((_) async {
        attempts++;
        return attempts < 2
            ? http.Response('rate limited', 429)
            : http.Response(liveBody, 200);
      });

      await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
      expect(attempts, 2);
    });

    test('explains what to do when retries are exhausted', () async {
      final da = clientFor((_) async => http.Response('rate limited', 429));

      await expectLater(
        da.getAnchorFeedsWithProof([Feeds.flrUsd]),
        throwsA(
          isA<FlareTransportException>()
              .having((e) => e.statusCode, 'statusCode', 429)
              // The endpoint sends no Retry-After, so the message has to carry
              // the remedy itself.
              .having((e) => e.message, 'message', contains('API key')),
        ),
      );
    });

    test('sends X-API-KEY when configured', () async {
      late Map<String, String> headers;
      final da = clientFor(
        (req) async {
          headers = req.headers;
          return http.Response(liveBody, 200);
        },
        apiKey: 'secret-key',
      );

      await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
      expect(headers['X-API-KEY'], 'secret-key');
    });

    test('omits X-API-KEY when not configured', () async {
      late Map<String, String> headers;
      final da = clientFor((req) async {
        headers = req.headers;
        return http.Response(liveBody, 200);
      });

      await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
      expect(headers.keys.map((k) => k.toLowerCase()),
          isNot(contains('x-api-key')));
    });
  });

  group('endpoints', () {
    test('selects the documented base URL per network', () {
      String baseFor(FlareChain c) => DaLayerClient(c).baseUrl;

      expect(baseFor(FlareChain.flare),
          'https://flr-data-availability.flare.network');
      expect(baseFor(FlareChain.coston2),
          'https://ctn2-data-availability.flare.network');
      expect(baseFor(FlareChain.songbird),
          'https://sgb-data-availability.flare.network');
      expect(baseFor(FlareChain.coston),
          'https://ctn-data-availability.flare.network');
    });

    test('rejects a network with no known endpoint unless overridden', () {
      const unknown = FlareChain(
        name: 'Nowhere',
        chainId: 999999,
        rpcUrl: 'https://example.invalid',
        explorerUrl: 'https://example.invalid',
        nativeSymbol: 'NON',
        isTestnet: true,
      );

      expect(() => DaLayerClient(unknown), throwsArgumentError);
      expect(
        () => DaLayerClient(unknown, baseUrl: 'https://custom.example'),
        returnsNormally,
      );
    });
  });

  group('malformed responses', () {
    test('rejects a non-array anchor feed payload', () async {
      final da = clientFor((_) async => http.Response('{"oops":true}', 200));
      await expectLater(
        da.getAnchorFeedsWithProof([Feeds.flrUsd]),
        throwsA(isA<FlareTransportException>()),
      );
    });

    test('rejects an entry missing its body object', () async {
      final da = clientFor((_) async => http.Response('[{"proof":[]}]', 200));
      await expectLater(
        da.getAnchorFeedsWithProof([Feeds.flrUsd]),
        throwsA(isA<FlareException>()),
      );
    });

    test('treats malformed JSON as non-retryable', () async {
      var attempts = 0;
      final da = clientFor((_) async {
        attempts++;
        return http.Response('not json', 200);
      });

      await expectLater(
        da.getStatus(),
        throwsA(isA<FlareTransportException>()),
      );
      expect(attempts, 1);
    });
  });

  group('lifecycle', () {
    test('rejects use after close', () async {
      final da = clientFor((_) async => http.Response(liveBody, 200));
      da.close();
      await expectLater(da.getStatus(), throwsStateError);
    });
  });
}
