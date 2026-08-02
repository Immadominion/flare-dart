import 'dart:async';
import 'dart:io';

import 'ws_transport.dart';

/// `dart:io` WebSocket, used on mobile, desktop and server.
class IoWsTransport implements WsTransport {
  final WebSocket _socket;

  IoWsTransport(this._socket);

  @override
  Stream<String> get messages =>
      _socket.where((e) => e is String).cast<String>();

  @override
  void send(String data) => _socket.add(data);

  @override
  Future<void> close() async {
    // A socket that is already closing throws on a second close; the caller
    // should not have to care.
    try {
      await _socket.close();
    } catch (_) {}
  }
}

Future<WsTransport> connectWebSocket(
  String url, {
  required Duration timeout,
}) async => IoWsTransport(await WebSocket.connect(url).timeout(timeout));
