import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../rpc/flare_exception.dart';
import 'eth_address.dart';
import 'hex.dart';

/// A Solidity ABI type, able to encode Dart values to calldata and decode
/// return data back.
///
/// Obtain instances with [AbiType.parse]. Encoding follows the head/tail layout
/// from the Contract ABI specification: static values sit inline in the head,
/// dynamic values place a byte offset in the head and their payload in the tail.
///
/// ## Dart representations
///
/// | Solidity              | Dart                     |
/// |-----------------------|--------------------------|
/// | `uintN`, `intN`       | [BigInt]                 |
/// | `address`             | [EthAddress]             |
/// | `bool`                | [bool]                   |
/// | `bytes`, `bytesN`     | [Uint8List]              |
/// | `string`              | [String]                 |
/// | `T[]`, `T[k]`         | [List]                   |
/// | `(A,B)` tuple         | [List]                   |
///
/// Every integer decodes to [BigInt], including small ones such as `int8`.
/// That is deliberate: a uniform rule cannot silently overflow, and callers
/// narrow explicitly with `.toInt()` where they know the range. FTSO decimals
/// are `int8` and legitimately negative, so a `BigInt`-to-`int` conversion at
/// the edge is the only place a sign error can hide.
@immutable
sealed class AbiType {
  const AbiType();

  /// Canonical Solidity name, as it appears in a function selector.
  String get name;

  /// Whether this type is dynamically sized and therefore encoded in the tail.
  bool get isDynamic;

  /// Bytes this type occupies in the head. Dynamic types occupy one 32-byte
  /// word holding an offset.
  int get headSize => 32;

  /// Encodes [value] into whole 32-byte words.
  Uint8List encode(Object? value);

  /// Decodes a value starting at [offset] in [data].
  ///
  /// [base] is the byte position that dynamic offsets in this region are
  /// measured from — the start of the enclosing tuple, which is not always 0
  /// for nested structures.
  Object? decode(Uint8List data, int offset, int base);

  /// Parses a Solidity type expression such as `uint256`, `bytes21`,
  /// `address[]`, `uint8[3]` or `(address,uint256)[]`.
  factory AbiType.parse(String type) {
    final t = type.trim();
    if (t.isEmpty) {
      throw const FlareAbiException('Empty type expression');
    }

    // Arrays bind last, so peel the trailing [..] first.
    if (t.endsWith(']')) {
      final open = _matchingBracket(t);
      final inner = AbiType.parse(t.substring(0, open));
      final lengthText = t.substring(open + 1, t.length - 1);
      if (lengthText.isEmpty) return AbiArrayType(inner);
      final length = int.tryParse(lengthText);
      if (length == null || length < 0) {
        throw FlareAbiException(
          'Invalid fixed array length "$lengthText"',
          solidityType: t,
        );
      }
      return AbiFixedArrayType(inner, length);
    }

    if (t.startsWith('(') && t.endsWith(')')) {
      return AbiTupleType(
        _splitTopLevel(
          t.substring(1, t.length - 1),
        ).map(AbiType.parse).toList(),
      );
    }

    if (t == 'address') return const AbiAddressType();
    if (t == 'bool') return const AbiBoolType();
    if (t == 'string') return const AbiStringType();
    if (t == 'bytes') return const AbiBytesType();

    // `uint`/`int` are aliases for the 256-bit forms; the canonical name must
    // be expanded or the selector will not match the deployed contract.
    if (t == 'uint') return const AbiIntType(256, signed: false);
    if (t == 'int') return const AbiIntType(256, signed: true);

    if (t.startsWith('uint') || t.startsWith('int')) {
      final signed = t.startsWith('int');
      final bits = int.tryParse(t.substring(signed ? 3 : 4));
      if (bits == null || bits < 8 || bits > 256 || bits % 8 != 0) {
        throw FlareAbiException(
          'Integer width must be a multiple of 8 between 8 and 256',
          solidityType: t,
        );
      }
      return AbiIntType(bits, signed: signed);
    }

    if (t.startsWith('bytes')) {
      final size = int.tryParse(t.substring(5));
      if (size == null || size < 1 || size > 32) {
        throw FlareAbiException(
          'Fixed bytes width must be between 1 and 32',
          solidityType: t,
        );
      }
      return AbiFixedBytesType(size);
    }

    throw FlareAbiException('Unsupported type', solidityType: t);
  }

