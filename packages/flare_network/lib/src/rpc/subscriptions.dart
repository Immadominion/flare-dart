import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import '../abi/hex.dart';
import '../network/flare_chain.dart';
import 'flare_exception.dart';
import 'json_rpc_client.dart';
import 'logs.dart';
import 'transaction.dart';
import 'ws/ws_connect.dart';
import 'ws/ws_transport.dart';

/// Push subscriptions over WebSocket, as an alternative to polling.
///
/// Flare's public endpoints support `eth_subscribe` — verified against both
/// `wss://coston2-api.flare.network/ext/C/ws` and the mainnet equivalent — so
/// new blocks and matching logs arrive as the node produces them, rather than
/// on a timer.
///
/// ```dart
/// final subs = FlareSubscriptions(FlareChain.coston2);
/// await for (final block in subs.newHeads()) {
///   print('block ${block.number}');
/// }
/// ```
///
/// ## Delivery is at-most-once
///
/// A dropped socket loses whatever the node produced while it was down.
/// Reconnecting resubscribes from the present, not from the gap. Anything that
/// must not be missed needs a [FlareClient.getLogs] sweep over the missing
/// range once the socket is back.
///
/// ## When to prefer polling
///
/// A socket is not automatically the better choice on mobile. It holds an open
/// connection, is dropped when the OS suspends the app, and has to be torn down
/// and re-established across background transitions. For a screen that shows
/// prices every couple of seconds, `FtsoV2.watchFeeds` is simpler and survives
/// backgrounding without special handling. Reach for this when you need low
/// latency or must not miss an event.
///
/// ## Platforms
///
/// Native targets use `dart:io`; web targets use the browser's own `WebSocket`
/// through `dart:js_interop`. The choice is made at compile time, so this class
/// works everywhere the rest of the package does.
class FlareSubscriptions {
  /// The network being subscribed to.
  final FlareChain chain;

  /// WebSocket endpoint in use.
  final String wsUrl;

  /// How reconnection is paced after a drop.
  final RetryPolicy retryPolicy;

  /// Whether to reconnect automatically when the socket closes.
  final bool autoReconnect;

  /// How long to wait for the socket handshake.
  final Duration connectTimeout;

  /// Opens the socket. Injectable so reconnect and backoff can be tested
  /// without a network.
  final WsConnector _connect;

  final math.Random _random;

  /// Derives the `wss://` endpoint from a network's HTTPS RPC URL.
  ///
  /// Flare serves both from the same host: `/ext/C/rpc` becomes `/ext/C/ws`.
  static String webSocketUrlFor(FlareChain chain) => chain.rpcUrl
      .replaceFirst('https://', 'wss://')
      .replaceFirst(RegExp(r'/rpc$'), '/ws');

  FlareSubscriptions(
    this.chain, {
    String? wsUrl,
    this.retryPolicy = const RetryPolicy(maxRetries: 5),
    this.autoReconnect = true,
    this.connectTimeout = const Duration(seconds: 20),
    WsConnector? connector,
    math.Random? random,
  }) : wsUrl = wsUrl ?? webSocketUrlFor(chain),
       _connect = connector ?? connectWebSocket,
       _random = random ?? math.Random();

  /// Emits each new block header as the node produces it.
  ///
  /// Only header fields arrive over the subscription; transaction hashes are
  /// not included, so fetch the block if you need them.
  Stream<BlockInfo> newHeads() =>
      _subscribe(const ['newHeads']).map((json) => BlockInfo.fromJson(json));

  /// Emits logs matching [filter] as they are produced.
  ///
  /// Block ranges are meaningless for a live subscription, so only the address
  /// and topic constraints of [filter] are sent.
  Stream<FlareLog> logs([LogFilter filter = const LogFilter()]) {
    final params = <String, Object?>{
      if (filter.addresses.length == 1)
        'address': filter.addresses.single.hex
      else if (filter.addresses.length > 1)
        'address': filter.addresses.map((a) => a.hex).toList(),
      if (filter.topics.isNotEmpty) 'topics': filter.topics,
    };
    // The filter object is required even when empty. Sending just `['logs']`
    // is rejected by Flare with
    // `-32602: missing value for required argument 1`, so an unconstrained
    // subscription still has to pass `{}`.
    return _subscribe(['logs', params]).map((json) => FlareLog.fromJson(json));
  }

  /// Emits the hash of each transaction entering the mempool.
  ///
  /// High volume, and a hash is all you get — fetch the body separately if you
  /// need it.
  Stream<String> pendingTransactions() => _subscribe(const [
    'newPendingTransactions',
  ]).map((json) => json['result']?.toString() ?? '');

  /// Opens a subscription and yields each notification payload.
  ///
  /// Reconnects with jittered backoff when [autoReconnect] is set, resetting
  /// the backoff after any successful connection.
  Stream<Map<String, Object?>> _subscribe(List<Object?> params) async* {
    var attempt = 0;

    while (true) {
      WsTransport? socket;
      try {
        socket = await _connect(wsUrl, timeout: connectTimeout);
        attempt = 0; // A successful connect resets the backoff.

        socket.send(
          jsonEncode({
            'jsonrpc': '2.0',
            'id': 1,
            'method': 'eth_subscribe',
            'params': params,
          }),
        );

        await for (final raw in socket.messages) {
          final decoded = jsonDecode(raw);
          if (decoded is! Map) continue;

          final error = decoded['error'];
          if (error is Map) {
            // A rejected subscription is a caller mistake — a bad filter or an
            // unsupported kind — so reconnecting would just repeat it.
            throw FlareRpcException(
              (error['message'] ?? 'subscription error').toString(),
              code: (error['code'] as num?)?.toInt() ?? -1,
              method: 'eth_subscribe',
            );
          }

          // The reply to eth_subscribe itself carries the id, not a payload.
          final p = decoded['params'];
          if (p is! Map) continue;
          final result = p['result'];
          if (result is Map) {
            yield result.cast<String, Object?>();
          } else if (result != null) {
            // newPendingTransactions delivers a bare hash string.
            yield {'result': result};
          }
        }
      } on FlareException {
        rethrow;
      } catch (e) {
        if (!autoReconnect || attempt >= retryPolicy.maxRetries) {
          throw FlareTransportException(
            'WebSocket subscription failed: $e',
            endpoint: wsUrl,
          );
        }
      } finally {
        await socket?.close();
      }

      if (!autoReconnect) return;
      attempt++;
      if (attempt > retryPolicy.maxRetries) {
        throw FlareTransportException(
          'WebSocket reconnect gave up after ${retryPolicy.maxRetries} '
          'attempt(s)',
          endpoint: wsUrl,
        );
      }
      await Future<void>.delayed(retryPolicy.delayFor(attempt, _random));
    }
  }
}

/// Convenience accessors on a decoded block header.
extension BlockHeaderHex on BlockInfo {
  /// The block hash as `0x`-prefixed hex.
  String get hashHex => bytesToHex(hash);
}
