import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// The only thing this app needs a wallet to do.
///
/// Kept to one method deliberately. `flare_network` builds the payload and
/// reads the result; the wallet's entire job is to turn that payload into a
/// transaction hash. Depending on an interface rather than a wallet SDK keeps
/// the controller testable and means swapping in a real wallet touches one
/// file.
///
/// A real implementation over Reown/WalletConnect is roughly:
///
/// ```dart
/// class ReownWallet implements Wallet {
///   final ReownAppKitModal modal;
///
///   @override
///   Future<Uint8List> sendTransaction(
///     Map<String, Object?> payload, {
///     required String chainId,
///   }) async {
///     final result = await modal.request(
///       topic: modal.session!.topic,
///       chainId: chainId,               // CAIP-2, e.g. 'eip155:114'
///       request: SessionRequestParams(
///         method: 'eth_sendTransaction',
///         params: [payload],            // exactly TransactionRequest.toWalletJson()
///       ),
///     );
///     return hexToBytes(result as String);
///   }
/// }
/// ```
///
/// Note the chain travels as a **separate CAIP-2 argument**, not inside the
/// payload — which is why [TransactionRequest.toWalletJson] omits `chainId` by
/// default.
abstract interface class Wallet {
  /// Shown in the UI so it is always clear what is being signed with.
  String get label;

  /// Whether this wallet can actually produce a signature.
  ///
  /// False for the built-in demonstration wallet, which must never be
  /// presented as if it had signed something.
  bool get canSign;

  /// Submits [payload] and returns the resulting transaction hash.
  ///
  /// Throws [WalletDeclined] if the user refuses.
  Future<Uint8List> sendTransaction(
    Map<String, Object?> payload, {
    required String chainId,
  });
}

/// The user dismissed the wallet without approving.
///
/// A normal outcome, not a failure — the UI colours it neutrally.
class WalletDeclined implements Exception {
  const WalletDeclined();

  @override
  String toString() => 'WalletDeclined';
}

/// How the demonstration wallet should behave.
enum DemoOutcome {
  /// Returns a real Coston2 transaction that succeeded.
  succeeds,

  /// Returns a real Coston2 transaction that was mined and **reverted**.
  ///
  /// The case dApps get wrong: the receipt arrives, so anything that treats
  /// "receipt received" as success reports a failed action as done.
  reverts,

  /// Refuses, as a user closing the wallet sheet does.
  declines,
}

/// Stands in for a wallet so the whole flow can run with no wallet, no funds
/// and no account.
///
/// It cannot sign, and does not pretend to. Instead it returns the hash of a
/// **real, historical Coston2 transaction**, so everything downstream — the
/// receipt, the gas actually burned, the logs, the success flag — is fetched
/// from the live chain rather than fabricated. The UI is required to say so.
///
/// Hashes were taken from Coston2 blocks 33,543,314 and 33,543,317 on
/// 2026-08-02. Both are real transactions against the Smart Accounts
/// controller, and neither was sent by this project.
class DemoWallet implements Wallet {
  /// A transaction that succeeded: 571,598 gas, 12 logs.
  static const succeededHash =
      '0xf9ee64b31bbbe3a6345f2a03cab1ac431783bd3f5953ec920c391d57c6f6a458';

  /// A transaction that was mined and reverted, still costing 156,522 gas.
  static const revertedHash =
      '0xd187f6cfee9b7b71ddf11db8b185e817414c7296a9699b18aaa7ddedf38ee44f';

  /// What this wallet will do when asked to sign.
  final DemoOutcome outcome;

  /// Delay before answering, standing in for a user reading an approval sheet.
  final Duration think;

  const DemoWallet({
    this.outcome = DemoOutcome.succeeds,
    this.think = const Duration(milliseconds: 600),
  });

  @override
  String get label => 'Demo (does not sign)';

  @override
  bool get canSign => false;

  @override
  Future<Uint8List> sendTransaction(
    Map<String, Object?> payload, {
    required String chainId,
  }) async {
    await Future<void>.delayed(think);
    return switch (outcome) {
      DemoOutcome.succeeds => hexToBytes(succeededHash),
      DemoOutcome.reverts => hexToBytes(revertedHash),
      DemoOutcome.declines => throw const WalletDeclined(),
    };
  }
}
