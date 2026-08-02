import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../rpc/flare_exception.dart';
import 'abi_error.dart';
import 'hex.dart';

/// Why a call reverted, recovered from the node's error payload.
///
/// Flare returns ABI-encoded revert data in the JSON-RPC `error.data` field for
/// both `eth_call` and `eth_estimateGas` — measured on 2026-08-02 against
/// Coston2 and mainnet, error code `3`. Without decoding it, a caller sees only
/// `execution reverted`, which is exactly the case for the 168 custom errors
/// declared across Flare's published ABIs.
///
/// ```dart
/// try {
///   await client.estimateGas(request);
/// } on FlareRpcException catch (e) {
///   final why = e.revertReason;
///   if (why != null) print(why.description);
/// }
/// ```
@immutable
sealed class RevertReason {
  const RevertReason();

  /// A single line suitable for showing a user or writing to a log.
  String get description;

  /// Decodes revert data, selector included.
  ///
  /// Pass [errors] — typically `abi.errors` — to name custom errors. Without
  /// them a custom error still decodes, as [RevertWithUnknownSelector], which
  /// preserves the selector so it can be matched later.
  ///
  /// Never throws. Revert data comes from the called contract, so a hostile or
  /// simply mismatched payload is expected input, not an exceptional case.
  static RevertReason decodeBytes(
    Uint8List data, {
    Iterable<AbiError> errors = const [],
  }) {
    // A bare `revert()`, a `require` with no message, and a call to an address
    // holding no code all produce empty data.
    if (data.isEmpty) return const RevertWithoutReason();
    if (data.length < 4) return RevertWithUnknownSelector(data, Uint8List(0));

    final selector = Uint8List.sublistView(data, 0, 4);
    final payload = Uint8List.sublistView(data, 4);

    bool matches(AbiError e) => _sameBytes(e.selector, selector);

    if (matches(SolidityErrors.error)) {
      final decoded = _tryDecode(SolidityErrors.error, data);
      if (decoded != null && decoded.length == 1 && decoded.first is String) {
        return RevertWithMessage(decoded.first! as String);
      }
    }

    if (matches(SolidityErrors.panic)) {
      final decoded = _tryDecode(SolidityErrors.panic, data);
      if (decoded != null && decoded.length == 1 && decoded.first is BigInt) {
        return RevertWithPanic(decoded.first! as BigInt);
      }
    }

    for (final candidate in errors) {
      if (!matches(candidate)) continue;
      final decoded = _tryDecode(candidate, data);
      // A selector match with undecodable arguments is still a positive
      // identification; report the error, with no arguments rather than none.
      return RevertWithCustomError(candidate, decoded ?? const []);
    }

    return RevertWithUnknownSelector(
      Uint8List.fromList(selector),
      Uint8List.fromList(payload),
    );
  }

  /// Decodes the `data` field of a JSON-RPC error object.
  ///
  /// Returns null when the field is absent or is not revert data. Flare sends a
  /// plain `0x`-prefixed string; the nested `{data: ...}` shape some other
  /// nodes use is also accepted.
  static RevertReason? tryDecode(
    Object? rpcErrorData, {
    Iterable<AbiError> errors = const [],
  }) {
    final raw = switch (rpcErrorData) {
      String s => s,
      Map<String, Object?> m => m['data'] as String?,
      Map<Object?, Object?> m => m['data'] as String?,
      _ => null,
    };
    if (raw == null) return null;

    final trimmed = raw.trim();
    if (!trimmed.startsWith('0x') && !trimmed.startsWith('0X')) return null;

    final Uint8List bytes;
    try {
      bytes = hexToBytes(trimmed);
    } catch (_) {
      return null;
    }
    return decodeBytes(bytes, errors: errors);
  }

  static List<Object?>? _tryDecode(AbiError error, Uint8List data) {
    try {
      return error.decode(data);
    } catch (_) {
      return null;
    }
  }

  static bool _sameBytes(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// `Error(string)` — from `require(cond, "msg")` or `revert("msg")`.
final class RevertWithMessage extends RevertReason {
  /// The message the contract supplied.
  final String message;

  const RevertWithMessage(this.message);

  @override
  String get description => message;

  @override
  String toString() => 'RevertWithMessage($message)';
}

/// `Panic(uint256)` — from `assert`, or a compiler-inserted safety check.
///
/// A panic signals a bug rather than a rejected input: overflow, division by
/// zero, an out-of-bounds index.
final class RevertWithPanic extends RevertReason {
  /// The raw panic code.
  final BigInt code;

  const RevertWithPanic(this.code);

  @override
  String get description => SolidityErrors.describePanic(code);

  @override
  String toString() => 'RevertWithPanic($description)';
}

/// A custom error declared in the contract's ABI, matched and decoded.
final class RevertWithCustomError extends RevertReason {
  /// The matched declaration.
  final AbiError error;

  /// Decoded arguments, in declaration order. Empty if they failed to decode.
  final List<Object?> arguments;

  const RevertWithCustomError(this.error, this.arguments);

  @override
  String get description =>
      arguments.isEmpty
          ? error.name
          : '${error.name}(${arguments.map(_render).join(', ')})';

  static String _render(Object? v) =>
      v is Uint8List ? bytesToHex(v) : v.toString();

  @override
  String toString() => 'RevertWithCustomError($description)';
}

/// Revert data whose 4-byte selector matched nothing known.
///
/// Almost always a custom error from a contract whose ABI was not supplied.
/// [selector] is kept so it can be matched against an ABI later, or looked up
/// in a signature database.
final class RevertWithUnknownSelector extends RevertReason {
  /// The leading 4 bytes, or fewer if the data was shorter.
  final Uint8List selector;

  /// Everything after the selector, still ABI-encoded.
  final Uint8List payload;

  const RevertWithUnknownSelector(this.selector, this.payload);

  @override
  String get description =>
      'Reverted with unrecognised error ${bytesToHex(selector)}';

  @override
  String toString() => 'RevertWithUnknownSelector(${bytesToHex(selector)})';
}

/// The call reverted and supplied no data at all.
///
/// Produced by a bare `revert()`, a failed `require` with no message, running
/// out of gas, or calling an address that holds no code.
final class RevertWithoutReason extends RevertReason {
  const RevertWithoutReason();

  @override
  String get description => 'Reverted without a reason';

  @override
  String toString() => 'RevertWithoutReason()';
}

/// Recovers the revert reason attached to a node's error response.
extension RevertingRpcException on FlareRpcException {
  /// The decoded revert reason, or null if this error carried none.
  ///
  /// Names `Error(string)` and `Panic(uint256)` unaided. A custom error needs
  /// its declaration, so use [revertReasonWith] when the ABI is to hand;
  /// otherwise it arrives as [RevertWithUnknownSelector] with the selector
  /// intact.
  RevertReason? get revertReason => RevertReason.tryDecode(data);

  /// The decoded revert reason, matched against [errors].
  ///
  /// ```dart
  /// final abi = ContractAbi.fromJson(json);
  /// final why = e.revertReasonWith(abi.errors);
  /// ```
  RevertReason? revertReasonWith(Iterable<AbiError> errors) =>
      RevertReason.tryDecode(data, errors: errors);
}
