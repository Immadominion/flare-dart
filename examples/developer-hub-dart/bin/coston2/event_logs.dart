// Reads and decodes event logs from Coston2.
//
// Flare's public RPC caps eth_getLogs at 30 blocks per request — measured, and
// identical on mainnet. `getLogs` splits wider ranges automatically, so the
// range below (300 blocks) becomes ten requests behind the scenes.
//
//   dart run bin/coston2/event_logs.dart
import 'package:flare_network/flare_network.dart';

/// The canonical ERC-20 Transfer, which FXRP and WNat both emit.
final transfer = AbiEvent.fromJson(const {
  'type': 'event',
  'name': 'Transfer',
  'inputs': [
    {'name': 'from', 'type': 'address', 'indexed': true},
    {'name': 'to', 'type': 'address', 'indexed': true},
    {'name': 'value', 'type': 'uint256', 'indexed': false},
  ],
});

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final head = await client.getBlockNumber();
    final from = head - BigInt.from(299);

    print('topic0 for ${transfer.canonicalSignature}:');
    print('  ${transfer.topic0Hex}\n');
    print(
      'scanning blocks $from..$head '
      '(${(300 / FlareClient.maxLogBlockSpan).ceil()} requests)\n',
    );

    final logs = await client.getEventLogs(
      event: transfer,
      fromBlock: BlockRef.number(from),
      toBlock: BlockRef.number(head),
    );

    print('${logs.length} Transfer event(s)\n');
    for (final t in logs.take(8)) {
      // Indexed parameters come from topics; the value comes from data.
      final fromAddr = t['from']! as EthAddress;
      final toAddr = t['to']! as EthAddress;
      final value = t['value']! as BigInt;
      print(
        '  block ${t.log.blockNumber}  '
        '${_short(fromAddr)} -> ${_short(toAddr)}  $value',
      );
    }

    // A filter can constrain any indexed parameter. Passing null leaves a
    // position free, so this is "transfers to anyone, from this sender".
    if (logs.isNotEmpty) {
      final sender = logs.first['from']! as EthAddress;
      final bySender = await client.getEventLogs(
        event: transfer,
        indexedValues: [sender, null],
        fromBlock: BlockRef.number(from),
        toBlock: BlockRef.number(head),
      );
      print('\n${bySender.length} of those came from ${_short(sender)}');
    }
  } finally {
    client.close();
  }
}

String _short(EthAddress a) {
  final h = a.checksummed;
  return '${h.substring(0, 8)}…${h.substring(h.length - 4)}';
}
