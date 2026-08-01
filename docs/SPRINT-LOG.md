# Sprint log

Running record of what was built, what was proven, and what is still unverified.
Newest first.

---

## Sprint 2 — Codegen, DA Layer, parity examples, docs
**2026-08-01** · Status: **complete, all green**

### Shipped

| Package | lib LOC | Notes |
|---|---:|---|
| `flare_network` | ~3,000 | + `DaLayerClient`, anchor feeds, `FspStatus` |
| `flare_network_codegen` | 552 | Standalone CLI, ABI JSON → typed Dart |
| `flare_network_periphery` | 30,168 | **142 bindings / 1,049 read methods** |
| `examples/developer-hub-dart` | — | **14 runnable parity examples** |

Docs: root `README.md`, `AGENTS.md`, `llms.txt`,
`.github/copilot-instructions.md`, package `README`/`CHANGELOG`, MIT `LICENSE`.

### Proven

- `dart analyze` clean across all four packages.
- **54 unit + 38 integration tests green** (30 core + 8 generated bindings).
- **All 14 parity examples run** against live Coston2, Coston, Songbird and
  mainnet.
- `dart pub publish --dry-run` reports no packaging errors.

### Measured this sprint

- **DA Layer rate limit, measured directly**: 18 sequential unauthenticated
  requests succeeded, the **19th returned 429**, and **no `Retry-After` or
  rate-limit headers are sent at all**. Prior research said "first 429 at #21";
  the gap is explained by two calls already made against a shared window. ~20
  per window is the right planning figure.
- **DA Layer does not preserve request order** — a call for
  `[FLR/USD, BTC/USD]` returned BTC first. `DaLayerClient` re-orders by feed ID,
  and an integration test asserts it.
- **Anchor decimals ≠ block-latency decimals**: FLR/USD came back at 6 dp from
  the DA Layer and 8 dp from FTSOv2 at the same moment. Both correct, different
  products.
- **Confirmed**: FDC `getRequestFee` for `EVMTransaction`/`ETH` on mainnet is
  `20000000000000000000` wei = **20 FLR**.
- **Refuted**: the claim that Flare's example hardcodes a timing value "45s off
  from mainnet". Coston2 and mainnet return **identical**
  `firstVotingRoundStartTs` (1658430000) and `votingEpochDurationSeconds` (90).
- A fourth decimal scale appeared in the wild: ETH/USD at **3 dp**.

### Corrected mid-sprint

- **GROUND-TRUTH.md understated the ABI corpus.** It recorded 112 contracts /
  954 functions; the glob only matched the flat tier and missed 75 files nested
  under `contracts/{staking,utils,ftso}/interfaces/`. Correct figures:
  **187 files / 1,540 functions**, which now agrees with the independent
  research estimate. File updated with the correction noted inline.
- **Codegen shadowing bug**, caught by `dart analyze` on generated output:
  `ICoreVaultManager.isDestinationAddressAllowed(string address)` emitted a
  parameter shadowing the class's own `address` field, silently rebinding
  `contract: address` to the argument. Generator now reserves class members.
- **Tuple mapping.** Tuples were first mapped to Dart records, which failed on
  nested cases (`IIInflationV1.getAnnum` returns a struct containing a struct
  containing an array of structs). Now mapped to positional `List<Object?>`;
  multi-output functions still get proper named records, since those need no
  recursion.

### Process failure

The background verification workflow launched at the start of this sprint
**produced nothing** — all four agents show `[Request interrupted by user]`.
It was interrupted, not stalled, and this went unnoticed for about an hour. The
load-bearing facts it was meant to establish (FDC fees, DA Layer limits,
protocol timing) were subsequently measured by hand instead, which is stronger
evidence anyway.

**Still unverified:** `web3dart` signing defects, the pointycastle vs
`secp256k1_ecdsa` performance ratio, `web3dart_builders` resolution on Dart
3.12, and `blockchain_utils` requiring a browser `self` global. None block
current work — the SDK is read-only and depends on none of them.

### Next

1. Flutter reference app (live FTSO ticker).
2. `flare-for-dart-developers.mdx` guide draft for developer-hub.
3. Decide on a signing story for v0.5, or formalise read-only permanently.

