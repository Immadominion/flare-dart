import 'package:flare_network/flare_network.dart';

/// Formats a wei amount as a decimal string.
///
/// Integer arithmetic throughout. Wei routinely exceeds what a `double` holds
/// exactly — 2^53 wei is only about 0.009 FLR — so converting to a double first
/// silently rounds the number a user is about to approve.
String formatUnits(
  BigInt amount, {
  int decimals = 18,
  int maxFractionDigits = 6,
}) {
  final unit = BigInt.from(10).pow(decimals);
  final whole = amount ~/ unit;
  var fraction = (amount % unit).toString().padLeft(decimals, '0');

  if (fraction.length > maxFractionDigits) {
    fraction = fraction.substring(0, maxFractionDigits);
  }
  fraction = fraction.replaceFirst(RegExp(r'0+$'), '');
  return fraction.isEmpty ? '$whole' : '$whole.$fraction';
}

/// Formats wei as gwei, the unit fees are usually quoted in.
String formatGwei(BigInt wei) =>
    formatUnits(wei, decimals: 9, maxFractionDigits: 2);

/// Abbreviates an address for display, keeping the checksum casing.
///
/// Both ends are shown: an address that matches only at the front is the
/// oldest trick there is.
String shortAddress(EthAddress address) {
  final hex = address.checksummed;
  return '${hex.substring(0, 8)}…${hex.substring(hex.length - 6)}';
}

/// Abbreviates a transaction hash for display.
String shortHash(String hex) => hex.length <= 18
    ? hex
    : '${hex.substring(0, 10)}…${hex.substring(hex.length - 6)}';
