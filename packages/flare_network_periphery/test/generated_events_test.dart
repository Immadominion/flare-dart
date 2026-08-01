@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:flare_network_periphery/src/if_asset.g.dart';
import 'package:test/test.dart';

/// Proves the *generated* event definitions are correct.
///
/// `dart analyze` shows they compile; these show their topic hashes match the
/// chain and that they decode a real log.
///
/// Run with: `dart test -P integration`
void main() {
  test('a generated event derives the canonical topic0', () {
    // Independently produced by `cast keccak "Transfer(address,address,uint256)"`.
    expect(
      IFAssetContract.transferEvent.topic0Hex,
      '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
    );
  });

  test('indexed flags survive code generation', () {
    final ev = IFAssetContract.transferEvent;
    expect(ev.indexedParameters.map((p) => p.name), ['from', 'to']);
    expect(ev.dataParameters.map((p) => p.name), ['value']);
  });

  test('decodes a log captured live from Coston2', () {
    // Real FXRP transfer of 10,000,000 units, 2026-08-02.
    final topics =
        [
          '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
          '0x000000000000000000000000d5796ac33466bfaa9cba703ac0e13994fda77a53',
          '0x00000000000000000000000045228bed3d90919bea1ccf72f70e082de5c7daa3',
        ].map(hexToBytes).toList();
    final data = hexToBytes(
      '0x0000000000000000000000000000000000000000000000000000000000989680',
    );

    final values = IFAssetContract.transferEvent.decode(
      topics: topics,
      data: data,
    );
    expect(
      (values[0]! as EthAddress).hex,
      '0xd5796ac33466bfaa9cba703ac0e13994fda77a53',
    );
    expect(values[2], BigInt.from(10000000));
  });

  test('the generated dispatcher routes a log to the right event', () {
    final log = FlareLog(
      address: EthAddress.parse(
        '0x0b6a3645c240605887a5532109323a3e12273dc7',
        validateChecksum: false,
      ),
      topics:
          [
            '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
            '0x000000000000000000000000d5796ac33466bfaa9cba703ac0e13994fda77a53',
            '0x00000000000000000000000045228bed3d90919bea1ccf72f70e082de5c7daa3',
          ].map(hexToBytes).toList(),
      data: hexToBytes(
        '0x0000000000000000000000000000000000000000000000000000000000989680',
      ),
      blockNumber: BigInt.from(33521715),
      blockHash: hexToBytes('0x${'00' * 32}'),
      transactionHash: hexToBytes('0x${'11' * 32}'),
      transactionIndex: 0,
      logIndex: 3,
      removed: false,
    );

    final decoded = IFAssetContract.decodeLog(log);
    expect(decoded, isNotNull);
    expect(decoded!.name, 'Transfer');
    expect(decoded['value'], BigInt.from(10000000));
    expect(decoded['from'], isA<EthAddress>());
  });

  test('the dispatcher returns null for an unrelated log', () {
    // One address emits many event types; a non-match must not throw.
    final log = FlareLog(
      address: EthAddress.zero,
      topics: [hexToBytes('0x${'ff' * 32}')],
      data: hexToBytes('0x'),
      blockNumber: BigInt.one,
      blockHash: hexToBytes('0x${'00' * 32}'),
      transactionHash: hexToBytes('0x${'00' * 32}'),
      transactionIndex: 0,
      logIndex: 0,
      removed: false,
    );
    expect(IFAssetContract.decodeLog(log), isNull);
  });

  test('allEvents lists every event the contract declares', () {
    expect(IFAssetContract.allEvents, isNotEmpty);
    for (final e in IFAssetContract.allEvents) {
      expect(e.topic0Hex, startsWith('0x'));
      expect(e.topic0Hex, hasLength(66));
      // At most three indexed parameters — the EVM's hard limit, since topic0
      // occupies the fourth slot.
      expect(e.indexedParameters.length, lessThanOrEqualTo(3));
    }
  });

  test('generated events find real logs on chain', () async {
    final client = FlareClient(FlareChain.coston2);
    addTearDown(client.close);

    final head = await client.getBlockNumber();
    final logs = await client.getEventLogs(
      event: IFAssetContract.transferEvent,
      fromBlock: BlockRef.number(head - BigInt.from(119)),
      toBlock: BlockRef.number(head),
    );

    if (logs.isEmpty) {
      markTestSkipped('no Transfer events in the last 120 blocks');
      return;
    }
    for (final t in logs) {
      expect(t.name, 'Transfer');
      expect(t['value'], isA<BigInt>());
    }
  });
}
