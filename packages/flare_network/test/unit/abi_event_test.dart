import 'dart:convert';
import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Event decoding, checked against Foundry vectors and one log captured live
/// from Coston2 on 2026-08-02.
void main() {
  /// The canonical ERC-20 Transfer, as Flare's FXRP token declares it.
  final transfer = AbiEvent.fromJson(const {
    'type': 'event',
    'name': 'Transfer',
    'anonymous': false,
    'inputs': [
      {'name': 'from', 'type': 'address', 'indexed': true},
      {'name': 'to', 'type': 'address', 'indexed': true},
      {'name': 'value', 'type': 'uint256', 'indexed': false},
    ],
  });

  group('signature hashing', () {
    test('topic0 matches cast keccak "Transfer(address,address,uint256)"', () {
      // Independently produced by `cast keccak`.
      expect(
        transfer.topic0Hex,
        '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
      );
    });

    test('the signature includes indexed parameters', () {
      // Indexing changes where a value is stored, never the signature.
      expect(transfer.canonicalSignature, 'Transfer(address,address,uint256)');
    });

    test('an anonymous event has no topic0', () {
      final anon = AbiEvent.fromJson(const {
        'type': 'event',
        'name': 'Secret',
        'anonymous': true,
        'inputs': [
          {'name': 'a', 'type': 'uint256', 'indexed': true},
        ],
      });
      expect(anon.topic0, isNull);
      expect(anon.topic0Hex, isNull);
      // Nothing identifies it, so it can never match by topics alone.
      expect(anon.matches([Uint8List(32)]), isFalse);
    });

    test('splits parameters by where the EVM stores them', () {
      expect(transfer.indexedParameters.map((p) => p.name), ['from', 'to']);
      expect(transfer.dataParameters.map((p) => p.name), ['value']);
    });
  });

  group('decoding a real Coston2 log', () {
    // Captured live: an FXRP transfer of 10,000,000 units (10 FXRP at 6 dp).
    final topics =
        [
          '0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef',
          '0x000000000000000000000000d5796ac33466bfaa9cba703ac0e13994fda77a53',
          '0x00000000000000000000000045228bed3d90919bea1ccf72f70e082de5c7daa3',
        ].map(hexToBytes).toList();
    final data = hexToBytes(
      '0x0000000000000000000000000000000000000000000000000000000000989680',
    );

    test('recognises the log as its own', () {
      expect(transfer.matches(topics), isTrue);
    });

    test('decodes indexed addresses from topics and the value from data', () {
      final values = transfer.decode(topics: topics, data: data);

      expect(values, hasLength(3));
      expect(
        (values[0]! as EthAddress).hex,
        '0xd5796ac33466bfaa9cba703ac0e13994fda77a53',
      );
      expect(
        (values[1]! as EthAddress).hex,
        '0x45228bed3d90919bea1ccf72f70e082de5c7daa3',
      );
      // `cast abi-decode "f()(uint256)"` on the same data gives 10000000.
      expect(values[2], BigInt.from(10000000));
    });

    test('decodeToMap keys by parameter name', () {
      final m = transfer.decodeToMap(topics: topics, data: data);
      expect(m.keys, ['from', 'to', 'value']);
      expect(m['value'], BigInt.from(10000000));
    });

    test('rejects a log with the wrong topic count', () {
      expect(
        () => transfer.decode(topics: topics.take(2).toList(), data: data),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('rejects a topic that is not 32 bytes', () {
      expect(
        () => transfer.decode(
          topics: [topics[0], topics[1], hexToBytes('0xdead')],
          data: data,
        ),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('events with no indexed parameters', () {
    // 238 of Flare's 592 events index nothing at all.
    final ev = AbiEvent.fromJson(const {
      'type': 'event',
      'name': 'Updated',
      'inputs': [
        {'name': 'a', 'type': 'uint256', 'indexed': false},
        {'name': 'b', 'type': 'bool', 'indexed': false},
      ],
    });

    test('carries only the signature topic', () {
      final data = AbiCodec.encodeTypes(
        ['uint256', 'bool'],
        [BigInt.from(42), true],
      );
      final values = ev.decode(topics: [ev.topic0!], data: data);
      expect(values, [BigInt.from(42), true]);
    });
  });

  group('the maximum three indexed parameters', () {
    // 55 of Flare's events use all three; the EVM allows no more, because
    // topic0 takes the fourth slot.
    final ev = AbiEvent.fromJson(const {
      'type': 'event',
      'name': 'Triple',
      'inputs': [
        {'name': 'a', 'type': 'address', 'indexed': true},
        {'name': 'b', 'type': 'uint64', 'indexed': true},
        {'name': 'c', 'type': 'bytes32', 'indexed': true},
        {'name': 'd', 'type': 'string', 'indexed': false},
      ],
    });

    test('decodes all three topics plus the data section', () {
      final addr = EthAddress.parse(
        '0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273',
      );
      final hash = hexToBytes('0x${'ab' * 32}');

      final values = ev.decode(
        topics: [
          ev.topic0!,
          addr.toAbiWord(),
          AbiType.parse('uint64').encode(BigInt.from(99)),
          hash,
        ],
        data: AbiCodec.encodeTypes(['string'], ['hello']),
      );

      expect(values[0], addr);
      expect(values[1], BigInt.from(99));
      expect(values[2], hash);
      expect(values[3], 'hello');
    });
  });

  group('dynamic indexed parameters are hashes, not values', () {
    // The EVM cannot fit a string into a topic, so it stores keccak(value).
    // Returning those 32 bytes as a String would be a plausible-looking lie.
    final ev = AbiEvent.fromJson(const {
      'type': 'event',
      'name': 'Named',
      'inputs': [
        {'name': 'label', 'type': 'string', 'indexed': true},
        {'name': 'amount', 'type': 'uint256', 'indexed': false},
      ],
    });

    test('yields an IndexedHash rather than pretending to decode', () {
      final labelHash = keccak256Utf8('deposit');
      final values = ev.decode(
        topics: [ev.topic0!, labelHash],
        data: AbiCodec.encodeTypes(['uint256'], [BigInt.one]),
      );

      expect(values[0], isA<IndexedHash>());
      expect((values[0]! as IndexedHash).solidityType, 'string');
    });

    test('the hash can be matched back against a candidate value', () {
      final labelHash = keccak256Utf8('deposit');
      final values = ev.decode(
        topics: [ev.topic0!, labelHash],
        data: AbiCodec.encodeTypes(['uint256'], [BigInt.one]),
      );
      final hash = values[0]! as IndexedHash;

      expect(hash.matches('deposit'), isTrue);
      expect(hash.matches('withdraw'), isFalse);
    });

    test('filtering on one requires an IndexedHash, not a raw value', () {
      // Passing the string would silently produce a topic that matches nothing.
      expect(
        () => ev.encodeTopicFilter(['deposit']),
        throwsA(isA<FlareAbiException>()),
      );
      expect(
        () => ev.encodeTopicFilter([
          IndexedHash(hash: keccak256Utf8('deposit'), solidityType: 'string'),
        ]),
        returnsNormally,
      );
    });
  });

  group('topic filters', () {
    final from = EthAddress.parse(
      '0xd5796Ac33466bFAA9cBA703AC0E13994fdA77A53',
      validateChecksum: false,
    );

    test('an unconstrained filter is just the signature hash', () {
      expect(transfer.encodeTopicFilter(), [transfer.topic0Hex]);
    });

    test('constrains the first indexed parameter', () {
      final topics = transfer.encodeTopicFilter([from]);
      expect(topics, hasLength(2));
      expect(topics[0], transfer.topic0Hex);
      expect(
        topics[1],
        '0x000000000000000000000000d5796ac33466bfaa9cba703ac0e13994fda77a53',
      );
    });

    test('a null leaves a position free', () {
      final to = EthAddress.parse(
        '0x45228BED3d90919BeA1CCf72f70E082de5c7daA3',
        validateChecksum: false,
      );
      final topics = transfer.encodeTopicFilter([null, to]);
      expect(topics, hasLength(3));
      expect(topics[1], isNull);
      expect(topics[2], contains('45228bed'));
    });

    test('a list means any-of', () {
      final topics = transfer.encodeTopicFilter([
        [from, EthAddress.zero],
      ]);
      expect(topics[1], isA<List<Object?>>());
      expect(topics[1]! as List, hasLength(2));
    });

    test('trailing nulls are dropped', () {
      // They constrain nothing, so sending them just bloats the request.
      expect(transfer.encodeTopicFilter([null, null]), hasLength(1));
    });

    test('rejects more filter values than indexed parameters', () {
      expect(
        () => transfer.encodeTopicFilter([from, from, from]),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('ContractAbi event lookup', () {
    final abi = ContractAbi.fromJson(const [
      {
        'type': 'event',
        'name': 'Transfer',
        'inputs': [
          {'name': 'from', 'type': 'address', 'indexed': true},
          {'name': 'to', 'type': 'address', 'indexed': true},
          {'name': 'value', 'type': 'uint256', 'indexed': false},
        ],
      },
      {
        'type': 'event',
        'name': 'Approval',
        'inputs': [
          {'name': 'owner', 'type': 'address', 'indexed': true},
          {'name': 'spender', 'type': 'address', 'indexed': true},
          {'name': 'value', 'type': 'uint256', 'indexed': false},
        ],
      },
      {
        'type': 'function',
        'name': 'totalSupply',
        'stateMutability': 'view',
        'inputs': [],
        'outputs': [
          {'name': '', 'type': 'uint256'},
        ],
      },
    ]);

    test('parses events alongside functions', () {
      expect(abi.events, hasLength(2));
      expect(abi.functions, hasLength(1));
    });

    test('looks an event up by name', () {
      expect(
        abi.event('Transfer').canonicalSignature,
        'Transfer(address,address,uint256)',
      );
    });

    test('reports an unknown event name', () {
      expect(() => abi.event('Nope'), throwsA(isA<FlareAbiException>()));
    });

    test('dispatches a log to the right event by topic0', () {
      final topics = [hexToBytes(abi.event('Approval').topic0Hex!)];
      expect(abi.eventForTopics(topics)?.name, 'Approval');
    });

    test('returns null for a topic it does not know', () {
      expect(abi.eventForTopics([Uint8List(32)]), isNull);
    });

    test('eventsByTopic0 indexes every event for fast dispatch', () {
      final index = abi.eventsByTopic0;
      expect(index, hasLength(2));
      expect(index[abi.event('Transfer').topic0Hex]?.name, 'Transfer');
    });
  });

  group('utf8 sanity for signature hashing', () {
    test('hashes the signature bytes, not a Dart string identity', () {
      final ev = AbiEvent.fromJson(const {
        'type': 'event',
        'name': 'A',
        'inputs': [
          {'name': 'x', 'type': 'uint256', 'indexed': false},
        ],
      });
      expect(
        ev.topic0Hex,
        bytesToHex(keccak256(Uint8List.fromList(utf8.encode('A(uint256)')))),
      );
    });
  });
}
