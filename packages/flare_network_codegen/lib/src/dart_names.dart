/// Words that cannot be used as Dart identifiers.
///
/// Solidity has its own keyword set, so a perfectly legal Solidity parameter
/// name such as `is` or `default` will not compile as Dart.
const _dartReserved = {
  'abstract', 'as', 'assert', 'async', 'await', 'base', 'break', 'case',
  'catch', 'class', 'const', 'continue', 'covariant', 'default', 'deferred',
  'do', 'dynamic', 'else', 'enum', 'export', 'extends', 'extension',
  'external', 'factory', 'false', 'final', 'finally', 'for', 'function',
  'get', 'hide', 'if', 'implements', 'import', 'in', 'interface', 'is',
  'late', 'library', 'mixin', 'new', 'null', 'on', 'operator', 'part',
  'required', 'rethrow', 'return', 'sealed', 'set', 'show', 'static',
  'super', 'switch', 'sync', 'this', 'throw', 'true', 'try', 'type',
  'typedef', 'var', 'void', 'when', 'while', 'with', 'yield',
};

/// Members every Dart object already has. Shadowing them in a generated class
/// produces a confusing override error rather than a clean failure.
const _objectMembers = {
  'hashCode', 'runtimeType', 'toString', 'noSuchMethod',
};

/// Converts a Solidity identifier to a safe lowerCamelCase Dart identifier.
///
/// Leading underscores are stripped — Solidity uses `_feedId` for parameters by
/// convention, but a leading underscore makes a Dart member library-private,
/// which would make generated fields unreachable from user code.
String toDartIdentifier(String raw, {String fallback = 'value'}) {
  var s = raw.replaceAll(RegExp(r'^_+'), '');
  if (s.isEmpty) return fallback;

  // snake_case and SCREAMING_CASE both appear in Flare's ABIs.
  final parts = s.split(RegExp(r'[_\s]+')).where((p) => p.isNotEmpty).toList();
  if (parts.isEmpty) return fallback;

  final buffer = StringBuffer();
  for (var i = 0; i < parts.length; i++) {
    final part = parts[i];
    if (i == 0) {
      buffer.write(
        part.toUpperCase() == part && part.length > 1
            ? part.toLowerCase()
            : '${part[0].toLowerCase()}${part.substring(1)}',
      );
    } else {
      buffer.write('${part[0].toUpperCase()}${part.substring(1)}');
    }
  }

  var out = buffer.toString();
  if (out.isEmpty) return fallback;
  if (RegExp(r'^[0-9]').hasMatch(out)) out = 'v$out';
  if (_dartReserved.contains(out) || _objectMembers.contains(out)) {
    out = '${out}Value';
  }
  return out;
}

/// Converts a Solidity contract or interface name to UpperCamelCase.
///
/// The leading `I` of an interface name is kept: `IFtsoV2` and `FtsoV2` are
/// distinct entries in Flare's artifacts, and collapsing them would collide.
String toDartClassName(String raw) {
  final s = raw.replaceAll(RegExp(r'[^A-Za-z0-9]'), '');
  if (s.isEmpty) return 'Contract';
  return '${s[0].toUpperCase()}${s.substring(1)}';
}

/// Converts a name to lower_snake_case, for file names.
String toSnakeCase(String raw) {
  final s = raw
      .replaceAllMapped(
        RegExp(r'([a-z0-9])([A-Z])'),
        (m) => '${m[1]}_${m[2]}',
      )
      .replaceAllMapped(
        RegExp(r'([A-Z]+)([A-Z][a-z])'),
        (m) => '${m[1]}_${m[2]}',
      )
      .toLowerCase();
  return s.replaceAll(RegExp(r'[^a-z0-9]+'), '_').replaceAll(RegExp(r'^_|_$'), '');
}

/// Makes each name in [names] unique by appending a numeric suffix.
///
/// Overloaded Solidity functions share a name, and two different parameters in
/// one function can normalise to the same Dart identifier.
List<String> deduplicate(List<String> names) {
  final seen = <String, int>{};
  return [
    for (final name in names)
      if (!seen.containsKey(name))
        (seen[name] = 1, name).$2
      else
        '$name${seen[name] = seen[name]! + 1}',
  ];
}