  static int _matchingBracket(String t) {
    var depth = 0;
    for (var i = t.length - 1; i >= 0; i--) {
      final c = t[i];
      if (c == ']') depth++;
      if (c == '[') {
        depth--;
        if (depth == 0) return i;
      }
    }
    throw FlareAbiException('Unbalanced brackets', solidityType: t);
  }

  /// Splits `a,(b,c),d` on top-level commas only.
  static List<String> _splitTopLevel(String s) {
    if (s.trim().isEmpty) return const [];
    final parts = <String>[];
    var depth = 0;
    var start = 0;
    for (var i = 0; i < s.length; i++) {
      final c = s[i];
      if (c == '(' || c == '[') depth++;
      if (c == ')' || c == ']') depth--;
      if (c == ',' && depth == 0) {
        parts.add(s.substring(start, i));
        start = i + 1;
      }
    }
    parts.add(s.substring(start));
    return parts;
  }

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) => other is AbiType && other.name == name;

  @override
  int get hashCode => name.hashCode;
}

/// `uintN` and `intN`.
final class AbiIntType extends AbiType {
  final int bits;
  final bool signed;

  const AbiIntType(this.bits, {required this.signed});

  @override
  String get name => '${signed ? 'int' : 'uint'}$bits';

  @override
  bool get isDynamic => false;

  BigInt get _modulus => BigInt.one << bits;

  @override
  Uint8List encode(Object? value) {
    final v = switch (value) {
      BigInt b => b,
      int i => BigInt.from(i),
      _ =>
        throw FlareAbiException(
          'Expected BigInt or int, got ${value.runtimeType}',
          solidityType: name,
        ),
    };

    if (signed) {
      final bound = BigInt.one << (bits - 1);
      if (v >= bound || v < -bound) {
        throw FlareAbiException('Value $v out of range', solidityType: name);
      }
    } else {
      if (v.isNegative || v >= _modulus) {
        throw FlareAbiException('Value $v out of range', solidityType: name);
      }
    }

    // Two's complement over the full 256-bit word, so the leading bytes of a
    // negative value become 0xff — exactly the sign extension the ABI expects.
    final normalised = v.isNegative ? (BigInt.one << 256) + v : v;

    var hex = normalised.toRadixString(16);
    if (hex.length > 64) hex = hex.substring(hex.length - 64);
    return hexToBytes(hex.padLeft(64, '0'));
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    final word = Uint8List.sublistView(data, offset, offset + 32);
    var v = BigInt.parse(bytesToHex(word, include0x: false), radix: 16);
    if (signed) {
      final signBit = BigInt.one << (bits - 1);
      // The word is sign-extended to 256 bits, so mask to the declared width
      // before interpreting the sign.
      v = v & (_modulus - BigInt.one);
      if ((v & signBit) != BigInt.zero) v -= _modulus;
    }
    return v;
  }
}

/// `address`.
final class AbiAddressType extends AbiType {
  const AbiAddressType();

  @override
  String get name => 'address';

  @override
  bool get isDynamic => false;

  @override
  Uint8List encode(Object? value) => switch (value) {
    EthAddress a => a.toAbiWord(),
    String s => EthAddress.parse(s).toAbiWord(),
    _ =>
      throw FlareAbiException(
        'Expected EthAddress or String, got ${value.runtimeType}',
        solidityType: name,
      ),
  };

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    return EthAddress.fromAbiWord(
      Uint8List.sublistView(data, offset, offset + 32),
    );
  }
}

/// `bool`.
final class AbiBoolType extends AbiType {
  const AbiBoolType();

  @override
  String get name => 'bool';

  @override
  bool get isDynamic => false;

  @override
  Uint8List encode(Object? value) {
    if (value is! bool) {
      throw FlareAbiException(
        'Expected bool, got ${value.runtimeType}',
        solidityType: name,
      );
    }
    final out = Uint8List(32);
    if (value) out[31] = 1;
    return out;
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    for (var i = offset; i < offset + 32; i++) {
      if (data[i] != 0) return true;
    }
    return false;
  }
}

/// `bytesN`, 1 ≤ N ≤ 32. Left-aligned in its word.
final class AbiFixedBytesType extends AbiType {
  final int size;

  const AbiFixedBytesType(this.size);

  @override
  String get name => 'bytes$size';

  @override
  bool get isDynamic => false;

