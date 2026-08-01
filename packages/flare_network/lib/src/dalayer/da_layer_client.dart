import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../abi/hex.dart';
import '../ftso/feed_id.dart';
import '../network/flare_chain.dart';
import '../rpc/flare_exception.dart';
import '../rpc/json_rpc_client.dart';

/// One anchor (Scaling) feed reading with the Merkle proof that authenticates
/// it against the on-chain root.
///
/// Anchor feeds are published every 90 seconds by ~100 independent data
/// providers through a commit-reveal process. Only a commitment lives on chain;
/// the feed body itself is served off chain by the DA Layer, and the [proof]
/// is what lets a contract verify it.
///
/// **Anchor decimals are not the same as block-latency decimals.** A live
/// Coston2 call returned FLR/USD as `6280` at 6 dp from the DA Layer while
/// FTSOv2 returned `626973` at 8 dp for the same feed at the same moment. Both
/// are correct; they are different products. Never carry a scale across.
@immutable
final class AnchorFeed {
  /// Which feed this is.
  final FeedId feedId;

  /// The voting round this reading was finalised in.
  final int votingRoundId;

  /// The unscaled value. Signed — the API returns an `int32`.
  final int value;

  /// Decimal places to shift [value] by. Signed.
  final int decimals;

  /// Share of vote power that participated, in basis points (10000 = 100%).
  final int turnoutBips;

  /// Merkle proof, ordered, for on-chain verification.
  final List<Uint8List> proof;

  const AnchorFeed({
    required this.feedId,
    required this.votingRoundId,
    required this.value,
    required this.decimals,
    required this.turnoutBips,
    required this.proof,
  });

  /// The value as an exact decimal string, without floating point.
  String toDecimalString() {
    if (decimals <= 0) {
      return (BigInt.from(value) * BigInt.from(10).pow(-decimals)).toString();
    }
    final negative = value < 0;
    final digits = value.abs().toString().padLeft(decimals + 1, '0');
    final whole = digits.substring(0, digits.length - decimals);
    final fraction = digits.substring(digits.length - decimals);
    return '${negative ? '-' : ''}$whole.$fraction';
  }

  /// The value as a [double], for display. Lossy; prefer [toDecimalString].
  double get asDouble => decimals >= 0
      ? value / math.pow(10, decimals).toDouble()
      : value * math.pow(10, -decimals).toDouble();

  /// Turnout as a percentage.
  double get turnoutPercent => turnoutBips / 100.0;

  factory AnchorFeed._fromJson(Map<String, Object?> json) {
    final body = json['body'];
    if (body is! Map) {
      throw const FlareTransportException(
        'DA Layer response entry is missing its "body" object',
      );
    }
    final proof = (json['proof'] as List<Object?>? ?? const [])
        .cast<String>()
        .map(hexToBytes)
        .toList();

    return AnchorFeed(
      feedId: FeedId.parse(body['id']! as String),
      votingRoundId: (body['votingRoundId']! as num).toInt(),
      value: (body['value']! as num).toInt(),
      decimals: (body['decimals']! as num).toInt(),
      turnoutBips: (body['turnoutBIPS'] as num?)?.toInt() ?? 0,
      proof: proof,
    );
  }

  @override
  String toString() =>
      '${feedId.name} = ${toDecimalString()} (round $votingRoundId, '
      '${proof.length}-element proof)';
}

/// Where the protocol currently stands, from `/api/v0/fsp/status`.
@immutable
final class FspStatus {
  /// The round currently being voted on.
  final int activeVotingRoundId;

  /// The most recent finalised FDC round.
  final int latestFdcVotingRoundId;

  /// The most recent finalised FTSO round.
  final int latestFtsoVotingRoundId;

  /// Start of the active round.
  final DateTime activeRoundStart;

  const FspStatus({
    required this.activeVotingRoundId,
    required this.latestFdcVotingRoundId,
    required this.latestFtsoVotingRoundId,
    required this.activeRoundStart,
  });

