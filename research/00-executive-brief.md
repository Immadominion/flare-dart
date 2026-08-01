# Flare × Dart/Flutter — Executive Brief

**For:** Nwakanma Dominion (`Immadominion`) · **Date:** 2026-07-31 · **Reading time:** 10 min

This brief sits on top of [`01-dossier.md`](01-dossier.md) (99k chars, 13 research agents, 1.8M tokens).
It records the **decision**, the **corrections**, and the **one thing that is time-critical**. Where this
brief and the dossier disagree, **this brief wins** — it contains findings the fleet could not reach,
gathered through the authenticated `gh` CLI, Flare's own MCP documentation server, and the X API.

---

## 0. Two corrections to what I told you earlier today

**Correction 1 — I misread the Flare grants page, and the fleet caught it.**

I told you *"Dev Tools is one of only three named categories."* That is wrong. The string
`Top Categories DeFi Infrastructure Dev Tools` sits inside the **statistics block** on
flare.network/resources/grants, next to `Grants Awarded 100` and a row of country flags. It is a
**descriptive summary of 100 past awards, not a solicitation.** The same page asks for *"your
**company** pitch deck"*, and all four featured grantees are TVL-generating DeFi protocols
(Clearpool, RainDEX, Kinetic, SparkDEX). The program is real and open — the fit is materially
weaker than I implied.

**Correction 2 — you have five published Dart packages, not one.**

I said your published package was `jupiter`. I had only looked at local folders. The real record:

| Package | Latest | pub points | dl/30d | `repository:` |
|---|---|---:|---:|---|
| `dartus` (Walrus blob storage) | 0.3.0, 2026-06-20 | **150**/160 | 72 | live |
| `tld_parser` (AllDomains) | 0.1.0, 2026-03-30 | **150**/160 | 6 | **404 — dead** |
| `jupiter` (Jupiter Ultra API) | 1.0.1, 2025-08-05 | 140/160 | 16 | **404 — dead** |
| `coral_xyz` (Solana/Anchor client) | 1.0.0-beta.9, 2026-03-28 | 130/160 | 149 | live |
| `coral_xyz_codegen` (IDL → Dart) | 1.0.0-beta.9, 2026-03-28 | 130/160 | 38 | live |

For comparison, `solana`, `coral_xyz` and `polkadart` all score 130/160. **Your quality scores are
at or above the established chain SDKs.** Adoption is ~281 downloads/month across all five. So the
honest framing is **craft, not traction** — and there is one specific asset that matters more than
the rest, see §3.

---

## 1. The verdict

**Build it — but not "a Dart SDK for Flare."**

A general-purpose Dart EVM client for Flare is undifferentiated and falsifiable in thirty seconds: a
Flutter developer already reaches Flare through `web3dart` with `chainId: 14`, or through
`reown_appkit`'s public `addSupportedNetworks()` in about ten lines of config. **Connect-and-sign is
a config problem, not an SDK problem.** Any pitch implying otherwise dies on contact with a reviewer.

What is genuinely unsolved in Dart is **Flare's enshrined protocols**: FTSO feed-ID encoding, the
six-step FDC attestation flow, FAssets, Smart Accounts, and typed bindings across a large and
churning contract surface. Build **that**, positioned as *"an FTSO and FDC client for Dart, where the
EVM layer is a dependency."*

Scope it so **zero funding is an acceptable outcome**. Never scope P-chain — see §5.

---

## 2. ⏰ The time-critical finding

**Flare Summer Signal hackathon — submissions close 2026-08-14 19:59 UTC.**

The fleet flagged this as `[U]` unverified because DoraHacks returns HTTP 405 to automated fetches.
**I verified it directly.** Confirmed from the live page:

| | |
|---|---|
| Prize pool | **$12,000** |
| Bounty 1 — Interoperable Asset Products | $6,000 → $4,000 first / $2,000 second |
| Bounty 2 — Confidential Compute Apps | $6,000 → $4,000 first / $2,000 second |
| Timeline | Opened Jun 29 → **close Aug 14 19:59 UTC** → judging Aug 15–21 → winners Aug 24 |
| Registered | 377 hackers |
| Telegram | `t.me/+5Vn6ZKhr6KI3NjIx` |

Note this does **not** appear anywhere in Flare's documentation — querying their own MCP docs server
for "hackathon" returns no documents. It was only reachable through the X API.

**Two rules make developer tooling eligible, contradicting the dossier's cautious "product tracks
only" read.** Verbatim from the rules page:

- Judging criterion #1: *"Product usefulness — Does the product solve a real user, **developer**,
  ecosystem, or **infrastructure** problem?"*
- *"Participants can build from scratch, bring an existing project, or **port an existing product to
  Flare**."* Existing projects must separate what pre-existed from what was newly built.

