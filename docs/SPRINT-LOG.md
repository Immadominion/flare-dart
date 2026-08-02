# Sprint log

Running record of what was built, what was proven, and what is still unverified.
Newest first.

---

## Sprint 6 — The write path
**2026-08-02** · Status: **complete, all green**

### Shipped

The SDK could read Flare and could not help anyone change it. The README told
people to connect a wallet and let it sign, then gave them nothing to hand that
wallet: no transaction request type, no fee suggestion, no broadcast, and a
revert surfaced as `execution reverted` with the reason thrown away.

| Layer | What landed |
|---|---|
| `rpc/tx_request.dart` | `TransactionRequest` (+ `.callFunction` / `.transfer` / `.deploy`), `toWalletJson()`, `assertSendable()`, `FeeEstimate` |
| `rpc/flare_client.dart` | `suggestFees`, `prepareTransaction`, `sendRawTransaction`, `simulate` |
| `abi/revert.dart` | `RevertReason` — message, panic, custom error, unknown selector, empty |
| `abi/abi_error.dart` | `AbiError`, `SolidityErrors`; `ContractAbi` now parses `error` entries |
| codegen | 513 `…Tx` builders and 168 custom-error declarations with `decodeRevert` |

Generated bindings went from **149 files to 164** — fifteen interfaces had
previously emitted nothing at all because none of their functions has outputs.
`IWNat` was one of them, so wrapping FLR, the most ordinary action on Flare,
had no typed path.

### Proven

| Suite | Count |
|---|---:|
| Core hermetic | **234** |
| Core live | **91** |
| Generated bindings, live | **27** |
| Codegen unit | **33** |
| Flutter widget | **10** |

Revert vectors come from Foundry `cast`; the `Error(string)` vector is
byte-identical to what Coston2 returned live for the same call. The live revert
tests use `eth_call` **state overrides**, which Coston2 supports — so every
revert class (message, panic, custom with and without arguments, empty) is
exercised against a real node with no deployment, no funded key and no gas.

### Measured this sprint

- **Block time is not ~1.8 s, and is not one number.** Over 1,000 consecutive
  blocks per network: Songbird **1.066 s**, Flare **1.161 s**, Coston2
  **2.726 s**, Coston **3.995 s** — a 3.7x spread. The published figure
  describes none of the four. `blockTime` is now per-chain.
- **The base fee sits at a 500 gwei floor**: 95.2% of mainnet blocks and 99.9%
  of Coston2 blocks across 8,192 samples, never rising more than 11.3% above it.
  `gasUsedRatio` medians are 0.019 and 0.0077. The default fee multiplier is
  **1.5**, not the Ethereum-conventional 2.
- **`eth_maxPriorityFeePerGas` returns exactly 150 gwei on all four networks**,
  unchanged across ~20 samples — a flat constant, not a market signal.
  `eth_gasPrice` is exactly `baseFee + 150 gwei`, so it carries nothing extra.
- **The node adds no gas buffer.** A plain transfer estimates at exactly 21000,
  and a caller-supplied gas limit that is too low is ignored rather than
  rejected. All headroom is the SDK's responsibility.
- **Revert data arrives in `error.data` with code 3**, over single calls,
  batches and WebSocket alike. But an **empty** revert comes back as `-32000`
  with the field **absent entirely**, where geth sends `data: "0x"`. Branching
  on `code == 3` would miss it, so the decoder branches on presence.
- **A third error class exists**: the node refusing to simulate at all
  (`insufficient funds`), reported as `-32000` with a message and no data —
  neither a revert nor a transport failure.
- **`eth_call` state overrides are supported**; `debug_traceCall` is not.
- **168 custom errors** across the 187 published ABIs. They carry no message, so
  the node reports them as four opaque bytes.
- **`WNat.withdrawTo` does not exist.** Selector `0x205c2878` is absent from
  mainnet WNat's deployed bytecode, while `deposit`, `depositTo`, `withdraw` and
  `withdrawFrom` are all present. Secondary documentation lists it.

### Corrected mid-sprint

- **`sendRawTransaction` inherited the client's retry policy.** A broadcast is
  not idempotent — a response lost in transit does not mean the node dropped the
  transaction — so a retry risks submitting it twice and turning a success into
  `already known`. Added `JsonRpcClient.callOnce`; broadcast never retries.
- **`simulate()` dropped `from` and `value`**, silently mis-simulating every
  `msg.sender`-gated and every payable call. Now routed through
  `toCallRequest()`.
