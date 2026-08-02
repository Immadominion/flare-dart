import 'dart:async';
import 'dart:js_interop';

import 'ws_transport.dart';

/// The browser's own `WebSocket`, bound through `dart:js_interop`.
///
/// Declared here rather than pulled from `package:web` so the package keeps its
/// three dependencies. `dart:js_interop` ships with the SDK, and the surface
/// needed is four event handlers and `send`.
@JS('WebSocket')
extension type _BrowserWebSocket._(JSObject _) implements JSObject {
  external factory _BrowserWebSocket(String url);

  external void send(JSAny data);
  external void close();

  external set onopen(JSFunction? value);
  external set onmessage(JSFunction? value);
  external set onerror(JSFunction? value);
  external set onclose(JSFunction? value);
}

extension type _MessageEvent._(JSObject _) implements JSObject {
  external JSAny? get data;
}

/// Browser WebSocket, used on Flutter Web and any dart2js/dart2wasm target.
class WebWsTransport implements WsTransport {
  final _BrowserWebSocket _socket;
  final StreamController<String> _controller;

  WebWsTransport._(this._socket, this._controller);

  @override
  Stream<String> get messages => _controller.stream;

  @override
  void send(String data) => _socket.send(data.toJS);

  @override
  Future<void> close() async {
    _socket.close();
    if (!_controller.isClosed) await _controller.close();
  }
}

Future<WsTransport> connectWebSocket(String url, {required Duration timeout}) {
  final socket = _BrowserWebSocket(url);
  final controller = StreamController<String>();
  final opened = Completer<WsTransport>();

  socket.onopen =
      ((JSAny _) {
        if (!opened.isCompleted) {
          opened.complete(WebWsTransport._(socket, controller));
        }
      }).toJS;

  socket.onmessage =
      ((JSAny event) {
        // Flare sends text frames; a binary frame would dartify to a byte list,
        // which is not a JSON-RPC notification, so it is dropped.
        final data = (event as _MessageEvent).data?.dartify();
        if (data is String && !controller.isClosed) controller.add(data);
      }).toJS;

  socket.onerror =
      ((JSAny _) {
        // The browser deliberately withholds the reason for a failed WebSocket
        // handshake, so there is no detail to pass on here.
        final error = StateError('WebSocket error on $url');
        if (!opened.isCompleted) {
          opened.completeError(error);
        } else if (!controller.isClosed) {
          controller.addError(error);
        }
      }).toJS;

  socket.onclose =
      ((JSAny _) {
        if (!opened.isCompleted) {
          opened.completeError(
            StateError('WebSocket to $url closed before it opened'),
          );
        }
        if (!controller.isClosed) controller.close();
      }).toJS;

  return opened.future.timeout(
    timeout,
    onTimeout: () {
      socket.close();
      unawaited(controller.close());
      throw TimeoutException('WebSocket handshake to $url timed out', timeout);
    },
  );
}
