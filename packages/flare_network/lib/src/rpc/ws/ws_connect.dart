/// Selects a WebSocket implementation per compilation target.
///
/// Without this indirection the `dart:io` import in the native implementation
/// is reachable from the public barrel, and pub.dev drops the package's `web`
/// platform tag — which makes the *whole* package unusable from Flutter Web,
/// not merely the subscription class that needs a socket.
library;

export 'ws_transport_stub.dart'
    if (dart.library.io) 'ws_transport_io.dart'
    if (dart.library.js_interop) 'ws_transport_web.dart';
