# Ground Truth — Empirically Verified

Everything here was measured directly on this machine on **2026-07-31**, not inferred. Each entry
names the command that produced it so it can be re-run. Anything not verified this way is labelled
`[Inference]`, `[Speculation]`, or `[Unverified]` and must stay labelled downstream.

Re-verify before relying on any of it after **2026-10-31** (chain state and package versions drift).

---

## 1. ABI corpus — `@flarenetwork/flare-periphery-contract-artifacts@0.1.52`

> **Corrected 2026-07-31.** An earlier revision of this file reported 112
> contracts / 954 functions. That glob (`contracts/*/*.json`) only matched the
> flat top tier and silently missed 75 files nested under
> `contracts/{staking,utils,ftso,...}/interfaces/`. The recursive figures below
> are the correct ones, and they now agree with the independently-derived
> "187 contracts / 1,540 functions" from the earlier research pass.

Measured by walking every `*.json` under `<network>/artifacts/contracts/`.

| Network | Files | flat | nested | Functions | view/pure | state-changing | Events |
|---|---:|---:|---:|---:|---:|---:|---:|
| flare | **187** | 112 | 75 | **1,540** | 1,027 | 513 | 592 |
| coston2 | **187** | 112 | 75 | **1,540** | 1,027 | 513 | 592 |
| songbird | **174** | 105 | 69 | **1,455** | 969 | 486 | 565 |
| coston | **174** | 105 | 69 | **1,455** | 969 | 486 | 565 |

Roughly two-thirds of the surface (1,027 of 1,540) is `view`/`pure`, which is
why a read-only SDK covers most of what a client actually needs and requires no
signing stack at all.

**Two ABI sets, not four.** Verified by SHA-256 over sorted ABI JSON per contract:

- `flare` ≡ `coston2` — identical key sets, **0 differing ABIs**
- `songbird` ≡ `coston` — byte-identical
- `flare` has exactly **7** contracts absent from `songbird`, and all 7 are P-chain surface:
  `IAddressBinder`, `IDistributionToDelegators`, `IPChainStakeMirror`,
  `IPChainStakeMirrorMultiSigVoting`, `IPChainStakeMirrorVerifier`, `IPChainVotePower`,
  `IValidatorRegistry`

**Codegen consequence:** emit two binding sets (`mainnet-class`, `canary-class`) with a network flag,
not four trees. The 7 P-chain-only contracts fall outside the supported surface anyway.

**Artifact shape:** every JSON file is a **bare ABI array**, never a Hardhat `{abi, bytecode}` object.
A parser expecting `.abi` will fail on all 112 files.

## 2. Registry products map — `dist/index.js`

- `FlareContractRegistryAddress` = `0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019`
- Products per network: **flare 40, coston2 40, songbird 38, coston 38**
- Each product: `{name, interface, registry, abi}`

**The `FtsoV2` collision is real** — two distinct products claim the same `registry` key:

```
FtsoV2      interface=FtsoV2Interface       registry="FtsoV2"
TestFtsoV2  interface=TestFtsoV2Interface   registry="FtsoV2"
```

Resolving by registry name alone is ambiguous. The generator must select on `name`, not `registry`,
or `TestFtsoV2` can silently win.

Deprecated V1 contracts are still present in the products map (`FtsoManager`, `FtsoRegistry`, …).
Curate the exposed surface; do not re-export all 40.

## 3. Live chain verification — Coston2

```
RPC   https://coston2-api.flare.network/ext/C/rpc
eth_chainId -> 0x72  (114)
```

Resolved through the registry with `cast`:

| Name | Address | Note |
|---|---|---|
| `WNat` | `0xC67DCE33D7A8efA5FfEB961899C73fe01bCe9273` | **Matches** the address in `make_query_coston2.py`'s comment |
| `FtsoV2` | `0xC4e9c78EA53db782E28f28Fdf80BaF59336B304d` | ⚠️ Flare's own `ftsov2_consumer_coston2.py` **hardcodes `0x3d893C53D9e8056135C26C8c638B76C8b60Df726`, which is stale** |

