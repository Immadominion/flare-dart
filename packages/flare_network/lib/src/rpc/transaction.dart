import 'dart:typed_data';

import 'package:meta/meta.dart';

import '../abi/eth_address.dart';
import '../abi/hex.dart';
import 'logs.dart';

/// The outcome of a transaction, from `eth_getTransactionReceipt`.
///
/// This is what closes the loop after an external wallet signs and broadcasts:
/// the SDK cannot sign, but it can tell you whether what the wallet sent
/// actually succeeded, what it cost, and which events it emitted.
@immutable
final class TransactionReceipt {
  /// Hash of the transaction.
  final Uint8List transactionHash;

  /// Index of the transaction within its block.
  final int transactionIndex;

  /// Block that included it.
  final BigInt blockNumber;

  /// Hash of that block.
  final Uint8List blockHash;

  /// Sender.
  final EthAddress from;

  /// Recipient, or null when the transaction deployed a contract.
  final EthAddress? to;

  /// Address of the deployed contract, when this was a deployment.
  final EthAddress? contractAddress;

  /// Gas actually consumed by this transaction.
  final BigInt gasUsed;

  /// Cumulative gas used in the block up to and including this transaction.
  final BigInt cumulativeGasUsed;

  /// Price actually paid per unit of gas, in wei.
  final BigInt effectiveGasPrice;

  /// Whether the transaction succeeded.
  ///
  /// **A mined transaction is not a successful one.** A reverted transaction is
  /// still included in a block and still costs gas; only this flag distinguishes
  /// them. Treating "the receipt arrived" as success is a common and expensive
  /// mistake.
  final bool succeeded;

  /// Events emitted by the transaction.
  final List<FlareLog> logs;

  /// EIP-2718 transaction type: 0 legacy, 2 EIP-1559.
  final int type;

  const TransactionReceipt({
    required this.transactionHash,
    required this.transactionIndex,
    required this.blockNumber,
    required this.blockHash,
    required this.from,
    required this.to,
    required this.contractAddress,
    required this.gasUsed,
    required this.cumulativeGasUsed,
    required this.effectiveGasPrice,
    required this.succeeded,
    required this.logs,
    required this.type,
  });

  factory TransactionReceipt.fromJson(Map<String, Object?> json) {
    EthAddress? address(String key) {
      final v = json[key];
      return v is String && v.isNotEmpty
          ? EthAddress.parse(v, validateChecksum: false)
          : null;
    }

    BigInt quantity(String key) => hexToBigInt((json[key] as String?) ?? '0x0');

    return TransactionReceipt(
      transactionHash: hexToBytes((json['transactionHash'] as String?) ?? '0x'),
      transactionIndex: quantity('transactionIndex').toInt(),
      blockNumber: quantity('blockNumber'),
      blockHash: hexToBytes((json['blockHash'] as String?) ?? '0x'),
      from: address('from') ?? EthAddress.zero,
      to: address('to'),
      contractAddress: address('contractAddress'),
      gasUsed: quantity('gasUsed'),
      cumulativeGasUsed: quantity('cumulativeGasUsed'),
      effectiveGasPrice: quantity('effectiveGasPrice'),
      // `status` is 0x1 for success and 0x0 for a revert.
      succeeded: quantity('status') == BigInt.one,
      logs:
          ((json['logs'] as List<Object?>?) ?? const [])
              .whereType<Map<Object?, Object?>>()
              .map((l) => FlareLog.fromJson(l.cast<String, Object?>()))
              .toList(),
      type: quantity('type').toInt(),
    );
  }

  /// Total fee paid, in wei: [gasUsed] × [effectiveGasPrice].
  BigInt get feePaid => gasUsed * effectiveGasPrice;

  /// Whether this transaction deployed a contract.
  bool get isDeployment => contractAddress != null;

  @override
  String toString() =>
      'TransactionReceipt(${bytesToHex(transactionHash)} '
      '${succeeded ? 'succeeded' : 'REVERTED'}, gas $gasUsed, '
      'block $blockNumber, ${logs.length} log(s))';
}

/// A transaction as returned by `eth_getTransactionByHash`.
@immutable
final class TransactionInfo {
  final Uint8List hash;
  final EthAddress from;
  final EthAddress? to;

  /// Value transferred, in wei.
  final BigInt value;

  /// Calldata.
  final Uint8List input;

  /// Sender nonce.
  final BigInt nonce;

  /// Gas limit the sender set.
  final BigInt gas;

  /// Legacy gas price, in wei. Zero on a type-2 transaction.
  final BigInt gasPrice;

  /// EIP-1559 fee cap, when present.
  final BigInt? maxFeePerGas;

  /// EIP-1559 priority fee, when present.
  final BigInt? maxPriorityFeePerGas;

