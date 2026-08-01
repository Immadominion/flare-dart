# Dart/Flutter SDK for Flare Network — Research Dossier

**Compiled:** 2026-07-31 · **Status of evidence:** every claim below is tagged `[V]` verified by direct probe, `[S]` self-reported single-machine measurement not independently reproduced, `[E]` estimate/inference, or `[U]` unverified — confirm at the cited URL before use. Claims that failed verification have been removed or corrected in place; corrections are called out explicitly so they are not silently reintroduced.

---

## 1. Verdict and the three things that decide it

### Verdict

**Build it — but not the thing the framing implies.**

Do **not** build "a Dart SDK for Flare Network" as a general-purpose EVM client library. That version is undifferentiated, competes with a package doing 26,566 downloads/month, and is one `grep` away from being falsified by a reviewer.

**Do** build, in this order, scoped so that **zero external funding is an acceptable outcome**:

1. An **ABI code generator** for Flare's official contract artifacts, targeting `on_chain`'s ABI layer. This is the load-bearing component and the only thing that makes the rest maintainable.
2. **FTSO reads + FDC client + ContractRegistry resolution** as a small, pure-Dart package (`flare_network`).
3. **One Flutter demo app** — a live FTSO ticker plus an XRPL-address → Flare Smart Account lookup. This is the argument, not the library.
4. A **`flare-for-dart-developers` guide PR** to `flare-foundation/developer-hub`, matching the existing per-language guide template.

Total: ~3–5 weeks of focused solo work for a credible v0.1 + guide. Funding, if it arrives, extends this — it should not gate it.

**Never scope P-chain staking.** Not "v2", not "later" — say "out of scope" in the README and name the nine methods.

### The three things that decide it

**Decider 1 — The gap is real, documented, and cheap for Flare to close. `[V]`**

`docs/network/guides/` in `flare-foundation/developer-hub` contains guides for JavaScript, React, Python, Rust and Go. There is no Dart entry. GitHub code search across `org:flare-foundation` (92 repos: TypeScript 30, Go 25, Python 14, Solidity 8) returns **0 results for `flutter`** and **0 for `pub.dev`**. Every existing guide recommends a *third-party* library (web3.py, alloy-rs, Wagmi) — Flare maintains no per-language SDKs, so a Dart SDK is additive, not competitive, and there is no "not invented here" objection to clear.

**Decider 2 — Demand is not merely thin, it is absent, and the cheapest substitute is ten lines of config. This caps the ambition. `[V]`**

| Probe | Result |
|---|---|
| Dart files on GitHub referencing `flare-api.flare.network` | **1** (a 314 MB unstarred multi-chain repo) |
| Dart files referencing `coston2-api` | **0** |
| Issues in `org:flare-foundation` mentioning `flutter` or `dart sdk` | **0** |
| Stack Exchange results for Flare + Flutter | 0 relevant |
| Web search for `"flare_flutter_sdk" OR "nemorixgroup"` | Returns Rive animation results only |

And the substitution risk is concrete: `reown_appkit` 1.8.3 ships **37 default network presets** (corrected from an earlier "40" figure) `[V]`, none of which is Flare, Songbird or Coston `[V]` — but it exposes a public `ReownAppKitModalNetworks.addSupportedNetworks(namespace, chains)` API `[V, re-confirm in source]`. A Flutter developer reaches Flare today with one `ReownAppKitModalNetworkInfo` literal and one call. **Wallet connect-and-sign on Flare is a config problem, not an SDK problem.** Any pitch implying otherwise is falsifiable in thirty seconds.

What genuinely remains: FTSO feed-ID construction, the six-step FDC attestation flow, FAssets mint/redeem, Smart Accounts byte layouts, and typed bindings for a large contract surface. That is real, but it is a *library for people who do not yet exist*.

**Decider 3 — Flare funding for this is weaker than it first appears, so the project must be worth doing unfunded. `[V]`**

The commonly-cited "Dev Tools is one of Flare's three Top Categories" is a **misreading**. The literal DOM context on flare.network/resources/grants is:

> `Grants Awarded 100 | Countries 21 | US GB SI SG HK NL AE CH PA FR FI AU +9 | Top Categories DeFi Infrastructure Dev Tools`

It sits inside the **statistics block**, adjacent to country flags — a descriptive summary of 100 past awards, **not** a solicited-category list. The same page says *"What to Include: Your **company** pitch deck… Tell us why your **company** is unique"*, and all four featured grantees are TVL-generating DeFi protocols (Clearpool, RainDEX, Kinetic, SparkDEX). No token grant amount is published anywhere on the page; the only figures are Google Cloud credits.

Corroborating signal: of Flare's repos created since 2026-01-01, the large majority are `fce-*` / `tee-*` Confidential Compute work in Go. Their own `flare-tx-sdk` has 3 stars, ~507 npm downloads/month, and no substantive commit since 2026-01-12 `[V]`. Flare is investing in TEEs, not client SDKs.

### The strongest argument against — state it first in any pitch

**The maintenance decay base rate is brutal, and it is the objection a funder is actually holding.** `[V]`

