import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';
import 'package:flare_network_periphery/flare_network_periphery.dart';
import 'package:flutter/widgets.dart';

import 'wallet.dart';

/// Where a wrap has got to.
///
/// Sealed so the UI's switch is exhaustive: adding a state that some widget
/// forgets to render becomes a compile error rather than a blank screen.
@immutable
sealed class WrapState {
  const WrapState();
}

/// Nothing requested yet.
final class WrapIdle extends WrapState {
  const WrapIdle();
}

/// Resolving WNat, simulating the call, and pricing it.
final class WrapPricing extends WrapState {
  const WrapPricing();
}

/// Priced. Everything a wallet needs is ready.
final class WrapPriced extends WrapState {
  final TransactionRequest prepared;
  final FeeEstimate fees;
  final EthAddress wnat;

  const WrapPriced({
    required this.prepared,
    required this.fees,
    required this.wnat,
  });

  /// What a wallet shows as the maximum, including the value being sent.
  BigInt get maxCost => prepared.maxCost!;

  /// What inclusion at the current base fee would actually be charged.
  BigInt get likelyFee => fees.likelyCostFor(prepared.gas!);
}

/// The node or the contract refused before anything was signed.
///
/// Costs nothing and is the best possible outcome for a doomed action.
final class WrapRejectedBeforeSigning extends WrapState {
  final String message;

  /// Present when a contract reverted; absent when the node declined outright,
  /// which it does with a message and no revert data.
  final RevertReason? revert;

  const WrapRejectedBeforeSigning({required this.message, this.revert});
}

/// Handed to the wallet; waiting for the user.
final class WrapAwaitingWallet extends WrapState {
  const WrapAwaitingWallet();
}

/// The user dismissed the wallet.
///
/// Neutral, never red. Declining is a normal thing to do, and styling it as an
/// error teaches people to ignore errors that matter.
final class WrapDeclined extends WrapState {
  const WrapDeclined();
}

/// Broadcast; waiting for inclusion.
final class WrapPending extends WrapState {
  final Uint8List hash;

  const WrapPending(this.hash);
}

/// Mined, and it did what was asked.
final class WrapConfirmed extends WrapState {
  final TransactionReceipt receipt;

  const WrapConfirmed(this.receipt);
}

/// Mined, and it did not.
///
/// **Reached from a receipt that arrived perfectly normally.** The only thing
/// separating this from [WrapConfirmed] is [TransactionReceipt.succeeded]; a
/// reverted transaction is included in a block, emits no logs, and still burns
/// gas. Treating "the receipt arrived" as success is the common bug, and it
/// reports a failed action as done.
final class WrapReverted extends WrapState {
  final TransactionReceipt receipt;

  const WrapReverted(this.receipt);
}

/// The network was unreachable, or inclusion was not observed in time.
final class WrapFailed extends WrapState {
  final String message;

  /// A timeout means "not yet", not "failed" — the transaction may still land.
  final bool mayStillLand;

  const WrapFailed(this.message, {this.mayStillLand = false});
}

/// Drives wrapping FLR into WNat, end to end.
///
/// The SDK builds and prices the transaction and reads the result; a [Wallet]
/// supplies the one thing it cannot, a signature. Splitting it there is what
/// lets the whole flow run in tests, and against the live chain, with no funds.
class WrapController extends ChangeNotifier {
  FlareChain _chain;
  Wallet _wallet = const DemoWallet();
  FlareClient? _client;

  WrapState _state = const WrapIdle();
  BigInt _amount = BigInt.from(10).pow(18);

  /// Stands in for the account a wallet would supply.
  ///
  /// `eth_estimateGas` simulates against it and never needs a signature, so the
  /// entire pricing path runs with no account and no funds.
  static final demoSender = EthAddress.parse(
    '0x1000000000000000000000000000000000000001',
  );

  WrapController(this._chain, {Wallet? wallet}) {
    if (wallet != null) _wallet = wallet;
  }