  /// Including block, or null while the transaction is still pending.
  final BigInt? blockNumber;

  /// EIP-2718 type.
  final int type;

  const TransactionInfo({
    required this.hash,
    required this.from,
    required this.to,
    required this.value,
    required this.input,
    required this.nonce,
    required this.gas,
    required this.gasPrice,
    required this.maxFeePerGas,
    required this.maxPriorityFeePerGas,
    required this.blockNumber,
    required this.type,
  });

  factory TransactionInfo.fromJson(Map<String, Object?> json) {
    BigInt quantity(String key) => hexToBigInt((json[key] as String?) ?? '0x0');
    BigInt? optional(String key) {
      final v = json[key];
      return v is String ? hexToBigInt(v) : null;
    }

    return TransactionInfo(
      hash: hexToBytes((json['hash'] as String?) ?? '0x'),
      from: EthAddress.parse(
        (json['from'] as String?) ?? '0x${'0' * 40}',
        validateChecksum: false,
      ),
      to:
          json['to'] is String
              ? EthAddress.parse(json['to']! as String, validateChecksum: false)
              : null,
      value: quantity('value'),
      input: hexToBytes((json['input'] as String?) ?? '0x'),
      nonce: quantity('nonce'),
      gas: quantity('gas'),
      gasPrice: quantity('gasPrice'),
      maxFeePerGas: optional('maxFeePerGas'),
      maxPriorityFeePerGas: optional('maxPriorityFeePerGas'),
      blockNumber: optional('blockNumber'),
      type: quantity('type').toInt(),
    );
  }

  /// Whether the transaction is still awaiting inclusion.
  bool get isPending => blockNumber == null;

  @override
  String toString() =>
      'TransactionInfo(${bytesToHex(hash)}'
      '${isPending ? ', pending' : ', block $blockNumber'})';
}

/// A block header, without full transaction bodies.
@immutable
final class BlockInfo {
  final BigInt number;
  final Uint8List hash;
  final Uint8List parentHash;

  /// Block timestamp, as seconds since the Unix epoch.
  final BigInt timestamp;

  /// Gas consumed by every transaction in the block.
  final BigInt gasUsed;

  /// Gas ceiling for the block.
  final BigInt gasLimit;

  /// EIP-1559 base fee, in wei.
  final BigInt? baseFeePerGas;

  /// Transaction hashes in the block.
  final List<Uint8List> transactionHashes;

  const BlockInfo({
    required this.number,
    required this.hash,
    required this.parentHash,
    required this.timestamp,
    required this.gasUsed,
    required this.gasLimit,
    required this.baseFeePerGas,
    required this.transactionHashes,
  });

  factory BlockInfo.fromJson(Map<String, Object?> json) {
    BigInt quantity(String key) => hexToBigInt((json[key] as String?) ?? '0x0');

    return BlockInfo(
      number: quantity('number'),
      hash: hexToBytes((json['hash'] as String?) ?? '0x'),
      parentHash: hexToBytes((json['parentHash'] as String?) ?? '0x'),
      timestamp: quantity('timestamp'),
      gasUsed: quantity('gasUsed'),
      gasLimit: quantity('gasLimit'),
      baseFeePerGas:
          json['baseFeePerGas'] is String
              ? hexToBigInt(json['baseFeePerGas']! as String)
              : null,
      // With `false` for the verbosity flag the node returns hashes; with
      // `true` it returns whole objects. This client asks for hashes.
      transactionHashes:
          ((json['transactions'] as List<Object?>?) ?? const [])
              .whereType<String>()
              .map(hexToBytes)
              .toList(),
    );
  }

  /// The block timestamp as a UTC [DateTime].
  DateTime get minedAt => DateTime.fromMillisecondsSinceEpoch(
    timestamp.toInt() * 1000,
    isUtc: true,
  );

  @override
  String toString() =>
      'BlockInfo(#$number, ${transactionHashes.length} tx, '
      '${minedAt.toIso8601String()})';
}

/// A call to simulate or price, used by `eth_estimateGas` and `eth_call`.
@immutable
final class CallRequest {
  final EthAddress? from;
  final EthAddress? to;

  /// Calldata.
  final Uint8List? data;

  /// Value to attach, in wei.
  final BigInt? value;

  /// Gas ceiling for the simulation.
  final BigInt? gas;

  const CallRequest({this.from, this.to, this.data, this.value, this.gas});

  Map<String, Object?> toJson() => {
    if (from != null) 'from': from!.hex,
    if (to != null) 'to': to!.hex,
    if (data != null) 'data': bytesToHex(data!),
    if (value != null) 'value': bigIntToHex(value!),
    if (gas != null) 'gas': bigIntToHex(gas!),
  };
}