- **`waitForReceipt` polled on a fixed 1500 ms**, citing the documented block
  time. Wrong on all four networks; now paces from `chain.blockTime`.
- **`toWalletJson` emitted `chainId` unconditionally**, with a comment claiming
  it guarded against a Coston2 request being signed on mainnet. That guard does
  not exist: MetaMask strips `chainId` while normalising parameters, before
  validation runs, and neither viem's formatter nor Reown's serialiser emits the
  key. Now opt-in, with `FlareChain.caip2` for the argument that does carry
  chain identity.
- **A Solidity parameter named `from` collided** with the generated builder's
  own `from`; five contracts failed to compile. Caught by analysing the
  generated output, not the generator.
- **`dart:typed_data` was imported for contracts referencing bytes only inside
  an error declaration**, where no Dart `Uint8List` is ever emitted.

### Next

1. Wire the write path into the Flutter reference app end to end.
2. Broadcast one real Coston2 transaction from a faucet-funded key, to settle
   what a below-minimum tip does and whether a mined-and-reverted receipt
   exposes any reason.
3. Smart Accounts: XRPL address → Flare account lookup.

---

## Sprint 5 — Receipts, gas estimation, subscriptions, and the web regression
**2026-08-02** · Status: **complete, all green**

### Shipped

- **`TransactionReceipt` / `TransactionInfo` / `BlockInfo` / `CallRequest`** —
  the reads a wallet-signing workflow depends on. RPC surface 8 → 15 methods.
- **`estimateGas`**, so an action can be priced before a user is asked to sign.
- **`FlareSubscriptions`** — `eth_subscribe` over WebSocket: `newHeads`, `logs`,
  `pendingTransactions`, with jittered reconnect.
- **`WsTransport`** — a transport interface behind a conditional export.

### Corrected mid-sprint

- **Exporting `subscriptions.dart` from the public barrel cost the package its
  `web` platform tag.** pana went from "Supports 6 of 6 possible platforms" to
  5, naming the chain: `flare_network.dart` → `subscriptions.dart` → `dart:io`.
  That does not merely disable subscriptions on the web; it makes the **whole**
  package unresolvable from a Flutter Web app, so reading a price feed stops
  working too. The doc comment claiming only the one class was affected was
  wrong. Fixed with a conditional export — `dart:io` natively, the browser's own
  `WebSocket` through `dart:js_interop` on the web, declared inline rather than
  pulled from `package:web` so the dependency count stays at three. Measured
  after: **6 of 6 platforms, and WASM-ready**.
- Injecting the transport also made the socket testable offline. Reconnect and
  backoff are precisely the paths a live test cannot reach — an endpoint that
  stays up never reconnects — so they had no coverage at all. 14 hermetic tests
  now cover them.

### Measured this sprint

- `eth_subscribe` **requires the filter object even when empty**: `['logs']`
  fails with `-32602`, so an unconstrained subscription must still pass `{}`.
- Flare answers `-32000 cannot query unfinalized data` for a height past the
  head, rather than returning null. A different condition from "no such block",
  so it is surfaced rather than flattened.
- Subscription delivery is **at-most-once**: a dropped socket loses whatever the
  node produced while it was down, and reconnecting resubscribes from the
  present. Anything critical needs a `getLogs` sweep over the gap.

---

## Sprint 4 — Event decoding, hostile input, registry resolution
**2026-08-01** · Status: **complete, all green**

### Shipped

- **`AbiEvent` / `DecodedLog` / `LogFilter`** — full event log decoding: topic0
  from the canonical signature, indexed parameters from topics, non-indexed from
  data, and dynamic indexed values surfaced as `IndexedHash` since the chain
  stores `keccak256(value)` rather than the value.
- **`getLogs` / `streamLogs` / `getEventLogs`**, with automatic splitting around
  the block-span cap.
- 592 event declarations emitted across the generated bindings, with a
  `decodeLog` dispatcher per contract.

### Measured this sprint

- **`eth_getLogs` accepts a span of 30 blocks and rejects 31** — measured on
  both Coston2 and mainnet: *"requested too many blocks … maximum is set to 30"*.
  Queries wider than that are split.
- Event corpus: **592 events, 0 anonymous, 0 with dynamic indexed parameters**.
- The barrel costs **zero AOT bytes** for unused code — tree-shaking verified by
  compiling with and without.

### Corrected mid-sprint

- **All 142 generated `resolve()` methods threw.** They defaulted to the
  Solidity interface name, and measured against a live `getAllContracts()`,
  **zero** of 142 interface names appear in the registry. Fixed by parsing the
  interface→registry mapping out of the artifacts package: 39 now default
  correctly (all verified live), 103 require an explicit name.
