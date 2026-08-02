import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../rpc/flare_exception.dart';
import 'abi_function.dart';
import 'abi_type.dart';
import 'hex.dart';
import 'keccak.dart';

/// A value that was `indexed` in an event but whose type is dynamic.
///
/// The EVM cannot fit a `string`, `bytes`, array or struct into a 32-byte
/// topic, so it stores **keccak256 of the value** instead. The original is not
/// in the log at all and cannot be recovered from it.
///
/// This type exists so that cannot be mistaken for the value. Returning the raw
/// 32 bytes as if it were a `string` would hand callers a plausible-looking
/// value that is actually a hash — silent, and very hard to spot in a UI.
///
/// To match against a known value, hash it the same way with [matches].
///
/// Flare's own ABI has no dynamic indexed parameters (measured across all 592
/// events on Coston2), so this is defensive — it matters for third-party
/// contracts.
@immutable
final class IndexedHash {
  /// The 32-byte keccak256 of the original value.
  final Uint8List hash;

  /// The Solidity type that was indexed, e.g. `string`.
  final String solidityType;

  const IndexedHash({required this.hash, required this.solidityType});

  /// Whether [value] hashes to this topic.
  ///
  /// ```dart
  /// if (log.name.matches('Deposit')) { … }
  /// ```
  bool matches(Object? value) {
    final encoded = AbiType.parse(solidityType).encode(value);
    // Dynamic types are hashed over their packed contents, without the length
    // prefix that the tail encoding adds.
    return _sameBytes(hash, keccak256(_packed(solidityType, value, encoded)));
  }

  static Uint8List _packed(String type, Object? value, Uint8List encoded) {
    if (type == 'string' || type == 'bytes') {
      // encode() emits length word + padded payload; the topic hashes only the
      // payload, unpadded.
      final length = int.parse(
        bytesToHex(Uint8List.sublistView(encoded, 0, 32), include0x: false),
        radix: 16,
      );
      return Uint8List.sublistView(encoded, 32, 32 + length);
    }
    return encoded;
  }

  static bool _sameBytes(Uint8List a, Uint8List b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// The hash as `0x`-prefixed hex.
  String get hex => bytesToHex(hash);

  @override
  String toString() => 'IndexedHash($solidityType, $hex)';

  @override
  bool operator ==(Object other) =>
      other is IndexedHash &&
      other.solidityType == solidityType &&
      _sameBytes(other.hash, hash);

  @override
  int get hashCode => Object.hash(solidityType, Object.hashAll(hash));
}

/// One parameter of an event.
@immutable
final class AbiEventParameter {
  /// Parameter name. May be empty.
  final String name;

  /// The parameter's type.
  final AbiType type;

  /// Whether it is stored in a topic rather than in the data section.
  final bool indexed;

  const AbiEventParameter({
    required this.name,
    required this.type,
    required this.indexed,
  });

  factory AbiEventParameter.fromJson(Map<String, Object?> json) {
    final base = AbiParameter.fromJson(json);
    return AbiEventParameter(
      name: base.name,
      type: base.type,
      indexed: json['indexed'] == true,
    );
  }

  /// Whether this type is stored as a hash when indexed, rather than a value.
  bool get isHashedWhenIndexed =>
      type is AbiStringType ||
      type is AbiBytesType ||
      type is AbiArrayType ||
      type is AbiTupleType ||
      (type is AbiFixedArrayType);

  @override
  String toString() =>
      '${type.name}${indexed ? ' indexed' : ''}${name.isEmpty ? '' : ' $name'}';
}

/// An event declared in a contract ABI, able to recognise and decode logs.
///
/// ## How a log is laid out
///
/// For a normal (non-anonymous) event, `topics[0]` is the [topic0] signature
/// hash. Each `indexed` parameter then takes one further topic, in declaration
/// order; the EVM allows at most three, so an event cannot index more than
/// that. Every remaining parameter is ABI-encoded together into `data`.
///
/// ```
/// Transfer(address indexed from, address indexed to, uint256 value)
///
/// topics[0] = keccak("Transfer(address,address,uint256)")
/// topics[1] = from,  right-aligned in 32 bytes
/// topics[2] = to
/// data      = value
/// ```
@immutable
final class AbiEvent {
  /// Event name as declared, e.g. `Transfer`.
  final String name;