  @override
  Uint8List encode(Object? value) {
    final bytes = switch (value) {
      Uint8List b => b,
      List<int> l => Uint8List.fromList(l),
      String s => hexToBytes(s),
      _ =>
        throw FlareAbiException(
          'Expected Uint8List or hex String, got ${value.runtimeType}',
          solidityType: name,
        ),
    };
    if (bytes.length != size) {
      throw FlareAbiException(
        'Expected exactly $size bytes, got ${bytes.length}',
        solidityType: name,
      );
    }
    return padRight32(bytes);
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    return Uint8List.fromList(
      Uint8List.sublistView(data, offset, offset + size),
    );
  }
}

/// `bytes`, dynamically sized.
final class AbiBytesType extends AbiType {
  const AbiBytesType();

  @override
  String get name => 'bytes';

  @override
  bool get isDynamic => true;

  @override
  Uint8List encode(Object? value) {
    final bytes = switch (value) {
      Uint8List b => b,
      List<int> l => Uint8List.fromList(l),
      String s => hexToBytes(s),
      _ =>
        throw FlareAbiException(
          'Expected Uint8List or hex String, got ${value.runtimeType}',
          solidityType: name,
        ),
    };
    final out =
        BytesBuilder()
          ..add(
            const AbiIntType(
              256,
              signed: false,
            ).encode(BigInt.from(bytes.length)),
          )
          ..add(padRight32(bytes));
    return out.toBytes();
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    final pointer =
        base +
        (const AbiIntType(256, signed: false).decode(data, offset, base)
                as BigInt)
            .toInt();
    _requireWord(data, pointer, name);
    final length =
        (const AbiIntType(256, signed: false).decode(data, pointer, base)
                as BigInt)
            .toInt();
    final start = pointer + 32;
    if (start + length > data.length) {
      throw FlareAbiException(
        'Declared length $length runs past the end of the data',
        solidityType: name,
      );
    }
    return Uint8List.fromList(
      Uint8List.sublistView(data, start, start + length),
    );
  }
}

/// `string`, encoded as UTF-8 `bytes`.
final class AbiStringType extends AbiType {
  const AbiStringType();

  @override
  String get name => 'string';

  @override
  bool get isDynamic => true;

  @override
  Uint8List encode(Object? value) {
    if (value is! String) {
      throw FlareAbiException(
        'Expected String, got ${value.runtimeType}',
        solidityType: name,
      );
    }
    return const AbiBytesType().encode(Uint8List.fromList(utf8.encode(value)));
  }

  @override
  Object? decode(Uint8List data, int offset, int base) =>
      utf8.decode(const AbiBytesType().decode(data, offset, base) as Uint8List);
}

/// `T[]`, dynamically sized.
final class AbiArrayType extends AbiType {
  final AbiType element;

  const AbiArrayType(this.element);

  @override
  String get name => '${element.name}[]';

  @override
  bool get isDynamic => true;

  @override
  Uint8List encode(Object? value) {
    if (value is! List) {
      throw FlareAbiException(
        'Expected List, got ${value.runtimeType}',
        solidityType: name,
      );
    }
    final out =
        BytesBuilder()
          ..add(
            const AbiIntType(
              256,
              signed: false,
            ).encode(BigInt.from(value.length)),
          )
          ..add(_encodeSequence(List.filled(value.length, element), value));
    return out.toBytes();
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    _requireWord(data, offset, name);
    final pointer =
        base +
        (const AbiIntType(256, signed: false).decode(data, offset, base)
                as BigInt)
            .toInt();
    _requireWord(data, pointer, name);
    final length =
        (const AbiIntType(256, signed: false).decode(data, pointer, base)
                as BigInt)
            .toInt();
    // Offsets inside the array body are relative to the body, not the message.
    final body = pointer + 32;
    return _decodeSequence(data, List.filled(length, element), body);
  }
}

/// `T[k]`, fixed length.
final class AbiFixedArrayType extends AbiType {
  final AbiType element;
  final int length;

  const AbiFixedArrayType(this.element, this.length);

  @override
  String get name => '${element.name}[$length]';

  /// A fixed array is dynamic exactly when its element type is.
  @override
  bool get isDynamic => element.isDynamic;

  @override
  int get headSize => isDynamic ? 32 : element.headSize * length;