That stale constant is the concrete justification for the never-hardcode rule: Flare's own published
example is already wrong.

Selectors (`cast sig`): `getFeedsById(bytes21[])` = `0x4c375745` ·
`getContractAddressByName(string)` = `0x82760fca`

## 4. FTSO feed IDs and the decimals hazard

Derivation, mirroring `get_feed_id.py` exactly — `category_hex + utf8_hex(name)`, right-padded with
`0` to 42 hex chars (21 bytes):

```
FLR/USD  0x01464c522f55534400000000000000000000000000
BTC/USD  0x014254432f55534400000000000000000000000000
ETH/USD  0x014554482f55534400000000000000000000000000
XRP/USD  0x015852502f55534400000000000000000000000000
```

Live `getFeedsById(bytes21[]) → (uint256[] values, int8[] decimals, uint64 timestamp)`:

| Feed | Raw value | Decimals | Real value |
|---|---:|---:|---|
| FLR/USD | 626025 | **8** | $0.00626025 |
| BTC/USD | 6293157 | **2** | $62,931.57 |
| XRP/USD | 1061895 | **6** | $1.061895 |

**Decimals differ per feed and must never be assumed.** Three feeds returned three different scales
in a single call. The API must always return value and decimals together, and `decimals` is `int8` —
**signed**, so it maps to Dart `int`, never `BigInt`.

`getFeedsById` is declared `payable` but is callable via `eth_call` at zero cost.

## 5. Reference program set (parity bar)

From `flare-foundation/developer-hub` `examples/`:

| Language | Programs | Notes |
|---|---:|---|
| Python | 23 files | Only set with both `compile_contract` and `fetch_abi`; has `utils.py`, `test_queries.py` |
| Rust | 18 bins | No `fetch_abi`, no `compile_contract` |
| Go | ~29 files | Per-network dirs + checked-in abigen bindings |
| JavaScript | 100+ files | Outlier — carries FAssets, FDC, gasless, bridging, oracle comparisons. **Not the parity bar** |
| **Dart** | **0** | The gap |

Canonical set to mirror: `block_number` (×4 networks), `chain_id` (×2), `create_account`,
`deploy_contract` (×2), `make_query` (×2), `get_feed_id`, `ftsov2_consumer`, `ftsov2_config`,
`secure_random`, `volatility_incentive`, `fetch_anchor_feeds`, `fetch_and_verify_anchor_onchain`,
`fetch_abi` (×2).

**11 of these need no signing at all** — only `deploy_contract`, `create_account` and
`volatility_incentive` touch keys.

## 6. Dependency versions — verified live on pub.dev

| Package | Version | Published | SDK constraint |
|---|---|---|---|
| `on_chain` | 8.1.0 | 2026-07-16 | `>=3.7.0 <4.0.0` |
| `blockchain_utils` | 7.1.0 | 2026-07-16 | `>=3.7.0 <4.0.0` |
| `web3dart` | 3.0.3 | 2026-06-28 | `>=2.12.0 <4.0.0` |
| `pointycastle` | 4.0.0 | 2025-02-19 | `^3.2.0` |
| `http` | 1.6.0 | 2025-11-10 | `^3.4.0` |
| `test` | 1.31.2 | 2026-06-27 | `^3.11.0` |
| `mockito` | 5.8.0 | 2026-07-31 | `^3.7.0` |
| `build_runner` | 2.16.0 | 2026-07-31 | `^3.11.0` |
| `json_annotation` | 4.12.0 | 2026-05-15 | `^3.9.0` |
| `crypto` | 3.0.7 | 2025-11-04 | `^3.4.0` |

Local toolchain: **Dart 3.12.2 stable (macos_arm64)**, Flutter present, `cast`/`forge` (Foundry)
available, `gh` authenticated.

## 7. FDC timing and fees — measured live 2026-08-01

Read with `cast` against both networks, resolving every address through the
registry.

