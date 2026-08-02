import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Revert decoding, against vectors produced by Foundry `cast`.
///
/// Expected values come from an external implementation rather than from this
/// package, so the tests cannot agree with a bug in our own encoder:
///
/// ```
/// cast sig "Error(string)"
/// cast concat-hex 0x08c379a0 $(cast abi-encode "f(string)" "…")
/// ```
///
/// The `Error(string)` vector below is additionally byte-identical to what
/// Coston2 returned live for a `transferFrom` with no balance, so the same
/// bytes are confirmed from two independent directions.
void main() {
  group('selectors', () {
    test('Error and Panic match cast', () {
      // cast sig "Error(string)" -> 0x08c379a0
      expect(SolidityErrors.error.selectorHex, '0x08c379a0');
      // cast sig "Panic(uint256)" -> 0x4e487b71
      expect(SolidityErrors.panic.selectorHex, '0x4e487b71');
    });

    test('custom error selectors match cast', () {
      const cases = {
        'CallFailed(uint256,bytes)': '0x5c0dee5d',
        'AgentNotWhitelisted()': '0xa0479f78',
        'InsufficientFundsForCollateralReservation(uint256,uint256)':
            '0x1124fd9f',
      };
      for (final entry in cases.entries) {
        final name = entry.key.substring(0, entry.key.indexOf('('));
        final types = entry.key
            .substring(entry.key.indexOf('(') + 1, entry.key.length - 1)
            .split(',')
            .where((t) => t.isNotEmpty);
        final error = AbiError(
          name: name,
          inputs: [
            for (final t in types)
              AbiParameter(name: '', type: AbiType.parse(t)),
          ],
        );
        expect(error.canonicalSignature, entry.key);
        expect(error.selectorHex, entry.value, reason: entry.key);
      }
    });
  });

  group('Error(string)', () {
    // Identical bytes were returned live by Coston2 on 2026-08-02 for
    // transferFrom against WNat with no balance.
    const wire =
        '0x08c379a0'
        '0000000000000000000000000000000000000000000000000000000000000020'
        '0000000000000000000000000000000000000000000000000000000000000026'
        '45524332303a207472616e7366657220616d6f756e7420657863656564732062'
        '616c616e63650000000000000000000000000000000000000000000000000000';

    test('decodes the message', () {
      final reason = RevertReason.decodeBytes(hexToBytes(wire));
      expect(reason, isA<RevertWithMessage>());
      expect(
        (reason as RevertWithMessage).message,
        'ERC20: transfer amount exceeds balance',
      );
      expect(reason.description, 'ERC20: transfer amount exceeds balance');
    });

    test('decodes from a JSON-RPC error object', () {
      const rpc = FlareRpcException(
        'execution reverted: ERC20: transfer amount exceeds balance',
        code: 3,
        data: wire,
        method: 'eth_call',
      );
      expect(
        rpc.revertReason?.description,
        'ERC20: transfer amount exceeds balance',
      );
    });

    test('honours the offset word rather than assuming 0x20', () {
      // A conforming encoder always emits 0x20 here, but the offset is part of
      // the encoding and a contract may legitimately place the string further
      // out. Assuming 0x20 would silently mis-read this.
      final shifted = hexToBytes(
        '0x08c379a0'
        '0000000000000000000000000000000000000000000000000000000000000040'
        '0000000000000000000000000000000000000000000000000000000000000000'
        '0000000000000000000000000000000000000000000000000000000000000002'
        '6869000000000000000000000000000000000000000000000000000000000000',
      );
      final reason = RevertReason.decodeBytes(shifted);
      expect(reason, isA<RevertWithMessage>());
      expect((reason as RevertWithMessage).message, 'hi');
    });
  });

  group('Panic(uint256)', () {
    test('names the arithmetic overflow code', () {
      // cast concat-hex 0x4e487b71 $(cast abi-encode "f(uint256)" 17)
      final reason = RevertReason.decodeBytes(
        hexToBytes(
          '0x4e487b71'
          '0000000000000000000000000000000000000000000000000000000000000011',
        ),
      );
      expect(reason, isA<RevertWithPanic>());
      expect((reason as RevertWithPanic).code, BigInt.from(0x11));
      expect(reason.description, contains('overflow'));
      expect(reason.description, contains('0x11'));
    });

    test('names the out-of-bounds code', () {
      final reason = RevertReason.decodeBytes(
        hexToBytes(
          '0x4e487b71'
          '0000000000000000000000000000000000000000000000000000000000000032',
        ),
      );
      expect((reason as RevertWithPanic).code, BigInt.from(0x32));
      expect(reason.description, contains('out of bounds'));
    });

    test('an unlisted code still reports its value', () {
      // The compiler may add codes; an unknown one must not be swallowed.
      final reason = RevertReason.decodeBytes(
        hexToBytes(
          '0x4e487b71'
          '00000000000000000000000000000000000000000000000000000000000000ff',
        ),
      );
      expect(reason.description, contains('0xff'));
    });
  });

  group('custom errors', () {
    final callFailed = AbiError(
      name: 'CallFailed',
      inputs: [
        AbiParameter(name: 'index', type: AbiType.parse('uint256')),
        AbiParameter(name: 'result', type: AbiType.parse('bytes')),
      ],
    );

    // cast concat-hex 0x5c0dee5d $(cast abi-encode "f(uint256,bytes)" 7 0xdeadbeef)
    final wire = hexToBytes(
      '0x5c0dee5d'
      '0000000000000000000000000000000000000000000000000000000000000007'
      '0000000000000000000000000000000000000000000000000000000000000040'
      '0000000000000000000000000000000000000000000000000000000000000004'
      'deadbeef00000000000000000000000000000000000000000000000000000000',
    );

    test('names and decodes a matched error', () {
      final reason = RevertReason.decodeBytes(wire, errors: [callFailed]);
      expect(reason, isA<RevertWithCustomError>());
      final custom = reason as RevertWithCustomError;
      expect(custom.error.name, 'CallFailed');
      expect(custom.arguments[0], BigInt.from(7));
      expect(custom.arguments[1], hexToBytes('0xdeadbeef'));
      expect(custom.description, 'CallFailed(7, 0xdeadbeef)');
    });

    test('without the ABI it keeps the selector for later', () {
      final reason = RevertReason.decodeBytes(wire);
      expect(reason, isA<RevertWithUnknownSelector>());
      final unknown = reason as RevertWithUnknownSelector;
      expect(bytesToHex(unknown.selector), '0x5c0dee5d');
      expect(unknown.payload, hasLength(wire.length - 4));
    });

    test('a zero-argument error decodes to its bare name', () {
      final notWhitelisted = AbiError(name: 'AgentNotWhitelisted', inputs: []);
      final reason = RevertReason.decodeBytes(
        hexToBytes('0xa0479f78'),
        errors: [notWhitelisted],
      );
      expect(reason.description, 'AgentNotWhitelisted');
    });

    test('a non-matching ABI does not produce a false positive', () {
      final other = AbiError(name: 'SomethingElse', inputs: []);
      expect(
        RevertReason.decodeBytes(wire, errors: [other]),
        isA<RevertWithUnknownSelector>(),
      );
    });

    test('revertReasonWith threads the ABI through from an exception', () {
      final rpc = FlareRpcException(
        'execution reverted',
        code: 3,
        data: bytesToHex(wire),
      );
      expect(rpc.revertReason, isA<RevertWithUnknownSelector>());
      expect(
        rpc.revertReasonWith([callFailed])?.description,
        'CallFailed(7, 0xdeadbeef)',
      );
    });
  });

  group('empty and malformed data', () {
    test('empty data means no reason was given', () {
      expect(
        RevertReason.decodeBytes(Uint8List(0)),
        isA<RevertWithoutReason>(),
      );
      expect(RevertReason.tryDecode('0x'), isA<RevertWithoutReason>());
    });

    test('an absent data field yields null', () {
      // Flare reports a bare `revert()` as -32000 with no `data` at all, where
      // geth reports code 3 with `data: "0x"`. Callers must not have to know
      // which node they are talking to, so both read as "no reason".
      const noData = FlareRpcException('execution reverted', code: -32000);
      expect(noData.revertReason, isNull);
      const withEmpty = FlareRpcException(
        'execution reverted',
        code: 3,
        data: '0x',
      );
      expect(withEmpty.revertReason, isA<RevertWithoutReason>());
      // Either way, the caller's question is answered the same.
      expect(
        noData.revertReason?.description ?? 'no reason',
        withEmpty.revertReason is RevertWithoutReason
            ? 'no reason'
            : 'mismatch',
      );
    });

    test('non-hex or absent payloads decode to null rather than throwing', () {
      expect(RevertReason.tryDecode(null), isNull);
      expect(RevertReason.tryDecode('not hex'), isNull);
      expect(RevertReason.tryDecode(42), isNull);
      expect(RevertReason.tryDecode({'nothing': 'here'}), isNull);
    });

    test('a nested {data: …} object is accepted', () {
      expect(
        RevertReason.tryDecode({'data': '0x4e487b71${'0' * 63}1'}),
        isA<RevertWithPanic>(),
      );
    });

    test('data shorter than a selector does not throw', () {
      final reason = RevertReason.decodeBytes(hexToBytes('0xabcd'));
      expect(reason, isA<RevertWithUnknownSelector>());
    });

    test('a truncated Error(string) body degrades instead of throwing', () {
      // Revert data comes from the called contract, so a hostile or simply
      // broken payload is expected input rather than an exceptional case.
      final truncated = hexToBytes(
        '0x08c379a0'
        '0000000000000000000000000000000000000000000000000000000000000020'
        '00000000000000000000000000000000000000000000000000000000000000ff',
      );
      expect(() => RevertReason.decodeBytes(truncated), returnsNormally);
      expect(
        RevertReason.decodeBytes(truncated),
        isA<RevertWithUnknownSelector>(),
      );
    });

    test('an enormous declared length does not allocate', () {
      final hostile = hexToBytes(
        '0x08c379a0'
        '0000000000000000000000000000000000000000000000000000000000000020'
        '7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',
      );
      expect(() => RevertReason.decodeBytes(hostile), returnsNormally);
    });
  });

  group('ContractAbi', () {
    test('parses errors alongside functions and events', () {
      final abi = ContractAbi.fromJson([
        {
          'type': 'function',
          'name': 'redeem',
          'inputs': [],
          'outputs': [],
          'stateMutability': 'nonpayable',
        },
        {'type': 'event', 'name': 'Redeemed', 'inputs': []},
        {
          'type': 'error',
          'name': 'InsufficientFundsForRedeem',
          'inputs': [
            {'name': 'required', 'type': 'uint256'},
          ],
        },
      ]);

      expect(abi.functions, hasLength(1));
      expect(abi.events, hasLength(1));
      expect(abi.errors, hasLength(1));
      expect(
        abi.errors.single.canonicalSignature,
        'InsufficientFundsForRedeem(uint256)',
      );
    });

    test('an ABI with no error entries yields an empty list', () {
      final abi = ContractAbi.fromJson([
        {
          'type': 'function',
          'name': 'name',
          'inputs': [],
          'outputs': [
            {'name': '', 'type': 'string'},
          ],
          'stateMutability': 'view',
        },
      ]);
      expect(abi.errors, isEmpty);
    });
  });
}