  /// Parameters in declaration order, indexed and not.
  final List<AbiEventParameter> parameters;

  /// Whether the event is `anonymous`, meaning it emits no signature topic.
  ///
  /// Anonymous events cannot be identified from their topics alone, so they can
  /// only be decoded when the caller already knows which event a log is.
  final bool anonymous;

  const AbiEvent({
    required this.name,
    required this.parameters,
    this.anonymous = false,
  });

  /// Builds an event from an ABI JSON entry with `"type": "event"`.
  factory AbiEvent.fromJson(Map<String, Object?> json) => AbiEvent(
    name: (json['name'] as String?) ?? '',
    anonymous: json['anonymous'] == true,
    parameters:
        ((json['inputs'] as List<Object?>?) ?? const [])
            .cast<Map<String, Object?>>()
            .map(AbiEventParameter.fromJson)
            .toList(),
  );

  /// Parameters carried in topics.
  List<AbiEventParameter> get indexedParameters =>
      parameters.where((p) => p.indexed).toList();

  /// Parameters carried in the data section.
  List<AbiEventParameter> get dataParameters =>
      parameters.where((p) => !p.indexed).toList();

  /// The canonical signature the topic hash is derived from, e.g.
  /// `Transfer(address,address,uint256)`.
  ///
  /// Note this includes **all** parameters, indexed or not, in declaration
  /// order — indexing does not change the signature.
  String get canonicalSignature =>
      '$name(${parameters.map((p) => p.type.name).join(',')})';

  /// The signature hash that identifies this event in `topics[0]`.
  ///
  /// Null for an [anonymous] event, which emits no signature topic.
  Uint8List? get topic0 => anonymous ? null : keccak256Utf8(canonicalSignature);

  /// [topic0] as `0x`-prefixed hex, for use in an `eth_getLogs` filter.
  String? get topic0Hex {
    final t = topic0;
    return t == null ? null : bytesToHex(t);
  }

  /// How many topics a log of this event carries: `topic0` plus one per
  /// indexed parameter.
  int get topicCount => (anonymous ? 0 : 1) + indexedParameters.length;

  /// Whether [topics] belong to this event.
  ///
  /// Checks the topic **count** as well as `topic0`, because a signature hash
  /// alone does not identify an event. Indexing is not part of the canonical
  /// signature, so two events that differ only in which parameters are indexed
  /// share a `topic0`.
  ///
  /// That is not hypothetical. ERC-20 and ERC-721 both declare
  /// `Transfer(address,address,uint256)` — identical signature, identical
  /// `topic0` — but ERC-721 also indexes `tokenId`, so its logs carry four
  /// topics against ERC-20's three. Matching on `topic0` alone accepts an NFT
  /// transfer as a token transfer and then fails to decode it, which is how
  /// this was found: a live query that had worked for weeks broke the day an
  /// ERC-721 transfer appeared in the scanned range.
  bool matches(List<Uint8List> topics) {
    if (anonymous) return false;
    if (topics.length != topicCount) return false;
    final expected = topic0!;
    for (var i = 0; i < 32; i++) {
      if (topics[0][i] != expected[i]) return false;
    }
    return true;
  }

  /// Decodes a log into one value per parameter, in declaration order.
  ///
  /// Indexed parameters come from [topics], the rest from [data]. A dynamic
  /// indexed parameter yields an [IndexedHash] rather than a value, because the
  /// value is genuinely not present in the log.
  ///
  /// Throws [FlareAbiException] if the topic count does not match the ABI, which
  /// usually means the log belongs to a different event.
  List<Object?> decode({
    required List<Uint8List> topics,
    required Uint8List data,
  }) {
    final indexed = indexedParameters;
    final expectedTopics = indexed.length + (anonymous ? 0 : 1);

    if (topics.length != expectedTopics) {
      throw FlareAbiException(
        '$name expects $expectedTopics topic(s) but the log has '
        '${topics.length}. This log probably belongs to a different event.',
        solidityType: canonicalSignature,
      );
    }
    for (final t in topics) {
      if (t.length != 32) {
        throw FlareAbiException(
          'Every topic must be 32 bytes; got ${t.length}',
          solidityType: canonicalSignature,
        );
      }
    }

    // Non-indexed parameters are one ABI tuple in the data section.
    final decodedData =
        dataParameters.isEmpty
            ? const <Object?>[]
            : AbiCodec.decodeParameters(
              dataParameters.map((p) => p.type).toList(),
              data,
            );

    final out = <Object?>[];
    var topicCursor = anonymous ? 0 : 1;
    var dataCursor = 0;

    for (final p in parameters) {
      if (p.indexed) {
        final topic = topics[topicCursor++];
        out.add(
          p.isHashedWhenIndexed
              // The EVM stored keccak(value) here, not the value.
              ? IndexedHash(
                hash: Uint8List.fromList(topic),
                solidityType: p.type.name,
              )
              : p.type.decode(topic, 0, 0),
        );
      } else {
        out.add(decodedData[dataCursor++]);
      }
    }
    return out;
  }

