/// Base class for every error this SDK throws.
///
/// Catching [FlareException] catches all of them; catch a subtype when you
/// intend to react differently, for example retrying only on
/// [FlareTransportException] while surfacing a [FlareContractException] to the
/// user.
sealed class FlareException implements Exception {
  /// Human-readable description of what went wrong.
  final String message;

  const FlareException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

/// The node was unreachable, timed out, or returned a non-200 status.
///
/// These are generally transient and safe to retry.
final class FlareTransportException extends FlareException {
  /// HTTP status code, or null if the request never completed.
  final int? statusCode;

  /// The endpoint that failed.
  final String? endpoint;

  const FlareTransportException(super.message, {this.statusCode, this.endpoint});

  /// Whether retrying is likely to help: connection failures, 408, 429, and 5xx.
  bool get isRetryable {
    final code = statusCode;
    if (code == null) return true;
    return code == 408 || code == 429 || code >= 500;
  }

  @override
  String toString() {
    final where = endpoint == null ? '' : ' [$endpoint]';
    final code = statusCode == null ? '' : ' (HTTP $statusCode)';
    return 'FlareTransportException$code$where: $message';
  }
}

/// The node returned a well-formed JSON-RPC error object.
final class FlareRpcException extends FlareException {
  /// JSON-RPC error code. `-32000` is a common generic execution error.
  final int code;

  /// Any `data` field the node attached, often ABI-encoded revert data.
  final Object? data;

  /// The method that failed.
  final String? method;

  const FlareRpcException(super.message, {required this.code, this.data, this.method});

  @override
  String toString() =>
      'FlareRpcException($code)${method == null ? '' : ' in $method'}: $message';
}

/// A contract call reverted, or returned data that could not be decoded.
final class FlareContractException extends FlareException {
  /// The contract that was called, if known.
  final String? address;

  /// The function that was called, if known.
  final String? function;

  const FlareContractException(super.message, {this.address, this.function});

  @override
  String toString() {
    final where = [
      if (function != null) function,
      if (address != null) 'at $address',
    ].join(' ');
    return 'FlareContractException${where.isEmpty ? '' : ' ($where)'}: $message';
  }
}

/// A value could not be encoded to, or decoded from, the ABI.
///
/// This almost always means the ABI does not match the deployed contract, or a
/// Dart value was out of range for its declared Solidity type.
final class FlareAbiException extends FlareException {
  /// The Solidity type involved, e.g. `uint256` or `bytes21`.
  final String? solidityType;

  const FlareAbiException(super.message, {this.solidityType});

  @override
  String toString() =>
      'FlareAbiException${solidityType == null ? '' : ' ($solidityType)'}: $message';
}

/// A name could not be resolved through the Flare Contract Registry.
final class FlareRegistryException extends FlareException {
  /// The registry name that failed to resolve, e.g. `FtsoV2`.
  final String contractName;

  const FlareRegistryException(super.message, {required this.contractName});

  @override
  String toString() => 'FlareRegistryException($contractName): $message';
}
