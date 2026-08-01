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

## 8. Carried forward from prior research — NOT re-verified here

Treat as `[Unverified]` until independently checked:

- `web3dart` signing defects (`chainId` defaulting to 1, hardcoded 1 gwei tip, no EIP-712)
- The 25–40× signer performance ratio between pointycastle and `secp256k1_ecdsa`
- FDC attestation fees (20 FLR mainnet / 1,000 wei Coston2) and the 20-request DA Layer rate limit
- `web3dart_builders` failing to resolve on Dart 3.12.2

Each is load-bearing for a design decision and should be re-measured before being cited externally.
