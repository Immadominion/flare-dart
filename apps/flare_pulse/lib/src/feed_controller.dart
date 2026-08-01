import 'dart:async';

import 'package:flare_network/flare_network.dart';
import 'package:flutter/widgets.dart';

/// How the app is currently doing against the network.
enum PulseStatus { connecting, live, retrying, failed }

/// One feed as the UI needs it: the latest reading plus how it moved.
@immutable
class FeedRow {
  final FeedId feedId;
  final FtsoFeedValue value;

  /// +1 up, -1 down, 0 unchanged or first reading.
  final int direction;

  const FeedRow({
    required this.feedId,
    required this.value,
    required this.direction,
  });
}

/// Drives the live feed list.
///
/// Wraps [FtsoV2.watchFeeds] and adds the things a UI needs and a library
/// should not assume: lifecycle-aware pausing, retry with visible status, and
/// per-feed direction for the flash animation.
class FeedController extends ChangeNotifier with WidgetsBindingObserver {
  /// Feeds shown, in display order.
  static final tracked = <FeedId>[
    Feeds.flrUsd,
    Feeds.btcUsd,
    Feeds.ethUsd,
    Feeds.xrpUsd,
    Feeds.dogeUsd,
    Feeds.solUsd,
  ];

  FlareChain _chain;
  FlareClient? _client;
  StreamSubscription<List<FtsoFeedValue>>? _subscription;

  var _status = PulseStatus.connecting;
  var _rows = <FeedRow>[];
  final _previous = <String, BigInt>{};
  EthAddress? _ftsoAddress;
  String? _error;
  DateTime? _lastUpdate;
  var _updateCount = 0;

  FeedController(this._chain) {
    WidgetsBinding.instance.addObserver(this);
    _connect();
  }

  FlareChain get chain => _chain;
  PulseStatus get status => _status;
  List<FeedRow> get rows => _rows;

  /// The FTSOv2 address resolved from the registry — surfaced in the UI
  /// because it is the proof that nothing here is hardcoded.
  EthAddress? get ftsoAddress => _ftsoAddress;
  String? get error => _error;
  DateTime? get lastUpdate => _lastUpdate;
  int get updateCount => _updateCount;

  Future<void> switchChain(FlareChain next) async {
    if (next.chainId == _chain.chainId) return;
    _chain = next;
    _previous.clear();
    _rows = [];
    _updateCount = 0;
    _ftsoAddress = null;
    await _teardown();
    _connect();
  }

  Future<void> _connect() async {
    _status = PulseStatus.connecting;
    _error = null;
    notifyListeners();

    try {
      final client = FlareClient(_chain);
      _client = client;

      // Catch a wrong endpoint here rather than as a puzzling
      // "contract not found" several calls later.
      await client.verifyChainId();

      final ftso = await FtsoV2.resolve(client);
      _ftsoAddress = ftso.address;

      _subscription = ftso
          .watchFeeds(tracked, interval: const Duration(seconds: 2))
          .listen(_onReadings, onError: _onError);

      _status = PulseStatus.live;
      notifyListeners();
    } catch (e) {
      _onError(e);
    }
  }

  void _onReadings(List<FtsoFeedValue> readings) {
    _rows = [
      for (final reading in readings)
        FeedRow(
          feedId: reading.feedId,
          value: reading,
          direction: switch (_previous[reading.feedId.hex]) {
            null => 0,
            final prev when reading.value > prev => 1,
            final prev when reading.value < prev => -1,
            _ => 0,
          },
        ),
    ];
    for (final reading in readings) {
      _previous[reading.feedId.hex] = reading.value;
    }
    _lastUpdate = DateTime.now();
    _updateCount++;
    _status = PulseStatus.live;
    _error = null;
    notifyListeners();
  }

  void _onError(Object error) {
    // The SDK already retries transport failures internally, so reaching here
    // means retries were exhausted. Keep the last known prices on screen and
    // say so, rather than blanking the list.
    _error = error is FlareException ? error.message : '$error';
    _status = _rows.isEmpty ? PulseStatus.failed : PulseStatus.retrying;
    notifyListeners();

    Future<void>.delayed(const Duration(seconds: 5), () {
      if (_subscription != null || _rows.isEmpty) _reconnect();
    });
  }

  Future<void> _reconnect() async {
    await _teardown();
    await _connect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Polling while backgrounded costs battery and burns the endpoint's rate
    // limit for a result nobody can see — so stop then, but only then.
    //
    // Deliberately NOT tearing down on `hidden` or `inactive`. On desktop,
    // `hidden` fires when the window is merely occluded by another app, and
    // tearing down there meant the ticker froze whenever it lost focus —
    // observed on macOS, where a window behind the terminal stopped fetching
    // entirely. On mobile `hidden` is always followed by `paused`, so nothing
    // is lost by ignoring it.
    switch (state) {
      case AppLifecycleState.resumed:
        if (_subscription == null) _connect();
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _teardown();
      case AppLifecycleState.hidden:
      case AppLifecycleState.inactive:
        break;
    }
  }

  Future<void> _teardown() async {
    await _subscription?.cancel();
    _subscription = null;
    _client?.close();
    _client = null;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _teardown();
    super.dispose();
  }
}
