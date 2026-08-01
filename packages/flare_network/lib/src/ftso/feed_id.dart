import 'dart:convert';
import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/hex.dart';
import '../rpc/flare_exception.dart';

/// The leading byte of a feed ID, identifying what kind of value it carries.
///
/// Only [crypto] is verified against live feeds in this SDK's tests. The other
/// values are declared so that arbitrary categories can be expressed, but their
/// numbering is **[Unverified]** — confirm against
/// <https://dev.flare.network/ftso/feeds> before relying on them. Use
/// [FeedCategory.custom] for any byte not listed here.
enum FeedCategory {
  /// Cryptocurrency pairs such as `FLR/USD`. Verified against live Coston2 and
  /// mainnet feeds.
  crypto(0x01),

  /// Foreign exchange pairs. [Unverified].
  forex(0x02),

  /// Commodities. [Unverified].
  commodity(0x03),

  /// Equities. [Unverified].
  equity(0x04);

  const FeedCategory(this.byte);

  /// The category byte as it appears at the start of the feed ID.
  final int byte;

  /// Two-character lowercase hex for this category, e.g. `01`.
  String get hex => byte.toRadixString(16).padLeft(2, '0');

  /// Looks up a category by byte, or null if it is not one of the named ones.
  static FeedCategory? fromByte(int byte) {
    for (final c in values) {
      if (c.byte == byte) return c;
    }
    return null;
  }
}

/// A 21-byte FTSO feed identifier.
///
/// The layout is one category byte followed by the UTF-8 bytes of the feed
/// name, right-padded with zeros to 21 bytes:
///
/// ```
/// 0x01  464c522f555344  0000000000000000000000000000
/// ^     ^               ^
/// |     |               padding to 21 bytes
/// |     "FLR/USD" as UTF-8
/// category 0x01 (crypto)
/// ```
///
/// ```dart
/// final flr = FeedId.crypto('FLR/USD');
/// print(flr.hex); // 0x01464c522f55534400000000000000000000000000
/// ```
///
/// This mirrors Flare's reference implementation exactly; the encoding is
/// verified byte-for-byte against `get_feed_id.py` in `developer-hub`.
@immutable
final class FeedId {
  /// Number of bytes in a feed ID.
  static const length = 21;

  /// The raw 21 bytes.
  final Uint8List bytes;

  const FeedId._(this.bytes);

  /// Builds a feed ID from a [category] and a feed [name] such as `FLR/USD`.
  ///
  /// Throws [FlareAbiException] if the name does not fit in the 20 bytes that
  /// remain after the category byte.
  factory FeedId(FeedCategory category, String name) =>
      FeedId.fromCategoryByte(category.byte, name);

  /// Builds a crypto-category (`0x01`) feed ID — by far the common case.
  factory FeedId.crypto(String name) => FeedId(FeedCategory.crypto, name);

  /// Builds a feed ID from an arbitrary category [byte].
  ///
  /// Use this for categories not covered by [FeedCategory].
  factory FeedId.fromCategoryByte(int byte, String name) {
    if (byte < 0 || byte > 0xff) {
      throw FlareAbiException(
        'Feed category must be a single byte, got $byte',
        solidityType: 'bytes21',
      );
    }
    final nameBytes = utf8.encode(name);
    if (nameBytes.length > length - 1) {
      throw FlareAbiException(
        'Feed name "$name" encodes to ${nameBytes.length} bytes; only '
        '${length - 1} fit after the category byte',
        solidityType: 'bytes21',
      );
    }
    final out = Uint8List(length)
      ..[0] = byte
      ..setRange(1, 1 + nameBytes.length, nameBytes);
    return FeedId._(out);
  }

  /// Parses a 21-byte hex feed ID, with or without a `0x` prefix.
  factory FeedId.parse(String hex) {
    final bytes = hexToBytes(hex);
    if (bytes.length != length) {
      throw FlareAbiException(
        'A feed ID must be $length bytes, got ${bytes.length}',
        solidityType: 'bytes21',
      );
    }
    return FeedId._(bytes);
  }

  /// Wraps exactly 21 raw bytes.
  factory FeedId.fromBytes(Uint8List bytes) {
    if (bytes.length != length) {
      throw FlareAbiException(
        'A feed ID must be $length bytes, got ${bytes.length}',
        solidityType: 'bytes21',
      );
    }
    return FeedId._(Uint8List.fromList(bytes));
  }

  /// The category byte.
  int get categoryByte => bytes[0];

  /// The category, or null if the byte is not one of the named ones.
  FeedCategory? get category => FeedCategory.fromByte(categoryByte);

  /// The feed name, with the category byte and zero padding removed.
  String get name {
    var end = bytes.length;
    while (end > 1 && bytes[end - 1] == 0) {
      end--;
    }
    return utf8.decode(Uint8List.sublistView(bytes, 1, end));
  }

  /// The full ID as `0x`-prefixed hex.
  String get hex => bytesToHex(bytes);

  @override
  String toString() => '$name (${bytesToHex(bytes)})';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FeedId) return false;
    for (var i = 0; i < length; i++) {
      if (bytes[i] != other.bytes[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode => Object.hashAll(bytes);
}

/// Common crypto feeds, provided for discoverability.
///
/// The authoritative list is on-chain and changes over time, so treat these as
/// convenient shorthands rather than an exhaustive catalogue. Build any other
/// feed with `FeedId.crypto('SYMBOL/USD')`.
abstract final class Feeds {
  static final flrUsd = FeedId.crypto('FLR/USD');
  static final sgbUsd = FeedId.crypto('SGB/USD');
  static final btcUsd = FeedId.crypto('BTC/USD');
  static final ethUsd = FeedId.crypto('ETH/USD');
  static final xrpUsd = FeedId.crypto('XRP/USD');
  static final dogeUsd = FeedId.crypto('DOGE/USD');
  static final adaUsd = FeedId.crypto('ADA/USD');
  static final solUsd = FeedId.crypto('SOL/USD');
  static final usdcUsd = FeedId.crypto('USDC/USD');
  static final usdtUsd = FeedId.crypto('USDT/USD');
}
