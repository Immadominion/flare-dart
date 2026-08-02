# flare-dart

A Dart/Flutter SDK for [Flare Network](https://flare.network).

Flare publishes official developer guides for JavaScript, React, Python, Rust
and Go. There is no Dart guide and no Dart SDK — querying Flare's own
documentation search for `dart` or `flutter` returns *"No matching documents
found"*. This repository is that missing piece.

## Packages

| Package | What it is |
|---|---|
| [`flare_network`](packages/flare_network) | The core SDK. Pure Dart, 3 dependencies, no Flutter, no FFI |
| [`flare_network_periphery`](packages/flare_network_periphery) | 164 generated bindings — 1,049 read methods, 513 transaction builders, 592 events, 168 custom errors |
| [`flare_network_codegen`](packages/flare_network_codegen) | Dev-only CLI: Flare's ABI artifacts → typed Dart |
| [`examples/developer-hub-dart`](examples/developer-hub-dart) | 17 runnable examples mirroring Flare's Go/Python/Rust sets |

## Quick start

```dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final ftso = await FtsoV2.resolve(client);
    for (final feed in await ftso.getFeedsById([Feeds.flrUsd, Feeds.btcUsd])) {
      print('${feed.feedId.name}: ${feed.toDecimalString()}');
    }
  } finally {
    client.close();
  }
}
```

```
FLR/USD: 0.00626973
BTC/USD: 62887.17
```

## Sending a transaction

The SDK holds no private keys and performs no signing — that is a deliberate,
permanent non-goal. It does everything on either side of the signature:

```dart
final wnat = await IWNatContract.resolve(client);

// Build. Only payable functions accept a value, so attaching one to a
// function that would reject it does not compile.
final tx = wnat.depositTx(value: BigInt.from(10).pow(18), from: user);

// Price. Simulates against current state, so a doomed action fails here —
// before the user is asked to approve it, and before it costs anything.
final ready = await client.prepareTransaction(tx);
print(ready.maxCost);            // worst case, in wei

// Sign — your wallet library, not this package.
final hash = await wallet.request('eth_sendTransaction', [ready.toWalletJson()]);

// Confirm. A mined transaction is not a successful one.
final receipt = await client.waitForReceipt(hash);
if (!receipt.succeeded) { /* reverted, and still cost gas */ }
for (final log in receipt.logs) { /* what it emitted */ }
```

When something reverts, you get the reason rather than `execution reverted`:

```dart
try {
  await client.prepareTransaction(tx);
} on FlareRpcException catch (e) {
  print(IAssetManagerContract.decodeRevert(e)?.description);
  // e.g. "InsufficientFundsForRedeem(1000000)"
}
```

That matters on Flare specifically: **168 of the custom errors in the published
ABIs carry no message at all**, so the node reports them as four opaque bytes.

Wallets sign; hardware wallets often only sign, and
[`sendRawTransaction`](packages/flare_network) broadcasts for those.
P-chain staking and C↔P transfers remain out of scope — they are not EVM
transactions. The reasoning is in [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Status

Working against live networks today: contract resolution, FTSOv2 price feeds,
Scaling anchor feeds with Merkle proofs, FDC attestations, FAssets, event log
decoding, WebSocket subscriptions, arbitrary `eth_call`, and the transaction
path above.

Runs on all six platforms Dart targets, including web, and pana reports the
package WASM-ready.

## Verify it

```bash
cd packages/flare_network
dart test                  # 234 tests — hermetic, offline
dart test -P integration   # 91 tests against live Coston2
dart run example/flare_network_example.dart
```

| Suite | Count |
|---|---:|
| Core hermetic | 234 |
| Core live | 91 |
| Generated bindings, live | 27 |
| Codegen unit | 33 |
| Flutter widget | 10 |

Nothing here rests on assumption where measurement was possible:

- ABI encoding is cross-checked against **Foundry** (`cast sig`, `cast calldata`,
  `cast abi-encode`), not against this implementation's own output.
- Integration tests assert invariants — types, relationships, freshness — never
  specific prices, so they stay meaningful as the chain moves.
- [docs/GROUND-TRUTH.md](docs/GROUND-TRUTH.md) records every measured fact with
  the command that produced it, and states plainly what is still unverified.

Two findings from that process worth knowing if you build on Flare in any
language:

- Flare's own published Python example hardcodes an FTSOv2 address that the
  registry no longer returns. Always resolve at runtime.
- Feed decimals vary per feed *and* per product: one live call returned 8 dp for
  FLR/USD, 2 for BTC/USD, 3 for ETH/USD and 6 for XRP/USD, while the DA Layer
  reported that same FLR/USD feed at 6 dp.
- Block time is **not** the documented ~1.8 s, and is not one number. Measured
  over 1,000 consecutive blocks per network: Songbird 1.066 s, Flare 1.161 s,
  Coston2 2.726 s, Coston 3.995 s — a 3.7x spread.
- The base fee sits at a 500 gwei floor on 95.2% of mainnet blocks and 99.9% of
  Coston2 blocks, never more than 11.3% above it across 8,192 blocks. Ethereum's
  usual 2x fee headroom is sized for a market Flare does not have.
- `WNat.withdrawTo` does not exist. Selector `0x205c2878` is absent from
  mainnet WNat's deployed bytecode, despite appearing in secondary docs.

## Documentation

- [Core SDK README](packages/flare_network/README.md) — full usage guide
- [AGENTS.md](AGENTS.md) / [.github/copilot-instructions.md](.github/copilot-instructions.md) — for AI coding agents
- [llms.txt](llms.txt) — condensed API surface for LLM consumption
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) — design decisions and rationale
- [docs/GROUND-TRUTH.md](docs/GROUND-TRUTH.md) — measured facts and open questions
- [docs/SPRINT-LOG.md](docs/SPRINT-LOG.md) — what was built, proven, and corrected

## License

MIT