- **The ABI decoder was hardened against hostile responses.** Offsets were
  compared by addition, so a crafted word near 2^63 overflowed to a negative
  int64 and passed a bounds check. Comparisons are now by subtraction, element
  counts are checked against remaining capacity before allocating, and signed
  integers are range-validated rather than masked.
- **`.superstack/` had been committed** by an earlier `git add -A`. Purged from
  history with `git filter-repo` and force-pushed. The old blob may remain
  reachable by SHA on GitHub until the repository is recreated.

---

## Sprint 3 — FDC, FAssets, four-network verification, 160/160
**2026-08-01** · Status: **complete, all green**

### Shipped

- **`FdcClient`** — Flare Data Connector reads: per-type attestation fees,
  voting-round timing from `ProtocolsV2` (cached), round-ID derivation, and
  on-chain proof verification for all nine attestation types.
- **`FAssetsClient`** — asset manager discovery, token metadata, supply at the
  token's own scale, holder balances, emergency-pause state, lot size.
- **`networks_test.dart`** — the same seven checks against all four networks.
- **Flare Pulse** — the Flutter reference app: live ticker, flash on change,
  network switcher, lifecycle-aware polling.
- **`flare-for-dart-developers.mdx`** — guide draft matching developer-hub's
  existing per-language template.
- Codegen test suite: 30 tests over naming, type mapping and emission.

### Proven

| Suite | Count |
|---|---:|
| Core hermetic | **131** |
| Core live (Coston2) | **46** |
| Cross-network live (all 4) | **30** |
| Generated bindings live | **8** |
| Codegen unit | **30** |
| Flutter widget | **9** |

`dart analyze` clean across five packages. **pana: 160/160**, including 20/20
platform support across all six targets — independent confirmation of the
"pure Dart, no FFI" claim.

### Measured this sprint

- **FDC source identifiers are network-specific.** Coston2 rejects every
  mainnet source name with *"Type and source combination not supported"*.
  Testnets expect `testXRP`, `testBTC`, `testETH`; mainnets use the bare names.
  `Web2Json`/`PublicWeb2` is chain-agnostic. Every supported pair costs **1000
  wei** on Coston2 against **20 FLR** on mainnet.
- **DA Layer rate limit, measured**: 18 sequential requests succeed, the 19th
  returns 429, and **no `Retry-After` header is sent at all**.
- **The DA Layer does not preserve request order** — a call for
  `[FLR/USD, BTC/USD]` returned BTC first.
- **Anchor decimals differ from block-latency decimals** for the same feed:
  FLR/USD at 6 dp from the DA Layer, 8 dp from FTSOv2, simultaneously.
- All four networks serve live FTSOv2 feeds, host the registry at the same
  address, and resolve WNat to four distinct addresses.

### Corrected mid-sprint

- **`meta: ^1.19.0` made the package unresolvable from any Flutter app**, since
  Flutter pins 1.18.0. The main audience could not use it. `dart analyze` and
  the whole suite were green throughout — it only surfaced when a real Flutter
  app was built against the package. Relaxed to `^1.15.0`.
- **macOS had no `network.client` entitlement** in either profile, so the app
  could not make outbound requests at all. Flutter's template supplies
  `network.server`, which is for the hot-reload tooling.
- **Android had `INTERNET` only in the debug manifest**, so a release build
  would have had no network access.
- **The lifecycle handler tore down on `AppLifecycleState.hidden`**, which on
  desktop fires when a window is merely occluded — the ticker froze whenever it
  lost focus. Found by running the built app, not by testing it. Verified after
  the fix: 12 of 12 sampled seconds hold a connection, against 0 of 10 before.
- **A test assumed an unused address holds no FAsset**; `0x…0001` holds 10.1
  FXRP on Coston2. Replaced with the accounting invariant.
- **A hand-written `bytes32` vector had a stray hex digit.** The test caught it;
  the expected values now come from `cast format-bytes32-string`.

### Still unverified — not cited as fact anywhere

`web3dart` signing defects, the pointycastle vs `secp256k1_ecdsa` performance
ratio, `web3dart_builders` resolution on Dart 3.12, and `blockchain_utils`
requiring a browser `self` global. None are depended on: the SDK is read-only
and uses none of them.

### Next

1. Push the repository so the pubspec `repository:` URL resolves.
2. File the developer-hub issue before opening the guide PR, per its
   CONTRIBUTING.md.
3. Decide whether v0.5 gets a signing story or stays permanently read-only.

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
