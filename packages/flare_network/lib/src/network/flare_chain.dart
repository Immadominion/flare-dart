import 'package:meta/meta.dart';

/// A Flare network: its chain ID, public RPC endpoint, explorer and faucet.
///
/// Use the constants [FlareChain.flare], [FlareChain.coston2],
/// [FlareChain.songbird] and [FlareChain.coston] rather than constructing this
/// directly. Construct one only to point at a private or paid RPC endpoint,
/// via [withRpcUrl].
@immutable
final class FlareChain {
  /// Human-readable name, e.g. `Flare Mainnet`.
  final String name;

  /// EIP-155 chain ID. Always pass this explicitly when signing.
  final int chainId;

  /// JSON-RPC endpoint for the C-chain (EVM) API.
  final String rpcUrl;

  /// Blockscout explorer base URL.
  final String explorerUrl;

  /// Ticker of the native gas token, e.g. `FLR`.
  final String nativeSymbol;

  /// Faucet URL, or null on production networks.
  final String? faucetUrl;

  /// Whether this network is a testnet. Guard destructive examples on it.
  final bool isTestnet;

  /// Observed mean time between blocks.
  ///
  /// Measured on 2026-08-02 over 1,000 consecutive blocks per network. The
  /// four differ by a factor of 3.7 — Songbird 1.066 s, Flare 1.161 s,
  /// Coston2 2.726 s, Coston 3.995 s — so the single "~1.8 s" figure in the
  /// public documentation does not describe any of them. Anything that polls
  /// for inclusion should pace itself from this rather than a shared constant.
  ///
  /// Each built-in network carries its measured value. The 2-second default
  /// applies only to a network constructed by hand, where the real figure is
  /// unknown; erring slow costs a little latency, never correctness.
  final Duration blockTime;

  const FlareChain({
    required this.name,
    required this.chainId,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.nativeSymbol,
    required this.isTestnet,
    this.blockTime = const Duration(seconds: 2),
    this.faucetUrl,
  });

  /// Flare mainnet. Chain ID 14.
  static const flare = FlareChain(
    name: 'Flare Mainnet',
    chainId: 14,
    rpcUrl: 'https://flare-api.flare.network/ext/C/rpc',
    explorerUrl: 'https://flare-explorer.flare.network',
    nativeSymbol: 'FLR',
    isTestnet: false,
    blockTime: Duration(milliseconds: 1161),
  );

  /// Coston2, the testnet for Flare mainnet. Chain ID 114.
  /// This is the network to develop dApps against.
  static const coston2 = FlareChain(
    name: 'Coston2',
    chainId: 114,
    rpcUrl: 'https://coston2-api.flare.network/ext/C/rpc',
    explorerUrl: 'https://coston2-explorer.flare.network',
    nativeSymbol: 'C2FLR',
    isTestnet: true,
    blockTime: Duration(milliseconds: 2726),
    faucetUrl: 'https://faucet.flare.network/coston2',
  );

  /// Songbird, the canary network. Chain ID 19.
  static const songbird = FlareChain(
    name: 'Songbird',
    chainId: 19,
    rpcUrl: 'https://songbird-api.flare.network/ext/C/rpc',
    explorerUrl: 'https://songbird-explorer.flare.network',
    nativeSymbol: 'SGB',
    isTestnet: false,
    blockTime: Duration(milliseconds: 1066),
  );

  /// Coston, the testnet for Songbird. Chain ID 16.
  static const coston = FlareChain(
    name: 'Coston',
    chainId: 16,
    rpcUrl: 'https://coston-api.flare.network/ext/C/rpc',
    explorerUrl: 'https://coston-explorer.flare.network',
    nativeSymbol: 'CFLR',
    isTestnet: true,
    blockTime: Duration(milliseconds: 3995),
    faucetUrl: 'https://faucet.flare.network/coston',
  );

  /// Every network the SDK knows about.
  static const values = [flare, coston2, songbird, coston];

  /// Looks up a network by EIP-155 chain ID, or null if unknown.
  static FlareChain? fromChainId(int chainId) {
    for (final c in values) {
      if (c.chainId == chainId) return c;
    }
    return null;
  }

  /// The published ABI set this network shares.
  ///
  /// Verified against `@flarenetwork/flare-periphery-contract-artifacts@0.1.52`:
  /// the Flare and Coston2 ABIs are byte-identical across all 112 contracts, as
  /// are Songbird and Coston across their 105. Flare's 7 extra contracts are
  /// all P-chain surface, which this SDK does not cover. So bindings only need
  /// to be generated twice, not four times.
  AbiProfile get abiProfile =>
      (chainId == 14 || chainId == 114)
          ? AbiProfile.flare
          : AbiProfile.songbird;

  /// Returns a copy pointing at [rpcUrl], for a private or paid endpoint.
  FlareChain withRpcUrl(String rpcUrl) => FlareChain(
    name: name,
    chainId: chainId,
    rpcUrl: rpcUrl,
    explorerUrl: explorerUrl,
    nativeSymbol: nativeSymbol,
    isTestnet: isTestnet,
    blockTime: blockTime,
    faucetUrl: faucetUrl,
  );

  /// CAIP-2 identifier, e.g. `eip155:114`.
  ///
  /// WalletConnect-family libraries take the target chain as a separate
  /// argument in this form, alongside the request itself.
  String get caip2 => 'eip155:$chainId';

  @override
  String toString() => '$name (chainId $chainId)';
}

/// Which of the two published ABI sets a network uses.
enum AbiProfile {
  /// Flare mainnet and Coston2 — 112 contracts.
  flare,

  /// Songbird and Coston — 105 contracts, without the 7 P-chain ones.
  songbird,
}
