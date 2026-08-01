import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import 'flare_exception.dart';

/// A single JSON-RPC call, used when batching.
@immutable
final class RpcRequest {
  final String method;
  final List<Object?> params;

  const RpcRequest(this.method, [this.params = const []]);

  @override
  String toString() => '$method(${params.join(', ')})';
}

/// Retry policy for transient transport failures.
///
/// Backoff is exponential with full jitter. Jitter matters here beyond good
/// manners: Flare's public DA Layer rate-limits aggressively, and a fleet of
/// mobile clients retrying in lockstep will keep re-colliding without it.
@immutable
final class RetryPolicy {
  /// Number of retries after the initial attempt. Zero disables retrying.
  final int maxRetries;

  /// Delay before the first retry.
  final Duration initialDelay;

  /// Upper bound on any single delay.
  final Duration maxDelay;

  const RetryPolicy({
    this.maxRetries = 3,
    this.initialDelay = const Duration(milliseconds: 200),
    this.maxDelay = const Duration(seconds: 8),
  });

  /// Never retry.
  static const none = RetryPolicy(maxRetries: 0);

  /// Computes the delay before retry [attempt] (1-based), with full jitter.
  Duration delayFor(int attempt, math.Random random) {
    final exponential = initialDelay.inMilliseconds * math.pow(2, attempt - 1);
    final capped = math.min(exponential.toDouble(), maxDelay.inMilliseconds.toDouble());
    return Duration(milliseconds: random.nextInt(capped.toInt() + 1));
  }
}

/// Minimal JSON-RPC 2.0 client over HTTP.
///
/// Not Flare-specific: it speaks plain JSON-RPC and knows nothing about
/// contracts. [FlareClient] layers Flare semantics on top.
class JsonRpcClient {
  /// The endpoint every request is posted to.
  final String url;

  /// How transient failures are retried.
  final RetryPolicy retryPolicy;

  /// Per-request timeout.
  final Duration timeout;

  final http.Client _http;
  final bool _ownsHttpClient;
  final math.Random _random;
  var _id = 0;
  var _closed = false;

  /// Creates a client for [url].
  ///
  /// Pass [httpClient] to share a connection pool or to inject a mock; the
  /// caller then owns its lifecycle and [close] will not shut it down.
  JsonRpcClient(
    this.url, {
    this.retryPolicy = const RetryPolicy(),
    this.timeout = const Duration(seconds: 30),
    http.Client? httpClient,
    math.Random? random,
  })  : _http = httpClient ?? http.Client(),
        _ownsHttpClient = httpClient == null,
        _random = random ?? math.Random();

  /// Sends one JSON-RPC call and returns its `result`.
  ///
  /// Throws [FlareRpcException] if the node reports an error, or
  /// [FlareTransportException] if the request never succeeded.
  Future<Object?> call(String method, [List<Object?> params = const []]) async {
    final body = {
      'jsonrpc': '2.0',
      'id': ++_id,
      'method': method,
      'params': params,
    };
    final decoded = await _post(jsonEncode(body), method);
    if (decoded is! Map) {
      throw FlareTransportException(
        'Expected a JSON object, got ${decoded.runtimeType}',
        endpoint: url,
      );
    }
    return _unwrap(decoded, method);
  }

  /// Sends [requests] as a single batch and returns results in the same order.
  ///
  /// One round trip instead of N. Flare's ~1.8s blocks make this the difference
  /// between one and N network waits when reading several contracts per frame.
  ///
  /// If any individual call errors, that error is thrown — so a batch is
  /// all-or-nothing from the caller's point of view.
  Future<List<Object?>> batch(List<RpcRequest> requests) async {
    if (requests.isEmpty) return const [];

    final ids = <int, int>{}; // request id -> original index
    final payload = <Map<String, Object?>>[];
    for (var i = 0; i < requests.length; i++) {
      final id = ++_id;
      ids[id] = i;
      payload.add({
        'jsonrpc': '2.0',
        'id': id,
        'method': requests[i].method,
        'params': requests[i].params,
      });
    }

    final decoded = await _post(jsonEncode(payload), 'batch');
    if (decoded is! List) {
      throw FlareTransportException(
        'Expected a JSON array for a batch request, got ${decoded.runtimeType}. '
        'Some endpoints do not support batching.',
        endpoint: url,
      );
    }

    // Nodes may reorder batch responses, so match on id rather than position.
    final out = List<Object?>.filled(requests.length, null);
    for (final entry in decoded) {
      if (entry is! Map) continue;
      final idx = ids[entry['id']];
      if (idx == null) continue;
      out[idx] = _unwrap(entry, requests[idx].method);
    }
    return out;
  }

  Object? _unwrap(Map<dynamic, dynamic> response, String method) {
    final error = response['error'];
    if (error != null) {
      if (error is Map) {
        throw FlareRpcException(
          (error['message'] ?? 'Unknown JSON-RPC error').toString(),
          code: (error['code'] as num?)?.toInt() ?? -1,
          data: error['data'],
          method: method,
        );
      }
      throw FlareRpcException(error.toString(), code: -1, method: method);
    }
    return response['result'];
  }

  Future<Object?> _post(String body, String label) async {
    if (_closed) {
      throw StateError('This JsonRpcClient has been closed');
    }
    FlareTransportException? last;

    for (var attempt = 0; attempt <= retryPolicy.maxRetries; attempt++) {
      if (attempt > 0) {
        await Future<void>.delayed(retryPolicy.delayFor(attempt, _random));
      }
      try {
        final res = await _http
            .post(
              Uri.parse(url),
              headers: const {'content-type': 'application/json'},
              body: body,
            )
            .timeout(timeout);

        if (res.statusCode != 200) {
          last = FlareTransportException(
            'Node returned HTTP ${res.statusCode}: '
            '${res.body.length > 200 ? '${res.body.substring(0, 200)}…' : res.body}',
            statusCode: res.statusCode,
            endpoint: url,
          );
          if (!last.isRetryable) throw last;
          continue;
        }
        return jsonDecode(res.body);
      } on FlareTransportException {
        rethrow;
      } on TimeoutException {
        last = FlareTransportException(
          'Request "$label" timed out after ${timeout.inSeconds}s',
          endpoint: url,
        );
      } on FormatException catch (e) {
        // Malformed JSON is not transient; retrying will not fix it.
        throw FlareTransportException(
          'Node returned a malformed JSON response: ${e.message}',
          endpoint: url,
        );
      } catch (e) {
        last = FlareTransportException(
          'Request "$label" failed: $e',
          endpoint: url,
        );
      }
    }
    throw last ??
        FlareTransportException('Request "$label" failed', endpoint: url);
  }

  /// Releases the underlying HTTP client, unless one was injected.
  void close() {
    _closed = true;
    if (_ownsHttpClient) _http.close();
  }
}
