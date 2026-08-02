import 'package:flare_network_codegen/src/dart_names.dart';
import 'package:flare_network_codegen/src/generator.dart';
import 'package:flare_network_codegen/src/type_mapper.dart';
import 'package:test/test.dart';

/// Tests for the binding generator.
///
/// This tool emits ~30,000 lines across 142 files, so a mistake here is
/// multiplied. The cases below pin the behaviours that were actually wrong at
/// some point during development.
void main() {
  const generator = BindingGenerator(artifactVersion: '0.1.52');

  Map<String, Object?> fn(
    String name, {
    List<Map<String, Object?>> inputs = const [],
    List<Map<String, Object?>> outputs = const [],
    String mutability = 'view',
  }) => {
    'type': 'function',
    'name': name,
    'inputs': inputs,
    'outputs': outputs,
    'stateMutability': mutability,
  };

  group('toDartIdentifier', () {
    test('strips the leading underscore Solidity uses for parameters', () {
      // A leading underscore would make the Dart member library-private and
      // therefore unreachable from user code.
      expect(toDartIdentifier('_feedId'), 'feedId');
      expect(toDartIdentifier('__value'), 'value');
    });

    test('converts snake_case to lowerCamelCase', () {
      expect(toDartIdentifier('voting_round_id'), 'votingRoundId');
    });

    test('renames Dart reserved words', () {
      // `is` and `default` are legal Solidity parameter names.
      for (final word in ['is', 'default', 'class', 'switch', 'in']) {
        final result = toDartIdentifier(word);
        expect(result, isNot(word), reason: word);
        expect(result, endsWith('Value'), reason: word);
      }
    });

    test('renames members every Dart object already has', () {
      expect(toDartIdentifier('hashCode'), isNot('hashCode'));
      expect(toDartIdentifier('toString'), isNot('toString'));
    });

    test('prefixes identifiers that would start with a digit', () {
      expect(toDartIdentifier('2fa'), startsWith('v'));
    });

    test('falls back when the name is empty', () {
      expect(toDartIdentifier('', fallback: 'arg1'), 'arg1');
      expect(toDartIdentifier('_', fallback: 'arg1'), 'arg1');
    });
  });

  group('naming helpers', () {
    test('keeps the leading I of an interface name', () {
      // IFtsoV2 and FtsoV2 are separate artifacts; collapsing them would
      // collide two different contracts onto one file.
      expect(toDartClassName('IFtsoV2'), 'IFtsoV2');
      expect(toDartClassName('FtsoV2'), 'FtsoV2');
    });

    test('converts contract names to snake_case file names', () {
      expect(toSnakeCase('FtsoV2Interface'), 'ftso_v2_interface');
      expect(toSnakeCase('IFdcHub'), 'i_fdc_hub');
      expect(toSnakeCase('IIFtsoFeedPublisher'), 'ii_ftso_feed_publisher');
    });

    test('deduplicate suffixes repeats', () {
      expect(deduplicate(['a', 'b', 'a', 'a']), ['a', 'b', 'a2', 'a3']);
    });
  });

  group('TypeMapper', () {
    String map(String solidityType) =>
        TypeMapper.dartType(AbiParam(name: '', type: solidityType));

    test('maps every integer width to BigInt, including int8', () {
      // A uniform rule cannot silently overflow.
      for (final t in ['uint8', 'int8', 'uint64', 'int256', 'uint256']) {
        expect(map(t), 'BigInt', reason: t);
      }
    });

    test('maps the primitive types', () {
      expect(map('address'), 'EthAddress');
      expect(map('bool'), 'bool');
      expect(map('string'), 'String');
      expect(map('bytes'), 'Uint8List');
      expect(map('bytes21'), 'Uint8List');
      expect(map('bytes32'), 'Uint8List');
    });

    test('maps arrays, including nested ones', () {
      expect(map('address[]'), 'List<EthAddress>');
      expect(map('bytes21[]'), 'List<Uint8List>');
      expect(map('uint256[2]'), 'List<BigInt>');
      expect(map('uint256[2][]'), 'List<List<BigInt>>');
    });

    test('maps tuples to positional lists rather than records', () {
      // Records read better but need recursive destructuring for nested
      // tuples, which Flare's ABI genuinely contains.
      final tuple = AbiParam(
        name: 'data',
        type: 'tuple',
        components: [
          AbiParam(name: 'a', type: 'uint256'),
          AbiParam(name: 'b', type: 'address'),
        ],
      );
      expect(TypeMapper.dartType(tuple), 'List<Object?>');
    });

    test('expands tuple components in the canonical signature', () {
      // The raw ABI `type` field says only "tuple", so a selector hashed from
      // it would be wrong.
      final tuple = AbiParam(
        name: 'data',
        type: 'tuple',
        components: [
          AbiParam(name: 'a', type: 'uint32'),
          AbiParam(name: 'b', type: 'bytes21'),
        ],
      );
      expect(tuple.canonicalType, '(uint32,bytes21)');

      final tupleArray = AbiParam(
        name: 'data',
        type: 'tuple[]',
        components: [AbiParam(name: 'a', type: 'uint32')],
      );
      expect(tupleArray.canonicalType, '(uint32)[]');
    });

    test('multi-output functions get a named record when all are named', () {
      final outputs = [
        AbiParam(name: '_value', type: 'uint256'),
        AbiParam(name: '_decimals', type: 'int8'),
        AbiParam(name: '_timestamp', type: 'uint64'),
      ];
      expect(
        TypeMapper.returnType(outputs),
        '({BigInt value, BigInt decimals, BigInt timestamp})',
      );
    });

    test('multi-output falls back to a positional record when unnamed', () {
      final outputs = [
        AbiParam(name: '', type: 'uint256'),
        AbiParam(name: '', type: 'bool'),
      ];
      expect(TypeMapper.returnType(outputs), '(BigInt, bool)');
    });

    test('single and zero output cases', () {
      expect(TypeMapper.returnType([AbiParam(name: '', type: 'bool')]), 'bool');
      expect(TypeMapper.returnType(const []), 'void');
    });

    test('throws on an unmappable type rather than emitting dynamic', () {
      // Failing loudly beats generating code that compiles but is wrong.
      expect(() => map('fixed128x18'), throwsA(isA<UnsupportedError>()));
    });
  });

  group('parseArtifact', () {
    test('accepts a bare ABI array, which is what Flare publishes', () {
      final abi = parseArtifact('[{"type":"function","name":"a"}]');
      expect(abi, hasLength(1));
    });

    test('also accepts a Hardhat-style object', () {
      final abi = parseArtifact('{"abi":[{"type":"function","name":"a"}]}');
      expect(abi, hasLength(1));
    });

    test('rejects anything else', () {
      expect(() => parseArtifact('"nope"'), throwsFormatException);
    });
  });

  group('generate', () {
    test('emits a class with a resolve helper and a typed method', () {
      final binding =
          generator.generate('FtsoV2Interface', [
            fn(
              'getFeedsById',
              inputs: [
                {'name': '_feedIds', 'type': 'bytes21[]'},
              ],
              outputs: [
                {'name': '_values', 'type': 'uint256[]'},
                {'name': '_decimals', 'type': 'int8[]'},
                {'name': '_timestamp', 'type': 'uint64'},
              ],
              mutability: 'payable',
            ),
          ])!;

      expect(binding.fileName, 'ftso_v2_interface.g.dart');
      expect(binding.methodCount, 1);
      expect(binding.source, contains('class FtsoV2InterfaceContract'));
      expect(
        binding.source,
        contains('static Future<FtsoV2InterfaceContract> resolve'),
      );
      expect(
        binding.source,
        contains(
          'Future<({List<BigInt> values, List<BigInt> decimals, BigInt timestamp})> '
          'getFeedsById(List<Uint8List> feedIds)',
        ),
      );
      expect(binding.source, contains('DO NOT EDIT'));
      expect(binding.source, contains('0.1.52'));
    });

    test('includes payable getters, which read free via eth_call', () {
      // FTSOv2's feed getters are declared payable yet cost nothing to read.
      final binding = generator.generate('X', [
        fn(
          'getFeed',
          outputs: [
            {'name': '', 'type': 'uint256'},
          ],
          mutability: 'payable',
        ),
      ]);
      expect(binding?.methodCount, 1);
    });

    test('emits a transaction builder for a state-changing function', () {
      final binding = generator.generate('X', [
        fn(
          'setThing',
          inputs: [
            {'name': 'v', 'type': 'uint256'},
          ],
          mutability: 'nonpayable',
        ),
      ]);

      // A nonpayable function cannot be read, but it is exactly what a wallet
      // is asked to sign, so the binding builds the request rather than
      // leaving the caller to hand-encode calldata.
      expect(binding, isNotNull);
      expect(
        binding!.source,
        contains('TransactionRequest setThingTx(BigInt v, {EthAddress? from})'),
      );
      // Nonpayable: no `value` parameter, because attaching value reverts.
      expect(binding.source, isNot(contains('BigInt? value')));
      // And no reader, since eth_call would not reflect the state change.
      expect(binding.source, isNot(contains('Future<void> setThing(')));
    });

    test('a payable function gets both a reader and a builder', () {
      final binding = generator.generate('X', [
        fn(
          'requestThing',
          inputs: [
            {'name': 'v', 'type': 'uint256'},
          ],
          outputs: [
            {'name': '', 'type': 'bytes32'},
          ],
          mutability: 'payable',
        ),
      ]);

      // FTSOv2's feed getters are payable yet read for free, while FDC's
      // requestAttestation is payable and genuinely state-changing. The ABI
      // does not distinguish them, so both members are emitted.
      expect(binding!.source, contains('Future<Uint8List> requestThing('));
      expect(binding.source, contains('TransactionRequest requestThingTx('));
      // Payable, so value is accepted.
      expect(binding.source, contains('BigInt? value'));
      expect(binding.source, contains('value: value,'));
    });

    test('emits an events-only interface rather than skipping it', () {
      // IAssetManagerEvents declares 55 events and no functions. Those logs
      // are the entire point of the contract, so a binding is still useful.
      final binding = generator.generate('IEvents', [
        {
          'type': 'event',
          'name': 'Thing',
          'inputs': [
            {'name': 'who', 'type': 'address', 'indexed': true},
          ],
        },
      ]);

      expect(binding, isNotNull);
      expect(binding!.methodCount, 0);
      expect(binding.eventCount, 1);
      expect(binding.source, contains('static final AbiEvent thingEvent'));
      expect(binding.source, contains('indexed: true'));
      expect(binding.source, contains('static DecodedLog? decodeLog'));
    });

    test('returns null only when the ABI declares nothing usable', () {
      expect(generator.generate('X', []), isNull);
      expect(
        generator.generate('X', [
          {'type': 'constructor', 'inputs': <Object?>[]},
        ]),
        isNull,
      );
    });

    test('emits custom errors and a decoder', () {
      // 168 custom errors are declared across the published corpus. They carry
      // no message, so without the declaration a caller sees only the bare
      // string "execution reverted".
      final binding = generator.generate('X', [
        {
          'type': 'error',
          'name': 'InsufficientFundsForRedeem',
          'inputs': [
            {'name': 'required', 'type': 'uint256'},
          ],
        },
        {'type': 'error', 'name': 'AgentNotWhitelisted', 'inputs': <Object?>[]},
      ]);

      expect(binding, isNotNull);
      expect(
        binding!.source,
        contains('static final AbiError insufficientFundsForRedeemError'),
      );
      expect(binding.source, contains('static final List<AbiError> allErrors'));
      expect(
        binding.source,
        contains('static RevertReason? decodeRevert(FlareRpcException e)'),
      );
      expect(binding.source, contains('e.revertReasonWith(allErrors)'));
    });

    test('renames a parameter that would shadow a class member', () {
      // ICoreVaultManager.isDestinationAddressAllowed(string address) shadowed
      // the contract's own `address` field and silently rebound the call
      // target. The generated code compiled; it just called the wrong place.
      final binding =
          generator.generate('ICoreVaultManager', [
            fn(
              'isDestinationAddressAllowed',
              inputs: [
                {'name': 'address', 'type': 'string'},
              ],
              outputs: [
                {'name': '', 'type': 'bool'},
              ],
            ),
          ])!;

      expect(binding.source, contains('String address_'));
      expect(binding.source, contains('args: [address_]'));
      // The call target must still be the field.
      expect(binding.source, contains('contract: address,'));
    });

    test('gives overloaded functions distinct Dart names', () {
      final binding =
          generator.generate('X', [
            fn(
              'get',
              inputs: [
                {'name': 'a', 'type': 'uint256'},
              ],
              outputs: [
                {'name': '', 'type': 'bool'},
              ],
            ),
            fn(
              'get',
              inputs: [
                {'name': 'a', 'type': 'uint256'},
                {'name': 'b', 'type': 'uint256'},
              ],
              outputs: [
                {'name': '', 'type': 'bool'},
              ],
            ),
          ])!;

      // `get` is a Dart built-in identifier and the reserved list is
      // deliberately over-broad, so both overloads are renamed. A slightly
      // uglier identifier is a far cheaper failure than generated code that
      // does not compile.
      expect(binding.methodCount, 2);
      expect(binding.source, contains('> getValue('));
      expect(binding.source, contains('> getValue2('));
      // Each overload keeps its own ABI descriptor, so the two selectors stay
      // distinct even though the Solidity name is shared.
      expect(binding.source, contains('getValueFn'));
      expect(binding.source, contains('getValue2Fn'));
    });

    test('only imports dart:typed_data when a Uint8List appears', () {
      final withBytes =
          generator.generate('A', [
            fn(
              'f',
              outputs: [
                {'name': '', 'type': 'bytes32'},
              ],
            ),
          ])!;
      final withoutBytes =
          generator.generate('B', [
            fn(
              'f',
              outputs: [
                {'name': '', 'type': 'uint256'},
              ],
            ),
          ])!;

      expect(withBytes.source, contains("import 'dart:typed_data'"));
      // An unconditional import produced 110 unused-import warnings across the
      // generated tree.
      expect(withoutBytes.source, isNot(contains("import 'dart:typed_data'")));
    });

    test('preserves the canonical signature for selector derivation', () {
      final binding =
          generator.generate('X', [
            fn(
              'f',
              inputs: [
                {
                  'name': 'data',
                  'type': 'tuple',
                  'components': [
                    {'name': 'a', 'type': 'uint32'},
                    {'name': 'b', 'type': 'bytes21'},
                  ],
                },
              ],
              outputs: [
                {'name': '', 'type': 'bool'},
              ],
            ),
          ])!;

      // Not "f(tuple)", which would hash to a selector no contract answers.
      expect(binding.source, contains('f((uint32,bytes21))'));
      expect(binding.source, contains("AbiType.parse('(uint32,bytes21)')"));
    });

    test('barrel exports every generated file, sorted', () {
      final bindings = [
        for (final name in ['ZContract', 'AContract'])
          generator.generate(name, [
            fn(
              'f',
              outputs: [
                {'name': '', 'type': 'bool'},
              ],
            ),
          ])!,
      ];

      final barrel = generator.generateBarrel(bindings);
      expect(
        barrel.indexOf('a_contract'),
        lessThan(barrel.indexOf('z_contract')),
      );
      expect(barrel, contains('DO NOT EDIT'));
    });
  });
}
