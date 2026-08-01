# Architecture

Design decisions for the Flare Dart SDK, and the evidence behind each. Where a
decision rests on something not directly measured, it is labelled
`[Inference]` or `[Unverified]`.

---

## 1. Scope

**In scope for v0.1–v1.0:** everything reachable over `eth_call` and HTTP —
contract resolution, FTSOv2 feeds, FDC attestation requests and DA Layer proofs,
FAssets read paths, WNat reads.

**Permanently out of scope:** P-chain staking, delegation, and C↔P transfers.
This is stated as a non-goal in the README rather than deferred, so nobody plans
around it arriving later.

The reasoning: P-chain requires the Avalanche linear codec, and a meaningful part
of it has to match AvalancheGo byte-for-byte or transactions are rejected on
chain. Prior research put that at roughly 90–111 engineer-days `[Unverified —
derived from a TypeScript LOC count, not re-measured here]`. Against that, the
verified fact is that 7 of the 112 contracts in the Flare ABI set are P-chain
surface, and they are exactly the 7 absent from Songbird — so excluding them also
collapses four ABI trees into two.

## 2. Package layout

```
packages/flare_network/          pure Dart core, no Flutter
  lib/flare_network.dart         the only public barrel
  lib/src/
    network/   FlareChain presets
    abi/       hex, keccak, EthAddress, AbiType, AbiFunction
    rpc/       JsonRpcClient (transport), FlareClient (typed reads), exceptions
    registry/  ContractRegistry
    ftso/      FeedId, FtsoV2
```

**The core has no Flutter dependency.** A Flutter dependency in a core SDK makes
it unusable from `dart run`, from a Dart backend, and from CI without Flutter.
Flutter-only concerns (secure key storage, biometrics, widgets) belong in a
separate `flare_network_flutter` package that depends on this one, never the
reverse.

**Everything lives under `lib/src/`.** Files at the root of `lib/` become public
API implicitly. The single barrel uses explicit `show` clauses so the public
surface is a decision rather than an accident.

## 3. Dependencies

| Package | Version | Why |
|---|---|---|
| `http` | ^1.6.0 | The standard Dart HTTP client |
| `meta` | ^1.19.0 | `@immutable` annotations |
| `pointycastle` | ^4.0.0 | Keccak-256 only |

Three dependencies, all pure Dart. **Nothing requires `dart:ffi`**, so there are
no platform channels, no CocoaPods step and no Gradle native build — normally the
largest schedule risk in a cross-platform crypto SDK.

**Why not `web3dart`:** it is the incumbent (~26.5k downloads/month) but the
original `simolus3/web3dart` was archived in 2022, and the live `xclud` fork has
87 open issues and roughly 4 commits/year. Specific defects reported by prior
research — a `chainId` parameter defaulting to Ethereum mainnet, a hardcoded
1 gwei priority fee, no EIP-712 — are `[Unverified]` here and are being
re-measured. Even so, the SDK needs no EVM library at all for reads: the ABI
codec is ~600 lines and is now cross-checked against Foundry.

**Why the core implements its own ABI codec.** It removes the largest dependency
from the read path entirely, and the read path is the majority of the surface —
666 of 954 functions in the Flare ABI set are `view`/`pure`. A signing dependency
can be chosen later, on its own merits, without disturbing any of this.

## 4. The ABI codec

`AbiType` is a sealed hierarchy with one class per Solidity type family. Two
things about it are easy to get wrong:

**`encode` emits the tail only.** A dynamic value's offset lives in the head of
the *enclosing* sequence, so an `AbiType` cannot emit it. Top-level callers use
`AbiCodec.encodeParameters`, which supplies the head. This is why
`abi.encode(string)` begins with an offset word of `0x20` — and why an earlier
draft of this codec failed its own round-trip tests.

**All integers decode to `BigInt`.** A uniform rule cannot silently overflow.
Narrowing happens explicitly at the edge — `FtsoV2` calls `.toInt()` on `int8`
decimals at exactly one place, which is also the only place a sign error could
hide.

Correctness is established against **Foundry**, not against itself: every
expected value in `test/unit/abi_test.dart` came from `cast sig`,
`cast calldata` or `cast abi-encode`. A test that encodes with this
implementation and decodes with it only proves self-consistency.

## 5. Contract resolution

One address is hardcoded — the registry, which is identical on all four
networks. Everything else resolves at runtime through
`getContractAddressByName`.

This is not defensive style. Flare's own `ftsov2_consumer_coston2.py` hardcodes
FtsoV2 at `0x3d893C53…`, and the registry now returns `0xC4e9c78E…` on Coston2.
An integration test asserts that disagreement, so the rule keeps its evidence.

Resolutions are cached per `ContractRegistry` instance. `addressesOf` batches
several lookups into one JSON-RPC round trip.

## 6. Errors

A `sealed` hierarchy, so `switch` over `FlareException` is exhaustive:

| Type | Meaning | Retry? |
|---|---|---|
| `FlareTransportException` | unreachable, timeout, non-200 | often — see `isRetryable` |
| `FlareRpcException` | node returned a JSON-RPC error object | depends on code |
| `FlareContractException` | reverted, or empty return data | no |
| `FlareAbiException` | encode/decode failure, out-of-range value | no |
| `FlareRegistryException` | unknown registry name | no |

Messages state the likely cause and next step. Empty return data, for instance,
reports that the address probably holds no contract — which is what it almost
always means — rather than decoding zeros and returning a plausible-looking
wrong answer.

## 7. Retries

Exponential backoff with **full jitter**, on by default. Jitter matters beyond
politeness here: prior research reports the public DA Layer rate-limits after
about 20 unauthenticated requests `[Unverified — being re-measured]`, and a
fleet of mobile clients retrying in lockstep would keep re-colliding.

Malformed JSON is treated as non-retryable; only transport-level failures and
408/429/5xx are retried.

## 8. Testing

Two tiers, split in `dart_test.yaml`:

- **Unit** — hermetic, offline, ~1s. Runs on plain `dart test`.
- **Integration** — live Coston2, opt-in via `dart test -t integration`.

Integration tests assert *invariants*, never prices: that a timestamp is recent,
that a batch call shares one timestamp, that feeds use more than one decimal
scale, that a feed index round-trips. These stay meaningful as the chain moves.

## 9. Open decisions

Pending the background verification pass:

1. **Signing dependency** — `on_chain` vs a native implementation. Blocked on
   confirming `on_chain`/`blockchain_utils` work on a bare Dart VM; prior
   research claims `blockchain_utils` requires a browser `self` global
   `[Unverified]`.
2. **Codegen** — a standalone Dart CLI emitting bindings from the 112 periphery
   artifacts, committed to the repo rather than generated at build time.
   `web3dart_builders` is reported not to resolve on Dart 3.12 `[Unverified]`,
   which is the argument against a `build_runner` approach.
3. **FDC fees and round arithmetic** — must be read live from
   `FdcRequestFeeConfigurations` and `ProtocolsV2`, never hardcoded.
