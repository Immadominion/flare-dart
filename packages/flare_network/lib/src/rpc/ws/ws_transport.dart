import 'dart:async';

/// A minimal duplex text socket.
///
/// [FlareSubscriptions] talks to this rather than reaching for `dart:io`
/// directly. Two things fall out of that:
///
/// - The package stays compilable for the web. Importing `dart:io` anywhere
///   reachable from the public barrel costs the whole package its `web`
///   platform tag, not just the one class that needs it.
/// - Reconnect, backoff and error mapping become testable offline, by handing
///   [FlareSubscriptions] a fake connector instead of a real endpoint.
abstract interface class WsTransport {
  /// Text frames from the peer.
  ///
  /// Closes when the socket closes, which is the signal [FlareSubscriptions]
  /// uses to decide whether to reconnect.
  Stream<String> get messages;

  /// Sends one text frame.
  void send(String data);

  /// Closes the socket. Safe to call more than once.
  Future<void> close();
}

/// Opens a [WsTransport] against [url].
///
/// The default implementation is chosen per platform by conditional export;
/// tests inject their own.
typedef WsConnector =
    Future<WsTransport> Function(String url, {required Duration timeout});