| Value | Coston2 | Flare mainnet |
|---|---|---|
| `ProtocolsV2` | `0xA90Db6D10F856799b10ef2A77EBCbF460aC71e52` | resolved at runtime |
| `firstVotingRoundStartTs` | **1658430000** | **1658430000** |
| `votingEpochDurationSeconds` | **90** | **90** |
| `FdcRequestFeeConfigurations` | `0x191a1282Ac700edE65c5B0AaF313BAcC3eA7fC7e` | `0x259852Ae6d5085bDc0650D3887825f7b76F0c4fe` |

Round ID arithmetic: `roundId = (blockTimestamp − firstVotingRoundStartTs) / votingEpochDurationSeconds`.
An integration test derives the current epoch this way and checks it against
`getCurrentVotingEpochId()`, allowing two epochs of slack.

**Confirmed:** `getRequestFee` for an `EVMTransaction`/`ETH` attestation on
mainnet returns `20000000000000000000` wei = **20 FLR**. A request that omits
`msg.value` reverts, so the fee must always be read and attached.

### Source identifiers differ between mainnet and testnets

Discovered by calling `getRequestFee` on Coston2 with mainnet source names and
getting `execution reverted: Type and source combination not supported` for
every pair. Retrying with `test`-prefixed names succeeded:

| Type | Source on Coston2 | Fee |
|---|---|---|
| `Payment` | `testXRP`, `testBTC`, `testDOGE` | 1000 wei |
| `EVMTransaction` | `testETH`, `testSGB`, `testFLR` | 1000 wei |
| `AddressValidity` | `testXRP` | 1000 wei |
| `ConfirmedBlockHeightExists` | `testBTC` | 1000 wei |
| `ReferencedPaymentNonexistence` | `testXRP` | 1000 wei |
| `BalanceDecreasingTransaction` | `testXRP` | 1000 wei |
| `Web2Json` | `PublicWeb2` — **no `test` variant** | 1000 wei |

Every supported pair on Coston2 is **1000 wei**; mainnet is **20 FLR**.
`Web2Json` is not chain-specific, so its source is identical everywhere.

A port that hardcodes mainnet source names reverts on every testnet call, and
the revert message says nothing about the naming rule. `AttestationSource.xrp
.forChain(chain)` picks the right form.

**Refuted:** prior research claimed Flare's example hardcodes a Coston timing
value "45 seconds off from mainnet". Coston2 and mainnet return **identical**
values for both parameters, so that specific discrepancy does not exist between
those two networks. Coston (the Songbird testnet) was not checked. Read the
values at runtime regardless — the cost is one `eth_call` at init.

## 7a. `eth_getLogs` is capped at 30 blocks

Measured 2026-08-02 by bisecting the span on both networks:

| Network | span 30 | span 31 |
|---|---|---|
| Coston2 | OK, 221 logs | `requested too many blocks … maximum is set to 30` |
| Flare mainnet | OK, 258 logs | same error |

At roughly 1.8 s per block that is about **54 seconds of history per request**,
so scanning an hour needs ~67 calls. Any log query worth making has to be split,
which is why `FlareClient.getLogs` chunks automatically and
`streamLogs` exists for wide scans.

An integration test asserts that an unsplit 90-block request **is** rejected, so
if Flare ever raises the cap the test fails and `maxLogBlockSpan` gets revisited.

## 7c. Event corpus

Measured across all Coston2 artifacts:

- **592 events**, 1,713 parameters
- **0 anonymous** — every event carries a signature topic
- Indexed-count histogram: 238 events index nothing, 160 index one, 139 two,
  55 three. Three is the EVM's limit, because `topics[0]` takes the fourth slot.
- **0 dynamic indexed parameters.** No Flare event indexes a `string`, `bytes`,
  array or struct, so the keccak-instead-of-value case never arises in practice.
  `IndexedHash` handles it anyway, for third-party contracts.

## 7b. The periphery barrel costs zero bytes

Two `dart compile exe` binaries — one importing only `flare_network`, one also
importing the full 142-binding barrel — came out **byte-identical**
(`5,765,392` bytes each). Dart's tree shaker drops the 141 unused classes and
their lazy `static final AbiFunction` fields entirely.

