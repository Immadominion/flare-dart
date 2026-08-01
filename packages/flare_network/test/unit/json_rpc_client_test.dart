import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flare_network/flare_network.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// Hermetic tests for the JSON-RPC transport.
///
/// The retry, batching and error-mapping paths are hard to exercise against a
/// live node — you cannot ask Flare to return a 503 on demand — so they are
/// driven through a mock client here. Integration tests cover the happy path
/// against the real chain.
void main() {
  /// A [math.Random] that always returns its maximum, so jittered backoff
  /// becomes deterministic and the tests do not sleep for a random duration.
  final maxJitter = _FixedRandom();

  /// No delay, so retry tests run instantly.
  const instantRetry = RetryPolicy(
    maxRetries: 3,
    initialDelay: Duration.zero,
    maxDelay: Duration.zero,
  );

  JsonRpcClient clientFor(
    Future<http.Response> Function(http.Request) handler, {
    RetryPolicy policy = instantRetry,
  }) => JsonRpcClient(
    'https://node.example/rpc',
    retryPolicy: policy,
    httpClient: MockClient(handler),
    random: maxJitter,
  );

  String rpcOk(Object? result, {int id = 1}) =>
      jsonEncode({'jsonrpc': '2.0', 'id': id, 'result': result});

  group('call', () {
    test('returns the result field', () async {
      final client = clientFor((_) async => http.Response(rpcOk('0x72'), 200));
      expect(await client.call('eth_chainId'), '0x72');
    });

    test('sends a well-formed JSON-RPC 2.0 envelope', () async {
      late Map<String, Object?> sent;
      final client = clientFor((req) async {
        sent = jsonDecode(req.body) as Map<String, Object?>;
        return http.Response(rpcOk('0x1'), 200);
      });

      await client.call('eth_getBalance', ['0xabc', 'latest']);

      expect(sent['jsonrpc'], '2.0');
      expect(sent['method'], 'eth_getBalance');
      expect(sent['params'], ['0xabc', 'latest']);
      expect(sent['id'], isA<int>());
    });

    test('increments the request id across calls', () async {
      final ids = <Object?>[];
      final client = clientFor((req) async {
        ids.add((jsonDecode(req.body) as Map)['id']);
        return http.Response(rpcOk('0x1'), 200);
      });

      await client.call('eth_chainId');
      await client.call('eth_chainId');

      expect(ids, hasLength(2));
      expect(ids[0], isNot(ids[1]));
    });

    test('maps a JSON-RPC error object to FlareRpcException', () async {
      final client = clientFor(
        (_) async => http.Response(
          jsonEncode({
            'jsonrpc': '2.0',
            'id': 1,
            'error': {'code': -32000, 'message': 'execution reverted'},
          }),
          200,
        ),
      );

      await expectLater(
        client.call('eth_call'),
        throwsA(
          isA<FlareRpcException>()
              .having((e) => e.code, 'code', -32000)
              .having((e) => e.message, 'message', contains('reverted'))
              .having((e) => e.method, 'method', 'eth_call'),
        ),
      );
    });

    test('preserves the error data field for revert decoding', () async {
      final client = clientFor(
        (_) async => http.Response(
          jsonEncode({
            'id': 1,
            'error': {'code': 3, 'message': 'reverted', 'data': '0xdeadbeef'},
          }),
          200,
        ),
      );

      await expectLater(
        client.call('eth_call'),
        throwsA(
          isA<FlareRpcException>().having((e) => e.data, 'data', '0xdeadbeef'),
        ),
      );
    });

    test('treats malformed JSON as non-retryable', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return http.Response('not json at all', 200);
      });

      await expectLater(
        client.call('eth_chainId'),
        throwsA(isA<FlareTransportException>()),
      );
      // Retrying cannot fix a malformed body, so it must not be attempted.
      expect(attempts, 1);
    });
  });

  group('retry', () {
    test('retries a 503 and succeeds', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return attempts < 3
            ? http.Response('upstream down', 503)
            : http.Response(rpcOk('0x72'), 200);
      });

      expect(await client.call('eth_chainId'), '0x72');
      expect(attempts, 3);
    });

    test('retries a 429', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return attempts < 2
            ? http.Response('slow down', 429)
            : http.Response(rpcOk('0x1'), 200);
      });

      await client.call('eth_chainId');
      expect(attempts, 2);
    });

    test('gives up after maxRetries and reports the last failure', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return http.Response('still down', 503);
      });

      await expectLater(
        client.call('eth_chainId'),
        throwsA(
          isA<FlareTransportException>().having(
            (e) => e.statusCode,
            'statusCode',
            503,
          ),
        ),
      );
      // One initial attempt plus three retries.
      expect(attempts, 4);
    });

    test('does not retry a 400, which will never succeed', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return http.Response('bad request', 400);
      });

      await expectLater(
        client.call('eth_chainId'),
        throwsA(isA<FlareTransportException>()),
      );
      expect(attempts, 1);
    });

    test('RetryPolicy.none makes a single attempt', () async {
      var attempts = 0;
      final client = clientFor((_) async {
        attempts++;
        return http.Response('down', 503);
      }, policy: RetryPolicy.none);

      await expectLater(
        client.call('eth_chainId'),
        throwsA(isA<FlareTransportException>()),
      );
      expect(attempts, 1);
    });

    test('isRetryable classifies status codes correctly', () {
      bool retryable(int? code) =>
          FlareTransportException('x', statusCode: code).isRetryable;

      expect(retryable(null), isTrue, reason: 'no response at all');
      expect(retryable(408), isTrue);
      expect(retryable(429), isTrue);
      expect(retryable(500), isTrue);
      expect(retryable(503), isTrue);
      expect(retryable(400), isFalse);
      expect(retryable(404), isFalse);
    });

    test('backoff grows and stays within maxDelay', () {
      const policy = RetryPolicy(
        initialDelay: Duration(milliseconds: 100),
        maxDelay: Duration(milliseconds: 800),
      );
      final rng = _FixedRandom();

      // With max jitter the delay equals the capped exponential value.
      expect(policy.delayFor(1, rng).inMilliseconds, 100);
      expect(policy.delayFor(2, rng).inMilliseconds, 200);
      expect(policy.delayFor(3, rng).inMilliseconds, 400);
      expect(policy.delayFor(4, rng).inMilliseconds, 800);
      // Capped, not unbounded.
      expect(policy.delayFor(10, rng).inMilliseconds, 800);
    });

    test('jitter can produce a delay below the exponential value', () {
      const policy = RetryPolicy(initialDelay: Duration(milliseconds: 100));
      final zero = _FixedRandom(value: 0);
      // Full jitter means the range is [0, exponential], so a fleet of clients
      // does not retry in lockstep.
      expect(policy.delayFor(3, zero), Duration.zero);
    });
  });

  group('batch', () {
    test('sends one request and returns results in input order', () async {
      late List<Object?> sent;
      final client = clientFor((req) async {
        sent = jsonDecode(req.body) as List<Object?>;
        // Reply deliberately out of order — nodes are allowed to do this.
        final ids = [for (final e in sent) (e as Map)['id']];
        return http.Response(
          jsonEncode([
            {'id': ids[2], 'result': 'third'},
            {'id': ids[0], 'result': 'first'},
            {'id': ids[1], 'result': 'second'},
          ]),
          200,
        );
      });

      final results = await client.batch(const [
        RpcRequest('a'),
        RpcRequest('b'),
        RpcRequest('c'),
      ]);

      expect(sent, hasLength(3));
      expect(results, ['first', 'second', 'third']);
    });

    test('an empty batch makes no request', () async {
      var called = false;
      final client = clientFor((_) async {
        called = true;
        return http.Response('[]', 200);
      });

      expect(await client.batch(const []), isEmpty);
      expect(called, isFalse);
    });

    test('surfaces a per-entry error rather than returning a null', () async {
      final client = clientFor((req) async {
        final ids = [
          for (final e in jsonDecode(req.body) as List) (e as Map)['id'],
        ];
        return http.Response(
          jsonEncode([
            {'id': ids[0], 'result': 'ok'},
            {
              'id': ids[1],
              'error': {'code': -32000, 'message': 'reverted'},
            },
          ]),
          200,
        );
      });

      await expectLater(
        client.batch(const [RpcRequest('a'), RpcRequest('b')]),
        throwsA(isA<FlareRpcException>()),
      );
    });

    test('explains a node that does not support batching', () async {
      final client = clientFor(
        (_) async => http.Response(rpcOk('not a list'), 200),
      );

      await expectLater(
        client.batch(const [RpcRequest('a')]),
        throwsA(
          isA<FlareTransportException>().having(
            (e) => e.message,
            'message',
            contains('batching'),
          ),
        ),
      );
    });
  });

  group('lifecycle', () {
    test('rejects use after close', () async {
      final client = clientFor((_) async => http.Response(rpcOk('0x1'), 200));
      client.close();
      await expectLater(client.call('eth_chainId'), throwsStateError);
    });
  });
}

/// Deterministic [math.Random] for backoff tests.
class _FixedRandom implements math.Random {
  /// Returned from [nextInt] when set. Otherwise the largest value `nextInt`
  /// can produce (`max - 1`) is returned, so a jittered delay lands exactly on
  /// its exponential ceiling.
  final int? value;

  _FixedRandom({this.value});

  @override
  int nextInt(int max) => value ?? (max > 0 ? max - 1 : 0);

  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 1;
}