  @override
  String toString() => 'FspStatus(active $activeVotingRoundId, '
      'ftso $latestFtsoVotingRoundId, fdc $latestFdcVotingRoundId)';
}

/// Client for Flare's Data Availability Layer REST API.
///
/// The DA Layer serves anchor feed bodies and their Merkle proofs off chain.
/// Reading it is trustless: the proof can be verified against the on-chain
/// Merkle root, so a dishonest DA Layer cannot forge a value.
///
/// ```dart
/// final da = DaLayerClient(FlareChain.coston2);
/// try {
///   final feeds = await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
///   print(feeds.single);
/// } finally {
///   da.close();
/// }
/// ```
///
/// ## Rate limits
///
/// The public endpoints are aggressively rate-limited and send **no**
/// `Retry-After` header. Measured on Coston2 on 2026-08-01: 18 sequential
/// unauthenticated requests succeeded and the 19th returned 429, against a
/// window already partly consumed. Treat roughly 20 per window as the ceiling.
///
/// Because of that, [retryPolicy] is on by default and uses full jitter — a
/// fleet of mobile clients retrying in lockstep would otherwise keep
/// re-colliding. For anything beyond light use, request an API key through the
/// developer-hub issue tracker and pass it as [apiKey].
class DaLayerClient {
  /// Base URLs per network, from Flare's Scaling documentation.
  static const _baseUrls = {
    14: 'https://flr-data-availability.flare.network',
    114: 'https://ctn2-data-availability.flare.network',
    19: 'https://sgb-data-availability.flare.network',
    16: 'https://ctn-data-availability.flare.network',
  };

  /// The network being queried.
  final FlareChain chain;

  /// Base URL in use.
  final String baseUrl;

  /// Optional API key, sent as `X-API-KEY`.
  final String? apiKey;

  /// Retry policy for transient failures, including 429.
  final RetryPolicy retryPolicy;

  /// Per-request timeout.
  final Duration timeout;

  final http.Client _http;
  final bool _ownsHttpClient;
  final math.Random _random;
  var _closed = false;

  /// Creates a client for [chain].
  ///
  /// Throws [ArgumentError] if [chain] has no known DA Layer and no [baseUrl]
  /// override is supplied.
  DaLayerClient(
    this.chain, {
    String? baseUrl,
    this.apiKey,
    this.retryPolicy = const RetryPolicy(maxRetries: 4),
    this.timeout = const Duration(seconds: 30),
    http.Client? httpClient,
    math.Random? random,
  })  : baseUrl = baseUrl ??
            _baseUrls[chain.chainId] ??
            (throw ArgumentError.value(
              chain.chainId,
              'chain',
              'No DA Layer endpoint is known for this network; pass baseUrl',
            )),
        _http = httpClient ?? http.Client(),
        _ownsHttpClient = httpClient == null,
        _random = random ?? math.Random();

  /// Current protocol status: active and latest finalised voting rounds.
  Future<FspStatus> getStatus() async {
    final json = await _get('/api/v0/fsp/status');
    if (json is! Map) {
      throw const FlareTransportException(
        'Expected a JSON object from /api/v0/fsp/status',
      );
    }
    int roundOf(String key) {
      final entry = json[key];
      if (entry is! Map) return 0;
      return (entry['voting_round_id'] as num?)?.toInt() ?? 0;
    }

    final activeStart =
        ((json['active'] as Map?)?['start_timestamp'] as num?)?.toInt() ?? 0;

    return FspStatus(
      activeVotingRoundId: roundOf('active'),
      latestFdcVotingRoundId: roundOf('latest_fdc'),
      latestFtsoVotingRoundId: roundOf('latest_ftso'),
      activeRoundStart: DateTime.fromMillisecondsSinceEpoch(
        activeStart * 1000,
        isUtc: true,
      ),
    );
  }

