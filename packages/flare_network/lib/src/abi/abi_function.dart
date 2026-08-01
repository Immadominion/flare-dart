import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../rpc/flare_exception.dart';
import 'abi_type.dart';
import 'hex.dart';
import 'keccak.dart';

/// How a function may modify chain state.
enum StateMutability {
  pure,
  view,
  nonpayable,
  payable;

  /// Whether the function can be read with `eth_call` at no cost.
  ///
  /// Note that `payable` functions are also readable this way when they do not
  /// actually require value — FTSOv2's `getFeedsById` is declared `payable` yet
  /// costs nothing to read. So this is a hint, not a restriction.
  bool get isReadOnly => this == pure || this == view;

  static StateMutability parse(String? value) => switch (value) {
    'pure' => StateMutability.pure,
    'view' => StateMutability.view,
    'payable' => StateMutability.payable,
    _ => StateMutability.nonpayable,
  };
}

/// A named ABI parameter.
@immutable
final class AbiParameter {
  /// Parameter name. Often empty — Solidity does not require naming returns.
  final String name;

  /// The parameter's type.
  final AbiType type;

  const AbiParameter({required this.name, required this.type});

  /// Builds a parameter from one entry of an ABI JSON `inputs`/`outputs` array.
  ///
  /// Tuples are reconstructed from their `components`, because the `type` field
  /// only says `tuple` and drops the internal structure.
  factory AbiParameter.fromJson(Map<String, Object?> json) {
    final rawType = (json['type'] as String?) ?? '';
    final components = json['components'] as List<Object?>?;

    if (components != null && rawType.startsWith('tuple')) {
      final inner = AbiTupleType(
        components
            .cast<Map<String, Object?>>()
            .map((c) => AbiParameter.fromJson(c).type)
            .toList(),
      );
      // Re-apply any array suffix that followed `tuple`, e.g. `tuple[]`.
      final suffix = rawType.substring('tuple'.length);
      final type =
          suffix.isEmpty ? inner : AbiType.parse('${inner.name}$suffix');
      return AbiParameter(name: (json['name'] as String?) ?? '', type: type);
    }

    return AbiParameter(
      name: (json['name'] as String?) ?? '',
      type: AbiType.parse(rawType),
    );
  }

  @override
  String toString() => name.isEmpty ? type.name : '${type.name} $name';
}

/// A callable contract function, with the selector derived from its ABI.
@immutable
final class AbiFunction {
  final String name;
  final List<AbiParameter> inputs;
  final List<AbiParameter> outputs;
  final StateMutability stateMutability;

  const AbiFunction({
    required this.name,
    required this.inputs,
    required this.outputs,
    required this.stateMutability,
  });

  /// Builds a function from an ABI JSON entry with `"type": "function"`.
  factory AbiFunction.fromJson(Map<String, Object?> json) => AbiFunction(
    name: (json['name'] as String?) ?? '',
    inputs:
        ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParameter.fromJson)
            .toList(),
    outputs:
        ((json['outputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiParameter.fromJson)
            .toList(),
    stateMutability: StateMutability.parse(json['stateMutability'] as String?),
  );

  /// The canonical signature the selector is hashed from, e.g.
  /// `getFeedsById(bytes21[])`.
  String get canonicalSignature =>
      '$name(${inputs.map((i) => i.type.name).join(',')})';

  /// The 4-byte selector.
  Uint8List get selector => functionSelector(canonicalSignature);

  /// The selector as a hex string, e.g. `0x4c375745`.
  String get selectorHex => bytesToHex(selector);

  /// ABI-encodes a call: selector followed by the encoded arguments.
  Uint8List encodeCall(List<Object?> args) {
    if (args.length != inputs.length) {
      throw FlareAbiException(
        '$name expects ${inputs.length} argument(s), got ${args.length}',
        solidityType: canonicalSignature,
      );
    }
    return (BytesBuilder()
          ..add(selector)
          ..add(
            AbiCodec.encodeParameters(inputs.map((i) => i.type).toList(), args),
          ))
        .toBytes();
  }

  /// Decodes return data into one value per entry in [outputs].
  ///
  /// Empty return data usually means the call hit an address with no code —
  /// a stale or wrong contract address — so it is reported rather than
  /// silently decoded as zeros.
  List<Object?> decodeReturn(Uint8List data) {
    if (outputs.isEmpty) return const [];
    if (data.isEmpty) {
      throw FlareContractException(
        'Empty return data from $name. The address probably holds no contract, '
        'or the call reverted without a reason.',
        function: canonicalSignature,
      );
    }
    return AbiCodec.decodeParameters(outputs.map((o) => o.type).toList(), data);
  }

  @override
  String toString() =>
      '$canonicalSignature ${stateMutability.name}'
      '${outputs.isEmpty ? '' : ' returns (${outputs.map((o) => o.type.name).join(',')})'}';
}

/// A parsed contract ABI: the functions from one ABI JSON array.
@immutable
final class ContractAbi {
  /// Functions by name. Overloads share a name, so the value is a list.
  final Map<String, List<AbiFunction>> functionsByName;

  const ContractAbi(this.functionsByName);

  /// Parses an ABI JSON array.
  ///
  /// Flare's published artifacts are **bare JSON arrays**, not Hardhat
  /// `{abi, bytecode}` objects — verified across all 112 contracts in
  /// `flare-periphery-contract-artifacts@0.1.52`.
  factory ContractAbi.fromJson(List<Object?> json) {
    final map = <String, List<AbiFunction>>{};
    for (final entry in json) {
      if (entry is! Map) continue;
      if (entry['type'] != 'function') continue;
      final fn = AbiFunction.fromJson(entry.cast<String, Object?>());
      (map[fn.name] ??= []).add(fn);
    }
    return ContractAbi(map);
  }

  /// All functions, flattened.
  List<AbiFunction> get functions =>
      functionsByName.values.expand((f) => f).toList();

  /// Looks up a function by name.
  ///
  /// When [name] is overloaded, pass [argumentCount] to disambiguate; without
  /// it an overloaded name throws rather than guessing.
  AbiFunction function(String name, {int? argumentCount}) {
    final candidates = functionsByName[name];
    if (candidates == null || candidates.isEmpty) {
      throw FlareAbiException('No function named "$name" in this ABI');
    }
    if (candidates.length == 1) return candidates.single;
    if (argumentCount == null) {
      throw FlareAbiException(
        '"$name" is overloaded (${candidates.length} variants). '
        'Pass argumentCount to select one: '
        '${candidates.map((c) => c.canonicalSignature).join(', ')}',
      );
    }
    for (final c in candidates) {
      if (c.inputs.length == argumentCount) return c;
    }
    throw FlareAbiException(
      'No overload of "$name" takes $argumentCount argument(s)',
    );
  }
}
