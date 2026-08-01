import 'dart:convert';

import 'dart_names.dart';
import 'type_mapper.dart';

/// A function parsed from an ABI array.
class AbiFn {
  final String name;
  final List<AbiParam> inputs;
  final List<AbiParam> outputs;
  final String stateMutability;

  AbiFn({
    required this.name,
    required this.inputs,
    required this.outputs,
    required this.stateMutability,
  });

  factory AbiFn.fromJson(Map<String, Object?> json) => AbiFn(
        name: (json['name'] as String?) ?? '',
        inputs: ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParam.fromJson)
            .toList(),
        outputs: ((json['outputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParam.fromJson)
            .toList(),
        stateMutability: (json['stateMutability'] as String?) ?? 'nonpayable',
      );

  String get canonicalSignature =>
      '$name(${inputs.map((i) => i.canonicalType).join(',')})';

  /// Whether this function can be read through `eth_call`.
  ///
  /// `payable` counts: FTSOv2's feed getters are declared `payable` yet read
  /// for free. Only `nonpayable` is treated as definitely state-changing.
  bool get isReadable =>
      outputs.isNotEmpty &&
      (stateMutability == 'view' ||
          stateMutability == 'pure' ||
          stateMutability == 'payable');
}

/// Result of generating one contract binding.
class GeneratedBinding {
  final String contractName;
  final String fileName;
  final String source;
  final int methodCount;
  final int skippedCount;

  GeneratedBinding({
    required this.contractName,
    required this.fileName,
    required this.source,
    required this.methodCount,
    required this.skippedCount,
  });
}

/// Emits a typed Dart binding class from an ABI array.
class BindingGenerator {
  /// Version of the artifacts package the bindings came from, recorded in the
  /// generated header so a stale checkout is obvious.
  final String artifactVersion;

  const BindingGenerator({required this.artifactVersion});

  /// Generates a binding for [contractName] from its raw ABI [abi].
  ///
  /// Returns null when the contract exposes nothing readable, so callers can
  /// skip writing an empty file.
  GeneratedBinding? generate(String contractName, List<Object?> abi) {
    final all = [
      for (final entry in abi)
        if (entry is Map && entry['type'] == 'function')
          AbiFn.fromJson(entry.cast<String, Object?>()),
    ];

    final readable = all.where((f) => f.isReadable).toList();
    if (readable.isEmpty) return null;

    final className = '${toDartClassName(contractName)}Contract';
    final buffer = StringBuffer();

    // Only import dart:typed_data when a Uint8List actually appears, or every
    // binding without a bytes type emits an unused-import warning.
    final needsTypedData = readable.any((f) => [...f.inputs, ...f.outputs]
        .any((p) => TypeMapper.dartType(p).contains('Uint8List')));

    _writeHeader(buffer, contractName, className, all.length, readable.length,
        needsTypedData: needsTypedData);
    _writeClassOpen(buffer, className, contractName);

    // Overloads share a Solidity name; give each a unique Dart name.
    final methodNames = deduplicate(
      readable.map((f) => toDartIdentifier(f.name, fallback: 'call')).toList(),
    );

    for (var i = 0; i < readable.length; i++) {
      _writeAbiFunctionField(buffer, readable[i], methodNames[i]);
    }
    for (var i = 0; i < readable.length; i++) {
      _writeMethod(buffer, readable[i], methodNames[i]);
    }

    buffer.writeln('}');

    return GeneratedBinding(
      contractName: contractName,
      fileName: '${toSnakeCase(contractName)}.g.dart',
      source: buffer.toString(),
      methodCount: readable.length,
      skippedCount: all.length - readable.length,
    );
  }

  void _writeHeader(
    StringBuffer b,
    String contractName,
    String className,
    int total,
    int readable, {
    required bool needsTypedData,
  }) {
    b
      ..writeln('// GENERATED CODE — DO NOT EDIT BY HAND.')
      ..writeln('//')
      ..writeln('// Source: @flarenetwork/flare-periphery-contract-artifacts@'
          '$artifactVersion')
      ..writeln('// Contract: $contractName')
      ..writeln('// Functions: $readable readable of $total total '
          '(state-changing functions are omitted — this SDK does not sign).')
      ..writeln('//')
      ..writeln('// Regenerate with:')
      ..writeln('//   dart run flare_network_codegen --artifacts <dir> '
          '--out <dir>')
      ..writeln();
    if (needsTypedData) {
      b
        ..writeln("import 'dart:typed_data';")
        ..writeln();
    }
    b
      ..writeln("import 'package:flare_network/flare_network.dart';")
      ..writeln();
  }

  void _writeClassOpen(StringBuffer b, String className, String contractName) {
    b
      ..writeln('/// Typed read bindings for Flare\'s `$contractName` contract.')
      ..writeln('///')
      ..writeln('/// Resolve it through the registry rather than hardcoding an')
      ..writeln('/// address — Flare redeploys contracts.')
      ..writeln('class $className {')
      ..writeln('  /// Client used for calls.')
      ..writeln('  final FlareClient client;')
      ..writeln()
      ..writeln('  /// Resolved address on [client]\'s network.')
      ..writeln('  final EthAddress address;')
      ..writeln()
      ..writeln('  const $className({required this.client, '
          'required this.address});')
      ..writeln()
      ..writeln('  /// Resolves `$contractName` through the '
          '[ContractRegistry].')
      ..writeln('  static Future<$className> resolve(')
      ..writeln('    FlareClient client, {')
      ..writeln('    ContractRegistry? registry,')
      ..writeln('    String registryName = \'$contractName\',')
      ..writeln('  }) async {')
      ..writeln('    final resolved = await (registry ?? '
          'ContractRegistry(client))')
      ..writeln('        .addressOf(registryName);')
      ..writeln('    return $className(client: client, address: resolved);')
      ..writeln('  }')
      ..writeln();
  }

  void _writeAbiFunctionField(StringBuffer b, AbiFn fn, String methodName) {
    b
      ..writeln('  /// ABI descriptor for `${fn.canonicalSignature}`.')
      ..writeln('  static final AbiFunction ${methodName}Fn = AbiFunction(')
      ..writeln("    name: '${fn.name}',")
      ..writeln('    inputs: [');
    for (final input in fn.inputs) {
      b.writeln("      AbiParameter(name: '${input.name}', "
          "type: AbiType.parse('${input.canonicalType}')),");
    }
    b
      ..writeln('    ],')
      ..writeln('    outputs: [');
    for (final output in fn.outputs) {
      b.writeln("      AbiParameter(name: '${output.name}', "
          "type: AbiType.parse('${output.canonicalType}')),");
    }
    b
      ..writeln('    ],')
      ..writeln('    stateMutability: StateMutability.${fn.stateMutability},')
      ..writeln('  );')
      ..writeln();
  }

  /// Members of the generated class that a parameter must not shadow.
  ///
  /// Solidity commonly names a parameter `address`, which would shadow the
  /// contract's own `address` field and silently rebind `contract: address` to
  /// the argument — code that compiles in some cases and calls the wrong target
  /// in others. `ICoreVaultManager.isDestinationAddressAllowed(string address)`
  /// is a real instance.
  static const _classMembers = {'client', 'address'};

  /// Renames [name] if it would shadow a class member or the method's own
  /// static `AbiFunction` field.
  String _avoidShadowing(String name, String methodName) =>
      (_classMembers.contains(name) || name == '${methodName}Fn')
          ? '${name}_'
          : name;

  void _writeMethod(StringBuffer b, AbiFn fn, String methodName) {
    final paramNames = deduplicate([
      for (var i = 0; i < fn.inputs.length; i++)
        _avoidShadowing(
          toDartIdentifier(fn.inputs[i].name, fallback: 'arg${i + 1}'),
          methodName,
        ),
    ]);

    final params = [
      for (var i = 0; i < fn.inputs.length; i++)
        '${TypeMapper.dartType(fn.inputs[i])} ${paramNames[i]}',
    ];

    final returnType = TypeMapper.returnType(fn.outputs);

    b
      ..writeln('  /// Calls `${fn.canonicalSignature}`.')
      ..writeln('  ///')
      ..writeln('  /// Declared `${fn.stateMutability}` in Solidity; read via '
          '`eth_call`.')
      ..writeln('  Future<$returnType> $methodName('
          '${params.join(', ')}) async {');

    if (fn.inputs.isEmpty) {
      b
        ..writeln('    final out = await client.callFunction(')
        ..writeln('      contract: address,')
        ..writeln('      function: ${methodName}Fn,')
        ..writeln('    );');
    } else {
      b
        ..writeln('    final out = await client.callFunction(')
        ..writeln('      contract: address,')
        ..writeln('      function: ${methodName}Fn,')
        ..writeln('      args: [${paramNames.join(', ')}],')
        ..writeln('    );');
    }

    if (fn.outputs.length == 1) {
      b.writeln('    return ${TypeMapper.castExpression('out[0]', fn.outputs.single)};');
    } else {
      final names = fn.outputs
          .map((o) => o.name.isEmpty ? '' : toDartIdentifier(o.name))
          .toList();
      final named =
          names.every((n) => n.isNotEmpty) && names.toSet().length == names.length;

      final parts = [
        for (var i = 0; i < fn.outputs.length; i++)
          '${named ? '${names[i]}: ' : ''}'
              '${TypeMapper.castExpression('out[$i]', fn.outputs[i])}',
      ];
      b.writeln('    return (${parts.join(', ')});');
    }

    b
      ..writeln('  }')
      ..writeln();
  }

  /// Emits a barrel file exporting every generated binding.
  String generateBarrel(List<GeneratedBinding> bindings) {
    final b = StringBuffer()
      ..writeln('// GENERATED CODE — DO NOT EDIT BY HAND.')
      ..writeln('//')
      ..writeln('// Typed bindings for @flarenetwork/'
          'flare-periphery-contract-artifacts@$artifactVersion')
      ..writeln('// ${bindings.length} contracts, '
          '${bindings.fold<int>(0, (n, x) => n + x.methodCount)} read methods.')
      ..writeln();
    for (final binding in [...bindings]..sort(
        (a, b) => a.fileName.compareTo(b.fileName),
      )) {
      b.writeln("export 'src/${binding.fileName}';");
    }
    return b.toString();
  }
}

/// Parses an artifact file, which Flare publishes as a **bare ABI array**
/// rather than a Hardhat `{abi, bytecode}` object.
///
/// Verified across all 112 contracts in artifacts 0.1.52. Both shapes are
/// accepted anyway, so a future change in packaging does not break the tool.
List<Object?> parseArtifact(String contents) {
  final decoded = jsonDecode(contents);
  if (decoded is List) return decoded;
  if (decoded is Map && decoded['abi'] is List) {
    return decoded['abi'] as List<Object?>;
  }
  throw FormatException(
    'Expected a bare ABI array or an object with an "abi" key, '
    'got ${decoded.runtimeType}',
  );
}
