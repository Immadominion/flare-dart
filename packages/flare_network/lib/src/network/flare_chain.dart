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

  const FlareChain({
    required this.name,
    required this.chainId,
    required this.rpcUrl,
    required this.explorerUrl,
    required this.nativeSymbol,
    required this.isTestnet,
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
  );

  /// Coston, the testnet for Songbird. Chain ID 16.
  static const coston = FlareChain(
    name: 'Coston',
    chainId: 16,
    rpcUrl: 'https://coston-api.flare.network/ext/C/rpc',
    explorerUrl: 'https://coston-explorer.flare.network',
    nativeSymbol: 'CFLR',
    isTestnet: true,
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
  AbiProfile get abiProfile => (chainId == 14 || chainId == 114)
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
        faucetUrl: faucetUrl,
      );

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
