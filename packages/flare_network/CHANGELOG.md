## 0.1.0-dev.1

First development release. Read-only; transaction signing is a documented
non-goal.

### Added

- `FlareClient` — JSON-RPC reads over Flare's C-chain, with automatic retry
  (exponential backoff, full jitter), request batching, and `verifyChainId()`
  to catch a misconfigured endpoint at startup rather than as a confusing
  "contract not found" later.
- `FlareChain` — presets for Flare (14), Coston2 (114), Songbird (19) and
  Coston (16), with `withRpcUrl()` for private endpoints.
- `ContractRegistry` — runtime contract resolution with caching and batched
  lookups. The registry address is the only address this package hardcodes.
- `FtsoV2` — block-latency price feeds: `getFeedById`, `getFeedsById`,
  `getFeedIndex`, `getFeedId`, `calculateFeeByIds`, and `watchFeeds` for a
  deduplicated live stream.
- `FeedId` — the 21-byte feed identifier, with exact-decimal formatting on
  `FtsoFeedValue` via `toDecimalString()`.
- `DaLayerClient` — Scaling anchor feeds with Merkle proofs, plus protocol
  status. Results are re-ordered to match the request, because the API does not
  preserve request order. Supports an `X-API-KEY` for higher rate limits.
- `FdcClient` — Flare Data Connector reads: per-type attestation fees, voting
  round timing from `ProtocolsV2` (cached), round-ID derivation, and on-chain
  proof verification. `AttestationSource.<chain>.forChain(chain)` resolves the
  network-specific source identifier, because testnets use `test`-prefixed
  names (`testXRP`, `testETH`) and a mainnet name reverts there with a message
  that does not explain why.
- A complete ABI codec: `AbiType`, `AbiFunction`, `ContractAbi`, `AbiCodec`,
  covering every Solidity type including nested tuples and fixed arrays.
- `EthAddress` with EIP-55 checksum validation enforced by default.
- A sealed `FlareException` hierarchy for exhaustive error handling.

### Verified

- ABI encoding is cross-checked against Foundry (`cast sig`, `cast calldata`,
  `cast abi-encode`) rather than against its own output.
- 131 hermetic unit tests, plus 39 integration tests against live Coston2, and
  9 widget tests in the reference app.
- Measured, not assumed: FDC fees are 1000 wei on Coston2 and 20 FLR on
  mainnet; the public DA Layer serves ~18 requests before returning 429 and
  sends no `Retry-After`.
