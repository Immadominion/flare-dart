# flare_network

A Dart client for [Flare Network](https://flare.network) — read FTSOv2 price
feeds, resolve contracts through the Flare Contract Registry, fetch Scaling
anchor feeds with Merkle proofs, and call any Flare contract over JSON-RPC.

**Pure Dart. No Flutter dependency, no FFI, no native build step.** It runs in
Flutter apps on every platform, in server code, and in CLI tools.

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

## Install

```yaml
dependencies:
  # Pre-release, so the constraint must admit it: `^0.1.0` alone does not
  # match `0.1.0-dev.N`.
  flare_network: ^0.1.0-dev.2
```

## Networks

| Network | Chain ID | Purpose |
|---|---:|---|
| `FlareChain.flare` | 14 | Flare mainnet |
| `FlareChain.coston2` | 114 | Testnet for mainnet — **develop here** |
| `FlareChain.songbird` | 19 | Canary network |
| `FlareChain.coston` | 16 | Testnet for Songbird |

Get testnet C2FLR from the [Coston2 faucet](https://faucet.flare.network/coston2).
Point at a private or paid endpoint with `FlareClient(chain, rpcUrl: ...)`.

## Two rules that will save you a debugging session

### Never hardcode a contract address — resolve it

Only one address is stable: the Flare Contract Registry, identical on every
network. Flare redeploys everything else.

This is not hypothetical. Flare's own published Python example hardcodes FTSOv2
at `0x3d893C53…`; the registry currently returns `0xC4e9c78E…` on Coston2. This
repo has a test asserting that disagreement.

```dart
final registry = ContractRegistry(client);
final wnat = await registry.addressOf(FlareContract.wNat);

// Several names in one round trip:
final addresses = await registry.addressesOf([
  FlareContract.ftsoV2,
  FlareContract.wNat,
  FlareContract.protocolsV2,
]);
```

### Never assume a feed's decimal scale

`decimals` varies per feed, is a signed `int8`, and differs even between
products reading the same pair. One live Coston2 call returned:

| Feed | Raw value | Decimals | Actual |
|---|---:|---:|---|
| FLR/USD | 626973 | 8 | 0.00626973 |
| BTC/USD | 6288717 | 2 | 62887.17 |
| ETH/USD | 1861608 | 3 | 1861.608 |
| XRP/USD | 1061849 | 6 | 1.061849 |

`FtsoFeedValue` always carries `value` and `decimals` together. Use
`toDecimalString()` for exact output, `asDouble` for display.

## FTSOv2 price feeds

Reads are free. The getters are declared `payable` in Solidity but resolve
through `eth_call` at no cost — no account, funds or signing involved.

```dart
final ftso = await FtsoV2.resolve(client);

// Several feeds in one call — cheaper, and every reading shares one timestamp.
final feeds = await ftso.getFeedsById([Feeds.flrUsd, Feeds.btcUsd]);

// Any pair, not just the shorthands in `Feeds`:
final doge = await ftso.getFeedById(FeedId.crypto('DOGE/USD'));

// Confirm rather than assume a feed is free:
final fee = await ftso.calculateFeeByIds([Feeds.flrUsd]); // 0
```

### Live updates

Flare publishes roughly every ~1.8s. `watchFeeds` polls and suppresses repeats,
so every event is a genuinely new publication.

```dart
await for (final tick in ftso.watchFeeds([Feeds.flrUsd])) {
  print('${tick.first.publishedAt}  ${tick.first.toDecimalString()}');
}
```

On mobile, cancel the subscription when the app is backgrounded — a background
poll costs battery and burns rate limit.

## Scaling anchor feeds and Merkle proofs

Anchor feeds are published every 90 seconds by ~100 independent providers. Only
a commitment lives on chain; the DA Layer serves the body plus the proof that
authenticates it.

```dart
final da = DaLayerClient(FlareChain.coston2);
final feeds = await da.getAnchorFeedsWithProof([Feeds.flrUsd]);
print(feeds.single.proof.length); // e.g. 6 Merkle nodes
da.close();
```

Results come back **in the order you requested**. The API does not preserve
request order, so this client re-orders by feed ID.

> **Anchor decimals ≠ block-latency decimals.** The same FLR/USD feed was 6 dp
> from the DA Layer and 8 dp from FTSOv2 at the same moment. Both are correct —
> they are different products. Never carry a scale across.

**Rate limits.** The public DA Layer is aggressively limited and sends no
`Retry-After`. Measured: 18 sequential requests succeeded, the 19th returned
429. Retries with full jitter are on by default. For real traffic, request an
API key through the
[developer-hub issue tracker](https://github.com/flare-foundation/developer-hub/issues/new/choose)
and pass it as `DaLayerClient(chain, apiKey: ...)`.

## Flare Data Connector

The FDC proves facts about other chains and about public Web2 APIs. Requesting
an attestation needs a signed, payable transaction — which this package does not
do — but everything around it is a free read.

```dart
final fdc = await FdcClient.resolve(client);

// Source identifiers differ per network; let forChain pick.
final source = AttestationSource.xrp.forChain(client.chain);
final fee = await fdc.getRequestFee(AttestationType.payment, source);

final round = await fdc.currentVotingRoundId();
final timing = await fdc.timing();
```

> **Testnets use `test`-prefixed sources.** Coston2 and Coston expect `testXRP`,
> `testBTC`, `testETH`; Flare and Songbird expect the bare names. Using a
> mainnet name on a testnet reverts with *"Type and source combination not
> supported"*, which says nothing about the actual rule — so
> `AttestationSource.xrp.forChain(chain)` exists to get it right.
> `Web2Json` is chain-agnostic and always uses `PublicWeb2`.

Measured fees: **1000 wei** for every supported pair on Coston2, **20 FLR** on
Flare mainnet. Always read the fee — a request that omits it reverts.

Voting round timing must also be read at runtime. `fdc.timing()` fetches
`firstVotingRoundStartTs` and `votingEpochDurationSeconds` from `ProtocolsV2`
and caches them; `votingRoundIdAt(when)` derives the round a past event belongs
to, which is what a proof lookup needs.

## Event logs

Every contract's events are decoded, including the indexed parameters that live
in topics rather than in the data section.

```dart
final transfer = fxrpAbi.event('Transfer');

final logs = await client.getEventLogs(
  event: transfer,
  addresses: [fxrpToken],
  fromBlock: BlockRef.height(head - 300),
);

for (final t in logs) {
  print('${t['from']} -> ${t['to']}  ${t['value']}');
}
```

Filter on any indexed parameter; `null` leaves a position unconstrained and a
list means any-of:

```dart
// Transfers from one sender, to anyone.
indexedValues: [sender, null]
```

> **`eth_getLogs` is capped at 30 blocks** on Flare's public RPC — measured, and
> identical on Coston2 and mainnet. A wider request is rejected outright, so
> `getLogs` splits the range automatically. For large scans prefer
> `streamLogs`, which yields each log as its window returns instead of
> buffering everything.

**Indexed dynamic values are hashes, not values.** The EVM cannot fit a `string`
or `bytes` into a 32-byte topic, so it stores `keccak256(value)` and the original
is not in the log at all. Those decode to `IndexedHash` rather than a
plausible-looking wrong value; use `hash.matches('candidate')` to test one.

## Calling any contract

```dart
final balanceOf = AbiFunction(
  name: 'balanceOf',
  inputs: [AbiParameter(name: 'owner', type: AbiType.parse('address'))],
  outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
  stateMutability: StateMutability.view,
);

final balance = await client.callFunctionSingle(
  contract: await registry.addressOf(FlareContract.wNat),
  function: balanceOf,
  args: [EthAddress.parse('0x…')],
) as BigInt;
```

Or parse a whole ABI:

```dart
final abi = ContractAbi.fromJson(jsonDecode(abiJson) as List);
final fn = abi.function('getFeedsById');
```

### Type mapping

| Solidity | Dart |
|---|---|
| `uintN`, `intN` | `BigInt` — *always*, including `int8` |
| `address` | `EthAddress` (EIP-55 enforced) |
| `bool` | `bool` |
| `bytes`, `bytesN` | `Uint8List` |
| `string` | `String` |
| `T[]`, `T[k]` | `List<T>` |
| tuple / struct | `List<Object?>`, positional |

Every integer decodes to `BigInt` so nothing can silently overflow; narrow with
`.toInt()` where you know the range.

## Errors

A sealed hierarchy, so a `switch` over `FlareException` is exhaustive.

| Type | Meaning | Retry? |
|---|---|---|
| `FlareTransportException` | unreachable, timeout, non-200 | often — see `isRetryable` |
| `FlareRpcException` | node returned a JSON-RPC error | depends on `code` |
| `FlareContractException` | reverted, or empty return data | no |
| `FlareAbiException` | encode/decode failure, value out of range | no |
| `FlareRegistryException` | unknown registry name | no |

```dart
try {
  await ftso.getFeedById(Feeds.flrUsd);
} on FlareTransportException catch (e) {
  if (e.isRetryable) { /* back off and retry */ }
} on FlareContractException {
  // Usually a wrong address, or a revert.
}
```

`FlareClient` retries transient failures automatically with exponential backoff
and full jitter. Tune with `RetryPolicy`, or disable with `RetryPolicy.none`.

## Typed contract bindings

The companion `flare_network_periphery` package ships **142 generated bindings
covering 1,049 read methods**, produced from Flare's published ABI artifacts by
`flare_network_codegen`. Multi-output functions become named records:

```dart
final result = await ftsoContract.getFeedsById(feedIds);
result.values;     // List<BigInt>
result.decimals;   // List<BigInt>
result.timestamp;  // BigInt
```

## Following a wallet transaction

This package cannot sign — but it covers everything either side of the wallet,
so the flow completes:

```dart
// 1. Price it before asking the user to sign.
final gas = await client.estimateGas(CallRequest(to: contract, data: calldata));
final tip = await client.getMaxPriorityFeePerGas();

// 2. The wallet signs and broadcasts; you get a hash back.

// 3. Wait for it, and check it actually worked.
final receipt = await client.waitForReceipt(hash);
if (!receipt.succeeded) { /* reverted — still mined, still cost gas */ }

// 4. Read what it emitted.
for (final log in receipt.logs) { … }
```

> **A receipt is not success.** A reverted transaction is still included in a
> block and still costs gas. Only `receipt.succeeded` distinguishes them.

`waitForReceipt` timing out means *not yet*, not *failed* — the transaction may
still land. Also available: `getTransactionByHash`, `getTransactionCount` (pass
`BlockTag.pending` for the next usable nonce), `getBlockByNumber`,
`getBlockByHash`, `getLatestBlock`.

## Live subscriptions

Flare serves `eth_subscribe` over WebSocket on every network:

```dart
final subs = FlareSubscriptions(FlareChain.coston2);
await for (final block in subs.newHeads()) print(block.number);
await for (final log in subs.logs(LogFilter(addresses: [token]))) print(log);
```

Reconnects with jittered backoff. Delivery is **at-most-once**: a dropped socket
loses whatever was produced while it was down, so anything that must not be
missed should be reconciled with a `getLogs` sweep over the gap.

Polling is not the inferior option on mobile. A socket is dropped when the OS
suspends the app and must be re-established across background transitions;
`FtsoV2.watchFeeds` just works. Reach for subscriptions when you need low
latency. `FlareSubscriptions` uses `dart:io`, so it is unavailable on Flutter
Web — the rest of the package is platform-neutral.

## Scope

**Supported:** contract resolution, FTSOv2 reads, DA Layer anchor feeds and
proofs, FDC, FAssets, event logs, transaction receipts and gas estimation,
WebSocket subscriptions, arbitrary `eth_call`, chain queries.

**Deliberately not supported — a non-goal, not a missing feature:** transaction
signing, and therefore P-chain staking, delegation and C↔P transfers. P-chain
requires the Avalanche codec, much of which must match AvalancheGo byte-for-byte,
and it serves a very small share of addresses. For writes, connect an existing
wallet over WalletConnect/Reown and let it sign.

## Verify it yourself

```bash
dart test                  # 54 unit tests — hermetic, offline
dart test -P integration   # 30 tests against live Coston2
dart run example/flare_network_example.dart
```

ABI encoding is cross-checked against Foundry (`cast sig`, `cast calldata`,
`cast abi-encode`) rather than against this implementation's own output.

## License

MIT