  @override
  Uint8List encode(Object? value) {
    if (value is! List) {
      throw FlareAbiException(
        'Expected List, got ${value.runtimeType}',
        solidityType: name,
      );
    }
    if (value.length != length) {
      throw FlareAbiException(
        'Expected exactly $length elements, got ${value.length}',
        solidityType: name,
      );
    }
    return _encodeSequence(List.filled(length, element), value);
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    if (isDynamic) {
      final pointer =
          base +
          (const AbiIntType(256, signed: false).decode(data, offset, base)
                  as BigInt)
              .toInt();
      return _decodeSequence(data, List.filled(length, element), pointer);
    }
    return _decodeSequence(data, List.filled(length, element), offset);
  }
}

/// A tuple, which is how Solidity structs appear in an ABI.
final class AbiTupleType extends AbiType {
  final List<AbiType> components;

  const AbiTupleType(this.components);

  @override
  String get name => '(${components.map((c) => c.name).join(',')})';

  @override
  bool get isDynamic => components.any((c) => c.isDynamic);

  @override
  int get headSize =>
      isDynamic ? 32 : components.fold(0, (n, c) => n + c.headSize);

  @override
  Uint8List encode(Object? value) {
    if (value is! List) {
      throw FlareAbiException(
        'Expected List for tuple, got ${value.runtimeType}',
        solidityType: name,
      );
    }
    if (value.length != components.length) {
      throw FlareAbiException(
        'Expected ${components.length} components, got ${value.length}',
        solidityType: name,
      );
    }
    return _encodeSequence(components, value);
  }

  @override
  Object? decode(Uint8List data, int offset, int base) {
    if (isDynamic) {
      final pointer =
          base +
          (const AbiIntType(256, signed: false).decode(data, offset, base)
                  as BigInt)
              .toInt();
      return _decodeSequence(data, components, pointer);
    }
    return _decodeSequence(data, components, offset);
  }
}

/// Encodes and decodes ABI **parameter lists**, which is the shape every
/// contract call and return value actually takes.
///
/// Prefer this over calling [AbiType.encode] directly. A single [AbiType]
/// encodes only its tail payload, because the enclosing sequence owns the head
/// where a dynamic value's offset lives. At the top level there is no enclosing
/// sequence, so [encodeParameters] supplies that head — which is why
/// `abi.encode(string)` begins with an offset word of `0x20`.
abstract final class AbiCodec {
  /// Encodes [values] positionally against [types].
  static Uint8List encodeParameters(List<AbiType> types, List<Object?> values) {
    if (types.length != values.length) {
      throw FlareAbiException(
        'Expected ${types.length} value(s), got ${values.length}',
      );
    }
    return _encodeSequence(types, values);
  }

  /// Decodes [data] into one value per entry in [types].
  static List<Object?> decodeParameters(List<AbiType> types, Uint8List data) =>
      _decodeSequence(data, types, 0);

  /// Convenience wrapper taking Solidity type names, e.g. `['uint256','int8[]']`.
  static Uint8List encodeTypes(List<String> types, List<Object?> values) =>
      encodeParameters(types.map(AbiType.parse).toList(), values);

  /// Convenience wrapper taking Solidity type names.
  static List<Object?> decodeTypes(List<String> types, Uint8List data) =>
      decodeParameters(types.map(AbiType.parse).toList(), data);
}

// ---------------------------------------------------------------- shared

void _requireWord(Uint8List data, int offset, String type) {
  if (offset < 0 || offset + 32 > data.length) {
    throw FlareAbiException(
      'Truncated data: needed a 32-byte word at offset $offset but only '
      '${data.length} bytes are available. The ABI probably does not match '
      'the deployed contract.',
      solidityType: type,
    );
  }
}

/// Encodes [values] against [types] using the head/tail layout.
Uint8List _encodeSequence(List<AbiType> types, List<Object?> values) {
  final headSize = types.fold<int>(0, (n, t) => n + t.headSize);
  final head = BytesBuilder();
  final tail = BytesBuilder();

  for (var i = 0; i < types.length; i++) {
    final type = types[i];
    if (type.isDynamic) {
      head.add(
        const AbiIntType(
          256,
          signed: false,
        ).encode(BigInt.from(headSize + tail.length)),
      );
      tail.add(type.encode(values[i]));
    } else {
      head.add(type.encode(values[i]));
    }
  }
  return (BytesBuilder()
        ..add(head.toBytes())
        ..add(tail.toBytes()))
      .toBytes();
}

/// Decodes [types] from [data] starting at [base].
List<Object?> _decodeSequence(Uint8List data, List<AbiType> types, int base) {
  final out = <Object?>[];
  var cursor = base;
  for (final type in types) {
    out.add(type.decode(data, cursor, base));
    cursor += type.headSize;
  }
  return out;
}
