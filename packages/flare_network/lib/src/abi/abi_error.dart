import 'dart:typed_data';

import 'package:meta/meta.dart';

import 'abi_function.dart';
import 'abi_type.dart';
import 'hex.dart';
import 'keccak.dart';

/// A custom error declared in a contract ABI (Solidity >= 0.8.4).
///
/// These matter more on Flare than the name suggests. Of the 187 published
/// periphery ABIs, 168 entries are custom errors — FAssets and the Smart
/// Accounts facets revert with them almost exclusively. A custom error carries
/// no string, so a node reports only `execution reverted`; the reason is
/// recoverable only by matching the 4-byte selector back to a declaration like
/// this one.
@immutable
final class AbiError {
  /// Error name, e.g. `InsufficientFundsForRedeem`.
  final String name;

  /// Declared parameters, in order.
  final List<AbiParameter> inputs;

  const AbiError({required this.name, required this.inputs});

  factory AbiError.fromJson(Map<String, Object?> json) => AbiError(
    name: (json['name'] as String?) ?? '',
    inputs:
        ((json['inputs'] as List<Object?>?) ?? const [])
            .whereType<Map<Object?, Object?>>()
            .map((i) => AbiParameter.fromJson(i.cast<String, Object?>()))
            .toList(),
  );

  /// Canonical signature used for the selector, e.g. `CallFailed(uint256,bytes)`.
  String get canonicalSignature =>
      '$name(${inputs.map((i) => i.type.name).join(',')})';

  /// First four bytes of `keccak256(canonicalSignature)`.
  ///
  /// Computed exactly like a function selector — the EVM makes no distinction,
  /// which is also why a custom error can collide with a function selector.
  Uint8List get selector => functionSelector(canonicalSignature);

  /// The selector as `0x`-prefixed hex.
  String get selectorHex => bytesToHex(selector);

  /// Decodes the arguments from revert data, selector included.
  List<Object?> decode(Uint8List revertData) => AbiCodec.decodeParameters(
    inputs.map((i) => i.type).toList(),
    Uint8List.sublistView(revertData, 4),
  );

  @override
  String toString() => canonicalSignature;
}

/// Errors defined by the Solidity language itself, understood without an ABI.
///
/// Sourced from the Solidity documentation, "Panic via assert and Error via
/// require". Selectors are computed here rather than hardcoded, so they cannot
/// drift from the signatures.
abstract final class SolidityErrors {
  /// `Error(string)` — emitted by `require(cond, "msg")` and `revert("msg")`.
  static final AbiError error = AbiError(
    name: 'Error',
    inputs: const [AbiParameter(name: 'message', type: AbiStringType())],
  );

  /// `Panic(uint256)` — emitted by `assert` and by compiler-inserted checks.
  static final AbiError panic = AbiError(
    name: 'Panic',
    inputs: const [
      AbiParameter(name: 'code', type: AbiIntType(256, signed: false)),
    ],
  );

  /// Meanings of the panic codes defined by the Solidity documentation.
  ///
  /// An unlisted code is not an error in this SDK: the compiler may add codes,
  /// so [describePanic] falls back to reporting the raw value.
  static const panicCodes = <int, String>{
    0x00: 'Generic compiler-inserted panic',
    0x01: 'assert() with an argument that evaluated to false',
    0x11: 'Arithmetic overflow or underflow outside an unchecked block',
    0x12: 'Division or modulo by zero',
    0x21: 'A value too large or negative was converted to an enum',
    0x22: 'Access to an incorrectly encoded storage byte array',
    0x31: 'pop() on an empty array',
    0x32: 'Array, bytesN or array slice index out of bounds',
    0x41: 'Too much memory allocated, or an array created too large',
    0x51: 'Called a zero-initialized variable of internal function type',
  };

  /// Describes a panic code, naming it when known.
  static String describePanic(BigInt code) {
    final known = code.isValidInt ? panicCodes[code.toInt()] : null;
    final hex = '0x${code.toRadixString(16).padLeft(2, '0')}';
    return known == null ? 'Panic $hex' : '$known (panic $hex)';
  }
}
