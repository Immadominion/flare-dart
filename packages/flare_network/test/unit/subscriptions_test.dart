import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Hermetic subscription tests.
///
/// Reconnect, backoff and error mapping are the parts of a socket client most
/// likely to be wrong and least likely to be exercised by a live test — a live
/// endpoint that stays up never reconnects. Injecting [WsConnector] lets these
/// paths run offline and deterministically.

/// A socket driven entirely by the test.
class FakeTransport implements WsTransport {
  final _controller = StreamController<String>();
  final sent = <String>[];
  var closed = false;

  @override
  Stream<String> get messages => _controller.stream;

  @override
  void send(String data) => sent.add(data);

  @override
  Future<void> close() async {
    closed = true;
    if (!_controller.isClosed) await _controller.close();
  }

  /// Pushes a raw frame from the "server".
  void push(String frame) => _controller.add(frame);

  /// Pushes an `eth_subscription` notification carrying [result].
  void pushResult(Object result) => push(
    jsonEncode({
      'jsonrpc': '2.0',
      'method': 'eth_subscription',
      'params': {'subscription': '0xcafe', 'result': result},
    }),
  );

  /// Drops the connection without an error, as a network blip would.
  Future<void> drop() async {
    if (!_controller.isClosed) await _controller.close();
  }
}

/// Header fields in the shape a node sends them.
Map<String, Object?> headerJson(int number) => {
  'number': '0x${number.toRadixString(16)}',
  'hash': '0x${'11' * 32}',
  'parentHash': '0x${'22' * 32}',
  'timestamp': '0x6800a000',
  'gasUsed': '0x5208',
  'gasLimit': '0x1c9c380',
  'baseFeePerGas': '0x6fc23ac00',
};