**Why this reorders everything:** the dossier's §8.2 wedge argument is that a cold grant application
is near-worthless without an internal sponsor, and that you must "be the demand, visibly, in their
repo." The hackathon is a **better version of that same move** — it is judged by the exact people
who would later approve a grant or merge your docs PR, on a fixed 14-day clock, with money attached.

**Aim it at Bounty 1 (Interoperable Asset Products).** Every submission visible so far is a web
dApp; **zero are mobile**. Judges want *"full flow demoable in under 2 minutes"* — which a phone
screen recording wins outright. The SDK is the infrastructure story; a Flutter FXRP app is the demo.

---

## 3. Who to pitch — and the one asset that makes the pitch

### The target

**Kristaps Grinbergs** — GitHub `@fassko`, X `@fassko`, Latvia.

His X bio reads verbatim: **"Developer Relations Engineer @FlareNetworks."** (Stronger than the
fleet's source, which had only the `authors.yml` title "Dev Rel" and the employer "Salto X".)

He is decisive because he is a bottleneck of one: 47 of the last 59 developer-hub commits since
2026-07-01, he **personally authored `flare-for-react-developers.mdx`** — the only new language
guide added in 2026 — and he owns ~95% of `flare-ai-skills`. Flare's "Dev Rel Lead" title is
currently **vacant**, which is both why he carries the load and why there is room for an outsider.

**Two things that shape how you approach him, and both cut against the obvious pitch:**

1. **His mobile background is Swift/iOS — 39–43 Swift repos, and zero Dart.** He is a native mobile
   engineer. Expect *"why Flutter rather than Swift or Kotlin?"* Prepare it; do not assume an ally.
2. **His current attention is almost entirely Flare Confidential Compute / TEEs.** His last ~15
   posts are dominated by it. **Pitch into that interest, not against it.**

The genuinely compelling framing for him specifically: *Flare's most active DevRel engineer is a
native mobile developer with no mobile-native path onto his own chain to point developers at.*

### Supporting contacts (all verified)

| Who | Channel | Role |
|---|---|---|
| **@0xQuantic** (Víctor Muñoz) | X, 15.1k followers | "Contributing: @Flarenetworks & @FlareDevHub". Runs hackathon comms. Best amplifier for a mobile FXRP demo |
| **Dinesh Pinto** `@dineshpinto` | developer-hub feature-request issues auto-assign to him | Authored the original JS/Python/Rust/Go guide series — architectural owner of the pattern you'd extend |
| **Nik Erzetič** | `.github/CODEOWNERS` | Will auto-appear on your PR. **Do not email cold** |
| **Flare Africa** | flareafrica.xyz | Community Growth Grant recipient whose remit included FTSO/FAssets starter kits. Cheapest route to a **sponsored** rather than cold application |
| Official | @FlareNetworks (342k), @FlareDevHub (4.9k), Discord ~46.2k, `t.me/FlareNetwork` | Flare's own FAQ calls **Telegram** the primary dev channel |

**Do not contact** Uttam Singh — still listed in `authors.yml` as "Dev Rel Lead" but now at Alchemy,
no Flare activity since mid-2024. Contacting him signals zero research.

⚠️ The dossier proposes emailing `kristaps@flare.network` / `filip.koprivec@flare.network`, sourced
from **git commit metadata and CODEOWNERS**, not from published contact addresses. That is a real
source but a cold email to a harvested commit address is a judgment call. **Lead with the X DM or a
GitHub issue instead** — both are public, expected channels.

### The credibility anchor

Lead with **`coral_xyz_codegen`**, not with breadth.

The dossier's load-bearing technical finding is that **ABI codegen is the architecture** — the Flare
periphery surface is somewhere between 372 and 1,540 functions (three measurements exist and were
never reconciled; re-count in week 1), which is unmaintainable by hand. And the only existing Dart
ABI generator, `web3dart_builders`, **cannot resolve on Dart 3.12.2** — its chain reaches
`analyzer ^6.9.0 → macros → _macros`, removed from the SDK.

**You have already shipped exactly that tool once**, for Anchor IDLs. That is the hardest part of
this project and the part you have the most direct evidence of being able to do. Framing yourself as
prolific invites the grant-farmer read; framing yourself as *the person who has already built the
one component this project lives or dies on* does not.

---

## 4. Cost

Engineer-day = 6 focused hours. Figures are estimates; the TypeScript LOC inputs behind them were
independently verified.

| Tier | Scope | Eng-days | Solo @5d/wk |
|---|---|---:|---:|
| **PREVIEW** | Core + registry + FTSO + DA Layer + ~6 parity programs + draft guide | **23** | 5 wk |
| **MINIMAL** | Full Go/Python/Rust guide parity: 13 programs, signing, fees, guide | **34** | 7 wk |
| **STANDARD** | C-chain complete: codegen, FDC, FAssets reads, keystore, Reown, ref app | **114** | 23 wk |
| **AMBITIOUS** | + XRPL/FAssets minting + Smart Accounts writes + **P-chain** | **225** | 45 wk |

**Your stated "couple of weeks" at an aggressive 10 h/day × 14 days ≈ 23 engineer-days ≈ 68% of
MINIMAL.** That is a credible public **preview**, not a v1. Say "preview" and name what remains.

**Hard costs are effectively zero — this project is 100% labour:** ~$5 (MINIMAL) to ~$175
(AMBITIOUS). Testnet gas is free, Coston2 FDC attestations cost 1,000 wei, CI and pub.dev are free.
The only real line items are an optional domain and a $99 Apple Developer account for TestFlight.

**Maintenance: 22–44 engineer-days/year** for MINIMAL/STANDARD without FAssets. Excluding FAssets
cuts recurring maintenance by ~⅓; excluding P-chain cuts it by ~½ **and it never stops** (Etna
2025-12, Fortuna 2026-04, Granite 2026-07).

**Cost to a Flutter developer *using* it** — the "why fund this" number: today they must hand-write
ABI JSON, hand-encode 21-byte FTSO feed IDs, and hand-implement the six-step FDC flow including a
payable fee that silently reverts if omitted.

---

## 5. The three hard technical facts

**1. Do not build on `web3dart`.** The original `simolus3/web3dart` was **archived in 2022** with an
explicit disavowal of crypto. The live fork `xclud/web3dart` (26.5k downloads/month, 160/160 points)
has 87 open issues and ~4 commits/year. Its defects are aimed at exactly this use case:
`signTransactionRaw(tx, c, {int? chainId = 1})` **defaults to Ethereum mainnet**; its priority fee is
a hardcoded 1 gwei against Flare's actual **150 gwei** — a 150× understatement; zero EIP-712; and
Celo's type-123 encoding now sits in the core `Transaction` class.

**Build on `on_chain` 8.1.0** (160/160, all tx types, EIP-712 verified byte-exact), swap in a
**vendored** `secp256k1_ecdsa` (25–40× faster, bit-identical RFC-6979 output), and ship a thin
optional web3dart interop shim so the existing install base can adopt it.

⚠️ **Dependency concentration is the top technical risk:** your EVM core, XRPL leg and signer would
depend on **two individuals** (`mrtnetwork`, and the polkadart maintainers). Vendor the signer from
day one; exact-pin the rest.

**2. Nothing requires `dart:ffi`.** The whole stack compiles to JS *and* Wasm — no platform channels,
no CocoaPods, no Gradle native step. This removes what is normally the biggest schedule risk in a
cross-platform crypto SDK. **Drop Flutter Web as a v1 target anyway** — `reown_appkit` is
Android/iOS-only, so there is no wallet path there regardless.

**3. Never scope P-chain.** Not "v2" — say *out of scope* in the README and name the nine methods.
The port target is not `flare-tx-sdk` but **`flarejs`**: ~8,600 LOC of TypeScript for the C↔P round
trip, of which ~3,500 must **byte-match AvalancheGo** or transactions are silently rejected. That is
**90–111 engineer-days ≈ 5 months solo**, serving **4,215 P-chain delegator addresses against
8,542,034 C-chain addresses — 0.05%**. No Dart Avalanche codec exists anywhere.

And it is unnecessary: **68 of 77** `flare-tx-sdk` methods need no codec, and `claimStakingReward` is
a plain C-chain EVM call. A C-chain-only SDK can show stakes, validators, limits, **and claim
rewards** — it just cannot *create* a delegation.

---

## 6. The honest case against

Three things you should be able to say out loud before anyone says them to you.

**Demand is not thin — it is absent.** Dart files on GitHub referencing `coston2-api`: **0**. Issues
mentioning flutter or dart in `org:flare-foundation`: **0**. Relevant Stack Exchange results: **0**.
X search is useless here ("flare" and "flutter" are common English words — results are denim and
prose). You cannot manufacture demand evidence; do not try. Use the funders' own logic instead: TON
Society's **approved** grant #224 states verbatim *"there are no libraries to work with the TON
blockchain using Dart/Flutter… Developing this SDK will attract more developers."*

**The maintenance decay base rate is brutal.** Polkadart was approved for **$105,000** (W3F, two
applications) and has had no human commit since 2026-02-08. tonutils: $3,500, abandoned. Cardano
Catalyst's Flutter SDK: cancelled, only $3,188 of $15,000 distributed. The **one** healthy comparable
— Soneso's `stellar_flutter_sdk` — is the one with *ongoing* rather than lump-sum funding. Structure
any ask as **milestones + a maintenance retainer with published metrics.**

**There is already a competitor, published three days ago.** `flare_flutter_sdk` v0.0.1-dev
(2026-07-28) calls itself *"the first native Flutter/Dart SDK for the Flare network."* **Name it
first; never let a reviewer find it.** The counter is verified and strong: 31 KB, ~15 commits, 0
stars, no push since publication, and its own CHANGELOG says *"Scaffold phase complete… every public
method is an intentional UnimplementedError skeleton."* Its publisher shipped three chain SDKs in
seven days — a template strategy, funded by a tip jar. **That is exactly what an unfunded SDK
produces**, which is an argument *for* the budget. Do not claim to be first; claim to be working.

---

## 7. Do these five things first

**Before any outreach — the highest-return 30 minutes in this document.**

1. **Fix the two dead `repository:` links.** Publish `jupiter` 1.0.2 and `tld_parser` 0.1.1.
   `pub.dev/packages/jupiter` currently points at `github.com/jupiter-labs/jupiter-dart-sdk` → **404**;
   `tld_parser` points at `onsol-labs/tld-parser-dart` → **404**. Flare's grant criterion #5 is
   literally "previous blockchain development experience," and the first thing diligence does is open
   pub.dev. Leaving a 404 on your own package is the cheapest possible unforced error — and skipping
   this is **kill criterion #1**.
2. **Set up a verified pub.dev publisher** on a domain you own. All five packages currently show
   `publisherId: null`. This turns five scattered uploads into one visible body of work.
3. **Claim the pub.dev name `flare_network`** with a `0.0.1-dev` placeholder (verified available
   today; names are first-come). Never `flare_dart` or anything containing `flare_flutter` — those
   collide with Rive's animation library, which does 10,551 downloads/month.
4. **Run the demand probe — one hour, and it is also the sponsor test.** Publish the ten-line
   Reown + Flare snippet as a gist, post it in Flare's Discord `#BUILDers-only` (named in Flare's own
   issue-template config as the sanctioned dev channel). Note the date. If at day 14 there is zero
   engagement and neither fassko nor @0xQuantic replies, that is **kill criterion #3**.
