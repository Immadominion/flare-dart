import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/abi_function.dart';
import '../abi/abi_type.dart';
import '../abi/eth_address.dart';
import '../registry/contract_registry.dart';
import '../rpc/flare_client.dart';
import '../rpc/flare_exception.dart';
import 'feed_id.dart';

/// One FTSO feed reading: an integer [value] scaled by [decimals], plus the
/// on-chain [timestamp] it was published at.
///
/// Always carry [decimals] alongside [value]. It varies per feed and is not
/// stable — a single live call to Coston2 on 2026-07-31 returned 8 decimals for
/// FLR/USD, 2 for BTC/USD and 6 for XRP/USD. Assuming any fixed scale produces
/// prices that are wrong by orders of magnitude.
///
/// [decimals] is a Solidity `int8` and **can be negative**, which scales the
/// value up rather than down.
@immutable
final class FtsoFeedValue {
  /// The feed this reading belongs to.
  final FeedId feedId;

  /// The unscaled integer value.
  final BigInt value;

  /// Decimal places to shift by. Signed: negative scales up.
  final int decimals;

  /// When the feed was published, as seconds since the Unix epoch.
  final int timestamp;

  const FtsoFeedValue({
    required this.feedId,
    required this.value,
    required this.decimals,
    required this.timestamp,
  });

  /// The value as a [double], for display.
  ///
  /// Convenient but lossy — `double` cannot represent every `uint256`. For
  /// anything financial, prefer [toDecimalString] or work with [value] and
  /// [decimals] directly.
  double get asDouble {
    final scale = _pow10(decimals.abs()).toDouble();
    return decimals >= 0 ? value.toDouble() / scale : value.toDouble() * scale;
  }

  /// The value as an exact decimal string, without floating point.
  ///
  /// ```dart
  /// // value 626025, decimals 8
  /// reading.toDecimalString(); // "0.00626025"
  /// ```
  String toDecimalString() {
    if (decimals <= 0) {
      return (value * _pow10(-decimals)).toString();
    }
    final negative = value.isNegative;
    final digits = value.abs().toString().padLeft(decimals + 1, '0');
    final whole = digits.substring(0, digits.length - decimals);
    final fraction = digits.substring(digits.length - decimals);
    return '${negative ? '-' : ''}$whole.$fraction';
  }

  /// When this reading was published.
  DateTime get publishedAt =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

  static BigInt _pow10(int n) => BigInt.from(10).pow(n);

  @override
  String toString() =>
      '${feedId.name} = ${toDecimalString()} @ ${publishedAt.toIso8601String()}';
}