void main() {
  group('endpoint derivation', () {
    test('maps every network rpc url to its ws url', () {
      expect(
        FlareSubscriptions.webSocketUrlFor(FlareChain.coston2),
        'wss://coston2-api.flare.network/ext/C/ws',
      );
      expect(
        FlareSubscriptions.webSocketUrlFor(FlareChain.flare),
        'wss://flare-api.flare.network/ext/C/ws',
      );
      expect(
        FlareSubscriptions.webSocketUrlFor(FlareChain.songbird),
        'wss://songbird-api.flare.network/ext/C/ws',
      );
      expect(
        FlareSubscriptions.webSocketUrlFor(FlareChain.coston),
        'wss://coston-api.flare.network/ext/C/ws',
      );
    });
  });

  group('subscribe handshake', () {
    test('sends eth_subscribe with the requested kind', () async {
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final first = subs.newHeads().first;
      await Future<void>.delayed(Duration.zero);
      socket.pushResult(headerJson(100));
      await first;

      expect(socket.sent, hasLength(1));
      final request = jsonDecode(socket.sent.single) as Map<String, Object?>;
      expect(request['method'], 'eth_subscribe');
      expect(request['params'], ['newHeads']);
    });

    test('an unconstrained log filter still sends an empty object', () async {
      // Flare rejects `['logs']` with -32602; the filter argument is required
      // even when it constrains nothing.
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      unawaited(subs.logs().first.then((_) {}, onError: (_) {}));
      await Future<void>.delayed(Duration.zero);

      final request = jsonDecode(socket.sent.single) as Map<String, Object?>;
      expect(request['params'], ['logs', <String, Object?>{}]);
    });

    test('a single address is sent bare, several as a list', () async {
      final a = EthAddress.parse('0x1000000000000000000000000000000000000001');
      final b = EthAddress.parse('0x1000000000000000000000000000000000000002');

      Future<Object?> paramsFor(LogFilter filter) async {
        late FakeTransport socket;
        final subs = FlareSubscriptions(
          FlareChain.coston2,
          connector:
              (url, {required timeout}) async => socket = FakeTransport(),
        );
        unawaited(subs.logs(filter).first.then((_) {}, onError: (_) {}));
        await Future<void>.delayed(Duration.zero);
        return ((jsonDecode(socket.sent.single) as Map)['params'] as List)[1];
      }

      expect(await paramsFor(LogFilter(addresses: [a])), {'address': a.hex});
      expect(await paramsFor(LogFilter(addresses: [a, b])), {
        'address': [a.hex, b.hex],
      });
    });
  });

  group('payload handling', () {
    test('decodes pushed headers', () async {
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final blocks = subs.newHeads().take(2).toList();
      await Future<void>.delayed(Duration.zero);
      socket
        ..pushResult(headerJson(0x100))
        ..pushResult(headerJson(0x101));

      final got = await blocks;
      expect(got.map((b) => b.number), [
        BigInt.from(0x100),
        BigInt.from(0x101),
      ]);
      expect(got.first.baseFeePerGas, BigInt.from(0x6fc23ac00));
      expect(got.first.hashHex, '0x${'11' * 32}');
    });

    test('a bare hash is delivered for pending transactions', () async {
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final first = subs.pendingTransactions().first;
      await Future<void>.delayed(Duration.zero);
      socket.pushResult('0x${'ab' * 32}');

      expect(await first, '0x${'ab' * 32}');
    });

    test('the subscribe acknowledgement is not mistaken for a payload', () async {
      // The node replies `{"id":1,"result":"0xcafe"}` first. Emitting that as a
      // block would hand callers a header with every field zeroed.
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final first = subs.newHeads().first;
      await Future<void>.delayed(Duration.zero);
      socket
        ..push(jsonEncode({'jsonrpc': '2.0', 'id': 1, 'result': '0xcafe'}))
        ..pushResult(headerJson(7));

      expect((await first).number, BigInt.from(7));
    });

    test('malformed frames are skipped, not fatal', () async {
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final first = subs.newHeads().first;
      await Future<void>.delayed(Duration.zero);
      socket
        ..push('[1,2,3]') // valid JSON, wrong shape
        ..push(jsonEncode({'jsonrpc': '2.0'})) // no params
        ..pushResult(headerJson(9));

      expect((await first).number, BigInt.from(9));
    });
  });

  group('failure and reconnect', () {
    test('an RPC error ends the stream instead of looping', () async {
      // A rejected filter fails the same way every time, so retrying it would
      // spin forever against a mistake the caller has to fix.
      late FakeTransport socket;
      var connects = 0;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connector: (url, {required timeout}) async {
          connects++;
          return socket = FakeTransport();
        },
      );

      final first = subs.newHeads().first;
      await Future<void>.delayed(Duration.zero);
      socket.push(
        jsonEncode({
          'jsonrpc': '2.0',
          'id': 1,
          'error': {'code': -32602, 'message': 'invalid argument 0'},
        }),
      );

      await expectLater(
        first,
        throwsA(
          isA<FlareRpcException>()
              .having((e) => e.code, 'code', -32602)
              .having(
                (e) => e.message,
                'message',
                contains('invalid argument'),
              ),
        ),
      );
      expect(connects, 1, reason: 'must not reconnect after a caller error');
    });

    test('a dropped socket reconnects and resubscribes', () async {
      final sockets = <FakeTransport>[];
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        retryPolicy: const RetryPolicy(
          maxRetries: 3,
          initialDelay: Duration.zero,
        ),
        random: math.Random(1),
        connector: (url, {required timeout}) async {
          final s = FakeTransport();
          sockets.add(s);
          return s;
        },
      );

      final collected = subs.newHeads().take(2).toList();

      await Future<void>.delayed(Duration.zero);
      sockets[0].pushResult(headerJson(1));
      await sockets[0].drop();

      // A new socket must be opened, and it must send eth_subscribe again —
      // the old subscription died with the connection.
      await Future<void>.delayed(const Duration(milliseconds: 20));
      expect(sockets, hasLength(2));
      expect(sockets[1].sent, hasLength(1));

      sockets[1].pushResult(headerJson(2));
      expect((await collected).map((b) => b.number.toInt()), [1, 2]);
      expect(sockets[0].closed, isTrue);
    });

    test('a failing connector gives up after maxRetries', () async {
      var attempts = 0;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        retryPolicy: const RetryPolicy(
          maxRetries: 3,
          initialDelay: Duration.zero,
        ),
        random: math.Random(2),
        connector: (url, {required timeout}) async {
          attempts++;
          throw const SocketishFailure();
        },
      );

      await expectLater(
        subs.newHeads().first,
        throwsA(
          isA<FlareTransportException>().having(
            (e) => e.message,
            'message',
            anyOf(contains('gave up'), contains('subscription failed')),
          ),
        ),
      );
      // Bounded: one initial attempt plus the retries, never an endless loop.
      expect(attempts, lessThanOrEqualTo(4));
      expect(attempts, greaterThan(1));
    });

    test('autoReconnect: false fails on the first drop', () async {
      var attempts = 0;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        autoReconnect: false,
        connector: (url, {required timeout}) async {
          attempts++;
          throw const SocketishFailure();
        },
      );

      await expectLater(
        subs.newHeads().first,
        throwsA(isA<FlareTransportException>()),
      );
      expect(attempts, 1);
    });

    test('a clean close without autoReconnect ends the stream', () async {
      late FakeTransport socket;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        autoReconnect: false,
        connector: (url, {required timeout}) async => socket = FakeTransport(),
      );

      final all = subs.newHeads().toList();
      await Future<void>.delayed(Duration.zero);
      socket.pushResult(headerJson(42));
      await socket.drop();

      expect((await all).single.number, BigInt.from(42));
    });

    test('the connect timeout is passed through to the transport', () async {
      Duration? seen;
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        connectTimeout: const Duration(seconds: 3),
        autoReconnect: false,
        connector: (url, {required timeout}) async {
          seen = timeout;
          throw const SocketishFailure();
        },
      );

      await expectLater(subs.newHeads().first, throwsA(isA<FlareException>()));
      expect(seen, const Duration(seconds: 3));
    });
  });
}

/// Stands in for a transport-level failure without depending on `dart:io`,
/// which this test must not import if it is to run on every platform.
class SocketishFailure implements Exception {
  const SocketishFailure();
  @override
  String toString() => 'SocketishFailure: connection refused';
}