  /// Whether the wallet in use can actually produce a signature.
  bool get canSign => _wallet.canSign;

  FlareChain get chain => _chain;
  Wallet get wallet => _wallet;
  WrapState get state => _state;
  BigInt get amount => _amount;

  /// The CAIP-2 identifier a wallet takes alongside the request.
  String get caip2 => _chain.caip2;

  /// Exactly what is handed to `eth_sendTransaction`.
  Map<String, Object?>? get walletPayload => switch (_state) {
    WrapPriced(:final prepared) => prepared.toWalletJson(),
    _ => null,
  };

  set amount(BigInt value) {
    if (value == _amount) return;
    _amount = value;
    // Any previous quote priced a different amount, so it no longer applies.
    _set(const WrapIdle());
  }

  void useWallet(Wallet wallet) {
    _wallet = wallet;
    _set(const WrapIdle());
  }

  void switchChain(FlareChain next) {
    if (next.chainId == _chain.chainId) return;
    _chain = next;
    _client?.close();
    _client = null;
    _set(const WrapIdle());
  }

  void reset() => _set(const WrapIdle());

  /// Puts the controller into [state] directly.
  ///
  /// For tests only. Several states — a declined signature, a mined-and-
  /// reverted transaction — are unreachable without a real wallet and real
  /// funds, and they are precisely the ones whose rendering must be pinned.
  @visibleForTesting
  void debugSetState(WrapState state) => _set(state);

  void _set(WrapState next) {
    _state = next;
    notifyListeners();
  }

  /// Builds and prices the wrap, stopping before any signature.
  ///
  /// A transaction that would revert fails here — before a user is asked to
  /// approve it, and before it costs anything.
  Future<void> price() async {
    _set(const WrapPricing());
    final client = _client ??= FlareClient(_chain);

    try {
      // Resolved at runtime: Flare redeploys contracts, and a pinned address
      // eventually reads a dead one.
      final wnat = await IWNatContract.resolve(client);

      // Generated binding. Only `deposit()` is payable, so only it takes value.
      final request = wnat.depositTx(from: demoSender, value: _amount);

      final fees = await client.suggestFees();
      final prepared = await client.prepareTransaction(request);
      prepared.assertSendable();

      _set(WrapPriced(prepared: prepared, fees: fees, wnat: wnat.address));
    } on FlareRpcException catch (e) {
      // A contract revert carries decodable data; a node-level refusal such as
      // insufficient funds carries none, and reads as null.
      final revert = e.revertReason;
      _set(
        WrapRejectedBeforeSigning(
          message: revert?.description ?? e.message,
          revert: revert,
        ),
      );
    } on FlareException catch (e) {
      _set(WrapFailed(e.message));
    }
  }

  /// Hands the priced transaction to the wallet, then follows it to inclusion.
  Future<void> submit() async {
    final priced = _state;
    if (priced is! WrapPriced) return;

    final client = _client ??= FlareClient(_chain);
    _set(const WrapAwaitingWallet());

    final Uint8List hash;
    try {
      hash = await _wallet.sendTransaction(
        priced.prepared.toWalletJson(),
        chainId: caip2,
      );
    } on WalletDeclined {
      _set(const WrapDeclined());
      return;
    } catch (e) {
      _set(WrapFailed('The wallet could not sign: $e'));
      return;
    }

    _set(WrapPending(hash));

    try {
      final receipt = await client.waitForReceipt(hash);
      // The branch that matters, and it is not a try/catch: a reverted
      // transaction returns a perfectly good receipt.
      _set(receipt.succeeded ? WrapConfirmed(receipt) : WrapReverted(receipt));
    } on FlareTransportException catch (e) {
      _set(WrapFailed(e.message, mayStillLand: true));
    } on FlareException catch (e) {
      _set(WrapFailed(e.message));
    }
  }

  @override
  void dispose() {
    _client?.close();
    super.dispose();
  }
}
