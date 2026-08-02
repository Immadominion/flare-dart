import 'dart:convert';

import 'dart_names.dart';
import 'registry_names.dart';
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
    inputs:
        ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParam.fromJson)
            .toList(),
    outputs:
        ((json['outputs'] as List<Object?>?) ?? const [])
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

  /// Whether calling this needs a signed transaction.
  ///
  /// Anything not declared `view` or `pure` may write state. `payable` is both:
  /// it can be simulated for free through `eth_call` *and* sent as a real
  /// transaction, so those functions get a reader and a transaction builder.
  bool get isWritable => stateMutability != 'view' && stateMutability != 'pure';

  /// Whether the function accepts native value.
  bool get isPayable => stateMutability == 'payable';
}

/// A custom error parsed from an ABI array.
class AbiErr {
  final String name;
  final List<AbiParam> inputs;

  AbiErr({required this.name, required this.inputs});

  factory AbiErr.fromJson(Map<String, Object?> json) => AbiErr(
    name: (json['name'] as String?) ?? '',
    inputs:
        ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParam.fromJson)
            .toList(),
  );

  String get canonicalSignature =>
      '$name(${inputs.map((i) => i.canonicalType).join(',')})';
}

/// An event parsed from an ABI array.
class AbiEv {
  final String name;
  final List<AbiParam> inputs;
  final List<bool> indexed;
  final bool anonymous;

  AbiEv({
    required this.name,
    required this.inputs,
    required this.indexed,
    required this.anonymous,
  });

  factory AbiEv.fromJson(Map<String, Object?> json) {
    final raw =
        ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>();
    return AbiEv(
      name: (json['name'] as String?) ?? '',
      inputs: raw.map(AbiParam.fromJson).toList(),
      indexed: raw.map((e) => e['indexed'] == true).toList(),
      anonymous: json['anonymous'] == true,
    );
  }

  /// The signature the topic hash is derived from. Indexing does not change it.
  String get canonicalSignature =>
      '$name(${inputs.map((i) => i.canonicalType).join(',')})';
}

/// Result of generating one contract binding.
class GeneratedBinding {
  final String contractName;
  final String fileName;
  final String source;
  final int methodCount;
  final int skippedCount;
  final int eventCount;

  GeneratedBinding({
    required this.contractName,
    required this.fileName,
    required this.source,
    required this.methodCount,
    required this.skippedCount,
    this.eventCount = 0,
  });
}

/// Emits a typed Dart binding class from an ABI array.
class BindingGenerator {
  /// Version of the artifacts package the bindings came from, recorded in the
  /// generated header so a stale checkout is obvious.
  final String artifactVersion;

  /// Maps each Solidity interface name to the name it is registered under.
  ///
  /// Without this, a generated `resolve()` would default to the interface name
  /// and throw for every caller: measured against a live `getAllContracts()`,
  /// **zero** of 142 interface names appear in the registry.
  final RegistryNames registryNames;

  const BindingGenerator({
    required this.artifactVersion,
    this.registryNames = RegistryNames.empty,
  });

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

    final events = [
      for (final entry in abi)
        if (entry is Map && entry['type'] == 'event')
          AbiEv.fromJson(entry.cast<String, Object?>()),
    ];

    final errors = [
      for (final entry in abi)
        if (entry is Map && entry['type'] == 'error')
          AbiErr.fromJson(entry.cast<String, Object?>()),
    ];

    final readable = all.where((f) => f.isReadable).toList();
    final writable = all.where((f) => f.isWritable).toList();
    // A function is emitted if it can be read, sent, or both. `payable` is
    // both, so it appears once here and gets two members.
    final emitted = all.where((f) => f.isReadable || f.isWritable).toList();

    // An events-only interface is still worth emitting: IAssetManagerEvents
    // declares 55 events and no functions, and those logs are the whole point
    // of the contract.
    if (emitted.isEmpty && events.isEmpty && errors.isEmpty) return null;

    final className = '${toDartClassName(contractName)}Contract';
    final buffer = StringBuffer();

    // Only import dart:typed_data when a Uint8List actually appears, or every
    // binding without a bytes type emits an unused-import warning.
    // Error parameters are deliberately excluded: an error's declaration emits
    // only `AbiType.parse('bytes')` strings, never a Dart `Uint8List`, so
    // counting them would import dart:typed_data for nothing.
    final needsTypedData = emitted
        .expand((f) => [...f.inputs, ...f.outputs])
        .any((p) => TypeMapper.dartType(p).contains('Uint8List'));

    _writeHeader(
      buffer,
      contractName,
      className,
      all.length,
      readable.length,
      writable.length,
      errors.length,
      needsTypedData: needsTypedData,
    );
    _writeClassOpen(
      buffer,
      className,
      contractName,
      registryName: registryNames[contractName],
    );

