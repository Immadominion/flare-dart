import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/abi_event.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';

/// A raw event log as returned by `eth_getLogs`.
@immutable
final class FlareLog {
  /// The contract that emitted it.
  final EthAddress address;

  /// Topics. For a non-anonymous event `topics[0]` is the signature hash and
  /// the rest are indexed parameters, in declaration order.
  final List<Uint8List> topics;

  /// ABI-encoded non-indexed parameters.
  final Uint8List data;

  /// Block containing the emitting transaction.
  final BigInt blockNumber;

  /// Hash of that block.
  final Uint8List blockHash;

  /// Hash of the emitting transaction.
  final Uint8List transactionHash;

  /// Index of the transaction within its block.
  final int transactionIndex;

  /// Index of this log within the block.
  final int logIndex;

  /// True when the log was removed by a chain reorganisation.
  ///
  /// Worth checking before acting on a log: a reorg can retract one that was
  /// already delivered.
  final bool removed;

  const FlareLog({
    required this.address,
    required this.topics,
    required this.data,
    required this.blockNumber,
    required this.blockHash,
    required this.transactionHash,
    required this.transactionIndex,
    required this.logIndex,
    required this.removed,
  });

  /// Parses one entry of an `eth_getLogs` response.
  factory FlareLog.fromJson(Map<String, Object?> json) => FlareLog(
    address: EthAddress.parse(
      json['address']! as String,
      // Nodes return lowercase addresses, which carry no checksum.
      validateChecksum: false,
    ),
    topics:
        ((json['topics'] as List<Object?>?) ?? const [])
            .cast<String>()
            .map(hexToBytes)
            .toList(),
    data: hexToBytes((json['data'] as String?) ?? '0x'),
    blockNumber: hexToBigInt((json['blockNumber'] as String?) ?? '0x0'),
    blockHash: hexToBytes((json['blockHash'] as String?) ?? '0x'),
    transactionHash: hexToBytes((json['transactionHash'] as String?) ?? '0x'),
    transactionIndex:
        hexToBigInt((json['transactionIndex'] as String?) ?? '0x0').toInt(),
    logIndex: hexToBigInt((json['logIndex'] as String?) ?? '0x0').toInt(),
    removed: json['removed'] == true,
  );

  /// The signature hash, or null for a log with no topics.
  Uint8List? get topic0 => topics.isEmpty ? null : topics.first;

  /// The signature hash as hex, for dispatch.
  String? get topic0Hex {
    final t = topic0;
    return t == null ? null : bytesToHex(t);
  }

  @override
  String toString() =>
      'FlareLog(${address.checksummed} block $blockNumber #$logIndex, '
      '${topics.length} topic(s), ${data.length} data byte(s))';
}

/// A log paired with the event it decodes to.
@immutable
final class DecodedLog {
  /// The raw log.
  final FlareLog log;

  /// The matching event definition.
  final AbiEvent event;

  /// Decoded values, in parameter declaration order.
  final List<Object?> values;

  const DecodedLog({
    required this.log,
    required this.event,
    required this.values,
  });

  /// Values keyed by parameter name; unnamed parameters use their index.
  Map<String, Object?> get named => {
    for (var i = 0; i < event.parameters.length; i++)
      (event.parameters[i].name.isEmpty ? '$i' : event.parameters[i].name):
          values[i],
  };

  /// Looks up a parameter by name.
  Object? operator [](String parameterName) => named[parameterName];

  /// The event name, e.g. `Transfer`.
  String get name => event.name;

  @override
  String toString() {
    final args = [
      for (var i = 0; i < event.parameters.length; i++)
        '${event.parameters[i].name.isEmpty ? i : event.parameters[i].name}: '
            '${values[i]}',
    ];
    return '${event.name}(${args.join(', ')}) @ block ${log.blockNumber}';
  }
}

/// A point in the chain that a log query can start or end at.
@immutable
final class BlockRef {
  final String _value;

  const BlockRef._(this._value);

  /// The most recent block.
  static const latest = BlockRef._('latest');

  /// The genesis block.
  static const earliest = BlockRef._('earliest');

  /// Blocks not yet mined.
  static const pending = BlockRef._('pending');

  /// The most recent finalised block.
  static const finalized = BlockRef._('finalized');

  /// A specific height.
  factory BlockRef.number(BigInt n) => BlockRef._(bigIntToHex(n));

  /// A specific height, as an `int`.
  factory BlockRef.height(int n) => BlockRef.number(BigInt.from(n));

  /// Whether this is a concrete height rather than a tag.
  bool get isNumber => _value.startsWith('0x');

  /// The height, if this is a concrete one.
  BigInt? get asNumber => isNumber ? hexToBigInt(_value) : null;

  /// The JSON-RPC representation.
  String toJson() => _value;

  @override
  String toString() => _value;

  @override
  bool operator ==(Object other) => other is BlockRef && other._value == _value;

  @override
  int get hashCode => _value.hashCode;
}

/// Criteria for an `eth_getLogs` query.
///
/// ```dart
/// // Every FXRP transfer out of one address, over the last 500 blocks.
/// final filter = LogFilter(
///   addresses: [fxrpToken],
///   topics: transferEvent.encodeTopicFilter([sender, null]),
///   fromBlock: BlockRef.height(latest - 500),
/// );
/// ```
@immutable
final class LogFilter {
  /// Restrict to these contracts. Empty means any.
  final List<EthAddress> addresses;

  /// Positional topic constraints. An entry may be a hex string, a list of
  /// alternatives, or null to leave that position free.
  ///
  /// Build this with [AbiEvent.encodeTopicFilter] rather than by hand.
  final List<Object?> topics;

  /// First block to search, inclusive.
  final BlockRef fromBlock;

  /// Last block to search, inclusive.
  final BlockRef toBlock;

  const LogFilter({
    this.addresses = const [],
    this.topics = const [],
    this.fromBlock = BlockRef.latest,
    this.toBlock = BlockRef.latest,
  });

  /// The JSON-RPC parameter object.
  Map<String, Object?> toJson() => {
    if (addresses.length == 1)
      'address': addresses.single.hex
    else if (addresses.length > 1)
      'address': addresses.map((a) => a.hex).toList(),
    if (topics.isNotEmpty) 'topics': topics,
    'fromBlock': fromBlock.toJson(),
    'toBlock': toBlock.toJson(),
  };

  /// Returns a copy covering a specific block window.
  LogFilter forRange(BigInt from, BigInt to) => LogFilter(
    addresses: addresses,
    topics: topics,
    fromBlock: BlockRef.number(from),
    toBlock: BlockRef.number(to),
  );

  @override
  String toString() =>
      'LogFilter(${addresses.length} address(es), '
      '${topics.length} topic constraint(s), $fromBlock..$toBlock)';
}