So do not split the barrel to save size; there is nothing to save. `[Measured
on the Dart VM AOT path, not Flutter's build pipeline.]`

## 8. Previously-unverified claims — now measured

All four were re-measured on Dart 3.12.2 / macos_arm64 on 2026-08-02. **Two were
wrong.** They are recorded here rather than quietly deleted, because a document
whose whole premise is "measured, not assumed" has to show its own corrections.

### Confirmed — `web3dart` signing defects

Stronger than originally stated. `grep -rn "chainId = 1"` in
`~/.pub-cache/hosted/pub.dev/web3dart-3.0.3/lib/` returns four hits —
`transaction_signer.dart:108`, `client.dart:321`, `client.dart:360`,
`transaction.dart:109` — four places where a Flare caller who omits the
parameter signs a payload replayable on Ethereum mainnet; the value reaches
EIP-155 `v` at `credentials.dart:131`. The priority fee is literally
`EtherAmount.inWei(BigInt.from(1000000000))` at `transaction_signer.dart:238`,
and `eth_maxPriorityFeePerGas` has no match anywhere in `lib/`. Interestingly
`getFeeHistory` **is** implemented (`client.dart:284`) but is never called from
the signing path — a wiring omission, not a missing capability. EIP-712 is
absent; EIP-191 `personal_sign` exists at `credentials.dart:46`.

### Corrected — the signer performance ratio

The previously-quoted "25–40×" was wrong in both directions. Measured with 200
warm-up iterations discarded, 1,000 timed, 3 repeats:

| Comparison | Ratio |
|---|---|
| pointycastle 4.0.0 vs `secp256k1_ecdsa` 0.6.3, raw primitive | **9.3–9.7× (AOT), 10.9–11.3× (JIT)** |
| `web3dart`'s full `sign()` vs `secp256k1_ecdsa` | **72× (AOT), 93× (JIT)** |

The end-to-end gap is dominated by `EC.secp256k1.calculateRecoveryId`
(`secp256k1.dart:53`), which alone costs 75% of the total and recomputes
`privateKeyBytesToPublic` on every call. AOT does **not** help — it makes
`secp256k1_ecdsa` ~27% slower and leaves pointycastle flat.

This is **contingency data, not a live constraint**: `pointycastle` is used in
exactly one place in this repo, `abi/keccak.dart`, and never for signing.

### Retracted — the `blockchain_utils` browser-`self` claim

**This claim was false and has been withdrawn.** A program exercising
`QuickCrypto.generateRandom`, BIP39 mnemonic and seed generation, and
`Bip32Slip10Secp256k1.fromSeed()` ran clean under both `dart run` and
`dart compile exe`. Grepping `dart:js`, `dart:html` and `package:web/` across
versions 5.1.0, 5.2.0, 5.4.0 and 7.1.0 returns **zero files** in every one; the
package has zero runtime dependencies at all four. All 27 occurrences of `self`
are Rust-port doc comments or the BIP39 wordlist entry.

Carrying an unattributed defect claim against a zero-dependency library was a
mistake, and it undermines every other measured claim in this file.
(Behaviour under `dart2js` was not tested and is not claimed either way.)

### Corrected — `web3dart_builders` on Dart 3.12.2

False as literally stated: `dart pub add --dev web3dart_builders` **succeeds**.
But it silently selects `web3dart_builders` 0.1.2 over 3.0.1, `web3dart` 2.7.3
over 3.0.3, and `analyzer` 6.4.1 over 14.1.0, reporting "12 packages have newer
versions incompatible with dependency constraints."

Pin `web3dart: ^3.0.3` and it hard-fails:

> because macros >=0.1.3-main.0 depends on `_macros` from sdk which doesn't
> exist … version solving failed

That is the stronger argument, and the right one: `_macros` was removed from the
SDK, so the chain is **permanently** unresolvable against a modern analyzer.
This is why `flare_network_codegen` is a standalone CLI rather than a
`build_runner` builder.

### Still standing

FDC fees (20 FLR mainnet / 1,000 wei Coston2) and the DA Layer rate limit were
measured directly in §7 and by integration test, and remain confirmed.
