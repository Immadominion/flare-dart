@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live log queries against Coston2.
///
/// The public RPC caps `eth_getLogs` at 30 blocks, so most of what is worth
/// testing here is that the client splits ranges correctly and still decodes
/// what comes back.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;
  late BigInt head;

  /// ERC-20 Transfer, which FXRP and WNat both emit.
  final transfer = AbiEvent.fromJson(const {
    'type': 'event',
    'name': 'Transfer',
    'inputs': [
      {'name': 'from', 'type': 'address', 'indexed': true},
      {'name': 'to', 'type': 'address', 'indexed': true},
      {'name': 'value', 'type': 'uint256', 'indexed': false},
    ],
  });

  setUpAll(() async {
    client = FlareClient(FlareChain.coston2);
    head = await client.getBlockNumber();
  });
  tearDownAll(() => client.close());

  test('a single window within the cap returns logs', () async {
    final logs = await client.getLogs(
      LogFilter(
        fromBlock: BlockRef.number(head - BigInt.from(29)),
        toBlock: BlockRef.number(head),
      ),
    );

    // Coston2 is busy; 30 blocks reliably contains logs.
    expect(logs, isNotEmpty);
    for (final log in logs) {
      expect(log.blockNumber, greaterThanOrEqualTo(head - BigInt.from(29)));
      expect(log.blockNumber, lessThanOrEqualTo(head));
      for (final t in log.topics) {
        expect(t, hasLength(32));
      }
    }
  });

  test('a range wider than the 30-block cap is split automatically', () async {
    // 90 blocks is three windows. A single request would be rejected with
    // "requested too many blocks … maximum is set to 30", so this passing at
    // all is the evidence that chunking works.
    final from = head - BigInt.from(89);
    final logs = await client.getLogs(
      LogFilter(
        fromBlock: BlockRef.number(from),
        toBlock: BlockRef.number(head),
      ),
    );

    expect(logs, isNotEmpty);
    // Results must cover more than one window's worth of blocks.
    final blocks = logs.map((l) => l.blockNumber).toSet();
    expect(blocks.length, greaterThan(1));

    for (final log in logs) {
      expect(log.blockNumber, greaterThanOrEqualTo(from));
      expect(log.blockNumber, lessThanOrEqualTo(head));
    }
  });

  test('an unsplit request of the same width would be rejected', () async {
    // Pins the constraint the chunking exists for. If Flare ever raises the
    // cap this fails, which is the signal to revisit maxLogBlockSpan.
    final from = head - BigInt.from(89);
    await expectLater(
      client.rpc.call('eth_getLogs', [
        {
          'fromBlock': bytesToHexQuantity(from),
          'toBlock': bytesToHexQuantity(head),
        },
      ]),
      throwsA(
        isA<FlareRpcException>().having(
          (e) => e.message,
          'message',
          contains('too many blocks'),
        ),
      ),
    );
  });

  test('logs stream in block order', () async {
    final seen = <BigInt>[];
    await for (final log in client.streamLogs(
      LogFilter(
        fromBlock: BlockRef.number(head - BigInt.from(59)),
        toBlock: BlockRef.number(head),
      ),
    )) {
      seen.add(log.blockNumber);
    }

    expect(seen, isNotEmpty);
    for (var i = 1; i < seen.length; i++) {
      expect(
        seen[i],
        greaterThanOrEqualTo(seen[i - 1]),
        reason: 'windows must be emitted in ascending block order',
      );
    }
  });

  test('decodes real Transfer events end to end', () async {
    // Widened to 120 blocks because transfers are sporadic on a testnet.
    final decoded = await client.getEventLogs(
      event: transfer,
      fromBlock: BlockRef.number(head - BigInt.from(119)),
      toBlock: BlockRef.number(head),
    );

    if (decoded.isEmpty) {
      // Not a failure: a quiet stretch is legitimate. The chunking and
      // filtering paths are covered by the tests above regardless.
      markTestSkipped('no Transfer events in the last 120 blocks');
      return;
    }

    for (final t in decoded) {
      expect(t.name, 'Transfer');
      expect(t['from'], isA<EthAddress>());
      expect(t['to'], isA<EthAddress>());
      expect(t['value'], isA<BigInt>());
      expect((t['value']! as BigInt).isNegative, isFalse);
      // Every returned log really carries the Transfer signature.
      expect(t.log.topic0Hex, transfer.topic0Hex);
    }
  });

  test('a topic filter narrows results to one event type', () async {
    final all = await client.getLogs(
      LogFilter(
        fromBlock: BlockRef.number(head - BigInt.from(29)),
        toBlock: BlockRef.number(head),
      ),
    );
    final filtered = await client.getLogs(
      LogFilter(
        topics: transfer.encodeTopicFilter(),
        fromBlock: BlockRef.number(head - BigInt.from(29)),
        toBlock: BlockRef.number(head),
      ),
    );

    expect(filtered.length, lessThanOrEqualTo(all.length));
    for (final log in filtered) {
      expect(log.topic0Hex, transfer.topic0Hex);
    }
  });

  test('rejects an inverted block range', () async {
    await expectLater(
      client.getLogs(
        LogFilter(
          fromBlock: BlockRef.number(head),
          toBlock: BlockRef.number(head - BigInt.from(10)),
        ),
      ),
      throwsA(isA<FlareRpcException>()),
    );
  });
}

/// Minimal quantity encoder, local to this test so the negative case above does
/// not depend on client internals.
String bytesToHexQuantity(BigInt v) => '0x${v.toRadixString(16)}';
