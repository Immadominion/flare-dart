@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live WebSocket subscription tests against Coston2.
///
/// Run with: `dart test -P integration`
void main() {
  test('derives the wss endpoint from the https one', () {
    expect(
      FlareSubscriptions.webSocketUrlFor(FlareChain.coston2),
      'wss://coston2-api.flare.network/ext/C/ws',
    );
    expect(
      FlareSubscriptions.webSocketUrlFor(FlareChain.flare),
      'wss://flare-api.flare.network/ext/C/ws',
    );
  });

  test(
    'newHeads pushes blocks as the node produces them',
    () async {
      final subs = FlareSubscriptions(FlareChain.coston2);

      // Flare produces a block roughly every 1.8s, so two should arrive well
      // inside the timeout.
      final blocks =
          await subs
              .newHeads()
              .take(2)
              .timeout(const Duration(seconds: 60))
              .toList();

      expect(blocks, hasLength(2));
      for (final b in blocks) {
        expect(b.number, greaterThan(BigInt.zero));
        expect(b.hash, hasLength(32));
        expect(b.baseFeePerGas, isNotNull);
      }
      // Consecutive pushes must advance, and be linked.
      expect(blocks[1].number, greaterThan(blocks[0].number));
    },
    timeout: const Timeout(Duration(seconds: 90)),
  );

  test(
    'pushed heads agree with what HTTP reports',
    () async {
      final subs = FlareSubscriptions(FlareChain.coston2);
      final client = FlareClient(FlareChain.coston2);
      addTearDown(client.close);

      final pushed = await subs.newHeads().first.timeout(
        const Duration(seconds: 60),
      );
      final polled = await client.getBlockNumber();

      // Two independent transports observing the same chain, so they should be
      // within a couple of blocks of each other.
      expect((pushed.number - polled).abs(), lessThanOrEqualTo(BigInt.from(3)));
    },
    timeout: const Timeout(Duration(seconds: 90)),
  );

  test(
    'log subscriptions deliver decodable logs',
    () async {
      final subs = FlareSubscriptions(FlareChain.coston2);

      final logs =
          await subs
              .logs()
              .take(1)
              .timeout(const Duration(seconds: 60))
              .toList();

      expect(logs, hasLength(1));
      final log = logs.single;
      expect(log.address.isZero, isFalse);
      expect(log.blockNumber, greaterThan(BigInt.zero));
      for (final t in log.topics) {
        expect(t, hasLength(32));
      }
    },
    timeout: const Timeout(Duration(seconds: 90)),
  );

  test(
    'a bad endpoint fails rather than retrying forever',
    () async {
      final subs = FlareSubscriptions(
        FlareChain.coston2,
        wsUrl: 'wss://coston2-api.flare.network/does-not-exist',
        autoReconnect: false,
      );

      await expectLater(subs.newHeads().first, throwsA(isA<FlareException>()));
    },
    timeout: const Timeout(Duration(seconds: 60)),
  );
}