5. **File a GitHub issue before any PR.** `CONTRIBUTING.md` says *"Discuss large changes first,"* and
   developer-hub has community PRs rotting since 2025-07-04. **Issue → DM → PR. Never PR-first.**

---

## 8. Sequencing

**Now → Aug 14:** Build the preview and enter Summer Signal, Bounty 1. The hackathon *is* the wedge —
it produces public proof-of-work, judged by the people who matter, on a clock.

**In parallel, ~2 hours:** a `flare-dart-skill` PR to `flare-ai-skills`. Six skills exist, 0 open
issues, fassko owns ~95% of commits — it lands directly in his queue with zero contention. Its
CONTRIBUTING.md **mandates disclosing AI assistance. Disclose it.** Non-disclosure with the one
person you most need is relationship-ending.

**After something merges:** the `flare-for-dart-developers.mdx` guide PR
(`sidebar_position: 6`, `!!raw-loader!` imports, `examples/developer-hub-dart/`).

**Only after that:** the grants Airtable. Anchor your own number against the verified precedent band
(**$1,400 → $105,000**); **$25k–$45k** milestone-structured plus a maintenance retainer is
defensible. **Never quote a Flare grant figure — none is published.**

⚠️ **Sequencing trap:** XRPL Commons' Glow programme (Wave #5, closes **2026-08-31**) states
*"the work must not have been previously funded through Glow **or another program**."* It is
retroactive and individuals-only. Taking Flare money first may burn Glow eligibility for the same
work. **Ask XRPL Commons before submitting either.**

---

## 9. Kill criteria

Stop or pivot if: the dead repo links are still 404ing at outreach (week 0) · codegen is not
producing analyzer-clean Dart (week 2) · the demand probe gets zero engagement (week 2) · no
Flare-side human has engaged at all (week 4) · someone ships a real Flare Dart SDK with substantive
commits · **you find yourself scoping P-chain** · under 5 downloads/week at month 3 with zero
external issues — at which point ship the guide, publish a dated support policy, and stop
**deliberately and publicly**, before it rots into another broken link.

---

## 10. Open questions only Flare can answer

1. **Is P-chain parity required** for Flare to consider a Dart SDK complete? Largest fork in the
   estimate (~90–111 eng-days). Ask fassko directly.
2. **Which of the 100 awarded grants were "Dev Tools," and what did they build?** Flare publishes the
   label but no grantee list. This confirms or kills the tooling precedent outright.
3. **Does Flare intend to fund, endorse, or adopt a Dart SDK — or only accept the guide?** No public
   statement exists either way. Determines whether this is a portfolio artifact or a funded commitment.
4. **Does a Flare grant disqualify the same work from Glow?** Ask XRPL Commons first.
