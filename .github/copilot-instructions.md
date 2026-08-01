# flare-dart — instructions for AI coding agents

Pure-Dart SDK for Flare Network. No Flutter dependency in the core package, so it
runs in Flutter apps, server code and CLI tools alike.

## Architecture

`packages/flare_network/lib/src/` is layered, and each layer only depends downward:

```
ftso/ registry/     domain: FtsoV2, ContractRegistry
      rpc/          FlareClient (typed reads) -> JsonRpcClient (transport)
      abi/          AbiType/AbiFunction codec, EthAddress, keccak, hex
      network/      FlareChain presets (chain IDs 14/114/19/16)
```

`lib/flare_network.dart` is the only public barrel — it re-exports with explicit
`show` clauses. Anything not listed there is private API; never import
`package:flare_network/src/...` from outside the package.

## Non-negotiable domain rules

These encode real failures, not style preferences:

- **Only one address is ever hardcoded**: `ContractRegistry.address`
  (`0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019`, identical on all four networks).
  Resolve everything else at runtime. Flare's own published Python example
  hardcodes an FtsoV2 address that is already stale — there is an integration
  test asserting the registry disagrees with it.
- **Never assume a feed's decimal scale.** One live Coston2 call returns 8 dp for
  FLR/USD, 2 for BTC/USD, 3 for ETH/USD, 6 for XRP/USD. `FtsoFeedValue` always
  carries `value` + `decimals` together, and `decimals` is a signed `int8`.
- **Every integer decodes to `BigInt`**, including `int8`. Narrowing with
  `.toInt()` happens at exactly one visible place per call site.
- **`payable` does not mean it costs money.** FTSOv2 getters are declared
  `payable` yet read for free via `eth_call`; `StateMutability.isReadOnly` is a
  hint, not a gate.

## Conventions

- Errors: a `sealed` hierarchy in `src/rpc/flare_exception.dart`
  (`FlareTransportException`, `FlareRpcException`, `FlareContractException`,
  `FlareAbiException`, `FlareRegistryException`). Throw the specific one; message
  text should say what to do next, not just what failed.
- `AbiType.encode` emits the **tail only** — the enclosing sequence owns the head
  where a dynamic value's offset lives. For anything top-level use
  `AbiCodec.encodeParameters` / `decodeParameters`.
- Prefer batching: `ContractRegistry.addressesOf` and `FtsoV2.getFeedsById` are
  one round trip; the per-item variants are N.
- Dart 3 idioms in use: `sealed`/`final class`, switch expressions,
  `abstract final class` for namespaces (`Feeds`, `FlareContract`, `AbiCodec`).

## Testing

```bash
dart test                  # unit only — hermetic, offline, ~1s
dart test -P integration   # live Coston2 — a PRESET, not `-t`
dart analyze               # must be clean before any commit
dart run example/flare_network_example.dart
```

`dart_test.yaml` sets a top-level `exclude_tags`, so `-t integration` is
rejected as conflicting. The `-P integration` preset overrides the exclusion;
that is the only way in.

ABI and keccak expectations are cross-checked against Foundry
(`cast sig`, `cast calldata`, `cast abi-encode`) — see the vectors in
`test/unit/abi_test.dart`. When adding an encoding path, generate the expected
value with `cast` rather than from this implementation, or the test only proves
self-consistency. Integration tests assert invariants (types, relationships,
freshness), never specific prices.

## Ground truth

`docs/GROUND-TRUTH.md` records what was measured directly (ABI corpus counts,
network-identical ABI sets, live addresses, dependency versions) versus what is
carried forward unverified. Check it before trusting a number, and label anything
unverified as `[Inference]` / `[Unverified]` rather than stating it flatly.
Reference implementations for parity live in `reference/dh/examples/`.
