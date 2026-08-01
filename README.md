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
| [`flare_network_periphery`](packages/flare_network_periphery) | 142 generated contract bindings, 1,049 read methods |
| [`flare_network_codegen`](packages/flare_network_codegen) | Dev-only CLI: Flare's ABI artifacts → typed Dart |
| [`examples/developer-hub-dart`](examples/developer-hub-dart) | 14 runnable examples mirroring Flare's Go/Python/Rust sets |

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

## Status

Read-only, and deliberately so. Contract resolution, FTSOv2 price feeds, Scaling
anchor feeds with Merkle proofs, and arbitrary `eth_call` all work against live
networks today.

Transaction signing is a **documented non-goal**, which also puts P-chain
staking, delegation and C↔P transfers out of scope. For writes, connect an
existing wallet over WalletConnect/Reown and let it sign. The reasoning is in
[docs/ARCHITECTURE.md](docs/ARCHITECTURE.md).

## Verify it

```bash
cd packages/flare_network
dart test                  # 54 unit tests — hermetic, offline
dart test -P integration   # 30 tests against live Coston2
dart run example/flare_network_example.dart
```

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

## Documentation

- [Core SDK README](packages/flare_network/README.md) — full usage guide
- [AGENTS.md](AGENTS.md) / [.github/copilot-instructions.md](.github/copilot-instructions.md) — for AI coding agents
- [llms.txt](llms.txt) — condensed API surface for LLM consumption
- [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) — design decisions and rationale
- [docs/GROUND-TRUTH.md](docs/GROUND-TRUTH.md) — measured facts and open questions
- [docs/SPRINT-LOG.md](docs/SPRINT-LOG.md) — what was built, proven, and corrected

## License

MIT