  /// Fetches anchor feeds together with their Merkle proofs.
  ///
  /// Pass [votingRoundId] to read a specific round; omit it for the latest
  /// finalised one.
  ///
  /// Results are returned **in the order requested**. The API does not preserve
  /// request order — a live call for `[FLR/USD, BTC/USD]` came back BTC-first —
  /// so this method re-orders by feed ID rather than trusting position.
  ///
  /// Throws [FlareContractException] if the API omits a requested feed, which
  /// would otherwise surface much later as a silently missing price.
  Future<List<AnchorFeed>> getAnchorFeedsWithProof(
    List<FeedId> feedIds, {
    int? votingRoundId,
  }) async {
    if (feedIds.isEmpty) return const [];

    final path = '/api/v0/ftso/anchor-feeds-with-proof'
        '${votingRoundId == null ? '' : '?voting_round_id=$votingRoundId'}';

    final json = await _post(path, {
      'feed_ids': [for (final f in feedIds) f.hex],
    });

    if (json is! List) {
      throw FlareTransportException(
        'Expected a JSON array of anchor feeds, got ${json.runtimeType}',
        endpoint: baseUrl,
      );
    }

    final byId = <String, AnchorFeed>{};
    for (final entry in json) {
      if (entry is! Map) continue;
      final feed = AnchorFeed._fromJson(entry.cast<String, Object?>());
      byId[feed.feedId.hex] = feed;
    }

    return [
      for (final requested in feedIds)
        byId[requested.hex] ??
            (throw FlareContractException(
              'The DA Layer returned no anchor feed for ${requested.name} '
              '(${requested.hex}). It may not be a supported anchor feed on '
              '${chain.name}.',
            )),
    ];
  }

  Future<Object?> _get(String path) => _send('GET', path, null);

  Future<Object?> _post(String path, Object body) =>
      _send('POST', path, jsonEncode(body));

  Future<Object?> _send(String method, String path, String? body) async {
    if (_closed) throw StateError('This DaLayerClient has been closed');

    final uri = Uri.parse('$baseUrl$path');
    final headers = <String, String>{
      'accept': 'application/json',
      if (body != null) 'content-type': 'application/json',
      if (apiKey != null) 'X-API-KEY': apiKey!,
    };

    FlareTransportException? last;

    for (var attempt = 0; attempt <= retryPolicy.maxRetries; attempt++) {
      if (attempt > 0) {
        await Future<void>.delayed(retryPolicy.delayFor(attempt, _random));
      }
      try {
        final response = await (method == 'GET'
                ? _http.get(uri, headers: headers)
                : _http.post(uri, headers: headers, body: body))
            .timeout(timeout);

        if (response.statusCode == 429) {
          // No Retry-After is sent, so back off on our own schedule.
          last = FlareTransportException(
            'DA Layer rate limit hit. The public endpoint allows roughly 20 '
            'requests per window and sends no Retry-After header. Request an '
            'API key via the developer-hub issue tracker and pass it as '
            'apiKey, or reduce polling frequency.',
            statusCode: 429,
            endpoint: uri.toString(),
          );
          continue;
        }

        if (response.statusCode != 200) {
          final snippet = response.body.length > 200
              ? '${response.body.substring(0, 200)}…'
              : response.body;
          last = FlareTransportException(
            'DA Layer returned HTTP ${response.statusCode}: $snippet',
            statusCode: response.statusCode,
            endpoint: uri.toString(),
          );
          if (!last.isRetryable) throw last;
          continue;
        }
        return jsonDecode(response.body);
      } on FlareTransportException {
        rethrow;
      } on FormatException catch (e) {
        throw FlareTransportException(
          'DA Layer returned malformed JSON: ${e.message}',
          endpoint: uri.toString(),
        );
      } catch (e) {
        last = FlareTransportException(
          'DA Layer request failed: $e',
          endpoint: uri.toString(),
        );
      }
    }
    throw last ??
        FlareTransportException('DA Layer request failed', endpoint: baseUrl);
  }

  /// Releases the underlying HTTP connection.
  void close() {
    _closed = true;
    if (_ownsHttpClient) _http.close();
  }
}
