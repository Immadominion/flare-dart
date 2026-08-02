# AGENTS.md

Guidance for AI coding agents working in this repository. Human contributors
should read [`docs/ARCHITECTURE.md`](docs/ARCHITECTURE.md) instead; this file is
the short, operational version.

## What this is

A pure-Dart SDK for Flare Network. Reads the chain and builds transactions;
never signs one — see *Scope* below.

```
packages/flare_network/            core SDK, 3 deps, no Flutter
packages/flare_network_codegen/    dev-only CLI: ABI JSON -> Dart bindings
packages/flare_network_periphery/  164 generated bindings: 1049 reads, 513 tx
                                   builders, 592 events, 168 custom errors
examples/developer-hub-dart/       runnable parity examples
reference/                         upstream Flare sources, read-only
docs/                              architecture, ground truth, sprint log
```

## Commands

```bash
cd packages/flare_network
dart test                  # 240 tests, hermetic, ~1s
dart test -P integration   # 110 tests against live Coston2 + mainnet reads
dart test -P broadcast     # SPENDS TESTNET FUNDS; skips without COSTON2_TEST_KEY
                           #   source ~/.flare-dart/coston2-test.env first
dart analyze               # must be clean before any commit

# Regenerate bindings after an artifacts bump:
cd packages/flare_network_codegen
dart run bin/flare_network_codegen.dart \
  --artifacts ../../reference/package --network coston2 \
  --out ../flare_network_periphery/lib
```

`dart_test.yaml` sets a top-level `exclude_tags`, so **`-t integration` is
rejected as conflicting**. Use the `-P integration` preset. This is a real trap;
it silently ran the live suite on every `dart test` until it was fixed.

## Rules that encode real failures

1. **Only `ContractRegistry.address` is ever hardcoded**
   (`0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019`, identical on all four
   networks). Resolve everything else at runtime. Flare's own published Python
   example hardcodes a stale FtsoV2 address; an integration test asserts the
   registry disagrees with it.
2. **Never assume a decimal scale.** One live call returned 8 dp for FLR/USD,
   2 for BTC/USD, 3 for ETH/USD, 6 for XRP/USD. The DA Layer reports 6 dp for
   the *same* FLR/USD feed that FTSOv2 reports at 8 dp — different products,
   both correct. Always carry `value` and `decimals` together.
3. **Every integer decodes to `BigInt`**, including `int8`. Narrowing happens
   explicitly at one visible place per call site.
4. **`payable` does not mean it costs money.** FTSOv2 getters are declared
   `payable` yet read free via `eth_call`. `StateMutability.isReadOnly` is a
   hint, not a gate.
5. **`AbiType.encode` emits the tail only** — the enclosing sequence owns the
   head where a dynamic value's offset lives. For anything top-level, use
   `AbiCodec.encodeParameters` / `decodeParameters`.
6. **DA Layer responses are not in request order.** `DaLayerClient` re-orders by
   feed ID. Do not "simplify" that away.

## Verification standard

This repo distinguishes what was measured from what was assumed, and so should
you.

- ABI expectations are cross-checked against **Foundry** (`cast sig`,
  `cast calldata`, `cast abi-encode`). When adding an encoding path, generate
  the expected value with `cast` — a test that encodes and decodes with this
  implementation only proves self-consistency.
- Integration tests assert **invariants** (types, relationships, freshness),
  never specific prices, so they stay meaningful as the chain moves.
- [`docs/GROUND-TRUTH.md`](docs/GROUND-TRUTH.md) records measured facts with the
  command that produced them, and lists what is still unverified. Check it
  before trusting a number.
- Label anything you did not verify as `[Inference]`, `[Speculation]` or
  `[Unverified]`. Do not present inferred content as fact. If you cannot verify
  something, say so rather than guessing.

## Scope

**Supported:** contract resolution, FTSOv2 reads, DA Layer anchor feeds and
Merkle proofs, FDC, FAssets, Smart Accounts, event log decoding, subscriptions,
arbitrary `eth_call`, chain queries — and the whole transaction path either side
of the signature: build (`TransactionRequest`, generated `…Tx` builders), price
(`suggestFees`, `prepareTransaction`), broadcast already-signed bytes
(`sendRawTransaction`), confirm (`waitForReceipt`), and diagnose
(`RevertReason`).

**Deliberately not supported — a non-goal, not a gap:** *signing*. The package
holds no private keys. A wallet signs; this SDK prepares what it signs and
interprets what comes back. Do not add a signer without an explicit decision
recorded in `docs/ARCHITECTURE.md`.

Also out of scope: P-chain staking and C↔P transfers. Those are not EVM
transactions — they need the Avalanche codec, much of which must match
AvalancheGo byte-for-byte, for a very small share of addresses.

## Conventions

- `lib/flare_network.dart` is the only public barrel, with explicit `show`
  clauses. Never import `package:flare_network/src/...` from outside.
- Errors: the sealed hierarchy in `src/rpc/flare_exception.dart`. Messages
  should say what to do next, not just what failed.
- Prefer batching: `ContractRegistry.addressesOf` and `FtsoV2.getFeedsById` are
  one round trip; the per-item variants are N.
- Generated files end in `.g.dart` and carry a DO-NOT-EDIT header. Fix the
  generator, never the output.
- Dart 3 idioms in use: `sealed` / `final class`, switch expressions, named
  records for multi-return, `abstract final class` for namespaces.