---

## Sprint 1 — Core read path
**2026-07-31** · Status: **complete, all tests green**

### Shipped

`packages/flare_network` v0.1.0-dev.1 — pure Dart, 3 dependencies, `dart analyze`
clean.

| Layer | Files | What it does |
|---|---|---|
| `abi/` | `hex.dart`, `keccak.dart`, `eth_address.dart`, `abi_type.dart`, `abi_function.dart` | Full ABI codec, EIP-55 addresses, selectors |
| `rpc/` | `json_rpc_client.dart`, `flare_client.dart`, `flare_exception.dart` | Transport with batching + jittered backoff, typed reads, sealed errors |
| `network/` | `flare_chain.dart` | Presets for chain IDs 14 / 114 / 19 / 16 |
| `registry/` | `contract_registry.dart` | Runtime resolution, caching, batch lookup |
| `ftso/` | `feed_id.dart`, `ftso_v2.dart` | 21-byte feed IDs, feed reads, live stream |

### Proven

- **54 unit tests** — hermetic, offline. ABI expectations cross-checked against
  Foundry `cast`, so they are not self-referential.
- **24 integration tests** — live Coston2, all passing.
- **Example runs**, streaming real prices:

```
FLR/USD         0.00626973   (8 dp)
BTC/USD           62887.17   (2 dp)
ETH/USD           1861.608   (3 dp)
XRP/USD           1.061849   (6 dp)
```

### Measured this sprint

- ABI corpus at `flare-periphery-contract-artifacts@0.1.52`: **112 contracts /
  954 functions** on Flare and Coston2, **105 / 894** on Songbird and Coston.
  None of the three figures carried in from prior research (372 / 740 / 1540)
  was correct.
- **Flare ≡ Coston2** and **Songbird ≡ Coston**, byte-identical by SHA-256 over
  sorted ABI JSON. The 7 extra Flare contracts are all P-chain surface. So
  codegen needs **two** binding sets, not four.
- Artifacts are **bare JSON arrays**, not Hardhat `{abi,bytecode}` objects.
- The `FtsoV2` / `TestFtsoV2` registry-key collision is real — both products
  claim `registry: "FtsoV2"`. Codegen must select on `name`.
- Flare's `ftsov2_consumer_coston2.py` hardcodes a **stale** FtsoV2 address; the
  registry returns a different one. There is now a test asserting this.
- Four distinct decimal scales observed in live feeds (8 / 2 / 3 / 6).

### Corrected mid-sprint

- The first ABI codec draft failed its own round-trips: `encode` emitted the
  tail while `decode` expected a head offset. Fixed by adding `AbiCodec` for
  parameter lists, which is the shape real calls take. Confirmed against
  `cast abi-encode "f(string)" "hello"` leading with `0x20`.
- `contract_registry.dart` first shipped with untyped throwaway hex helpers
  duplicating `hex.dart`. Rewritten to use the real ones.
- `dart_test.yaml` used a `presets: default:` block, which package:test does not
  auto-apply — so `dart test` was silently running the live suite too. A
  top-level `exclude_tags` then broke `-t integration` by conflict. Settled on
  `exclude_tags` plus explicit `-P integration` / `-P mainnet` presets, and
  verified both commands empirically.

### Still unverified — do not cite as fact

- `web3dart` signing defects (chainId default, 1 gwei tip, no EIP-712)
- The 25–40× pointycastle vs `secp256k1_ecdsa` signing ratio
- FDC fees (20 FLR mainnet / 1,000 wei Coston2) and the ~20-request DA Layer
  rate limit
- `web3dart_builders` failing to resolve on Dart 3.12.2
- `blockchain_utils` requiring a browser `self` global
- Feed category bytes other than `0x01`

A background verification pass is re-measuring all of these.

### Next

1. Absorb the verification results; settle the signing dependency.
2. ABI codegen CLI → typed bindings from the 112 artifacts.
3. FDC + DA Layer client, with fees and round IDs read live.
4. WNat, secure random, and the remaining guide-parity programs.
5. AI-agent documentation (`llms.txt`, `AGENTS.md`) + Flutter reference app.
