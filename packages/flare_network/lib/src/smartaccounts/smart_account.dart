import 'package:meta/meta.dart';

import '../abi/eth_address.dart';

/// A Flare account controlled by an XRP Ledger address.
///
/// Smart Accounts let someone who holds only XRP act on Flare — minting FXRP,
/// holding vault positions — without ever holding FLR for gas or managing a
/// Flare key.
@immutable
final class SmartAccount {
  /// The XRPL address that controls this account, in base58 `r…` form.
  final String xrplOwner;

  /// The account's address on Flare.
  final EthAddress address;

  /// Whether the account has actually been created on chain.
  ///
  /// **This is the field that matters.** [address] is derived arithmetically
  /// from [xrplOwner] and is always non-zero — the controller returns an
  /// address for an XRPL address that has never been seen, and even for the
  /// empty string. A non-zero address therefore proves nothing on its own.
  /// Measured on Coston2: three nonsense inputs each produced a distinct,
  /// plausible-looking address with no code at any of them.
  final bool isDeployed;

  const SmartAccount({
    required this.xrplOwner,
    required this.address,
    required this.isDeployed,
  });

  @override
  String toString() =>
      'SmartAccount($xrplOwner -> ${address.hex}, '
      '${isDeployed ? 'deployed' : 'not yet created'})';

  @override
  bool operator ==(Object other) =>
      other is SmartAccount &&
      other.xrplOwner == xrplOwner &&
      other.address == address &&
      other.isDeployed == isDeployed;

  @override
  int get hashCode => Object.hash(xrplOwner, address, isDeployed);
}

/// An ERC-20 holding: which token, and how much of it.
@immutable
final class TokenBalance {
  /// The token contract.
  final EthAddress token;

  /// Balance in the token's own smallest unit. Read `decimals()` to scale it.
  final BigInt balance;

  const TokenBalance({required this.token, required this.balance});

  /// Whether the account holds any of this token.
  bool get isEmpty => balance == BigInt.zero;

  @override
  String toString() => 'TokenBalance(${token.hex}: $balance)';
}

/// A position in one of the Smart Accounts vaults.
@immutable
final class VaultPosition {
  /// Identifier the controller uses for this vault.
  final BigInt vaultId;

  /// The vault contract.
  final EthAddress vaultAddress;

  /// Vault kind, as the controller's own `uint8` enum.
  ///
  /// Left as a raw number deliberately: the set is defined by the deployed
  /// contract and the ABI does not name the variants, so mapping it to a Dart
  /// enum would be guesswork that silently breaks when a kind is added.
  /// `UnsupportedVaultType(uint8)` is a declared error, so unknown values are
  /// expected rather than exceptional.
  final int vaultType;

  /// Vault shares held.
  final BigInt shares;

  /// Underlying assets those shares represent.
  final BigInt assets;

  const VaultPosition({
    required this.vaultId,
    required this.vaultAddress,
    required this.vaultType,
    required this.shares,
    required this.assets,
  });

  @override
  String toString() =>
      'VaultPosition(#$vaultId type $vaultType, '
      'shares $shares, assets $assets)';
}

/// Everything a smart account holds, in one read.
@immutable
final class SmartAccountBalances {
  /// Native FLR balance, in wei.
  final BigInt native;

  /// Wrapped native (WNat) holding.
  final TokenBalance wNat;

  /// FXRP holding.
  final TokenBalance fXrp;

  /// Every vault the controller knows about, with this account's position in
  /// each.
  ///
  /// **A catalogue, not a portfolio.** The controller returns every vault
  /// regardless of the account, with `shares` and `assets` zeroed where nothing
  /// is held — an address that has never existed still comes back with all four
  /// Coston2 vaults listed. Use [heldVaults] for the positions that are
  /// actually held, and this for rendering the full set of options.
  final List<VaultPosition> vaults;

  const SmartAccountBalances({
    required this.native,
    required this.wNat,
    required this.fXrp,
    required this.vaults,
  });

  /// Only the vaults this account has a non-zero position in.
  List<VaultPosition> get heldVaults =>
      vaults.where((v) => v.shares != BigInt.zero).toList();

  /// Whether this account holds nothing at all.
  ///
  /// Judged on balances, not on whether [vaults] is populated — it always is.
  /// True for an account that has not been created, since the controller
  /// answers for a derived address whether or not it exists.
  bool get isEmpty =>
      native == BigInt.zero &&
      wNat.isEmpty &&
      fXrp.isEmpty &&
      heldVaults.isEmpty;

  @override
  String toString() =>
      'SmartAccountBalances(native $native, wNat ${wNat.balance}, '
      'fXrp ${fXrp.balance}, ${heldVaults.length} of ${vaults.length} '
      'vault(s) held)';
}