/// Reads FTSOv2 price feeds.
///
/// ```dart
/// final client = FlareClient(FlareChain.coston2);
/// final ftso = await FtsoV2.resolve(client);
/// final feeds = await ftso.getFeedsById([Feeds.flrUsd, Feeds.btcUsd]);
/// for (final f in feeds) print(f);
/// client.close();
/// ```
///
/// Reads cost nothing. The getters are declared `payable` in Solidity but are
/// callable through `eth_call` for free, which is why this class needs no
/// signer and no funded account.
class FtsoV2 {
  /// `getFeedsById(bytes21[]) returns (uint256[], int8[], uint64)`
  ///
  /// Selector `0x4c375745`, cross-checked against `cast sig`.
  static final AbiFunction getFeedsByIdFn = AbiFunction(
    name: 'getFeedsById',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [
      AbiParameter(name: '_values', type: AbiType.parse('uint256[]')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8[]')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// `getFeedById(bytes21) returns (uint256, int8, uint64)`
  static final AbiFunction getFeedByIdFn = AbiFunction(
    name: 'getFeedById',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [
      AbiParameter(name: '_value', type: AbiType.parse('uint256')),
      AbiParameter(name: '_decimals', type: AbiType.parse('int8')),
      AbiParameter(name: '_timestamp', type: AbiType.parse('uint64')),
    ],
    stateMutability: StateMutability.payable,
  );

  /// `getFeedIndex(bytes21) returns (uint256)`
  static final AbiFunction getFeedIndexFn = AbiFunction(
    name: 'getFeedIndex',
    inputs: [AbiParameter(name: '_feedId', type: AbiType.parse('bytes21'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// `getFeedId(uint256) returns (bytes21)`
  static final AbiFunction getFeedIdFn = AbiFunction(
    name: 'getFeedId',
    inputs: [AbiParameter(name: '_index', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes21'))],
    stateMutability: StateMutability.view,
  );

  /// `calculateFeeByIds(bytes21[]) returns (uint256)`
  static final AbiFunction calculateFeeByIdsFn = AbiFunction(
    name: 'calculateFeeByIds',
    inputs: [AbiParameter(name: '_feedIds', type: AbiType.parse('bytes21[]'))],
    outputs: [AbiParameter(name: '_fee', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// The client used for calls.
  final FlareClient client;

  /// The resolved FTSOv2 contract address on [client]'s network.
  final EthAddress address;

  const FtsoV2({required this.client, required this.address});

  /// Resolves FTSOv2 through the Flare Contract Registry.
  ///
  /// Always prefer this over hardcoding an address. Flare redeploys the
  /// contract, and the address in Flare's own published Python example is
  /// already stale on Coston2.
  static Future<FtsoV2> resolve(
    FlareClient client, {
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client))
        .addressOf(FlareContract.ftsoV2);
    return FtsoV2(client: client, address: resolved);
  }

  /// Reads several feeds in one call, which is both cheaper and atomic — every
  /// returned reading shares one timestamp.
  ///
  /// Prefer this over repeated [getFeedById] calls: one round trip, and the
  /// values are guaranteed to come from the same publication.
  Future<List<FtsoFeedValue>> getFeedsById(List<FeedId> feedIds) async {
    if (feedIds.isEmpty) return const [];

    final out = await client.callFunction(
      contract: address,
      function: getFeedsByIdFn,
      args: [feedIds.map((f) => f.bytes).toList()],
    );

    final values = (out[0]! as List).cast<BigInt>();
    final decimals = (out[1]! as List).cast<BigInt>();
    final timestamp = (out[2]! as BigInt).toInt();

    if (values.length != feedIds.length || decimals.length != feedIds.length) {
      throw FlareContractException(
        'FTSOv2 returned ${values.length} value(s) and ${decimals.length} '
        'decimal(s) for ${feedIds.length} requested feed(s)',
        address: address.checksummed,
        function: getFeedsByIdFn.canonicalSignature,
      );
    }

    return [
      for (var i = 0; i < feedIds.length; i++)
        FtsoFeedValue(
          feedId: feedIds[i],
          value: values[i],
          // int8 fits an int; the ABI layer decodes every integer to BigInt so
          // that narrowing is explicit and visible at exactly one place.
          decimals: decimals[i].toInt(),
          timestamp: timestamp,
        ),
    ];
  }

  /// Reads a single feed.
  Future<FtsoFeedValue> getFeedById(FeedId feedId) async {
    final out = await client.callFunction(
      contract: address,
      function: getFeedByIdFn,
      args: [feedId.bytes],
    );
    return FtsoFeedValue(
      feedId: feedId,
      value: out[0]! as BigInt,
      decimals: (out[1]! as BigInt).toInt(),
      timestamp: (out[2]! as BigInt).toInt(),
    );
  }

  /// The on-chain index of [feedId], used by the block-latency read path.
  Future<BigInt> getFeedIndex(FeedId feedId) async =>
      (await client.callFunctionSingle(
        contract: address,
        function: getFeedIndexFn,
        args: [feedId.bytes],
      ))! as BigInt;

  /// The feed ID registered at [index].
  Future<FeedId> getFeedId(BigInt index) async {
    final raw = await client.callFunctionSingle(
      contract: address,
      function: getFeedIdFn,
      args: [index],
    );
    return FeedId.fromBytes(raw! as Uint8List);
  }

  /// The fee, in wei, that reading [feedIds] would cost.
  ///
  /// Observed to be zero for standard feeds, which is why [getFeedsById] works
  /// through `eth_call` with no value attached. Call this rather than assuming:
  /// it is the supported way to discover that a feed is not free.
  Future<BigInt> calculateFeeByIds(List<FeedId> feedIds) async =>
      (await client.callFunctionSingle(
        contract: address,
        function: calculateFeeByIdsFn,
        args: [feedIds.map((f) => f.bytes).toList()],
      ))! as BigInt;

  /// Polls [feedIds] every [interval] and emits each reading.
  ///
  /// Consecutive readings carrying the same on-chain timestamp are suppressed,
  /// so the stream emits only genuinely new data. Flare publishes roughly every
  /// 1.8 seconds, so polling faster than that mostly produces duplicates.
  ///
  /// The stream is single-subscription and stops polling when the listener
  /// cancels. On a mobile client, cancel it when the app is backgrounded:
  /// a background poll is both a battery cost and a rate-limit risk.
  Stream<List<FtsoFeedValue>> watchFeeds(
    List<FeedId> feedIds, {
    Duration interval = const Duration(seconds: 2),
  }) async* {
    int? lastTimestamp;
    while (true) {
      final readings = await getFeedsById(feedIds);
      final ts = readings.isEmpty ? null : readings.first.timestamp;
      if (ts != lastTimestamp) {
        lastTimestamp = ts;
        yield readings;
      }
      await Future<void>.delayed(interval);
    }
  }
}
