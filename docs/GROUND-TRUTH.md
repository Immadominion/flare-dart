# Ground Truth — Empirically Verified

Everything here was measured directly on this machine, not inferred. Sections 1-8 date from
**2026-07-31**; sections 9-13 from **2026-08-02**. Each entry
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

---

## 9. Block time is not one number — measured 2026-08-02

Flare's own documentation gives a single "~1.8 seconds" for the whole family.
Measured over **1,000 consecutive blocks per network**, by differencing the
`timestamp` of the head against the head minus 1,000:

| Network | Elapsed / 1,000 blocks | s/block |
|---|---:|---:|
| Songbird | 1,066 s | **1.066** |
| Flare | 1,161 s | **1.161** |
| Coston2 | 2,726 s | **2.726** |
| Coston | 3,995 s | **3.995** |

A 3.7x spread, and the published figure matches none of them. `FlareChain`
carries a per-network `blockTime`, and `waitForReceipt` paces from it. A shared
constant either burns requests on the fast chains or adds latency on the slow.

## 10. The fee market — measured 2026-08-02

Sampled with `eth_feeHistory` over 8,192 blocks per network, in eight calls of
`blockCount: 0x400`.

| Fact | Flare mainnet | Coston2 |
|---|---|---|
| `baseFeePerGas` floor | 500 gwei (`0x746a528800`) | 500 gwei |
| Blocks exactly at floor | **95.23%** | **99.91%** |
| Largest excursion above floor | **+11.3%** (556.5 gwei) | +0.72% (503.6 gwei) |
| Median `gasUsedRatio` | 0.019 | 0.0077 |
| `eth_maxPriorityFeePerGas` | **150 gwei**, constant | **150 gwei**, constant |
| `eth_gasPrice` | exactly `baseFee + 150 gwei` (16/16 samples) | same |

Consequences encoded in the SDK:

- The default `baseFeeMultiplier` is **1.5**, not the Ethereum-conventional 2.
  1.5 covers four times the largest excursion ever observed. Surplus headroom is
  refunded, but `gas × maxFeePerGas` is what a wallet shows as the maximum cost,
  and against a 500 gwei floor an inflated cap makes a routine action alarming.
- The tip is a flat constant, not a market signal, so `eth_gasPrice` carries no
  information the base fee and the tip do not already give.
- `eth_feeHistory` **requires its third argument**; omitting it fails with
  `-32602 missing value for required argument 2`. `null` is accepted.

`[Unverified]` Whether a tip *below* 150 gwei is rejected or merely delayed. A
zero-tip transaction was observed mined on mainnet at ~2% block utilisation, but
behaviour under load is untested. Settling it needs a funded Coston2 key.

## 11. How a revert is reported — measured 2026-08-02

Against `eth_call` and `eth_estimateGas` on Coston2 and mainnet:

| Condition | code | `data` |
|---|---|---|
| `require`/`revert` with a message | `3` | `0x08c379a0…` (`Error(string)`) |
| `assert` / compiler check | `3` | `0x4e487b71…` (`Panic(uint256)`) |
| Custom error | `3` | selector + args; **message is just `execution reverted`** |
| Bare `revert()` / no message | `-32000` | **absent entirely** |
| Node refuses to simulate (`insufficient funds`) | `-32000` | absent, message descriptive |

Two things follow:

1. **Branch on the presence of `data`, never on `code == 3`.** geth sends
   `data: "0x"` for an empty revert; this node omits the field. Treating absent
   and `"0x"` as the same case is what makes a client portable across both.
2. **Custom errors are unreadable without their declaration.** There are
   **168** across the 187 published ABIs, and the node reports them as four
   opaque bytes. `flare_network_codegen` emits every one, with a per-contract
   `decodeRevert`.

Verified live, with the exact bytes:

```
$ curl -s -X POST https://coston2-api.flare.network/ext/C/rpc \
    -H 'Content-Type: application/json' \
    -d '{"jsonrpc":"2.0","id":1,"method":"eth_call","params":[
        {"to":"<WNat>","data":"0x23b872dd…"},"latest"]}'
{"error":{"code":3,"message":"execution reverted: ERC20: transfer amount exceeds balance",
 "data":"0x08c379a0…"}}
```

Those bytes are byte-identical to
`cast concat-hex 0x08c379a0 $(cast abi-encode "f(string)" "ERC20: transfer amount exceeds balance")`.

### `eth_call` state overrides are supported

Passing a third parameter substitutes bytecode at an address for one simulated
call. This makes every revert class testable against a real node with **no
deployment, no funded key and no gas**:

```
params: [{"to":"0x…ff","data":"0x"}, "latest",
         {"0x…ff": {"code": "0x634e487b7160e01b600052601260045260246000fd"}}]
-> {"code":3,"message":"execution reverted: division or modulo by zero",
    "data":"0x4e487b71…0012"}
```

`debug_traceCall` is **not** available (`-32601`), so when `data` is absent there
is genuinely nothing to recover.

## 12. `WNat.withdrawTo` does not exist — verified 2026-08-02

Some secondary documentation lists `withdrawTo(recipient, amount)` on WNat. It is
not in `IWNat`'s ABI, and its selector is absent from the deployed bytecode.

```
$ WNAT=$(cast call 0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019 \
    "getContractAddressByName(string)(address)" "WNat" \
    --rpc-url https://flare-api.flare.network/ext/C/rpc)
0x1D80c49BbBCd1C0911346656B529DF9E5c2F783d
```

Searching that contract's code for each selector:

| Function | Selector | In deployed bytecode |
|---|---|---|
| `withdrawTo(address,uint256)` | `0x205c2878` | **absent** |
| `deposit()` | `0xd0e30db0` | present |
| `depositTo(address)` | `0xb760faf9` | present |
| `withdraw(uint256)` | `0x2e1a7d4d` | present |
| `withdrawFrom(address,uint256)` | `0x9470b0bd` | present |

Note that `withdrawFrom` is **allowance-based** — it spends the owner's WNat and
sends native tokens to `msg.sender`. It is not a "withdraw to a recipient"
helper, and naming it as one leads to misuse.

## 13. Node identity

`web3_clientVersion` returns `"v0.15.4"` on all four networks.
`eth_getChainConfig` (a coreth extension) reports Cancun active
(`cancunTime` 1764676800) and a **dynamic** block gas limit under ACP-176 —
28,000,000 on an older mainnet block, 27,972,664 at the tip. Never hardcode it.

`[Inference]` The nodes appear to be `ava-labs/coreth`, matching its behaviour in
every case tested, but the deployed binary was not inspected. Notably
`flare-foundation/coreth@master` is an older fork whose revert unpacking handles
only `Error(string)`, while the live nodes decode `Panic` — so they are not on
that branch.