  /// Decodes a log into a name-keyed map.
  ///
  /// Unnamed parameters fall back to their positional index, e.g. `'2'`.
  Map<String, Object?> decodeToMap({
    required List<Uint8List> topics,
    required Uint8List data,
  }) {
    final values = decode(topics: topics, data: data);
    return {
      for (var i = 0; i < parameters.length; i++)
        (parameters[i].name.isEmpty ? '$i' : parameters[i].name): values[i],
    };
  }

  /// Builds the `topics` filter for `eth_getLogs`.
  ///
  /// [indexedValues] are matched positionally against the indexed parameters;
  /// pass null to leave a position unconstrained. A list at a position means
  /// "any of these".
  ///
  /// ```dart
  /// // Transfers *from* a specific address, to anyone.
  /// transfer.encodeTopicFilter([myAddress, null]);
  /// ```
  List<Object?> encodeTopicFilter([List<Object?> indexedValues = const []]) {
    final indexed = indexedParameters;
    if (indexedValues.length > indexed.length) {
      throw FlareAbiException(
        '$name has ${indexed.length} indexed parameter(s); got '
        '${indexedValues.length} filter value(s)',
        solidityType: canonicalSignature,
      );
    }

    final topics = <Object?>[if (!anonymous) topic0Hex];
    for (var i = 0; i < indexedValues.length; i++) {
      final v = indexedValues[i];
      if (v == null) {
        topics.add(null);
      } else if (v is List) {
        topics.add([for (final alt in v) _encodeTopic(indexed[i], alt)]);
      } else {
        topics.add(_encodeTopic(indexed[i], v));
      }
    }
    // Trailing nulls constrain nothing, so drop them for a tidier request.
    while (topics.isNotEmpty && topics.last == null) {
      topics.removeLast();
    }
    return topics;
  }

  static String _encodeTopic(AbiEventParameter p, Object? value) {
    if (p.isHashedWhenIndexed) {
      if (value is IndexedHash) return value.hex;
      throw FlareAbiException(
        'Filtering on the indexed ${p.type.name} "${p.name}" needs an '
        'IndexedHash: the chain stores keccak256 of the value, not the value.',
        solidityType: p.type.name,
      );
    }
    return bytesToHex(p.type.encode(value));
  }

  @override
  String toString() =>
      'event $name(${parameters.join(', ')})${anonymous ? ' anonymous' : ''}';
}

/// Extension on [ContractAbi] adding event lookup.
extension ContractAbiEvents on ContractAbi {
  /// Every event declared in this ABI, keyed by name.
  ///
  /// Populated by [ContractAbi.fromJson]; see [ContractAbi.eventsByName].
  AbiEvent event(String name) {
    final found = eventsByName[name];
    if (found == null || found.isEmpty) {
      throw FlareAbiException('No event named "$name" in this ABI');
    }
    if (found.length > 1) {
      throw FlareAbiException(
        '"$name" is overloaded (${found.length} variants): '
        '${found.map((e) => e.canonicalSignature).join(', ')}',
      );
    }
    return found.single;
  }

  /// Finds the event whose signature hash matches `topics[0]`, or null.
  AbiEvent? eventForTopics(List<Uint8List> topics) {
    if (topics.isEmpty) return null;
    for (final candidates in eventsByName.values) {
      for (final e in candidates) {
        if (e.matches(topics)) return e;
      }
    }
    return null;
  }

  /// Maps signature hash to event, for fast dispatch over many logs.
  Map<String, AbiEvent> get eventsByTopic0 => {
    for (final candidates in eventsByName.values)
      for (final e in candidates)
        if (!e.anonymous) e.topic0Hex!: e,
  };
}