| Project | Funding | Last human commit | Downloads/mo |
|---|---|---|---|
| polkadart | **approved for $105,000** (W3F, two applications) | 2026-02-08; dependabot-only since | 941 |
| espresso-cash (`solana`) | Solana Foundation grantee, amount undisclosed | 2026-04-10 | 723 |
| tonutils | $3,500 (TON Society footstep #224) | 2024-09-12 | 309 |
| stellar_flutter_sdk (Soneso) | *ongoing*, not lump-sum `[U — funding mechanism unconfirmed]` | 2026-07-20, active every month | — |

One project stays healthy and it is the one with continuing rather than one-off funding. Every chain-specific Dart SDK combined does roughly 6,000 downloads/month; Rive's five-years-deprecated `flare_flutter` animation library alone does 10,551 `[V]`.

There is a second, sharper edge to this. The proposer's own published portfolio is currently the best available exhibit *for* that objection — see §11.1. **Fix that before any outreach.** It is a 30-minute job and it is the highest-return half-hour in this entire document.

---

## 2. The gap — what exists for Flare today, what does not

### 2.1 Verified ground truth about Flare `[V]`

- EVM-compatible. Chain IDs: Flare **14**, Coston2 **114**, Songbird **19**, Coston **16**. Live-confirmed: `flare-api.flare.network/ext/C/rpc` → `eth_chainId 0xe`; `coston2-api.flare.network/ext/C/rpc` → `0x72`.
- Snowman++ consensus, Cancun EVM, all fees burned. Block time: Flare docs cite ~1.8s; Blockscout's own stats endpoint currently reports a 1.22s average. Treat as **~1.2–1.9s** and do not quote a precise figure.
- **`FlareContractRegistry` at `0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019`, identical on all four networks.** `getAllContracts()` returns 67 named contracts on mainnet, 69 on Coston2. This is the **only** address an SDK must hardcode. Note: a substantial fraction of the 67 are deprecated V1 contracts (`StateConnector`, `PriceSubmitter`, `FtsoManager`, `FtsoRegistry`, `InitialAirdrop`) — exposing all 67 as a flat namespace ships a museum. Curate.
- Live EIP-1559: base fee 500 gwei, `eth_maxPriorityFeePerGas` **150 gwei**, `eth_gasPrice` 650 gwei (measured 2026-07-31; Blockscout's rolling average was 1,274.94 gwei the same day — the two disagree, so do not build a cost model on a single reading).
- `debug_traceTransaction` is **not available**. `eth_call`, `eth_estimateGas`, `eth_createAccessList`, `eth_getProof`, `eth_getLogs` all exist.
- Flare block headers carry six non-standard coreth fields (`blockExtraData`, `extDataHash`, `extDataGasUsed`, `blockGasCost`, `minDelayExcess`, `timestampMilliseconds`). **Design constraint: block deserializers must ignore unknown keys, never strict-parse.**
- The "needs POA middleware" fear is a web3.py artifact, not a Dart one. web3dart 3.0.3 parses Flare/Coston2 blocks correctly; `extraData` is 30 bytes, under the 32-byte limit that trips web3.py. `[S — reproduce before relying on it]`

### 2.2 What Flare publishes for developers

| Surface | Status |
|---|---|
| Language guides | JavaScript, React, Python, Rust, Go. **No Dart, no Flutter.** `[V]` |
| Official client SDK | `@flarenetwork/flare-tx-sdk`, TypeScript only. 3 GitHub stars, ~507 npm downloads/month `[V]` |
| Contract artifacts | `@flarenetwork/flare-periphery-contract-artifacts` (v0.1.52, 2026-06-30) and `@flarenetwork/flare-periphery-contracts` — bare ABI JSON arrays, free to consume `[V]` |
| Docs corpus | `dev.flare.network/llms-full.txt`, 2,354,220 bytes, 228 sitemap URLs. **Correction: it is complete.** An earlier claim that it omits `smart-accounts/*` and `fxrp/*` is **false** — the file contains `## Flare Smart Accounts`, `## Smart Accounts Reference`, and 26 FXRP section headers `[V]` |
| DA Layer REST API | 10 endpoints, **no API key required**, verified live: `/api/health` → `{"healthy":true}`, anchor feeds with 6-element Merkle proofs, decoded FDC attestations `[V]` |
| FDC verifier | Regular grid: 4 verbs × 9 attestation types × 7 chains, plus 12 indexer GETs per UTXO/XRP chain. `prepareRequest` does MIC hashing and ABI encoding **server-side** `[V]` |
| AI/agent surface | `flare-ai-skills` (19 stars), Developer Hub MCP server, `llms.txt` index `[V]` |

### 2.3 The language-guide parity bar

The Go/Python/Rust guides define what "a Flare language guide" means. **Correction to a widely-repeated claim: the program sets are NOT identical across the three.** `[V]`

| | Programs | Notes |
|---|---|---|
| Python | 14 distinct | Only language shipping `compile_contract` **and** `fetch_abi` |
| Go | ~13 + generated abigen bindings + `_test` files | 34 files, 798 hand-written LOC (10,528 generated) |
| Rust | 12 | No `fetch_abi`, no `compile_contract`. 607 LOC, 18 files |
| JavaScript/TS | 112 files, 12,541 LOC | An outlier. **Not the bar.** |
| **Dart** | **0** | — |

The hand-written bar is **~600–800 LOC across ~13 programs**. Of those, **11 need no signing at all** — only `deploy_contract` and `volatility_incentive` do. That is why the guide is a two-week deliverable, not a two-month one.

The canonical 13: `chain_id`, `block_number` (×4 networks), `create_account`, `deploy_contract`, `make_query` (registry → WNat), `get_feed_id`, `ftsov2_consumer`, `ftsov2_config`, `secure_random`, `volatility_incentive`, `fetch_anchor_feeds`, `fetch_and_verify_anchor_onchain`, `fetch_abi`/`compile_contract`.

### 2.4 What exists in Dart today

| Package | Version / date | Downloads/30d | Assessment |
|---|---|---|---|
| `web3dart` (xclud fork) | 3.0.3, 2026-06-28 | 26,566 | Dominant but structurally unsound for signing — see §3.2 |
| `on_chain` (mrtnetwork) | 8.1.0, 2026-07-16 | 1,372 | 160/160 points, all tx types, EIP-712 byte-exact. **Bus factor 1** `[V]` |
| `blockchain_utils` | 7.1.0, 2026-07-16 | 12,383 | Same maintainer |
| `secp256k1_ecdsa` | 0.6.3, 2025-12-24 | ~2,075 | Fast signer. **Ships inside the polkadart monorepo**, last substantive change 2025-12-15 `[V]` |
| `xrpl_dart` (mrtnetwork) | 7.6.0, 2026-07-22 | 634 | Mature, complete XRPL binary codec. Same bus factor |
| `reown_appkit` | 1.8.3, **2026-02-19** | 6,554 | Android/iOS tags only, no web. 5 months without a release |
| `eip712` (variance.space) | 1.0.1, 2025-12-15 | **194, 1 like** | 160/160 points but effectively **zero production usage** — do not put it under a signing path |
| `avalanche_flutter_sdk` | 0.1.0-dev, 2026-07-24 | 338 | Address derivation only. **Zero** UTXO/codec/serialization code |
| `flare_flutter_sdk` | 0.0.1-dev, **2026-07-28** | 67, 0 likes | The competitor — see §11.4 |
| `web3dart_builders` | 3.0.1 | 101 | **Cannot resolve on Dart 3.12.2** (`dart_style ^2.3.8 → analyzer ^6.9.0 → macros → _macros`, removed from SDK) `[V]` |

**Not previously connected, and it matters:** `avalanche_flutter_sdk` and the competing `flare_flutter_sdk` share a publisher (nemorixpay.com / nemorixgroup) `[V]`. The team claiming the Flare Flutter name also owns the only Dart Avalanche package — directly relevant to the P-chain scoping conversation.

### 2.5 Naming

`[V]` as of 2026-07-31, HTTP 404 = available: `flare_network`, `flare_network_sdk`, `flare_sdk`, `flarenetwork`, `flare_ftso`, `dart_flare`, `flare_evm`, `flare_network_periphery`, `flare_network_flutter`, `flare_network_codegen`, `flare_core`, `flarekit`, `flare_wallet`, `flare_client`.

Taken and unusable: `flare` (v0.6.1, a 2015 Barback static-site transformer), `flare_dart` (v2.3.4, Rive vector animation, discontinued, still ~1,158 dl/30d), `flare_flutter` (Rive, **10,551 dl/30d, 739 likes**), `flare_flutter_sdk` (the competitor).

**Claim `flare_network`.** Never `flare_dart`, never anything containing `flare_flutter`. Organic search discovery is effectively unavailable — every "Flare Flutter" query resolves to Rive — which is itself the argument that **the developer-hub guide is the distribution channel**, not SEO. pub.dev names are first-come; re-check availability at publish time.

---

## 3. Technical feasibility

Net assessment: **this is the lowest-risk part of the project.** The hard parts are demand and maintenance, not code.

### 3.1 What is easy

| Item | Why |
|---|---|
| Chain access | Flare is EVM-equivalent at the transaction layer. EIP-2718, RLP, type-0 and type-2. No Flare-specific signing work. `[V]` |
| Contract discovery | One hardcoded registry address resolves everything at runtime. `[V]` |
| FTSO reads | Feed ID is 21 bytes: category byte + UTF-8 hex of the name, zero-padded. `FeedId.crypto('FLR/USD') == 0x01464c522f55534400000000000000000000000000`. Reads cost **0 wei** — `calculateFeeByIds` returns 0 for standard and custom feeds, and `getFeedsById` works via plain `eth_call` despite being declared `payable`. `[V]` |
| Live catalog | 63 crypto feeds + 2 custom (sFLR/USD, stXRP/USD). Fetch at runtime from `/api/v0/ftso/anchor-feed-names`; do not vendor into Dart source. `[V]` |
| DA Layer | Plain HTTP + JSON, no auth. Target v1 paths, treat v0 as legacy (both live). `[V]` |
| FDC request encoding | The verifier's `prepareRequest` does MIC hashing and ABI encoding server-side. **Dart never implements it.** `[V]` |
| Smart Accounts read path | `MasterAccountController.getPersonalAccount(<xrpl address>)` at `0x434936d47503353f06750db1a444dbdc5f0ad37c` (same address mainnet and Coston2) is one `eth_call`, zero XRPL crypto. `getDefaultInstructionFee()` = 500,000 drops = 0.5 XRP. `[V]` |
| Cross-platform | The whole stack compiles with `dart compile js` **and** `dart compile wasm`. **Nothing requires `dart:ffi`.** No platform channels, no CocoaPods, no Gradle native build. This removes what is normally the largest schedule risk in a cross-platform crypto SDK. `[V]` |
| BigInt | Not a bottleneck. mulmod 0.23 µs native vs ~400 µs for one signature. Do not write a custom uint256. `[S]` |

### 3.2 Why not web3dart

The defects are source-level and verified against the 3.0.3 tarball `[V]`:

| Defect | Consequence on Flare |
|---|---|
| `signTransactionRaw(tx, c, {int? chainId = 1})` — chainId **defaults to Ethereum mainnet** | A Flare tx silently signed for the wrong chain. Replay-safety footgun aimed at exactly this use case |
| `signTransactionRaw` throws `null cannot be rlp-encoded` when `data == null` | Every plain FLR transfer via the offline/hardware path crashes. One-line fix you must carry in a fork |
| `_getMaxPriorityFeePerGas()` returns a literal 1 gwei; **zero** occurrences of `eth_maxPriorityFeePerGas` in `lib/` | Flare's node suggests **150 gwei**. A 150× understatement → under-tipped, slow-to-include transactions |
| Zero EIP-712 (`grep 712\|typedData\|domainSeparator` → 0 matches); access list unconditionally `list.add([])` | Blocks gasless USDT0/FXRP and x402, which use EIP-3009 |
| `EthereumAddress`, `EtherAmount`, `BlockInformation` live in `package:wallet` **0.0.18**, not re-exported | A 0.0.x package (any release may break) owns your address, amount and block types |
| `EthereumAddress.fromHex(..., bool enforceEip55 = false)` | Bad-checksum addresses silently accepted **and rewritten**. Open issue #160 |
| `import 'package:pointycastle/src/utils.dart'` (line 22) — private implementation path | A pointycastle 4.x patch can break your build with no web3dart change |
| Celo type-123 encoding and `feeCurrency` baked into **core** `Transaction` (PR #164, merged 2026-01-24) | A competitor chain's semantics in your hot path; the roadmap is steered by whoever sends PRs |

Upstream health: 265 commits total, ~4/year for three years, 87 open issues, 3 open PRs (oldest 2022-02-24), 4 releases in 24 months with a 13-month gap `[V]`. The original was archived by simolus3 on 2022-02-04 with an explicit disavowal of crypto; the current package is a volunteer fork, not a curated handoff.

**Counter-evidence, stated honestly: web3dart works fine on Flare for reads.** `getNetworkId`, `getBlockNumber`, `getBlockInformation` all succeed against Coston2 including the non-standard block fields. The case against it is about the *signing* path and the maintenance model.

**Decision: build on `on_chain` 8.1.0.** All tx types (legacy/2930/1559/4844/7702/712-zkSync), EIP-712 verified byte-exact against the canonical "Ether Mail" vector (hash `0xbe609aee343fb3c4b28e1df9e632fca64fcfaede20f02e86244efddf30957bd2`, r/s/v and recovered signer all matching spec), one pure-Dart dependency, `data` required at compile time so the null-RLP crash is structurally impossible `[V]`. Ship a thin **optional** web3dart interop shim (`EthereumAddress`/`Credentials` adapters, ~120 lines, separate import) so the 26,566-downloads/month install base can drop the SDK in — adapter only, never a dependency.

### 3.3 The signer — corrected numbers

Pure-Dart secp256k1 signing via pointycastle is slow enough to matter. **The previously circulated multipliers were inflated and must be corrected before they appear in any external document.**

Measured with warmup, Dart 3.12.2 / macos_arm64 `[S — reproduce and publish the harness before quoting]`:

| Comparison | Measured ratio |
|---|---|
| `on_chain` signer vs `secp256k1_ecdsa`, JIT | 10,623 µs vs 433 µs = **24.5×** |
| `on_chain` signer vs `secp256k1_ecdsa`, AOT | 15,789 µs vs 435 µs = **36.3×** |
| web3dart/pointycastle vs `secp256k1_ecdsa`, AOT | 17,275 µs vs 435 µs = **39.7×** |

**Restate the headline as "roughly 25–40×, bit-identical RFC-6979 output" (r and s confirmed to match exactly).** The earlier "52×" and "71×" figures came from cold, un-warmed runs and will be found by anyone who re-benchmarks — which would cast doubt on better-founded claims.

The dart2js web figures (145–406 ms for pointycastle, ~2.7 ms for `secp256k1_ecdsa`) were **not** independently reproduced and, given the native inflation, should be **re-measured in headless Chrome with warmup before being quoted at all.** `[U]`

The architectural conclusion survives intact: swap the signer. `on_chain`'s `EthereumSigner` is a two-method `abstract mixin class` and **both methods are already `async`** `[V]` — so the swap is ~40 lines, needs no fork, and gives a free seam for isolate offload on mobile. Flutter Web has no isolates (Flutter's own docs: *"Dart web platforms, including Flutter web, don't support isolates"*; `compute()` runs on the main thread), so **the signer swap is the fix and isolates are defence-in-depth, in that order.**

**But note the dependency irony, and act on it:** `secp256k1_ecdsa` ships inside `leonardocustodio/polkadart` — the $105k W3F-funded SDK that is the canonical decay case, with no substantive commit since 2026-02-08 `[V]`. **Vendor it.** It is a small, pure-Dart, RFC-6979 implementation with output verifiably identical to pointycastle's. Copy the few files in-tree under license attribution, pin exactly, add golden vectors. Do the same contingency planning for the 5–6 `on_chain` files you actually need (BSD-3 permits it). Your EVM core, XRPL leg and signer currently depend on **two individuals** — `mrtnetwork` (75 of 76 commits on `on_chain`; 76 of 76 on `xrpl_dart`) and the polkadart maintainers.

### 3.4 The ABI surface — codegen is the architecture, not an optimization

Three different corpus measurements exist in the research and **they have never been reconciled.** `[U — re-measure before committing]`

| Source | Count |
|---|---|
| Documented Solidity interfaces in developer-hub docs | ~52 interfaces, **372 functions** (267 view/pure, 105 state-changing) |
| `@flarenetwork/flare-periphery-contracts` (`.sol` files) | **117 interface files, 740 functions** (522 view/pure, 218 state-changing), 98 structs, 362 events |
| `@flarenetwork/flare-periphery-contract-artifacts` (JSON) | **187 contracts, 1,540 functions** (1,027 view/pure, 513 state-changing), 592 events |

These plausibly describe different corpora (docs subset vs `.sol` interfaces vs full JSON artifacts including test/internal contracts), but the research never says so. **Re-run the count yourself in week 1 — it determines the codegen scope.** Whichever figure is right, hand-writing bindings is off the table: at ~15 lines of Dart per function, even the smallest number is 5,500+ LOC before tests, and the largest is larger than the P-chain port everyone agrees to defer.

Two further findings from the artifacts package, both flagged `[U]` and both worth ten minutes to re-verify because they materially shape the generator:

- Flare and Coston2 ABIs reported **byte-identical** (SHA-256 over sorted ABI JSON, 0 diffs); Songbird/Coston a subset missing 14 contracts (all P-chain-mirror / distribution / incentive-pool). If true, **emit one binding set with a network bitmask, not four trees.**
- Artifact JSONs are **bare ABI arrays**, not Hardhat `{abi, bytecode}` objects. The parser must not expect `.abi`. `[V]`
- `dist/index.js` ships an authoritative registry-name → interface `products` map, including the trap `FtsoV2 → FtsoV2Interface` **and** `FtsoV2 → TestFtsoV2Interface`. **The test variant must be filtered or it silently wins.** `[V that the collision exists; exact entry counts unverified]`

**Generator design:** a **standalone Dart CLI**, not `build_runner`. `web3dart_builders` cannot resolve on Dart 3.12.2, so a build_runner-based generator imposes an unresolvable dev dependency on every consumer. A standalone CLI runs once in CI, output is **committed**, consumers get plain `.dart` files with zero codegen footprint, and a 187-file bot PR is reviewable. `web3dart_builders`' generated output quality is genuinely good (Dart 3 typed records, per-event classes, `assert(checkSignature(...))` selector checks) — **fork it as a reference and retarget it to `on_chain`'s ABI layer** rather than designing from zero. Budget ~1 week.

Type mapping: `uintN`/`intN` → `BigInt` (never `int`), **except small signed types** — FTSO `decimals` is `int8` and **can be negative**, so it must be `int`. `address` → `ETHAddress` with EIP-55 enforced at construction. `bytes21` → a `FeedId` domain type (it is always an FTSO feed ID in this corpus). Multi-return → Dart 3 named records. Overloads suffixed by arity.

**CI sync job:** weekly, pull the latest artifact version, regenerate, `dart format`, `dart analyze --fatal-infos`, run selector goldens, open a PR with a *semantic* ABI diff in the body (functions added/removed/selector changed). This is the single strongest line available for a funding conversation: **when Flare ships a new contract, Dart bindings arrive by bot within a week with no human on the critical path.**

### 3.5 Contract churn — real in volume, benign in kind

Diff of `@flarenetwork/flare-periphery-contracts` 0.1.46 (2026-04-22) → 0.1.52 (2026-06-30), nine releases over ten weeks `[V]`:

- 4 interfaces **added** (`ICoreVaultManager`, `IMintingTagManager`, `IPublicKey`, `ISignature`)
- 18 files changed, but only **4** had a function-signature delta
- All four deltas were **pure additions** (`executeDirectMintingWithData`, `executeUserOp`, `setSystemRedemptionFeeBIPS`/`Receiver` + getters, `getVoterSignature`)
- **Zero functions removed.** The rest was cosmetic (import style, declaration reordering)

Flare also marks five interfaces *"long term support interface"* in-source: `FtsoV2Interface`, `ProtocolsV2Interface`, `RandomNumberV2Interface`, `RewardsV2Interface`, `TestFtsoV2Interface`.

**The uncomfortable implication:** the parts Flare guarantees stable (FTSO, protocol timing, RNG, rewards) are exactly the *commodity* parts — one ABI call each, trivially portable, least differentiated. The parts that actually churn (`IDirectMinting`, `IPersonalAccount`, `IRedeemExtendedSettings` — FAssets and Smart Accounts) are exactly the *differentiated* surface a pitch depends on. **Your moat and your maintenance burden are the same code.** An independent measurement over 0.1.48→0.1.52 found the same shape: **zero drift in the FTSO/FDC/registry core, all churn in FAssets** `[S]`.

Also note: the package is still `0.1.x` after 67 releases. **No semver protection.** A 0.2.0 or 1.0.0 release is the moment removals become possible — watch for it.

### 3.6 FDC — smaller than it looks, with two traps

The six-step flow: format request → `requestAttestation` on FdcHub with fee attached → compute voting round → wait for finalization → poll DA Layer for response + Merkle proof → submit to target contract for verification against `FdcVerification`.

Because `prepareRequest` is server-side, Dart's job reduces to HTTP POST → one payable tx → HTTP GET → pass a `bytes32[]` through. The verifier grid is fully regular, so a Dart client can be **one generic method parameterized by (chain, type, verb)** rather than 36 hand-written functions.

Two traps, both one-liners once known `[V]`:

1. **`requestAttestation` is payable and costs real money.** Live from `FdcRequestFeeConfigurations` (`0x259852ae6d5085bdc0650d3887825f7b76f0c4fe`) on mainnet: **20 FLR** for AddressValidity, Payment, BalanceDecreasingTransaction, ReferencedPaymentNonexistence, EVMTransaction, XRPPayment, XRPPaymentNonexistence; **3 FLR** for ConfirmedBlockHeightExists; Web2Json is **not enabled on mainnet** (reverts "Type and source combination not supported"). Coston2 charges **1,000 wei** for everything. **A naive port that omits `msg.value` reverts every single time.** Always call `getRequestFee` and attach it.
2. **Round ID must be read at runtime.** `roundId = floor((blockTimestamp − firstVotingRoundStartTs) / votingEpochDurationSeconds)`. Live from `ProtocolsV2` on mainnet: `firstVotingRoundStartTs = 1658430000`, `votingEpochDurationSeconds = 90`. Flare's own `fdc_submit_request.ts` example **hardcodes a Coston value 45 seconds off from mainnet** — copying it silently computes wrong round IDs and every proof lookup 404s. Read both from `ProtocolsV2` at init and cache. Drive waits off `isFdcVotingRoundFinalized`, never a fixed sleep.

Nine active attestation types plus one deprecated (`JsonApi`), each with a fixed chain-support matrix. **Encode the matrix in the Dart type system so `XRPPayment`-on-Bitcoin is a compile error.**

**Measured rate limit — this is the real operational constraint.** The unauthenticated DA Layer serves **exactly 20 requests, then HTTP 429** (first 429 at request #21, reproducible, no `Retry-After` header) `[V]`. The public Flare RPC handled 200/200 requests at concurrency 50 with zero throttling (~50 req/s observed — a point-in-time reading, **not an SLA**) `[S]`. So RPC is not the bottleneck; **the DA Layer is.** Any FDC-consuming mobile app at scale will 429 its entire user base on a shared IP. Flare's docs offer only *"raise an API Key Request issue on GitHub"* for higher limits — free but gated and manual. **The SDK must ship exponential backoff by default and a first-class bring-your-own-key path.**

### 3.7 What to defer, with the numbers that justify it

| Deferred | Cost if attempted | Why deferring is right |
|---|---|---|
| **P-chain (stake/delegate/export/import)** | The port target is **not** `flare-tx-sdk` (5,423 LOC of thin 41–82-line wrappers) but **`flarejs`**: 15,363 non-test LOC / 23,816 with tests. Minimum subset for the 5-tx stake round trip = **69 files / 7,130 LOC**, plus ~1,345 utils + ~133 crypto ≈ **8,600 LOC of TS ≈ 10–13k LOC of Dart**. Roughly **3,500 LOC** (`complexity.ts` 493, `spend*.ts`, `etna-builder/builder.ts` 1,828, fee `constants.ts` 279) must **byte-match AvalancheGo** or transactions are silently rejected on-chain. `[V]` | **4,215 unique P-chain delegator addresses vs 8,542,034 C-chain addresses = 0.05%.** Min delegation 50,000 FLR, 14-day lockup. No Dart Avalanche codec exists anywhere. **No server-side escape hatch:** `platform.exportAVAX` and `platform.addDelegator` return `rpc: can't find method` on Flare's public node. And it never ends — Etna 2025-12-02, Fortuna 2026-04-14, Granite 2026-07-14; `flarejs` has 5.1.0-rc.0 in beta while `latest` is still 4.1.1. `[V]` |
| **FAssets minting (XRPL leg)** | Requires signing an XRPL Payment with Flare-specific memo/destination-tag layouts (32-byte: prefix `0x4642505266410018` + 4 zero bytes + 20-byte recipient; 48-byte: prefix `0x4642505266410021` + recipient + executor) | `xrpl_dart` 7.6.0 is mature (169 files, 21,459 LOC, full binary serializer, ed25519 + secp256k1, Memo model) — this is **integration, not invention**, and lands cheaply in v1.1. Deferring removes an entire chain's key custody from the threat model. **Redemption needs no XRPL signature at all.** Alternative: deep-link to Xaman. `[V]` |
| **Smart Accounts write path** | XRPL signing + memo opcodes (`0xFE` keccak commitment, `0xFF` inline PackedUserOperation, `0xE0`–`0xE2`, `0xD0`/`0xD1`) | But ship the **read** now — one `eth_call`, zero XRPL crypto, high demo value `[V]` |
| **FCC (Confidential Compute)** | TEE attestation + Protocol Managed Wallets | Flare's own docs: *"in the final stages of development and not yet a fully public production system."* Porting a moving pre-release target is indefensible |

**Coverage arithmetic, corrected.** `flare-tx-sdk`'s `Network` class exposes **77 public async methods** `[V]` (an earlier "69" is wrong, and the derived "51 of 69" / "60 of 69" fractions are therefore invalid). **Nine** methods require the Avalanche codec `[V]` — an earlier "7" is wrong, and the same source then lists nine: `transferToP`, `transferToC`, `exportFromC`, `importToC`, `transferOnP`, `exportFromP`, `importToP`, `delegateOnP`, `addValidatorOnP`.

So: **68 of 77 (88%) are reachable without the codec**, of which 9 are P-chain read-only queries (JSON-RPC or C-chain contract reads; two of them decode UTXO bytes, a small read-only codec subset) and **59 are pure EVM**.

Critically, **`claimStakingReward` is a plain C-chain EVM call** `[V]`. A C-chain-only Dart SDK can still show a user their stake, their validators, the stake limits, and let them **claim staking rewards**. It only cannot *create* a delegation. That is a very defensible v1 — and the competitor's own roadmap also omits P-chain transactions, independent corroboration of the scope call.

One further mobile-UX tax on P-chain **reads**, worth knowing even though you are deferring: deriving a P-chain address needs the account's *public key* (`ripemd160(sha256(compressedPubkey))` → bech32), which EIP-1193 wallets do not expose. `flare-tx-sdk` works around it by scraping a block explorer for the user's first outgoing tx, falling back to an unexplained `personal_sign` prompt `[V]`.

---

## 4. Proposed architecture and phased scope

### 4.1 Layout

A four-package melos monorepo, one repo, independent versions:

```
flare-dart/
├── packages/
│   ├── flare_network/            PURE DART core. Zero Flutter dependency.
│   ├── flare_network_periphery/  GENERATED bindings. Version = artifact version.
│   ├── flare_network_flutter/    Secure storage, biometrics, Reown, widgets
│   └── flare_network_codegen/    Dev-only CLI. Not a runtime dep of anything.
└── apps/flare_pulse/             Reference app
```

**The core package must have no Flutter dependency.** This is the concrete lesson from the proposer's own `jup_dart_sdk` source tree, whose `pubspec.yaml` declares `flutter: sdk: flutter` in the core SDK — making it unusable from `dart run`, from a Dart backend, from CI without Flutter, and from a pure-Dart CLI. It is credible and disarming to say so in a proposal: *"I shipped this; here is what I would change."*

Second lesson from the same package: files sitting at the root of `lib/` become public API by accident. Convention is `lib/<pkg>.dart` as the only root file, everything else under `lib/src/`. Enforce it with a test that asserts `lib/` contains exactly the declared export files.

Why periphery is separate: it tracks a different release clock (`0.1.52+N`, self-documenting provenance), it is tens of thousands of generated LOC that everyone would otherwise pay for in `dart analyze` and IDE indexing, and a bot PR bumping 187 files must never touch the core changelog.

### 4.2 Public surface

```dart
// package:flare_network/flare_network.dart
export 'src/network.dart';        // FlareNetwork.flare/.coston2/.songbird/.coston
export 'src/client.dart';         // FlareClient
export 'src/registry.dart';       // ContractRegistry (curated, not all 67)
export 'src/ftso/ftso.dart';      // FeedId, FtsoValue, FtsoFeedStream
export 'src/fdc/fdc.dart';        // DaLayerClient, VerifierClient, AttestationRequest
export 'src/signing/signer.dart'; // FlareSigner (abstract), FlareLocalSigner
export 'src/tx/fees.dart';        // FlareFeeStrategy
```

Non-negotiable API rules, each closing a verified footgun:

- `chainId` is **required and non-defaulted** at every signing entry point.
- `enforceEip55: true` at every address construction site.
- `FeedId` is a domain type, never raw `bytes21`.
- FTSO reads return **value and decimals together** — the docs warn decimals can change, and the live feeds already mix 8, 2 and 6 decimals across FLR/USD, BTC/USD and XRP/USD, so any fixed assumption is visibly wrong.
- No API returns raw private key bytes. Biometric-gated `unlock()` is the only path to a signer.

### 4.3 Fee estimation — must be written from scratch

Neither candidate library ships usable logic. This work is mandatory regardless of dependency choice.

```dart
abstract class FlareFeeStrategy { Future<Eip1559Fees> estimate(FlareClient c); }

class FlareDefaultFeeStrategy implements FlareFeeStrategy {
  const FlareDefaultFeeStrategy({
    this.rewardPercentile = 60,
    this.historyBlocks = 20,
    this.baseFeeMultiplier = 2,
    this.minPriorityFee,   // null => probe eth_maxPriorityFeePerGas
  });
}
```

Percentile over `eth_feeHistory` with `eth_maxPriorityFeePerGas` as the primary source and a documented floor. Expose `bump(factor: 1.125)` — short block times make stuck-tx replacement a real mobile need. **Assert in tests that the computed tip is never 1 gwei on Flare.**

### 4.4 Phased scope

**v0.1 — "Read Flare from Flutter" (~2 weeks, demoable in 3 days)**

| Module | Contents |
|---|---|
| Core | 4 network presets, JSON-RPC client with batching/retry/backoff, `ContractRegistry` + cache |
| FTSO | `FeedId`, `FtsoValue`, `getFeedsById`, `getFeedConfigurations`, `calculateFeeByIds` |
| DA Layer | Anchor feeds + Merkle proofs, v1 paths, **exponential backoff by default** |
| Periphery | Generated bindings for the registry products only, not the full corpus |
| Flutter | `FeedTicker` widget + `FtsoFeedStream` |
| Parity | 8 of the 13 guide programs — all the ones needing no signing |

Read-only. **Zero signing stack.** The majority of the on-chain surface is view/pure and FTSO reads cost 0 wei, so this is the fastest path to a live, moving, screenshot-worthy demo.

**v0.5 — "Transact on Flare" (~3–4 more weeks)**

`FlareSigner` + `FlareLocalSigner` (vendored `secp256k1_ecdsa`) + `IsolateSigner`; tx builder on `on_chain` (EIP-1559 type-2, required `chainId`, nonce management); `FlareDefaultFeeStrategy`; `SecureKeystore` (Keychain/Keystore + biometric gate); Reown signer + Flare chain presets (Reown ships none); WNat wrap/unwrap, FTSO delegation, reward claiming, ERC-20; EIP-712 via `on_chain` for the gasless USDT0 / EIP-3009 path; remaining 5 parity programs; full binding generation.

**v1.0 — "FDC + FAssets reads" (~4–6 more weeks)**

`DaLayerClient` (10 endpoints); `VerifierClient` (one generic method over the 4×9×7 grid); `FdcClient.requestAttestation()` with automatic `getRequestFee`; round arithmetic from `ProtocolsV2` at init; `waitForFinalization()` off `isFdcVotingRoundFinalized`; FAssets — all `IAssetManager` view functions plus redemption; Smart Accounts read path; type-level chain-support matrix.

**Explicitly out of scope, permanently:** P-chain staking, delegation, and C↔P transfers. Name the nine methods in the README.

### 4.5 Flutter-specific value-add

This is the answer to *"web3dart already accepts `chainId: 14`."* None of the following exists today.

- **`SecureKeystore`** on `flutter_secure_storage` 10.3.1 + `local_auth` 3.0.2 (requires Flutter ≥ 3.38.0 — declare that floor). iOS: `kSecAttrAccessibleWhenUnlockedThisDeviceOnly` + `kSecAccessControlBiometryCurrentSet`. Android: EncryptedSharedPreferences, StrongBox when available, `setUserAuthenticationRequired(true)`. `BiometricPolicy.requireOnEachUse` binds to the current biometric set, so enrolling a new fingerprint invalidates the key.
- **Flare chain presets for Reown** — verified absent from its 37 defaults.
- **`FtsoFeedStream`** — backpressure-aware, deduplicating, auto-reconnecting, multiplexing all feeds into one `fetchCurrentFeeds(uint256[])` call. Resolve `FeedId → index` from `FastUpdatesConfiguration` once at init; never hardcode. Pause on `AppLifecycleState.paused` — a ~2s poll in the background is a battery complaint and an RPC-ratelimit incident. Dedupe on the on-chain `timestamp`, not value equality.
- **`IsolateSigner`** — free, because `EthereumSigner`'s methods are already async. Falls through to inline on web (`kIsWeb`).

**Correction, and it removes a constraint:** an earlier finding that "Coston2's FastUpdater is static, so the live-ticker demo must target mainnet" is **false**. Re-measured, Coston2's FastUpdater at `0x0B162CA3acf3482d3357972e12d794434085D839` produced 6 value changes over ~25s sampled directly, and `FtsoV2.getFeedsById` on Coston2 gave 8 changes over ~26s (mainnet: 8 and 11 respectively) `[V]`. The original 3-second observation window was simply too short — updates are ~2–3s apart. **Drop the `network != flare` warning.** Either network works for the demo.

### 4.6 Platform matrix

| Target | Status |
|---|---|
| Android / iOS | **Full.** Pure Dart, no platform channels, no native build step |
| Flutter Web | **Full for RPC/FTSO/FDC/signing.** WalletConnect **unavailable** — `reown_appkit` is tagged android/ios only, and has had no release since 2026-02-19. Fall back to injected provider via `package:web` (a different code path — test it, do not assume it) |
| macOS / Windows / Linux | Core works; `flutter_secure_storage` covers desktop; `local_auth` is Android/iOS/Windows only |
| Dart server / CLI | Core only. `blockchain_utils` reportedly requires the browser `self` global and throws under bare Node `[S — reproduce before documenting]`. Harmless in browsers; breaks Node-based CI and SSR. **Test web bundles in headless Chrome, never Node** |

**Recommendation: drop Flutter Web as a v1 target.** There is no wallet path there anyway, and dropping it removes the entire `secp256k1_ecdsa` performance argument from the critical path.

### 4.7 Reference app — `flare_pulse`

Four screens, ~2,500 LOC, each existing to prove one claim.

1. **Pulse.** FTSO feeds — FLR/USD, BTC/USD, XRP/USD, ETH/USD — each row a price, a sparkline, a flash on change. Proves registry resolution, ABI decode, `bytes21` feed IDs, correct signed `int8` decimals across three different scales, and the stream. **This is the screenshot, and it is a video, not a still.**
2. **Wallet.** Generate/import → `SecureKeystore` → biometric unlock → FLR + WFLR balance → wrap/unwrap on Coston2. Proves keystore, biometrics, isolate signing, EIP-1559 fees against the real 150 gwei tip, non-defaulted `chainId: 114`.
3. **Connect.** Reown modal with Flare/Coston2 registered as custom networks. Visibly demonstrates that Flare is absent from Reown's defaults until the SDK adds it.
4. **Proof.** (a) Fetch FLR/USD from the DA Layer with its Merkle proof and verify on-chain. (b) Paste an XRPL address → one `eth_call` → show the derived Flare Smart Account address.

Ship as an APK, a TestFlight build, **and a hosted web build** so a reviewer can click a link and watch prices move.

### 4.8 Testing and CI

**Unit (offline, hermetic):** ABI round-trip against captured `eth_call` fixtures; feed-ID vectors per category byte; signer cross-check against `on_chain`'s reference at the digest level (the regression guard on the swap); EIP-712 against the canonical vector; fee strategy against recorded `eth_feeHistory` payloads with an explicit never-1-gwei assertion; negative tests (bad checksum must throw; omitted `chainId` must not compile); the `lib/` public-surface hygiene test.

**Golden ABI tests — the guard on the codegen bot:** every generated function asserts `keccak256(canonicalSignature)[0..4] == literal`; snapshot goldens; registry coverage assertions; and a **semantic diff gate** that fails a bot PR if a selector changed on an existing function name (a breaking on-chain change needs a human and a major bump).

**Integration:** Coston2 tagged and run on merge + nightly, with one funded key in secrets (Coston2 FDC costs 1,000 wei, so ten thousand test attestations cost effectively nothing). **Mainnet read-only nightly**, asserting the FTSO stream emits ≥3 distinct timestamps in 20s — that guards the flagship demo against silent breakage.

**CI matrix:** analyze (`--fatal-infos`, `format --set-exit-if-changed`); unit across Dart 3.8/stable/beta × ubuntu/macos/windows; **compile-targets** (`dart compile js`, `wasm`, `exe`) — mechanically enforcing the "pure Dart, no FFI" claim; **web-runtime in headless Chrome, not Node**; Flutter builds (apk, web, ios --no-codesign); periphery goldens; `pub publish --dry-run` on all four packages.

---

## 5. Cost model

**Assumptions:** engineer-day = 6 focused hours. Zero ramp-up on Dart/Flutter/pub.dev (verified: Dart 3.12.2 active, publishing credentials configured, packages already shipped). Flare protocol ramp-up priced into the FTSO/FDC modules. Contingency +30% minimal, +35% standard, +50% for anything with no prior art.

**All effort figures below are estimates `[E]`/`[D]`.** The TypeScript LOC inputs they derive from are independently confirmed accurate, so the derivation base is sound, but the TS→Dart multiplier and day-per-LOC rates are judgment.

### 5.1 Build effort

| Tier | Scope | Eng-days | Range | Solo @5d/wk | Solo @3d/wk |
|---|---|---:|---:|---:|---:|
| **PREVIEW** | Core + registry + FTSO + DA Layer + ~6 parity programs + draft guide | **23** | 18–30 | 5 wk | 8 wk |
| **MINIMAL** | Full Go/Python/Rust parity: 13 programs, signing, fees, hand-written core bindings, guide | **34** | 27–44 | 7 wk | 11 wk |
| **STANDARD** | C-chain complete: codegen, FDC client, FAssets reads + redeem, keystore, Reown, EIP-712, ref app, docs | **114** | 88–148 | 23 wk | 38 wk |
| **AMBITIOUS** | + XRPL/FAssets minting + Smart Accounts writes + **P-chain** | **225** | 165–300 | 45 wk | 75 wk |

Sanity check on MINIMAL: ~2,300 LOC (SDK + examples) ÷ 34 days ≈ 68 LOC/day including tests and docs. Conservative-to-normal for library code.

**Honest flag on the stated availability.** "The next couple of weeks of focused work" at an aggressive 10 h/day × 14 days = 140 h = **~23 engineer-days = 68% of MINIMAL**. That is enough for a credible public preview, **not** a complete v1. Scope and communicate it as a preview, and name the remaining ~11 days.

### 5.2 P-chain, priced separately so the decision is visible

| Component | Eng-days | TS LOC being ported |
|---|---:|---:|
| Avalanche linear codec + serializable types | 15 | ~4,333 |
| UTXO handling, spend reducers, coin selection | 8 | ~925 |
| **Etna/ACP-103 4-dim fee complexity — must byte-match AvalancheGo** | 12 | ~772 |
| etna-builder + PVM/EVM atomic tx builders | 14 | 1,828 in `builder.ts` alone |
| EIP-191 credential signing (Flare divergence) + pubkey recovery | 3 | — |
| Port flarejs golden vectors | 8 | 1,834 of tests |
| Subtotal | 60 | |
| Contingency +50% (no Dart prior art anywhere) | 30 | |
| **P-chain total** | **~90–111** | **≈ 5 months solo** |

For **0.05% of addresses**, with a permanent upgrade treadmill. This is the single clearest scope decision in the project.

### 5.3 Second developer

| Tier | Parallelism | 1 dev | 2 dev | Total eng-days |
|---|---|---:|---:|---:|
| MINIMAL | Poor — one coherent unit | 7 wk | 6 wk (1.2×) | 34 → 41 (+20%) |
| STANDARD | Good — seams at codegen / FDC / FAssets / app / docs | 23 wk | 14 wk (1.6×) | 114 → 137 (+20%) |
| AMBITIOUS | Poor — byte-exact fee math is indivisible | 45 wk | 32 wk (1.4×) | 225 → 281 (+25%) |

A second developer is **only worth it at STANDARD**.

### 5.4 Hard costs — essentially zero

| Item | MINIMAL | STANDARD | AMBITIOUS |
|---|---:|---:|---:|
| Coston2 testnet gas (faucet free, FDC = 1,000 wei) | $0 | $0 | $0 |
| Mainnet validation gas (~200 txs + ~20 attestations) | ~$5 | ~$25 | ~$60 |
| CI (GitHub Actions, public repo) | $0 | $0 | $0 |
| pub.dev publishing | $0 | $0 | $0 |
| Docs hosting (GitHub Pages + dartdoc) | $0 | $0 | $0 |
| Custom domain (optional) | $0 | $15 | $15 |
| Apple Developer (only if TestFlight) | $0 | $99 | $99 |
| **Total** | **~$5** | **~$140** | **~$175** |

**This project is 100% labour.** There is no infrastructure, tooling, or licensing cost to argue about.

**Audit:** $0 if the SDK is non-custodial (signing delegated to Reown/WalletConnect). If it custodies keys, the risk concentrates in one place — `secp256k1_ecdsa` 0.6.3, for which **no published third-party cryptographic audit was found**, and whose constant-time behaviour and side-channel resistance were **not** verified. (Absence of a found audit is not proof none exists — frame it as "no audit report located", never as "unaudited".) A scoped review of the ~1,000-LOC signing path is $5k–15k at mid-tier firms; Trail of Bits is reported at ~$25k/engineer-week `[U — corroborated only by secondary sources citing an ARDC filing, not by trailofbits.com]`. Full protocol-audit benchmarks ($80k–200k) are the wrong comparison for a client library.

**Recommendation: ship v1 non-custodial and make "delegate signing" an explicit architectural decision, not an omission.**

### 5.5 Maintenance — measured, not guessed

| Driver | h/month | Basis |
|---|---:|---|
| ABI drift — core surface (FTSO/FDC/registry) | 0.5–1 | Measured **zero** change across 4 releases / 2 months |
| ABI drift — FAssets surface (only if in scope) | 3–6 | 5 contracts changed in the same window |
| Consensus upgrades (~2/yr) | 2–4 | Amortised |
| Dart/Flutter SDK churn | 2–3 | Quarterly stables |
| Dependency churn (`on_chain`, `blockchain_utils`, `secp256k1_ecdsa`, `xrpl_dart`) | 2–4 | Four small upstreams, two maintainers total |
| Issue triage + PR review | 3–8 | Scales with adoption |
| Releases, changelog, dartdoc | 1–2 | |

| Scope | h/month | Eng-days/yr |
|---|---:|---:|
| MINIMAL / STANDARD without FAssets | 11–22 | **22–44** |
| STANDARD with FAssets | 14–28 | 28–56 |
| AMBITIOUS with P-chain | 22–40 | 44–80 |

Upstream cadence for context: the artifacts package shipped **21 releases in 12 months, median 11-day gap**; `flare-tx-sdk` 8 releases, median 37 days.

**Scoping consequence: excluding FAssets cuts recurring maintenance by roughly a third. Excluding P-chain cuts it by roughly half — and P-chain never stops.**

### 5.6 Total

| Tier | Eng-days | Hard costs | @$250/d | @$600/d | @$1,200/d |
|---|---:|---:|---:|---:|---:|
| MINIMAL | 34 | $5 | $8,500 | $20,400 | $40,800 |
| STANDARD | 114 | $140 | $28,500 | $68,400 | $136,800 |
| AMBITIOUS | 225 | $175 | $56,250 | $135,000 | $270,000 |
| + maintenance yr 1 | 22–56 | — | $5,500–14,000 | $13,200–33,600 | $26,400–67,200 |

Rate columns are illustrative, not a proposed price. The observed market band for a chain-specific Dart SDK runs **$1,400 → $105,000** (see §7). STANDARD sits inside it.

---

## 6. The value case

### 6.1 What a Flutter developer faces today

Hand-rolled reference implementations were written and run to make these concrete: a 48-LOC FTSO reader returning FLR/USD = 0.00630057 and BTC/USD = 64315.42 (0.05% off CoinGecko — correct), and an 80-LOC FDC client producing a valid `abiEncodedRequest` and a round ID matching `getCurrentVotingEpochId` exactly `[S]`.

| # | Task | Today | With SDK | What the hours actually are |
|---:|---|---:|---:|---|
| 0 | Pick and validate an EVM stack | 8–16 h | 0 | web3dart is the default and carries three verified footguns (chainId→1, null-RLP crash, EIP-55 off) |
| 1 | Connect, chain ID, block number | 1 h | 0.1 h | |
| 2 | Resolve ContractRegistry | 2–3 h | 0.1 h | Find the address, hand-write the ABI fragment |
| 3 | FTSO feed read | 4–6 h | 0.2 h | Real cost is discovering the 21-byte encoding + decimals semantics |
| 4 | Correct Flare tx signing | 8–12 h | 0.3 h | The 1 gwei vs 150 gwei tip gap |
| 5 | Flutter Web signing performance | 8–16 h | 0 | Requires knowing `secp256k1_ecdsa` exists |
| 6 | ABI bindings for ~5 contracts | 6–10 h | 0 | Codegen is broken on current Dart — hand-write or downgrade to 2024 packages |
| 7 | FDC attestation client | 40–64 h | 0.5 h | Six-step async flow, 9 types, on-chain round math, DA polling with 429 backoff, proof structs |
| 8 | FAssets read + redeem | 24–40 h | 1 h | Large view surface |
| 9 | Flare fee strategy | 4–6 h | 0 | Neither library ships usable logic |
| 10 | Test infra vs Coston2 | 8–12 h | 2 h | |

| Persona | Today | With SDK | **Delta** |
|---|---:|---:|---:|
| **A** — price display only (0,1,2,3,10) | 19–32 h | 1.4 h | **≈ 24 h** |
| **B** — full dApp (0–7, 9, 10) | 89–146 h | 3.2 h | **≈ 114 h** |
| **C** — FAssets/XRPFi wallet (all + XRPL) | 129–210 h | ~6 h | **≈ 164 h** |

**Break-even in aggregate developer-hours:**

| Build tier | Cost (h) | vs Persona A | vs B | vs C |
|---|---:|---:|---:|---:|
| MINIMAL (204 h) | 204 | 9 devs | 2 devs | 1 dev |
| STANDARD (684 h) | 684 | 29 devs | **6 devs** | 4 devs |
| AMBITIOUS (1,350 h) | 1,350 | 56 devs | 12 devs | 8 devs |

**STANDARD repays its build cost once ~6 developers ship a real Flare Flutter dApp.**

Two caveats a funder will press on, and should: this is *time-saved* arithmetic, not revenue; and there is **zero recorded organic demand**. It is a supply-side bet and must be argued as one.

### 6.2 What Flare gains

**The one hard Flare-specific mobile datapoint.** Protos analysis of Flare Bridged XRP from launch (Sep 2025) through 2026-03-26: Flare *"averages fewer than 80 new users per day"*, median day **33**, over half of days under 50. On **2026-02-27**, coinciding with the **Xaman wallet integration**, new users **peaked above 2,000** — roughly 60× the median — then fell below 30 within two weeks. FAssets launch day drew 467 before dropping over 90% in a week. `[V]`

That is the most persuasive Flare-specific argument available, and it must be used honestly: **Xaman is React Native.** The claim is not "Flutter would have done it better." It is: *the one thing empirically proven to move Flare's user numbers is mobile wallet distribution, and the other half of the cross-platform mobile market currently has no documented path onto Flare at all.*

**Market context, with discipline about which numbers are safe:**
- Flutter: **1.5 million developers**, **#2 app development SDK on both the App Store and Google Play** (Google I/O 2026); ~30% of new iOS apps (Apptopia via Google Developers Blog, Dec 2024); `flutter/flutter` 178,009 stars vs `facebook/react-native` 126,266. `[V]`
- **Never cite "46% Flutter vs 35% React Native market share."** It traces to recycled 2023 Stack Overflow data via SEO blogs and cannot be sourced primarily. A reviewer who checks it discredits the whole document.
- Crypto is mobile-first in exactly the markets where Flutter is strongest: a16z State of Crypto 2025 — mobile wallet users at all-time highs, **+20% YoY**; **Argentina 16× increase over three years**; India, Nigeria, Colombia named fastest-growing. Chainalysis 2025 — Sub-Saharan Africa received **$205B+ on-chain** Jul-2024→Jun-2025, **+52% YoY**, with **over 8% of transferred value in sub-$10,000 transfers vs 6% globally**. `[V]`
- **Do not cite the "35 million mobile wallet MAU" figure** — it appears only in secondary summaries, not in a16z's own page. Concede the ceiling: ~40–70M active on-chain users, not 716M owners.
- **No source joins Flutter developer counts to those specific markets.** That link is currently asserted, not evidenced. Say so.

### 6.3 Runtime cost to end users

Gas medians below are author-computed from Blockscout and were **not independently reproduced** `[S]`; only the 21,000 native-transfer figure is protocol-fixed. Priced at 650 gwei, FLR = ~$0.0063. Note Blockscout's rolling average gas price was ~2× the `eth_gasPrice` reading the same day, so the USD column may understate.

| Operation | Gas | Protocol fee | **USD** |
|---|---:|---:|---:|
| **FTSO read (`eth_call`)** | 0 | 0 | **$0.0000** |
| Native FLR transfer | 21,000 | 0 | $0.0001 |
| ERC-20 approve | 46,241 | 0 | $0.0002 |
| WNat delegate | 172,549 | 0 | $0.0007 |
| WNat wrap | 237,204 | 0 | $0.0010 |
| RewardManager claim | 428,824 | 0 | $0.0018 |
| Smart Account `executeInstruction` | 587,790 | 0 | $0.0024 |
| FAssets `executeMinting` | 756,904 | 0 | $0.0031 |
| **FDC — ConfirmedBlockHeightExists** | 82,779 | **3 FLR** | **$0.019** |
| **FDC — other 8 types** | 84,210 | **20 FLR** | **$0.126** |

Two conclusions, the first robust to any plausible gas figure: **gas is not a design constraint on Flare** (everything non-FDC is under a third of a US cent), and **FDC is not free** — an app doing 1,000 attestations/month pays ~$126/month, and an SDK that calls `getRequestFee` automatically eliminates an entire class of failure.

### 6.4 Binary size — negligible

Compiled and measured, with key derivation, ABI encoding, EIP-1559 signing and XRPL serialisation exercised so tree-shaking could not elide them `[S]`:

| Target | Baseline | + EVM | Δ | + EVM + XRPL | Δ |
|---|---:|---:|---:|---:|---:|
| AOT arm64 | 6,389,200 | 7,226,432 | **+837 KB** | 7,850,224 | +1,461 KB |
| dart2js -O2 | 133,703 | 944,309 | +811 KB | 1,341,910 | +1,208 KB |
| dart2wasm | 117,680 | 580,071 | **+462 KB** | 822,635 | +705 KB |
| AOT gzipped | 2,647,493 | 3,034,296 | **+387 KB** | 3,292,850 | +645 KB |

~3% of a typical 15–25 MB Flutter release APK. dart2wasm is the cheapest target.

### 6.5 RPC cost at scale

| Profile | Monthly calls | Public RPC | Paid RPC (~$6/M) |
|---|---:|---:|---:|
| 1,000 MAU price app | 300,000 | $0 | ~$2 |
| 10,000 MAU | 3,000,000 | $0 (~1.16 req/s avg) | ~$18 |
| 100,000 MAU | 30,000,000 | $0 (~11.6 req/s avg) | ~$180 |

Paid RPC buys an SLA, not capacity, up to roughly six figures of MAU. **The DA Layer's 20-request unauthenticated budget is the real ceiling** — see §3.6.

---

## 7. Funding landscape

Ranked by expected value = P(success) × amount × speed. **Amounts are unpublished for the top Flare programs. Do not quote a Flare grant figure to anyone — none exists in public.**

| # | Avenue | Status | Amount | Deadline | P(success) | Fit |
|---:|---|---|---|---|---:|---|
| 1 | **Flare Summer Signal hackathon** | `[U]` — DoraHacks page is CAPTCHA-walled (HTTP 405 to fetch). **Confirm in a browser at dorahacks.io/hackathon/flaresummersignal/detail** | Reported $12,000 pool `[U]` | Reported 2026-08-14 `[U]` | ~35% place | Product tracks only — submit a **Flutter FXRP demo app**, not a library |
| 2 | **Flare Grants Program** | `[V]` open; Airtable form HTTP 200 | **Unpublished.** Only quantified figures are Google Cloud credits | Rolling; 7-stage process, months | ~15% cold / ~45% with a sponsor | Weaker than assumed — "Dev Tools" is a **stats block**, not a solicitation; page is written for companies; all featured grantees are DeFi protocols |
| 3 | **XRPL Commons "Glow" Wave #5** | `[V]` live | **Not published** — GitBook ask endpoint explicitly confirms no payout table. Shirt-sized S/M/L, paid in XRP | **2026-08-31** | ~40% if XRPL leg ships; ~5% for EVM-only | Strongest explicit "we fund SDKs" language found anywhere — but XRPL-scoped |
| 4 | **XAO DAO microgrants** | `[U]` — status, amounts and process could not be confirmed from a primary source. **Check xrpdao.vercel.app** | Unknown | Unknown | Unknown | The most SDK-friendly XRPL vehicle *if* live. One hour to check |
| 5 | **XRPL Grants / Accelerator** | `[V]` open, unified application | Accelerator reported up to $200K `[U — not stated on site]` | Rolling; new programming announced Oct 2026 | ~8% as a library / ~25% as a product | Stated priorities are DeFi, RWA, Payments, Trade Finance. **Tooling is not listed** |
| 6 | **Immunefi Flare bug bounty** | `[V]` live | Smart Contract Critical $250k max / $20k min; High $30k/$10k; Medium $5k; Low $1k | Rolling | — | Not a tooling grant. But reading FDC/FAssets contracts line-by-line is exactly the work that surfaces bounty-eligible bugs. Opportunistic byproduct, zero budgeted time |

### Ruled out — do not spend time here `[V]`

| Program | Why dead |
|---|---|
| Flare governance (FIP/STP/SIP) | **Flare Foundation is the sole Initiator** for all three proposal types. Token holders only vote. No community treasury. No Flare equivalent of RetroPGF |
| Flare Community Growth Grant | Up to $10k, but Round 1 closed Jul 2025, no Round 2 in 12+ months. All 11 recipients were events/translation/education — **zero tooling** |
| FAssets Incentive Program | 2,200,661,869 FLR, but targets TVL/liquidity across DEX/Lending/CDP/Yield. No tooling. Window ends Jul 2026. Page redirects builders to `/resources/grants` |
| Flare Developer Ambassadors | $1,000/mo + bonuses, but the only announcement is 2024-12-03 with a 4-week window. **19 months stale, dormant.** Never cite the stipend as current |
| "Flare Ignite" / Flare ecosystem VC fund / Flare retro-funding / Gitcoin-Superteam-Devfolio presence | No evidence any exists. `encode.club/flare-incubator` returns **404** |

### Precedent — the only defensible price anchors `[V]`

| Precedent | Amount | Outcome |
|---|---|---|
| **W3F → Polkadart** | **Approved for $105,000** — the sum of two applications: `Polkadart.md` (Level 3, $75,000, four milestones all marked Completed) + `polkadart_extension.md` (Level 2, $30,000). Say "approved for", not "paid" — these are application totals in the accepted-applications directory | 941 dl/mo, no human commit since 2026-02-08 |
| **TON Society → Dart/Flutter SDK for TON** | **$3,500** (issue #224, labeled Approved, closed 2023-07-17). Its stated case: *"there are no libraries to work with the TON blockchain using Dart/Flutter… Developing this SDK will attract more developers to the TON ecosystem"* | tonutils 309 dl/mo, abandoned 2024-09-12 |
| TON Society → Dart TON Connect | **$1,400** (issue #228) | darttonconnect 48 dl/mo |
| Cardano Catalyst Fund 9 → Flutter SDK | **$15,000 requested, "Did not finish (Cancelled)", only $3,188 distributed** | 48 dl/mo today |
| Sia Foundation → Dart/Flutter SDK | $10,000 requested, **not approved**, Inactive 2026-06-26 | — |
| Solana Foundation → Espresso Cash | Self-declared grantee; **amount never public**. Solana Mobile's own docs: *"The Solana Flutter SDK is a community-developed and maintained project and it is **not an official library**"* | 723 dl/mo |

**Observed band: $1,400 → $105,000.** A milestone-structured ask in the **$25k–$45k** range for EVM + FTSO + FDC + FAssets-reads, plus a **separately priced maintenance retainer**, sits defensibly inside it. Copy W3F's per-milestone format.

### Sequencing — this is the part people get wrong

Glow's eligibility page states verbatim: *"The work must not have been previously funded through Glow **or another program**."* It is also **retroactive** (last six months only) and **individuals only** (companies ineligible).

Therefore: **Glow closes 2026-08-31; a Flare grant takes months.** Ship the XRPL-facing work first and claim it from Glow. Then apply to Flare for the Flare-specific protocol work. **Scope them as disjoint deliverables in your own documentation** so neither funder pays for the other's work. Taking Flare money first for the whole SDK likely burns Glow eligibility for all of it. **Confirm the interaction directly with XRPL Commons before committing either way.**

---

## 8. Outreach plan

> **Verification caveat, and it is important.** The individuals and channels below are sourced from specific files in `flare-foundation/developer-hub` (`docs/authors.yml`, `.github/CODEOWNERS`, `.github/ISSUE_TEMPLATE/*.yml`) and from live API responses. **They were not re-confirmed as a contact path by the independent verification pass.** Open each cited file yourself and confirm the current contents before sending anything. Do not treat any name, email, or handle below as verified-for-outreach until you have looked at the source artifact on the day you send.

### 8.1 Ranked targets

**#1 — Kristaps Grinbergs · GitHub `@fassko` · X `@fassko` · `kristaps@flare.network`**
*(source: `docs/authors.yml` title `Dev Rel`; commit metadata `Kristaps Grinbergs <kristaps@flare.network>`)*

He is the target; everything else is secondary. He accounts for the large majority of recent developer-hub commits (89 of ~160 since 2026-04-01; 47 of 59 since 2026-07-01). **He personally created `flare-for-react-developers.mdx`** on 2026-01-28 — its frontmatter reads `authors: [fassko]` while every other language guide reads `authors: [dineshpinto]`. He is the only person who has added a new language guide in 2026, and he owns `flare-ai-skills` (81 of ~85 commits).

**The finding that shapes the pitch:** his GitHub bio reads *"Blockchain, **mobile** and fullstack developer."* His public repo language distribution is Swift 43, TypeScript 23, Solidity 6, JavaScript 3 — and **zero Dart**. Flare's most active DevRel engineer is a native mobile engineer with no mobile-native path onto his own chain to point developers at. He is also currently building mobile-shaped Flare demos (`flare-fdc-miniapp`, `fdc-demo-dapp`, `fassets-demo-dapp`, `flare-smart-accounts`).

Channel order: X DM → email after 5 days → Discord.

**#2 — Dinesh Pinto · GitHub `@dineshpinto` · X `@dineshkpinto`**
*(source: `authors.yml` title `Technical Product Lead`; `.github/ISSUE_TEMPLATE/feature_request.yml` contains `assignees: - dineshpinto`)*

Every feature request auto-routes to him. He authored the original guide series (`flare-for-{javascript,python,rust,go}-developers.mdx` all carry `authors: [dineshpinto]`) — the architectural owner of the pattern you are extending. **Filing a `[feat]:` issue is a zero-cost, guaranteed-delivery channel that cannot be ignored the way a DM can.** No developer-hub commits since 2026-04-01, so he is triage/architecture, not merge.

**#3 — Discord `#🔶│𝘉𝘜𝘐𝘓𝘋ers-only💪🏻`** — `discord.com/invite/flarenetwork`, resolved via Discord API v10: guild "Flare Network", **~46,200 members**. This exact channel is named in Flare's own `.github/ISSUE_TEMPLATE/config.yml` as the sanctioned developer channel. Use for warm-up and for resolving the open questions in §13. **Not for the partnership ask** — too noisy.

**#4 — Víctor Muñoz · `@TheVictorMunoz` · X `@0xQuantic`** — GitHub `company: @flare-foundation`, bio "DevRel Specialist". He landed an external-style docs PR himself (#701, gasless USDT0, merged 2025-05-20) and contributed the `flare-fce` skill. Public focus is Smart Accounts and Xaman — i.e. mobile XRPFi. **Best warm intro after fassko**, and the most natural amplifier for a Flutter FXRP demo.

**#5 — Nik Erzetič · `nik.erzetic@flare.network`** — `.github/CODEOWNERS` is a single line: `* nik.erzetic@flare.network filip.koprivec@flare.network`. He is the working reviewer who must approve your PR; he will appear automatically. **Do not email cold.** Note he commits under both `@flare.network` and `@aflabs.com` (a Slovenian contractor) — unresolved whether staff or contractor, which affects whether he can commit resources.

**#6 — Filip Koprivec · `filip.koprivec@flare.network`** — `authors.yml` title `Head of Dev Rel`. Second CODEOWNER, ~2 commits in 120 days. The approval/budget layer. **Email only after fassko engages**, or cc on a grant-scale proposal. Cold-emailing him first wastes your one shot.

**#7 — Flare Africa** — `flareafrica.xyz` live; GitHub org `Flare-Africa-Community`; a named Community Growth Grant recipient (Sept 2025) whose remit **explicitly included building FTSO/FAssets starter kits and hosting Dev Hours**. It accepts open Markdown contributions. For a Nigeria-based mobile engineer this is the cheapest route to a **sponsored rather than cold** grant application, and it converts the mobile-first-emerging-market argument from assertion into demonstrated relationship.

**Do not contact:** Uttam Singh (`@Uttam-Singhh`) — still listed in `authors.yml` as "Dev Rel Lead" but his GitHub reads *"Sr. DevRel Eng @alchemyplatform, Prev @0xPolygon, @flare-foundation"*, no Flare activity since mid-2024. Contacting him signals zero research. (Corollary: the Dev Rel Lead title is vacant — which is *why* fassko carries the load, and why there is room for an outsider.) Also avoid `swarna1101` (no org activity since May 2025); `forum.flare.network` (Discourse `categories.json` shows two categories, "General" with **4 topics** — dead); and `@FlareDevs` on X (**unconfirmed, may not exist** — an HTTP 200 from x.com is not proof given the login wall). Verify Luka Avbreht's handle before use: `authors.yml` points at `AvbrehtLuka` which 404s; the committing account is `LukaAvbreht`.

### 8.2 The wedge strategy

Three facts make a cold grant application close to worthless and a merged PR close to decisive:

1. **Flare has never funded a community-built language SDK.** All guides and SDKs are in-house. You are arguing for a first, and firsts go to known quantities.
2. **You cannot manufacture demand evidence** — it does not exist. The only credible way to supply it is to *be* the demand, visibly, in their repo.
3. **Flare's in-house SDK capacity is genuinely thin** (~507 npm downloads/month, 3 stars, 3 contributors, no substantive commit since January). You are not competing with a resourced internal effort — but they will question ROI, so **lead with the guide (cheap for them, high visibility) rather than asking them to adopt and maintain an SDK.**

**The caveat that determines order.** developer-hub has open community PRs aging badly: #1428 (2026-06-15), #1429 (2026-06-19), #1401 (2026-05-21), #731 (**open since 2025-07-04**). Of the ~100 most recently merged PRs, authorship was fassko 19, nikerzetic 3, nobody else. **CONTRIBUTING.md states the fix itself: "Discuss large changes first."**

**Order: issue first → DM second → PR third. Never PR-first.**

### 8.3 The ladder

**Rung 0 (~30 min) — the free warm-up PR.** Add the SDK to `src/features/DeveloperTools/developer-tools.json`, "Wallet SDKs" category — currently populated entirely by third-party vendors (Turnkey, Wagmi, MetaMask Embedded Wallets, Etherspot ×2, Dfns, RainbowKit). Each entry is `{name, link}` plus a one-line description. External-contributor precedent exists: PR #1181 (Envio → Indexers), opened 2026-02-05, merged 2026-02-15. Do this **after** the package is on pub.dev so the link resolves, and as a **separate PR** from the guide (CONTRIBUTING.md: one logical change per PR).

**Rung 1 — `flare-ai-skills`.** 19 stars, 0 open issues, six existing skills, fassko owns ~95% of commits. CONTRIBUTING.md gives an explicit recipe: `skills/flare-<name>-skill/` with `SKILL.md` and `reference.md`. A `flare-dart-skill` is a ~2-hour PR landing directly in fassko's queue with zero contention. **It also mandates: "If you are using any kind of AI assistance to contribute to this project, it must be disclosed in the pull request." Disclose it.** Non-disclosure here is a relationship-ending mistake with exactly the person you most need.

**Rung 2 — the language guide PR.** Contents:

**A. `docs/network/guides/flare-for-dart-developers.mdx`** — frontmatter matching the existing pattern exactly:
```yaml
---
slug: flare-for-dart-developers
title: Flare for Dart Devs
authors: [<your authors.yml key>]
tags: [dart, flutter, quickstart, solidity]
description: Learn how to interact with Flare using Dart and Flutter.
keywords: [dart, flutter, quickstart, solidity, smart-contract, flare-network]
sidebar_position: 6
---
```
`sidebar_position: 6` is correct — verified positions are JavaScript 2, Python 3, React 3, Rust 4, Go 5. (Python and React collide at 3; **do not "fix" that** in your PR.)

Body imports Docusaurus components and — critically — **never pastes code inline**. It uses `!!raw-loader!` imports from `/examples/`, so guide and runnable examples cannot drift. Match the `<Tabs>/<TabItem>` toolchain-install block and the `:::tip` admonition pointing at `developer-hub/examples`.

**B. `examples/developer-hub-dart/`** — a real Dart package mirroring the Go/Python/Rust layout with per-network subdirectories (`coston/`, `coston2/`, `flare/`, `songbird/`), covering the 13 canonical programs.

**C. `docs/network/guides/overview.mdx`** — one `DocCardList` entry after React, plus `dart`/`flutter` in that file's `keywords`.

**D. `docs/authors.yml`** — your entry, matching the existing shape.

**E. Process:** branch `docs/flare-for-dart-developers`; **Conventional Commits required** (`docs(network): add Flare for Dart developers guide`); CI green before requesting review.

**Rung 3 — the grant conversation**, only after something is merged.

---

## 9. The pitch

### One-liner

> Flare publishes official developer guides for JavaScript, React, Python, Rust and Go — but not for Dart, so the 1.5 million developers building on Flutter, the #2 app SDK on both app stores, have no documented path onto the chain whose largest single-day user acquisition event came from a mobile wallet integration.

### The narrative, in the order it should be told

1. **The gap, with the file path.** `docs/network/guides/` has five languages and no Dart. `org:flare-foundation` returns zero results for `flutter`. Every existing guide points at a third-party library — Flare maintains no per-language SDKs, so this is additive.
2. **Why Flare specifically.** FTSO block-latency feeds update every ~2 seconds and reads are **free** — a Flutter price ticker on Flare is a `StreamBuilder` over a zero-cost `eth_call` with no signing stack, no wallet, no gas. That is the cheapest "hello world" any chain can offer a mobile developer, and there is no Dart code anywhere that does it. Then FAssets ties Flare to XRPL's retail base, which is mobile-first by construction.
3. **The one hard datapoint.** The Xaman integration: >2,000 new users on 2026-02-27 against a median of 33. Concede immediately that Xaman is React Native, and make the actual claim: *the SDK lowers the cost for the next mobile integrator.*
4. **The deliverable, precisely scoped.** Not "a Dart SDK." An **FTSO and FDC client for Dart**, where the EVM layer is a dependency, plus the sixth language guide, plus a code generator that keeps bindings current by bot.
5. **The credibility paragraph** — see below.
6. **The gaps, named unprompted.** P-chain, FAssets minting, Flutter Web wallet connect. Naming them reads as engineering judgment.

### The credibility paragraph

> I am a mobile engineer who ports blockchain SDKs to Dart. Published on pub.dev: `coral_xyz`, a universal Dart client for Solana programs with dynamic IDL-based interaction (9 releases since July 2025); `coral_xyz_codegen`, which generates typed Dart clients from IDL files via build_runner; `dartus`, a Dart SDK for Walrus decentralized blob storage (5 releases since January 2026, 150/160 pub points); `tld_parser` for AllDomains name resolution; and `jupiter`, a type-safe Dart client for the Jupiter Ultra API with Solana transaction signing. Also two Godot Solana SDKs.
>
> The specific reason this matters for Flare: the only ABI code generator for the incumbent Dart EVM library, `web3dart_builders`, **cannot resolve on current Dart** — its dependency chain reaches `analyzer ^6.9.0 → macros → _macros`, a package no longer shipped in the SDK (matching its open issue #159). So typed contract bindings for FTSO, FDC and FAssets require a generator that does not currently exist in the Dart ecosystem. **I have already built that exact thing once, for Anchor IDLs, and shipped it.** That is the hardest part of this project and the part I have the most direct evidence of being able to do.

### Objection handling

**1. "web3dart already works on Flare. Why fund anything?"**
*Correct, and it kills a naively-scoped proposal.* `sendTransaction(..., {int? chainId = 1})` takes any int; EIP-155 is applied generically. Basic Flare EVM access works today.
**Rebuttal:** Then don't fund basic EVM access. Reading an FTSO feed is one ABI call. An FDC attestation is six asynchronous steps with a **20 FLR payable fee** that reverts if omitted and round arithmetic that Flare's own TypeScript example gets wrong on mainnet by 45 seconds. Plus FAssets mint/redeem, plus Smart Accounts. Layered **on top of** the existing Dart stack.

**2. "Reown already connects Flutter wallets to any EVM chain."**
*Also correct, and stronger than most people realise.* `addSupportedNetworks` is public; Flare is ~10 lines of config away.
**Rebuttal:** Connect-and-sign is solved. Flare's *enshrined protocols* are not, in any language other than the five Flare already documents. Also note Reown's Flutter packages are android/iOS only and have had no release since 2026-02-19 — so Flutter Web has no wallet path at all, which is a gap the SDK does not close and should not claim to.

**3. "You fund an SDK and it rots."**
*The real underwriting risk, and the data is against us.* Polkadart: approved for $105,000, 941 dl/mo, no human commit since 2026-02-08. tonutils: $3,500, abandoned 2024-09-12.
**Rebuttal:** Pre-empt it. The one healthy chain-specific Dart SDK — Soneso's `stellar_flutter_sdk`, 249 commits spread across all 12 months — is the one with *ongoing* rather than one-off funding. So structure the ask as **milestone delivery plus a maintenance retainer tied to published metrics**: downloads/month, guide parity maintained after each Flare consensus upgrade, time-to-support for new FDC attestation types. Then add the structural answer: **the codegen bot means the bindings stay current even during a quiet month.** *(Confirm before citing: the "Stellar Public Goods Program" funding mechanism could not be located in Soneso's repo, GitHub org, or on stellar.org's grants page. The commit cadence is verified; the funding behind it is not. Quote the cadence only.)*

**4. "Nobody is asking for this."**
*Correct.* Zero issues, zero code hits, zero forum threads.
**Rebuttal:** Don't claim demand. Use the funders' own logic. TON Society's approved issue #224 states verbatim: *"there are no libraries to work with the TON blockchain using Dart/Flutter… Developing this SDK will attract more developers to the TON ecosystem."* W3F funded Polkadart on identical reasoning. Language SDKs are not built in response to demand from a language's developers — they are built to make those developers reachable. Then land the Xaman number.

**5. "There is already a Flare Flutter SDK."**
**Name it first; never let a reviewer discover it.** `flare_flutter_sdk` v0.0.1-dev, published 2026-07-28, describing itself as *"The first native Flutter/Dart SDK for the Flare network."*
**Rebuttal, from verified data:** repo created 2026-07-27, **31 KB, ~15 commits, 0 stars, 0 forks**, no push since 2026-07-28, and its own CHANGELOG says *"Scaffold phase complete… No functional API yet, every public method is an intentional UnimplementedError skeleton."* All five roadmap milestones "Planned." Funding: Buy Me a Coffee. The same publisher shipped `avalanche_flutter_sdk` (2026-07-24) and `xrpl_flutter_sdk` (2026-07-30) — three packages in seven days, a template-driven multi-chain strategy. Then make the argument *for* funding: **a 31 KB skeleton with a tip jar is precisely what an unfunded SDK produces.** And note the corroboration — their roadmap also lists P-chain only as address derivation, never transactions.
*(Unresolved: whether they have already approached Flare. Check their public channels before applying — "uniqueness" is Flare's #1 criterion.)*

**6. "An unfunded individual already built the Dart crypto stack."**
`mrtnetwork` maintains 15 Dart blockchain repos single-handedly, unfunded.
**Rebuttal:** That is an argument *for* the budget, not against it — cryptography, signing and EVM primitives are **solved dependencies**, which is exactly why this is a 4–6 week protocol-layer build and not a from-scratch one. That *shrinks* the credible ask. What money buys is not feasibility; it is the maintenance commitment across Flare's twice-yearly consensus upgrades — precisely where every unfunded comparable died.

**7. "What adoption will this get?"**
**Do not promise thousands.** Every chain-specific Dart SDK combined does ~6,000 dl/mo; dependent-package counts are single-digit even for the best-funded (polkadart 5, solana 10, stellar 7).
**Rebuttal:** Benchmarked against Polkadart *after $105k*, a credible target is hundreds of downloads/month and a handful of real integrations. Justify it on strategic optionality — one Flutter wallet or remittance app reaching Flare — plus the Xaman precedent. And note that organic discovery is unavailable because every "Flare Flutter" search resolves to Rive's animation library — **which is itself the argument that the developer-hub guide is the deliverable, because the guide is the distribution.**

---

## 10. Outreach message templates

### A. Short — X DM to `@fassko` (Discord equivalent: same text)

No emoji, no hype, one artifact, one narrow question.

> Kristaps — I built a Dart client for Flare over the last two weeks and wanted to check something with you before I go further.
>
> It resolves contracts through FlareContractRegistry at 0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019, reads FTSOv2 feeds by ID, and pulls anchor feeds with proofs from the DA Layer. Working Flutter demo showing a live FLR/USD ticker and a Smart Account address resolved from an XRPL address via MasterAccountController.getPersonalAccount: <60s video>. Package: pub.dev/packages/flare_network. Source: <repo>.
>
> I noticed docs/network/guides has JavaScript, React, Python, Rust and Go but no Dart, and you wrote the React one in January. I've drafted flare-for-dart-developers.mdx to match that template — same frontmatter, same raw-loader imports, examples/developer-hub-dart mirroring the Go and Python sets.
>
> I filed <issue link> per CONTRIBUTING.md before opening the PR. One question: should sidebar_position be 6, or would you rather I slot it elsewhere in the series?
>
> Background: I've shipped five Dart SDKs on pub.dev — coral_xyz (Solana/Anchor client + IDL codegen), dartus (Walrus), tld_parser, jupiter.

Why it works: opens with a shipped artifact, not a request; demonstrates you read CONTRIBUTING.md, authors.yml and the guide frontmatter; credits his own work; asks something answerable in one line; never mentions money.

### B. Long — email to `kristaps@flare.network`, cc `filip.koprivec@flare.network`

Send only after the DM or issue gets a response, or after five days of silence.

> **Subject: Dart/Flutter guide for developer-hub — draft PR ready, one scoping question**
>
> Kristaps, Filip —
>
> I'm a mobile engineer who ports blockchain SDKs to Dart. Over the last two weeks I built a Dart client for Flare and a draft `flare-for-dart-developers` guide for developer-hub. I'd like to check the scope before opening the PR, since CONTRIBUTING.md asks to discuss large changes first.
>
> **What exists today**
>
> `flare_network` on pub.dev: contract resolution via FlareContractRegistry (one hardcoded address, everything else resolved at runtime), FTSOv2 feed reads with the 21-byte feed ID encoding, feed configurations, RandomNumberV2, and a DA Layer client against the v1 endpoints with exponential backoff — the unauthenticated endpoint 429s after 20 requests, so backoff is on by default. It builds on `on_chain` 8.1.0 with the signer swapped to a vendored `secp256k1_ecdsa`, which is 25–40x faster than the pointycastle path with bit-identical RFC-6979 output. `chainId` is a required parameter with no default, and EIP-55 checksums are enforced at every entry point.
>
> Source: <repo> · Package: <pub.dev> · Flutter demo (60s): <video>
>
> **What the PR would contain**
>
> - `docs/network/guides/flare-for-dart-developers.mdx`, matching the Go and React guides: same frontmatter shape, `sidebar_position: 6`, Tabs/TabItem toolchain block, `!!raw-loader!` imports so the guide and examples cannot drift.
> - `examples/developer-hub-dart/` — the canonical program set: chain_id, block_number across four networks, create_account, deploy_contract, make_query, get_feed_id, ftsov2_consumer, ftsov2_config, secure_random, volatility_incentive, fetch_anchor_feeds, fetch_and_verify_anchor_onchain, fetch_abi. Per-network subdirectories matching the existing layout. (I noticed the Go, Python and Rust sets aren't quite identical — Python has compile_contract and fetch_abi and the others don't. Happy to match whichever you prefer as canonical.)
> - One `DocCardList` entry in `guides/overview.mdx` and an `authors.yml` entry.
>
> Separately, I've drafted a `flare-dart-skill` for flare-ai-skills following the SKILL.md/reference.md structure in its CONTRIBUTING.md. Disclosure per that file: I used AI assistance for research and drafting; the code and the protocol work are mine.
>
> **Scoping question**
>
> I've deliberately excluded P-chain from v1. The port target there isn't flare-tx-sdk but flarejs — roughly 8,600 LOC of TypeScript for the C↔P round trip, of which about 3,500 (the ACP-103 complexity accounting and spend reducers) has to match AvalancheGo byte-for-byte or transactions get rejected, and it would need re-verifying after each consensus upgrade. Against that, only 9 of the 77 public methods on flare-tx-sdk's Network class require the codec — 68 are reachable without it, and `claimStakingReward` is a plain C-chain EVM call, so a Dart app can still show stakes, validators, limits, and claim rewards. It just can't create a delegation.
>
> Does that match how you'd scope a first Dart release, or is P-chain parity a requirement?
>
> **Background**
>
> Five packages on pub.dev: `coral_xyz`, a universal Dart client for Solana programs with dynamic IDL-based interaction, 9 releases since July 2025; `coral_xyz_codegen`, which generates typed Dart clients from IDL files via build_runner; `dartus` for Walrus blob storage; `tld_parser`; `jupiter`. The codegen piece is directly relevant — `web3dart_builders`, the only ABI generator for the incumbent Dart EVM library, no longer resolves on current Dart because its dependency chain reaches the removed `_macros` package, so typed FTSO/FDC/FAssets bindings need a generator that doesn't currently exist in Dart. I've built that once already.
>
> I'm based in Nigeria and work primarily on mobile. Happy to present this at a Builder Workshop if that's useful.
>
> — <name> · github.com/<handle>

### C. Grants Airtable — the three fields that decide it

Submit **only after** the developer-hub PR is open (merged is better). Against Flare's published criteria:

- **Criterion 1 (uniqueness):** Name `flare_flutter_sdk` explicitly with its date, size, commit count, and its own CHANGELOG's "intentional UnimplementedError skeleton." Then state what yours does, with links to running code. **Never claim to be first.**
- **Criterion 4 (FTSO/FDC integration) — the pass/fail gate:** Do not describe this as an SDK with FTSO support. Describe it as an **FTSO and FDC client for Dart** where the EVM layer is a dependency. Lead with the six-step FDC flow, the 20 FLR fee handling, runtime round-ID computation, DA Layer proof retrieval.
- **Criterion 3 (go-to-market and milestones):** Milestones priced individually, W3F-style. **Add a maintenance retainer line with explicit metrics.** This is the answer to the decay objection and reviewers look for it whether or not they say so.

**State no Flare grant amount as if it were a known band.** Anchor your own number and justify it against the verified W3F line ($75,000 + $30,000) and the TON floor ($3,500 / $1,400).

---

## 11. Risks, kill criteria, and what to watch

### 11.1 Risk #1 — the proposer's own portfolio, and it is fixable in 30 minutes

**Likelihood a reviewer finds this: HIGH.** Criterion 5 is literally "previous blockchain development experience"; the first thing diligence does is open pub.dev.

The published record `[V]`:

| Package | Latest | Score | dl/30d | Likes | `repository:` field |
|---|---|---|---:|---:|---|
| `coral_xyz` | 1.0.0-**beta**.9 (2026-03-28) | 130/160 | 149 | 3 | live |
| `coral_xyz_codegen` | 1.0.0-beta.9 (2026-03-28) | 130/160 | 38 | 0 | live |
| `dartus` | 0.3.0 (2026-06-20) | 150/160 | 72 | 1 | live |
| `tld_parser` | 0.1.0 (2026-03-30) | 150/160 | 6 | 0 | **404 — dead link on the live package page** |
| `jupiter` | 1.0.1 (2025-08-05) | 140/160 | 16 | 2 | **404 — dead link on the live package page** |

Two further facts: no package has a **verified pub.dev publisher** (`publisherId: null` on all five), and the brief's stated name "jup_dart_sdk" is the *local directory*, not the published package — `pub.dev/api/packages/jup_dart_sdk` 404s. A reviewer who searches the stated name gets nothing and stops reading.

(Reports of the total public repo count differ — one source says 82, another 173. The proposer knows the real number; the point stands either way: **breadth is not the asset here, and framing it as one invites the "grant farmer" read**.)

**Actions, all before any outreach:**
1. Publish `jupiter` 1.0.2 and `tld_parser` 0.1.1 with working `repository:` fields. **30 minutes.** Leaving a 404 on your own published package is the cheapest possible unforced error.
2. Bring `coral_xyz` out of beta, or formally mark genuinely dormant packages discontinued on pub.dev. A deliberately discontinued package reads as judgment; a silently rotting one reads as abandonment.
3. Set up a **verified pub.dev publisher** on a domain you own. This converts five scattered uploads into one visible body of work and pre-empts the "single anonymous dev" objection.
4. **Reframe from "prolific" to "focused."** Lead with `coral_xyz_codegen` — the one artifact directly relevant to the hardest part of this project.

### 11.2 Dependency concentration

Your EVM core (`on_chain`), XRPL leg (`xrpl_dart`) and signer (`secp256k1_ecdsa`, inside the dormant polkadart monorepo) depend on **two individuals**. `[V]`

- **Likelihood of an upstream stall: MED. Impact: HIGH.**
- **Watch:** a Dart stable release that `secp256k1_ecdsa` gets no compatibility publish for within 60 days; polkadart being archived; `on_chain` going quiet.
- **Mitigate:** vendor `secp256k1_ecdsa` from day one (small, self-contained, license-permitted, plus your own golden vectors). Exact-pin `on_chain: 8.1.0` and `blockchain_utils: 7.1.0` — not `^` — commit `pubspec.lock` in the reference app, and keep a `lib/src/vendor/` escape hatch designed but **empty** until needed. Premature vendoring of `on_chain` forfeits upstream fixes; the contingency is the point, not the act.

### 11.3 Maintenance rot

Base rate is bad (§1). The specific failure mode is not just "stops getting commits" — it is "the package page actively misleads," which is already visible in the proposer's portfolio.

- **Watch:** 30 days with no commit; an unanswered issue past 14 days; a periphery release your bindings do not regenerate against within a week.
- **Mitigate:** (a) codegen + scheduled regeneration bot, so the SDK stays current during a quiet month; (b) **a dated support policy in the README** — *"Supported: FTSO reads, FDC client, registry resolution. Out of scope permanently: P-chain staking, delegation, C↔P transfers. Response: best-effort, 14 days. Reviewed quarterly."* Explicit non-goals are the cheapest anti-rot device; (c) vendor and pin.

### 11.4 Competitive

`flare_flutter_sdk` is weak and already stalling (31 KB, no push since 2026-07-28). **Likelihood they ship something real: LOW.** But the name claim matters, because uniqueness is Flare's #1 criterion.

**Likelihood Flare ships an official Dart SDK: LOW** — zero Dart in 92 repos, every guide points at third-party libraries, their own TS SDK has 3 stars.

**Likelihood AI codegen obsoletes hand-written SDKs: HIGH — and this is the strategically correct response, not a threat.** Flare already ships `flare-ai-skills`, an MCP server, and `llms-full.txt`. The ecosystem is optimizing for agents reading docs. **A generator plus a `flare-dart-skill` turns the obsolescence risk into the distribution channel.**

**Watch:** `nemorixgroup/flare-flutter-sdk`'s `pushed_at`; any `dart`/`flutter` string appearing in `org:flare-foundation`.

### 11.5 Relationship

- **Grant-farmer perception. Likelihood MED-HIGH, impact HIGH and irreversible.** Contribute before asking. Land the JSON PR and the skill first; arrive as a known contributor.
- **Wrong-person risk.** See the do-not-contact list in §8.1.
- **Over-promising scope. Likelihood HIGH.** The temptation is "full flare-tx-sdk parity." Nine methods need a codec no Dart library implements. **Publish the non-goals in the proposal itself.**
- **Silent stall.** Follow CONTRIBUTING.md: issue before PR. Offer a Builder Workshop guest slot — content he already needs is an easier yes than code review.

### 11.6 Kill criteria

Stop or pivot immediately if:

1. **Week 0** — the two dead `repository:` links are still 404ing when outreach goes out. You are handing a reviewer the counter-argument. A 30-minute fix skipped predicts everything else.
2. **Week 2** — ABI codegen is not producing compiling, analyzer-clean Dart from the periphery artifacts. Hundreds-to-1,500 functions cannot be hand-written and cannot be maintained through 10-weekly churn. **No generator = no project.**
3. **Week 2** — the ten-line Reown+Flare snippet, published as a gist and posted in `#BUILDers-only`, gets zero engagement, and neither fassko nor `@0xQuantic` replies. That is the demand test and the sponsor test in one, for one hour of work.
4. **Week 4** — no Flare-side human has engaged: no merged JSON PR, no issue response, no DM reply. Without an internal sponsor a cold grant application will not clear screening.
5. **Any point** — a second developer ships a working Flare Dart SDK with substantive commits. "Uniqueness" is gone; pivot to contributing there.
6. **Any point** — you find yourself scoping P-chain. Non-negotiable.
7. **Month 3** — under 5 downloads/week with zero external issues or integrations. Ship the guide, mark the package maintenance-only in its support policy, and stop **deliberately and publicly** — before it rots into another broken link.

**Explicitly not worth doing:** a general-purpose "Dart SDK for Flare" competing on EVM basics; P-chain in any version; Flutter Web as a v1 target (no wallet path exists there anyway, and dropping it removes the entire signer-performance risk from the critical path).

---

## 12. The next two weeks, day by day

**Day 1 — hygiene and the opening move (no Flare code yet).**
- Publish `jupiter` 1.0.2 and `tld_parser` 0.1.1 with fixed `repository:` fields.
- Set up a verified pub.dev publisher.
- Claim `flare_network` with a `0.0.1-dev` placeholder.
- File the developer-hub feature request: `[feat]: Add "Flare for Dart/Flutter developers" guide`, including the program parity list, and one explicit sentence — *"I will write this and open the PR; I am filing first per CONTRIBUTING.md."*
- Publish the ten-line Reown+Flare snippet as a gist and post it in `#BUILDers-only`. **This is the demand probe. Note the date; measure at day 14.**

**Days 2–3 — foundation.**
- `FlareClient`: JSON-RPC over http, batching, error taxonomy, retry/backoff.
- Network presets for chain IDs 14/114/19/16; block deserializer that ignores unknown keys.
- `ContractRegistry` resolver with cache; curate the 67 contracts down to a usable set.
- `chainId` required, `enforceEip55: true`, everywhere.

**Days 4–5 — the generator.**
- **Re-measure the ABI corpus yourself** (see §3.4) and reconcile the three counts.
- Fork `web3dart_builders` as a reference; retarget emission to `on_chain`'s ABI layer as a **standalone CLI**.
- Type mapper with the `int8`-must-be-`int` and `bytes21 → FeedId` special cases; filter `TestFtsoV2Interface`.
- Generate the registry-products subset only. Selector golden tests.

**Days 6–7 — FTSO + DA Layer (the criterion-4 deliverable).**
- `FeedId` codec with vectors for all five category bytes.
- `getFeedsById`, `getFeedConfigurations`, `calculateFeeById(s)`, `RandomNumberV2.getRandomNumber`.
- DA Layer client on v1 paths with **exponential backoff by default** and a bring-your-own-key hook.
- Populate the feed catalog at runtime from `anchor-feed-names`.
- **Publish `flare_network` 0.1.0.** Shipping beats polishing.

**Days 8–9 — the demo.**
- ~150-line Flutter app: live FTSO ticker (either network — Coston2 ticks fine) plus `MasterAccountController.getPersonalAccount(<xrpl address>)`.
- Record a 60-second screen capture. **This is the entire go-to-market asset** — it goes in the DM, the hackathon submission, the grant application and the guide.
- DM fassko, linking the issue and the video.

**Days 10–11 — parity examples.**
- The runnable program set in `examples/developer-hub-dart/` layout with per-network subdirectories. Prioritize the 11 needing no signing; add `create_account` and a minimal signing path if time allows.
- Open the `developer-tools.json` PR (separate, one logical change).

**Days 12–13 — the guide.**
- Write `flare-for-dart-developers.mdx` to the exact template: frontmatter, `sidebar_position: 6`, Tabs/TabItem, `!!raw-loader!` imports.
- `overview.mdx` DocCardList entry; `authors.yml` entry.
- Open the guide PR on branch `docs/flare-for-dart-developers` with a Conventional Commit.
- Open the `flare-ai-skills` PR **with AI-assistance disclosure**.

**Day 14 — decide.**
- Measure the demand probe from Day 1.
- If Summer Signal is confirmed live and open, submit the demo app (not the library).
- Evaluate against kill criteria 2, 3 and 4. If they hold, continue to v0.5. If not, ship the guide, publish the support policy, and stop cleanly.

---

## 13. Open questions to resolve directly with Flare

Ordered by how much they change the plan.

**Highest value**

1. **Which of Flare's 100 awarded grants were "Dev Tools," and what did they build?** Flare publishes the category label but no grantee list. This confirms or kills the tooling precedent outright. Ask on the Airtable form or via Flare Africa.
2. **Is P-chain parity a requirement for Flare to consider a Dart SDK complete?** This is the single largest fork in the estimate (~90–111 eng-days). Ask fassko directly.
3. **Does Flare intend to fund, endorse, or adopt a Dart SDK — or only accept the guide?** No public statement exists either way. It determines whether this is a portfolio artifact or a funded commitment.
4. **Does taking a Flare grant disqualify the same work from Glow?** Glow's *"or another program"* clause is unresolved and determines application sequencing. Ask XRPL Commons before either submission.

**Blocking specific decisions**

5. **Flare Summer Signal's real deadline, prize split, and whether a library submission is eligible.** The DoraHacks page is CAPTCHA-walled. **Open it in a browser today** — the reported 2026-08-14 date is 14 days out and search-aggregated only.
6. **Glow's Small/Medium/Large payout amounts.** Explicitly not published. Ask XRPL Commons before investing.
7. **XAO DAO's status, amounts and process.** Only secondary sources indicate it is live. Check `xrpdao.vercel.app`.
8. **The real rate limit on the DA Layer and on the public verifier key `00000000-0000-0000-0000-000000000000`.** Measured at 20 unauthenticated requests before 429, but the documented path to a higher limit is a manual GitHub issue. A mobile SDK shipping a shared key could throttle its entire user base. Ask for the process and the numbers.
9. **v0 vs v1 DA Layer paths.** The FDC getting-started guide uses `/api/v0/fdc/get-proof-round-id-bytes`; the OpenAPI spec documents v1. Both are live. Which is supported long-term, and is v0 scheduled for removal?
10. **Has `nemorixgroup` already approached Flare?** If they applied first, criterion 1 could block a second Dart application. Check their public channels before applying.

**Operational**

11. **Is the Developer Ambassadors Program running in 2026?** Only the 2024-12-03 announcement exists. One question in `#BUILDers-only` resolves it. **Never cite the $1,000/month figure as current until it does.**
12. **Does the Builder Online Workshop series still run, and how does one get a guest slot?** No authoritative 2026 schedule page could be fetched. Offering content he already needs is often an easier yes than a code contribution.
13. **Who reviews starter-kit and example PRs?** `0xreflexivity` is the top 2026 committer to `flare-hardhat-starter` (39 commits) with a blank GitHub profile. Do not guess — ask.
14. **Is `nikerzetic-aflabs` staff or an AFLabs contractor?** He commits under both addresses; it affects whether he can commit resources or only execute scoped work.
15. **Is FCC in scope for any future phase?** Flare's docs say it is not yet a fully public production system, but it is where their engineering attention currently is.

**Technical, to resolve by measurement rather than by asking**

16. **Reconcile the three ABI corpus counts** (372 / 740 / 1,540 functions across three different sources). This sets codegen scope.
17. **Re-verify the "Flare and Coston2 ABIs are byte-identical" finding.** It justifies the one-binding-set architecture.
18. **Re-measure dart2js signing performance in headless Chrome with warmup.** The native figures were inflated ~2–3×; the web figures are unverified and should not be quoted until re-run.
19. **Confirm `blockchain_utils`' `self`-global behaviour under Node**, since it drives the "headless Chrome, never Node" CI rule.
20. **Confirm `ReownAppKitModalNetworks.addSupportedNetworks` is public in the current release** — it is the crux of the strongest objection against the whole project, so verify it in source rather than trusting a summary.