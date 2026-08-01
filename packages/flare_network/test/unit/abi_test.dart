import 'dart:typed_data';

import 'package:flare_network/src/abi/abi_function.dart';
import 'package:flare_network/src/abi/abi_type.dart';
import 'package:flare_network/src/abi/eth_address.dart';
import 'package:flare_network/src/abi/hex.dart';
import 'package:flare_network/src/rpc/flare_exception.dart';
import 'package:test/test.dart';

/// Every expected value in this file was produced independently by Foundry's
/// `cast calldata` / `cast abi-encode` on 2026-07-31. They are external
/// reference vectors, not values this implementation generated for itself.
void main() {
  group('AbiType.parse', () {
    test('expands the uint/int aliases to their canonical 256-bit names', () {
      // A selector hashed from "uint" instead of "uint256" matches nothing.
      expect(AbiType.parse('uint').name, 'uint256');
      expect(AbiType.parse('int').name, 'int256');
    });

    test('parses fixed and dynamic arrays', () {
      expect(AbiType.parse('address[]').name, 'address[]');
      expect(AbiType.parse('uint8[3]').name, 'uint8[3]');
      expect(AbiType.parse('bytes21[]').name, 'bytes21[]');
    });

    test('parses nested arrays with the correct binding order', () {
      expect(AbiType.parse('uint256[2][]').name, 'uint256[2][]');
    });

    test('parses tuples, including nested and arrayed ones', () {
      expect(AbiType.parse('(address,uint256)').name, '(address,uint256)');
      expect(
        AbiType.parse('(bytes32[],(uint32,int8))').name,
        '(bytes32[],(uint32,int8))',
      );
      expect(AbiType.parse('(address,uint256)[]').name, '(address,uint256)[]');
    });

    test('classifies dynamism correctly', () {
      expect(AbiType.parse('uint256').isDynamic, isFalse);
      expect(AbiType.parse('bytes21').isDynamic, isFalse);
      expect(AbiType.parse('bytes').isDynamic, isTrue);
      expect(AbiType.parse('string').isDynamic, isTrue);
      expect(AbiType.parse('address[]').isDynamic, isTrue);
      // A fixed array is dynamic only if its element is.
      expect(AbiType.parse('uint8[3]').isDynamic, isFalse);
      expect(AbiType.parse('string[3]').isDynamic, isTrue);
      // A tuple is dynamic if any component is.
      expect(AbiType.parse('(uint8,bool)').isDynamic, isFalse);
      expect(AbiType.parse('(uint8,bytes)').isDynamic, isTrue);
    });

    test('rejects malformed types', () {
      expect(() => AbiType.parse('uint7'), throwsA(isA<FlareAbiException>()));
      expect(() => AbiType.parse('uint512'), throwsA(isA<FlareAbiException>()));
      expect(() => AbiType.parse('bytes33'), throwsA(isA<FlareAbiException>()));
      expect(() => AbiType.parse('bytes0'), throwsA(isA<FlareAbiException>()));
      expect(
        () => AbiType.parse('nonsense'),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('integer encoding', () {
    test('encodes a signed negative as two\'s complement (cast: int8 -3)', () {
      expect(
        bytesToHex(const AbiIntType(8, signed: true).encode(BigInt.from(-3))),
        '0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd',
      );
    });

    test('round-trips negative int8 values', () {
      const t = AbiIntType(8, signed: true);
      for (final v in [-128, -3, -1, 0, 1, 127]) {
        final encoded = t.encode(BigInt.from(v));
        expect(t.decode(encoded, 0, 0), BigInt.from(v), reason: 'value $v');
      }
    });

    test('enforces the declared range', () {
      const i8 = AbiIntType(8, signed: true);
      expect(
        () => i8.encode(BigInt.from(128)),
        throwsA(isA<FlareAbiException>()),
      );
      expect(
        () => i8.encode(BigInt.from(-129)),
        throwsA(isA<FlareAbiException>()),
      );

      const u8 = AbiIntType(8, signed: false);
      expect(
        () => u8.encode(BigInt.from(-1)),
        throwsA(isA<FlareAbiException>()),
      );
      expect(
        () => u8.encode(BigInt.from(256)),
        throwsA(isA<FlareAbiException>()),
      );
    });

    test('handles a full-width uint256', () {
      final max = (BigInt.one << 256) - BigInt.one;
      const t = AbiIntType(256, signed: false);
      expect(t.decode(t.encode(max), 0, 0), max);
    });
  });

  group('encodeCall matches Foundry', () {
    test('getFeedsById(bytes21[]) with three feed IDs', () {
      final fn = AbiFunction(
        name: 'getFeedsById',
        inputs: [
          AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]')),
        ],
        outputs: const [],
        stateMutability: StateMutability.payable,
      );
      final calldata = fn.encodeCall([
        [
          hexToBytes('0x01464c522f55534400000000000000000000000000'),
          hexToBytes('0x014254432f55534400000000000000000000000000'),
          hexToBytes('0x015852502f55534400000000000000000000000000'),
        ],
      ]);
      expect(
        bytesToHex(calldata),
        '0x4c375745'
        '0000000000000000000000000000000000000000000000000000000000000020'
        '0000000000000000000000000000000000000000000000000000000000000003'
        '01464c522f555344000000000000000000000000000000000000000000000000'
        '014254432f555344000000000000000000000000000000000000000000000000'
        '015852502f555344000000000000000000000000000000000000000000000000',
      );
    });

    test('getContractAddressByName(string) with "FtsoV2"', () {
      final fn = AbiFunction(
        name: 'getContractAddressByName',
        inputs: [AbiParameter(name: '_name', type: AbiType.parse('string'))],
        outputs: const [],
        stateMutability: StateMutability.view,
      );
      expect(
        bytesToHex(fn.encodeCall(['FtsoV2'])),
        '0x82760fca'
        '0000000000000000000000000000000000000000000000000000000000000020'
        '0000000000000000000000000000000000000000000000000000000000000006'
        '4674736f56320000000000000000000000000000000000000000000000000000',
      );
    });

    test('transfer(address,uint256) — two static arguments', () {
      final fn = AbiFunction(
        name: 'transfer',
        inputs: [
          AbiParameter(name: 'to', type: AbiType.parse('address')),
          AbiParameter(name: 'amount', type: AbiType.parse('uint256')),
        ],
        outputs: const [],
        stateMutability: StateMutability.nonpayable,
      );
      final calldata = fn.encodeCall([
        EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
        BigInt.parse('1000000000000000000'),
      ]);
      expect(
        bytesToHex(calldata),
        '0xa9059cbb'
        '000000000000000000000000c67dce33d7a8efa5ffeb961899c73fe01bce9273'
        '0000000000000000000000000000000000000000000000000de0b6b3a7640000',
      );
    });
  });

  group('decodeReturn matches Foundry', () {
    test('decodes (uint256,int8[],uint64) — the FTSO return shape', () {
      // cast abi-encode "f(uint256,int8[],uint64)" 626025 "[8,2,6]" 1785528109
      final data = hexToBytes(
        '0x0000000000000000000000000000000000000000000000000000000000098d69'
        '0000000000000000000000000000000000000000000000000000000000000060'
        '000000000000000000000000000000000000000000000000000000006a6cff2d'
        '0000000000000000000000000000000000000000000000000000000000000003'
        '0000000000000000000000000000000000000000000000000000000000000008'
        '0000000000000000000000000000000000000000000000000000000000000002'
        '0000000000000000000000000000000000000000000000000000000000000006',
      );
      final fn = AbiFunction(
        name: 'f',
        inputs: const [],
        outputs: [
          AbiParameter(name: '', type: AbiType.parse('uint256')),
          AbiParameter(name: '', type: AbiType.parse('int8[]')),
          AbiParameter(name: '', type: AbiType.parse('uint64')),
        ],
        stateMutability: StateMutability.view,
      );
      final out = fn.decodeReturn(data);
      expect(out[0], BigInt.from(626025));
      expect(out[1], [BigInt.from(8), BigInt.from(2), BigInt.from(6)]);
      expect(out[2], BigInt.from(1785528109));
    });

    test('reports empty return data instead of decoding zeros', () {
      final fn = AbiFunction(
        name: 'getThing',
        inputs: const [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
        stateMutability: StateMutability.view,
      );
      expect(
        () => fn.decodeReturn(Uint8List(0)),
        throwsA(isA<FlareContractException>()),
      );
    });

    test('reports truncated data rather than reading past the end', () {
      final fn = AbiFunction(
        name: 'getThing',
        inputs: const [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );
      expect(
        () => fn.decodeReturn(Uint8List(16)),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('AbiCodec top-level encoding', () {
    // A standalone dynamic parameter carries a leading offset word. Verified
    // against `cast abi-encode "f(string)" "hello"`.
    test('a single string parameter leads with an offset word', () {
      expect(
        bytesToHex(AbiCodec.encodeTypes(['string'], ['hello'])),
        '0x0000000000000000000000000000000000000000000000000000000000000020'
        '0000000000000000000000000000000000000000000000000000000000000005'
        '68656c6c6f000000000000000000000000000000000000000000000000000000',
      );
    });

    test('string[] matches cast abi-encode "f(string[])" "[alpha,beta]"', () {
      expect(
        bytesToHex(
          AbiCodec.encodeTypes(
            ['string[]'],
            [
              ['alpha', 'beta'],
            ],
          ),
        ),
        '0x0000000000000000000000000000000000000000000000000000000000000020'
        '0000000000000000000000000000000000000000000000000000000000000002'
        '0000000000000000000000000000000000000000000000000000000000000040'
        '0000000000000000000000000000000000000000000000000000000000000080'
        '0000000000000000000000000000000000000000000000000000000000000005'
        '616c706861000000000000000000000000000000000000000000000000000000'
        '0000000000000000000000000000000000000000000000000000000000000004'
        '6265746100000000000000000000000000000000000000000000000000000000',
      );
    });

    test('rejects a values/types length mismatch', () {
      expect(
        () => AbiCodec.encodeTypes(['uint256', 'bool'], [BigInt.one]),
        throwsA(isA<FlareAbiException>()),
      );
    });
  });

  group('round-trips through AbiCodec', () {
    test('string, including multi-byte UTF-8', () {
      for (final s in ['', 'FtsoV2', 'a' * 100, 'héllo · 世界']) {
        final encoded = AbiCodec.encodeTypes(['string'], [s]);
        expect(AbiCodec.decodeTypes(['string'], encoded).single, s, reason: s);
      }
    });

    test('dynamic bytes of awkward lengths around the word boundary', () {
      for (final len in [0, 1, 31, 32, 33, 64, 100]) {
        final v = Uint8List.fromList(List.generate(len, (i) => i % 256));
        final encoded = AbiCodec.encodeTypes(['bytes'], [v]);
        expect(
          AbiCodec.decodeTypes(['bytes'], encoded).single,
          v,
          reason: 'length $len',
        );
      }
    });

    test('array of dynamic elements', () {
      final v = ['alpha', '', 'a longer string that spills past one word'];
      final encoded = AbiCodec.encodeTypes(['string[]'], [v]);
      expect(AbiCodec.decodeTypes(['string[]'], encoded).single, v);
    });

    test('tuple mixing static and dynamic components', () {
      final v = [
        EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
        hexToBytes('0xdeadbeef'),
        BigInt.from(42),
      ];
      final encoded = AbiCodec.encodeTypes(['(address,bytes,uint64)'], [v]);
      final out =
          AbiCodec.decodeTypes(['(address,bytes,uint64)'], encoded).single
              as List;
      expect(out[0], v[0]);
      expect(out[1], v[1]);
      expect(out[2], v[2]);
    });

    test('bytes21 feed IDs survive intact', () {
      final feed = hexToBytes('0x01464c522f55534400000000000000000000000000');
      final encoded = AbiCodec.encodeTypes(['bytes21'], [feed]);
      expect(AbiCodec.decodeTypes(['bytes21'], encoded).single, feed);
    });

    test('multiple mixed parameters in one list', () {
      final types = ['uint256', 'string', 'address', 'bool', 'int8[]'];
      final values = [
        BigInt.from(626025),
        'FLR/USD',
        EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
        true,
        [BigInt.from(8), BigInt.from(-2), BigInt.from(6)],
      ];
      final decoded = AbiCodec.decodeTypes(
        types,
        AbiCodec.encodeTypes(types, values),
      );
      expect(decoded[0], values[0]);
      expect(decoded[1], values[1]);
      expect(decoded[2], values[2]);
      expect(decoded[3], values[3]);
      expect(decoded[4], values[4]);
    });
  });

  group('ContractAbi', () {
    final abi = ContractAbi.fromJson([
      {
        'type': 'function',
        'name': 'getFeedsById',
        'stateMutability': 'payable',
        'inputs': [
          {'name': '_feedIds', 'type': 'bytes21[]'},
        ],
        'outputs': [
          {'name': '', 'type': 'uint256[]'},
          {'name': '', 'type': 'int8[]'},
          {'name': '', 'type': 'uint64'},
        ],
      },
      {
        'type': 'function',
        'name': 'overloaded',
        'stateMutability': 'view',
        'inputs': [
          {'name': 'a', 'type': 'uint256'},
        ],
        'outputs': const [],
      },
      {
        'type': 'function',
        'name': 'overloaded',
        'stateMutability': 'view',
        'inputs': [
          {'name': 'a', 'type': 'uint256'},
          {'name': 'b', 'type': 'uint256'},
        ],
        'outputs': const [],
      },
      {'type': 'event', 'name': 'Ignored', 'inputs': const []},
    ]);

    test('parses functions and skips non-function entries', () {
      expect(abi.functionsByName.containsKey('Ignored'), isFalse);
      expect(abi.function('getFeedsById').selectorHex, '0x4c375745');
    });

    test('preserves state mutability', () {
      expect(
        abi.function('getFeedsById').stateMutability,
        StateMutability.payable,
      );
      // Declared payable, yet free to read — the FTSOv2 quirk.
      expect(abi.function('getFeedsById').stateMutability.isReadOnly, isFalse);
    });

    test('refuses to guess between overloads', () {
      expect(
        () => abi.function('overloaded'),
        throwsA(isA<FlareAbiException>()),
      );
      expect(abi.function('overloaded', argumentCount: 2).inputs.length, 2);
    });

    test('reconstructs tuple components rather than losing them', () {
      final withTuple = ContractAbi.fromJson([
        {
          'type': 'function',
          'name': 'verifyFeedData',
          'stateMutability': 'view',
          'inputs': [
            {
              'name': '_feedData',
              'type': 'tuple',
              'components': [
                {'name': 'proof', 'type': 'bytes32[]'},
                {
                  'name': 'body',
                  'type': 'tuple',
                  'components': [
                    {'name': 'votingRoundId', 'type': 'uint32'},
                    {'name': 'id', 'type': 'bytes21'},
                    {'name': 'value', 'type': 'int32'},
                    {'name': 'turnoutBIPS', 'type': 'uint16'},
                    {'name': 'decimals', 'type': 'int8'},
                  ],
                },
              ],
            },
          ],
          'outputs': [
            {'name': '', 'type': 'bool'},
          ],
        },
      ]);
      expect(
        withTuple.function('verifyFeedData').canonicalSignature,
        'verifyFeedData((bytes32[],(uint32,bytes21,int32,uint16,int8)))',
      );
    });
  });

  group('EthAddress', () {
    test('computes the EIP-55 checksum', () {
      expect(
        EthAddress.parse(
          '0xc67dce33d7a8efa5ffeb961899c73fe01bce9273',
        ).checksummed,
        '0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273',
      );
    });

    test('accepts all-lowercase and all-uppercase input', () {
      expect(
        () => EthAddress.parse('0xc67dce33d7a8efa5ffeb961899c73fe01bce9273'),
        returnsNormally,
      );
      expect(
        () => EthAddress.parse('0xC67DCE33D7A8EFA5FFEB961899C73FE01BCE9273'),
        returnsNormally,
      );
    });

    test('rejects a mixed-case address whose checksum is wrong', () {
      // One character case-flipped from the valid checksum above.
      expect(
        () => EthAddress.parse('0xc67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
        throwsFormatException,
      );
    });

    test('rejects wrong-length input', () {
      expect(() => EthAddress.parse('0xdead'), throwsFormatException);
    });

    test('round-trips through an ABI word', () {
      final a = EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273');
      expect(EthAddress.fromAbiWord(a.toAbiWord()), a);
    });

    test('equality is by value', () {
      expect(
        EthAddress.parse('0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273'),
        EthAddress.parse('0xc67dce33d7a8efa5ffeb961899c73fe01bce9273'),
      );
    });
  });
}
