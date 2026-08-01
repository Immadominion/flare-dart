import 'dart_names.dart';

/// One entry from an ABI `inputs`/`outputs` array.
class AbiParam {
  final String name;
  final String type;
  final List<AbiParam> components;

  AbiParam({required this.name, required this.type, this.components = const []});

  factory AbiParam.fromJson(Map<String, Object?> json) => AbiParam(
        name: (json['name'] as String?) ?? '',
        type: (json['type'] as String?) ?? '',
        components: ((json['components'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParam.fromJson)
            .toList(),
      );

  /// The canonical Solidity type, with `tuple` expanded to its components.
  ///
  /// The raw `type` field says only `tuple`, so a selector hashed from it
  /// would be wrong. Any array suffix after `tuple` is preserved.
  String get canonicalType {
    if (!type.startsWith('tuple')) return type;
    final inner = components.map((c) => c.canonicalType).join(',');
    return '($inner)${type.substring('tuple'.length)}';
  }
}

/// Maps Solidity ABI types onto Dart types for generated bindings.
abstract final class TypeMapper {
  /// The Dart type that represents [param] when decoded.
  ///
  /// Integers all map to [BigInt], including narrow ones such as `int8`. A
  /// uniform rule cannot silently overflow, and it keeps every narrowing
  /// explicit and greppable at the call site.
  static String dartType(AbiParam param) => _dartTypeFor(param.canonicalType, param);

  static String _dartTypeFor(String solidityType, AbiParam param) {
    final t = solidityType;

    if (t.endsWith(']')) {
      final open = _lastUnmatchedBracket(t);
      final elementType = t.substring(0, open);
      return 'List<${_dartTypeFor(elementType, param)}>';
    }

    if (t.startsWith('(') && t.endsWith(')')) {
      return _recordType(param);
    }

    if (t == 'address') return 'EthAddress';
    if (t == 'bool') return 'bool';
    if (t == 'string') return 'String';
    if (t == 'bytes' || t.startsWith('bytes')) return 'Uint8List';
    if (t.startsWith('uint') || t.startsWith('int')) return 'BigInt';

    // An unmapped type would generate code that does not compile, which is a
    // louder and more useful failure than emitting `dynamic`.
    throw UnsupportedError('No Dart mapping for Solidity type "$t"');
  }

  /// The Dart type for a Solidity tuple (a struct).
  ///
  /// Tuples map to `List<Object?>`, positionally ordered, **not** to a Dart
  /// record. Records would read better, but the ABI decoder returns nested
  /// tuples as nested `List`s, and converting those into records requires
  /// recursive destructuring at every depth. Flare's ABI contains genuinely
  /// nested cases — `IIInflationV1.getAnnum` returns a struct containing a
  /// struct containing an array of structs — where that codegen is easy to get
  /// subtly wrong.
  ///
  /// Component order and names are documented on the generated method, so
  /// callers can destructure positionally with confidence.
  ///
  /// Multi-output functions still get proper records: each output maps 1:1 to a
  /// decoded value, so no recursion is involved. See [returnType].
  static String _recordType(AbiParam param) => 'List<Object?>';

  /// The Dart return type for a function with [outputs].
  ///
  /// - no outputs  -> `void`
  /// - one output  -> that type
  /// - several     -> a record, named when every output is named
  static String returnType(List<AbiParam> outputs) {
    if (outputs.isEmpty) return 'void';
    if (outputs.length == 1) return dartType(outputs.single);

    final names = outputs
        .map((o) => o.name.isEmpty ? '' : toDartIdentifier(o.name))
        .toList();
    final usable =
        names.every((n) => n.isNotEmpty) && names.toSet().length == names.length;

    if (usable) {
      final fields = [
        for (var i = 0; i < outputs.length; i++)
          '${dartType(outputs[i])} ${names[i]}',
      ];
      return '({${fields.join(', ')}})';
    }
    return '(${outputs.map(dartType).join(', ')})';
  }

  /// Expression that converts a decoded `Object?` at [source] into [dartTypeName].
  ///
  /// The ABI layer returns loosely-typed values; generated code casts them once,
  /// here, so user-facing signatures stay precise.
  static String castExpression(String source, AbiParam param) {
    final type = dartType(param);
    if (type.startsWith('List<')) {
      final inner = type.substring(5, type.length - 1);
      // `.cast<T>()` alone would defer failures to first access; building a new
      // list surfaces a shape mismatch immediately at the decode boundary.
      return '($source! as List).cast<$inner>()';
    }
    if (type == 'List<Object?>') {
      // A tuple decodes to a plain List; cast without a element type so a
      // nested tuple's inner Lists pass through untouched.
      return '($source! as List).cast<Object?>()';
    }
    return '$source! as $type';
  }

  static int _lastUnmatchedBracket(String t) {
    var depth = 0;
    for (var i = t.length - 1; i >= 0; i--) {
      if (t[i] == ']') depth++;
      if (t[i] == '[') {
        depth--;
        if (depth == 0) return i;
      }
    }
    throw FormatException('Unbalanced brackets in "$t"');
  }
}
