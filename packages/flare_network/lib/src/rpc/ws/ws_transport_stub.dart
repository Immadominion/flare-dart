import 'ws_transport.dart';

/// Fallback for platforms with neither `dart:io` nor `dart:js_interop`.
///
/// Only reachable if the SDK grows a target that has neither, which no current
/// one does. It exists so the conditional export in `ws_connect.dart` has a
/// default branch the analyzer can resolve.
Future<WsTransport> connectWebSocket(String url, {required Duration timeout}) =>
    throw UnsupportedError(
      'No WebSocket implementation is available on this platform. '
      'Poll with FtsoV2.watchFeeds or FlareClient.streamLogs instead.',
    );