    // Overloads share a Solidity name; give each a unique Dart name.
    final methodNames = deduplicate(
      emitted.map((f) => toDartIdentifier(f.name, fallback: 'call')).toList(),
    );

    for (var i = 0; i < emitted.length; i++) {
      _writeAbiFunctionField(buffer, emitted[i], methodNames[i]);
    }
    for (var i = 0; i < emitted.length; i++) {
      if (emitted[i].isReadable) {
        _writeMethod(buffer, emitted[i], methodNames[i]);
      }
    }
    for (var i = 0; i < emitted.length; i++) {
      if (emitted[i].isWritable) {
        _writeTxBuilder(buffer, emitted[i], methodNames[i]);
      }
    }

    if (errors.isNotEmpty) {
      final errorNames = deduplicate([
        for (final e in errors) toDartIdentifier(e.name, fallback: 'error'),
      ]);
      for (var i = 0; i < errors.length; i++) {
        _writeError(buffer, errors[i], errorNames[i]);
      }
      _writeErrorIndex(buffer, errorNames);
    }

    if (events.isNotEmpty) {
      final eventNames = deduplicate([
        for (final e in events) toDartIdentifier(e.name, fallback: 'event'),
      ]);
      for (var i = 0; i < events.length; i++) {
        _writeEvent(buffer, events[i], eventNames[i]);
      }
      _writeEventIndex(buffer, events, eventNames);
    }

    buffer.writeln('}');

    return GeneratedBinding(
      contractName: contractName,
      fileName: '${toSnakeCase(contractName)}.g.dart',
      source: buffer.toString(),
      methodCount: readable.length,
      skippedCount: all.length - readable.length,
      eventCount: events.length,
    );
  }

  void _writeTxBuilder(StringBuffer b, AbiFn fn, String methodName) {
    final paramNames = deduplicate([
      for (var i = 0; i < fn.inputs.length; i++)
        _avoidShadowing(
          toDartIdentifier(fn.inputs[i].name, fallback: 'arg${i + 1}'),
          methodName,
          alsoReserved: _txBuilderParams,
        ),
    ]);

    final positional = [
      for (var i = 0; i < fn.inputs.length; i++)
        '${TypeMapper.dartType(fn.inputs[i])} ${paramNames[i]}',
    ];

    // Only a payable function gets a `value` parameter. Attaching value to a
    // nonpayable function reverts, so the ABI's own declaration is used to make
    // that mistake unrepresentable rather than merely documented.
    final named = ['EthAddress? from', if (fn.isPayable) 'BigInt? value'];
    final signature = [...positional, '{${named.join(', ')}}'].join(', ');

    b
      ..writeln('  /// Builds an unsigned `${fn.canonicalSignature}`')
      ..writeln('  /// transaction.')
      ..writeln('  ///')
      ..writeln(
        '  /// Declared `${fn.stateMutability}` in Solidity, so it changes '
        'state and',
      )
      ..writeln('  /// must be signed. This package holds no keys: pass the')
      ..writeln('  /// result to [FlareClient.prepareTransaction] to fill in')
      ..writeln('  /// gas and fees, then hand')
      ..writeln('  /// [TransactionRequest.toWalletJson] to a wallet.');
    if (fn.isPayable) {
      b
        ..writeln('  ///')
        ..writeln('  /// Payable: [value] is attached in wei.');
    }
    b
      ..writeln('  TransactionRequest ${methodName}Tx($signature) =>')
      ..writeln('      TransactionRequest.callFunction(')
      ..writeln('        to: address,')
      ..writeln('        function: ${methodName}Fn,');
    if (fn.inputs.isNotEmpty) {
      b.writeln('        args: [${paramNames.join(', ')}],');
    }
    b.writeln('        from: from,');
    if (fn.isPayable) {
      b.writeln('        value: value,');
    }
    b
      ..writeln('      );')
      ..writeln();
  }

  void _writeError(StringBuffer b, AbiErr err, String fieldName) {
    b
      ..writeln('  /// `${err.canonicalSignature}`')
      ..writeln('  ///')
      ..writeln('  /// A custom error carries no message, so a node reports it')
      ..writeln('  /// as a bare `execution reverted`. Match it with')
      ..writeln('  /// [decodeRevert] to recover the name and arguments.')
      ..writeln('  static final AbiError ${fieldName}Error = AbiError(')
      ..writeln("    name: '${err.name}',")
      ..writeln('    inputs: [');
    for (final input in err.inputs) {
      b.writeln(
        "      AbiParameter(name: '${input.name}', "
        "type: AbiType.parse('${input.canonicalType}')),",
      );
    }
    b
      ..writeln('    ],')
      ..writeln('  );')
      ..writeln();
  }

  void _writeErrorIndex(StringBuffer b, List<String> fieldNames) {
    b
      ..writeln('  /// Every custom error this contract declares.')
      ..writeln('  static final List<AbiError> allErrors = [');
    for (final n in fieldNames) {
      b.writeln('    ${n}Error,');
    }
    b
      ..writeln('  ];')
      ..writeln()
      ..writeln('  /// Explains why a call to this contract reverted.')
      ..writeln('  ///')
      ..writeln('  /// ```dart')
      ..writeln('  /// try {')
      ..writeln('  ///   await client.estimateGas(request.toCallRequest());')
      ..writeln('  /// } on FlareRpcException catch (e) {')
      ..writeln('  ///   print(decodeRevert(e)?.description);')
      ..writeln('  /// }')
      ..writeln('  /// ```')
      ..writeln('  ///')
      ..writeln('  /// Returns null when the node attached no revert data,')
      ..writeln('  /// which is how Flare reports a bare `revert()`.')
      ..writeln('  static RevertReason? decodeRevert(FlareRpcException e) =>')
      ..writeln('      e.revertReasonWith(allErrors);')
      ..writeln();
  }

  void _writeEvent(StringBuffer b, AbiEv ev, String fieldName) {
    b
      ..writeln('  /// `${ev.canonicalSignature}`')
      ..writeln('  ///')
      ..writeln('  /// Decode a matching log with')
      ..writeln('  /// `${fieldName}Event.decode(topics: …, data: …)`, or use')
      ..writeln('  /// [decodeLog] to dispatch automatically.')
      ..writeln('  static final AbiEvent ${fieldName}Event = AbiEvent(')
      ..writeln("    name: '${ev.name}',")
      ..writeln('    anonymous: ${ev.anonymous},')
      ..writeln('    parameters: [');
    for (var i = 0; i < ev.inputs.length; i++) {
      final p = ev.inputs[i];
      b.writeln(
        "      AbiEventParameter(name: '${p.name}', "
        "type: AbiType.parse('${p.canonicalType}'), "
        'indexed: ${ev.indexed[i]}),',
      );
    }
    b
      ..writeln('    ],')
      ..writeln('  );')
      ..writeln();
  }

  void _writeEventIndex(
    StringBuffer b,
    List<AbiEv> events,
    List<String> fieldNames,
  ) {
    b
      ..writeln('  /// Every event this contract declares.')
      ..writeln('  static final List<AbiEvent> allEvents = [');
    for (final n in fieldNames) {
      b.writeln('    ${n}Event,');
    }
    b
      ..writeln('  ];')
      ..writeln()
      ..writeln('  /// Decodes [log] into whichever of [allEvents] it matches.')
      ..writeln('  ///')
      ..writeln('  /// Returns null when the log belongs to a different event,')
      ..writeln('  /// which is normal: one address emits many event types and')
      ..writeln('  /// an address-only filter returns all of them.')
      ..writeln('  static DecodedLog? decodeLog(FlareLog log) {')
      ..writeln('    for (final event in allEvents) {')
      ..writeln('      if (!event.matches(log.topics)) continue;')
      ..writeln('      return DecodedLog(')
      ..writeln('        log: log,')
      ..writeln('        event: event,')
      ..writeln('        values: event.decode(')
      ..writeln('          topics: log.topics,')
      ..writeln('          data: log.data,')
      ..writeln('        ),')
      ..writeln('      );')
      ..writeln('    }')
      ..writeln('    return null;')
      ..writeln('  }')
      ..writeln();
  }

  void _writeHeader(
    StringBuffer b,
    String contractName,
    String className,
    int total,
    int readable,
    int writable,
    int errors, {
    required bool needsTypedData,
  }) {
    b
      ..writeln('// GENERATED CODE — DO NOT EDIT BY HAND.')
      ..writeln('//')
      ..writeln(
        '// Source: @flarenetwork/flare-periphery-contract-artifacts@'
        '$artifactVersion',
      )
      ..writeln('// Contract: $contractName')
      ..writeln(
        '// Functions: $total — $readable readable via eth_call, '
        '$writable requiring a',
      )
      ..writeln(
        '// signed transaction. Payable functions are both, and get a reader '
        'and a',
      )
      ..writeln(
        '// `…Tx` builder. This package never signs: a builder returns an '
        'unsigned',
      )
      ..writeln('// TransactionRequest for a wallet to sign.')
      ..writeln('// Custom errors: $errors')
      ..writeln('//')
      ..writeln('// Regenerate with:')
      ..writeln(
        '//   dart run flare_network_codegen --artifacts <dir> '
        '--out <dir>',
      )
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

  void _writeClassOpen(
    StringBuffer b,
    String className,
    String contractName, {
    required String? registryName,
  }) {
    b
      ..writeln('/// Typed bindings for Flare\'s `$contractName` contract.')
      ..writeln('///')
      ..writeln('/// Read methods call through `eth_call`. Methods ending in')
      ..writeln('/// `Tx` build an unsigned [TransactionRequest] for a wallet')
      ..writeln('/// to sign — this package holds no keys.')
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
      ..writeln(
        '  const $className({required this.client, '
        'required this.address});',
      )
      ..writeln();

    if (registryName != null) {
      // The registry name and the interface name are different — `IFtsoV2` is
      // registered as `FtsoV2` — so this default comes from the artifacts'
      // own products map, never from the interface name.
      b
        ..writeln(
          '  /// Resolves `$contractName` through the [ContractRegistry].',
        )
        ..writeln('  ///')
        ..writeln(
          '  /// Registered as `$registryName`, which is what the registry',
        )
        ..writeln(
          '  /// answers to — the Solidity interface name is not a registry',
        )
        ..writeln('  /// key.')
        ..writeln('  static Future<$className> resolve(')
        ..writeln('    FlareClient client, {')
        ..writeln('    ContractRegistry? registry,')
        ..writeln('    String registryName = \'$registryName\',')
        ..writeln('  }) async {');
    } else {
      // Not in the products map, so there is no correct default. Requiring the
      // name is the honest signature: a guessed default would compile and then
      // throw at runtime for every caller.
      b
        ..writeln(
          '  /// Resolves `$contractName` through the [ContractRegistry].',
        )
        ..writeln('  ///')
        ..writeln(
          '  /// This contract has no entry in Flare\'s published products',
        )
        ..writeln(
          '  /// map, so [registryName] is required — there is no name that',
        )
        ..writeln(
          '  /// could be defaulted correctly. Call `ContractRegistry.listAll`',
        )
        ..writeln('  /// to see what this network registers.')
        ..writeln('  static Future<$className> resolve(')
        ..writeln('    FlareClient client, {')
        ..writeln('    required String registryName,')
        ..writeln('    ContractRegistry? registry,')
        ..writeln('  }) async {');
    }

    b
      ..writeln(
        '    final resolved = await (registry ?? '
        'ContractRegistry(client))',
      )
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
      b.writeln(
        "      AbiParameter(name: '${input.name}', "
        "type: AbiType.parse('${input.canonicalType}')),",
      );
    }
    b
      ..writeln('    ],')
      ..writeln('    outputs: [');
    for (final output in fn.outputs) {
      b.writeln(
        "      AbiParameter(name: '${output.name}', "
        "type: AbiType.parse('${output.canonicalType}')),",
      );
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

  /// Named parameters a transaction builder adds of its own.
  ///
  /// `transferFrom(address from, …)` is the common collision: Solidity's `from`
  /// would clash with the builder's own `from`, and Dart rejects the duplicate
  /// outright — noisily, which is the good case, but it stops the whole package
  /// compiling.
  static const _txBuilderParams = {'from', 'value'};

  /// Renames [name] if it would shadow a class member, the method's own static
  /// `AbiFunction` field, or one of [alsoReserved].
  String _avoidShadowing(
    String name,
    String methodName, {
    Set<String> alsoReserved = const {},
  }) =>
      (_classMembers.contains(name) ||
              alsoReserved.contains(name) ||
              name == '${methodName}Fn')
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
      ..writeln(
        '  /// Declared `${fn.stateMutability}` in Solidity; read via '
        '`eth_call`.',
      )
      ..writeln(
        '  Future<$returnType> $methodName('
        '${params.join(', ')}) async {',
      );

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
      b.writeln(
        '    return ${TypeMapper.castExpression('out[0]', fn.outputs.single)};',
      );
    } else {
      final names =
          fn.outputs
              .map((o) => o.name.isEmpty ? '' : toDartIdentifier(o.name))
              .toList();
      final named =
          names.every((n) => n.isNotEmpty) &&
          names.toSet().length == names.length;

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
    final b =
        StringBuffer()
          ..writeln('// GENERATED CODE — DO NOT EDIT BY HAND.')
          ..writeln('//')
          ..writeln(
            '// Typed bindings for @flarenetwork/'
            'flare-periphery-contract-artifacts@$artifactVersion',
          )
          ..writeln(
            '// ${bindings.length} contracts, '
            '${bindings.fold<int>(0, (n, x) => n + x.methodCount)} read methods.',
          )
          ..writeln();
    for (final binding in [...bindings]
      ..sort((a, b) => a.fileName.compareTo(b.fileName))) {
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
