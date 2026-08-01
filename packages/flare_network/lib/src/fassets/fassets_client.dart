import 'package:meta/meta.dart';

import '../abi/abi_function.dart';
import '../abi/abi_type.dart';
import '../abi/eth_address.dart';
import '../registry/contract_registry.dart';
import '../rpc/flare_client.dart';
import '../rpc/json_rpc_client.dart';
import '../abi/hex.dart';

/// An FAsset — a Flare-native wrapper around an asset from a chain without
/// smart contracts, such as XRP, BTC or DOGE.
@immutable
final class FAssetInfo {
  /// The asset manager that governs minting and redemption for this asset.
  final EthAddress assetManager;

  /// The ERC-20 token contract.
  final EthAddress token;

  /// Token name, e.g. `FXRP`.
  final String name;

  /// Token symbol. Testnet deployments prefix this, e.g. `FTestXRP`.
  final String symbol;

  /// ERC-20 decimals. FXRP uses 6, matching XRP's drops.
  final int decimals;

  /// Total minted supply, in the token's smallest unit.
  final BigInt totalSupply;

  const FAssetInfo({
    required this.assetManager,
    required this.token,
    required this.name,
    required this.symbol,
    required this.decimals,
    required this.totalSupply,
  });

  /// [totalSupply] as an exact decimal string, scaled by [decimals].
  String get totalSupplyFormatted {
    if (decimals <= 0) return totalSupply.toString();
    final digits = totalSupply.toString().padLeft(decimals + 1, '0');
    final whole = digits.substring(0, digits.length - decimals);
    final fraction = digits.substring(digits.length - decimals);
    return '$whole.$fraction';
  }

  @override
  String toString() => '$symbol ($name) — $totalSupplyFormatted minted';
}

/// Read access to FAssets: Flare's trustless wrappers for XRP, BTC and DOGE.
///
/// ```dart
/// final fassets = await FAssetsClient.resolve(client);
/// for (final asset in await fassets.listAssets()) {
///   print(asset); // FTestXRP (FXRP) — 4139441.754488 minted
/// }
/// ```
///
/// Read-only. Minting requires signing a payment on the underlying chain (an
/// XRP Ledger payment for FXRP), which is outside this package's scope; the
/// balances, supply and agent data below are all free `eth_call`s.
class FAssetsClient {
  /// `getAssetManagers() returns (address[])`
  static final AbiFunction getAssetManagersFn = AbiFunction(
    name: 'getAssetManagers',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// `assetManagerExists(address) returns (bool)`
  static final AbiFunction assetManagerExistsFn = AbiFunction(
    name: 'assetManagerExists',
    inputs: [
      AbiParameter(name: '_assetManager', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// `fAsset() returns (address)`
  static final AbiFunction fAssetFn = AbiFunction(
    name: 'fAsset',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// `emergencyPaused() returns (bool)`
  static final AbiFunction emergencyPausedFn = AbiFunction(
    name: 'emergencyPaused',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// `lotSize() returns (uint256)` — the minting granularity, in UBA.
  static final AbiFunction lotSizeFn = AbiFunction(
    name: 'lotSize',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  static AbiFunction _erc20(String name, String returns) => AbiFunction(
    name: name,
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse(returns))],
    stateMutability: StateMutability.view,
  );

  /// `balanceOf(address) returns (uint256)`
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: 'account', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// The client used for calls.
  final FlareClient client;

  /// `AssetManagerController`, which lists every deployed asset manager.
  final EthAddress controller;

  const FAssetsClient({required this.client, required this.controller});

  /// Resolves the controller through the registry.
  static Future<FAssetsClient> resolve(
    FlareClient client, {
    ContractRegistry? registry,
  }) async {
    final address = await (registry ?? ContractRegistry(client)).addressOf(
      FlareContract.assetManagerController,
    );
    return FAssetsClient(client: client, controller: address);
  }

  /// Every asset manager deployed on this network.
  ///
  /// Coston2 currently exposes one (FXRP); mainnet may expose several as more
  /// assets go live, so treat the count as variable.
  Future<List<EthAddress>> listAssetManagers() async =>
      ((await client.callFunctionSingle(
                contract: controller,
                function: getAssetManagersFn,
              ))!
              as List)
          .cast<EthAddress>();

  /// Whether [assetManager] is registered with the controller.
  Future<bool> assetManagerExists(EthAddress assetManager) async =>
      (await client.callFunctionSingle(
            contract: controller,
            function: assetManagerExistsFn,
            args: [assetManager],
          ))!
          as bool;

  /// Full details for every FAsset on this network.
  ///
  /// Each asset needs several reads, so they are issued as one batched request
  /// per asset rather than serially.
  Future<List<FAssetInfo>> listAssets() async {
    final managers = await listAssetManagers();
    return [for (final manager in managers) await getAsset(manager)];
  }

  /// Details for the FAsset governed by [assetManager].
  Future<FAssetInfo> getAsset(EthAddress assetManager) async {
    final token =
        (await client.callFunctionSingle(
              contract: assetManager,
              function: fAssetFn,
            ))!
            as EthAddress;

    // Four independent ERC-20 reads, batched into one round trip.
    final calls = <(String, String)>[
      ('name', 'string'),
      ('symbol', 'string'),
      ('decimals', 'uint8'),
      ('totalSupply', 'uint256'),
    ];

    final responses = await client.rpc.batch([
      for (final (fn, ret) in calls)
        RpcRequest('eth_call', [
          {
            'to': token.hex,
            'data': bytesToHex(_erc20(fn, ret).encodeCall(const [])),
          },
          'latest',
        ]),
    ]);

    Object? decode(int i) =>
        _erc20(
          calls[i].$1,
          calls[i].$2,
        ).decodeReturn(hexToBytes(responses[i]! as String)).single;

    return FAssetInfo(
      assetManager: assetManager,
      token: token,
      name: decode(0)! as String,
      symbol: decode(1)! as String,
      decimals: (decode(2)! as BigInt).toInt(),
      totalSupply: decode(3)! as BigInt,
    );
  }

  /// An account's balance of [token], in the token's smallest unit.
  Future<BigInt> balanceOf(EthAddress token, EthAddress account) async =>
      (await client.callFunctionSingle(
            contract: token,
            function: balanceOfFn,
            args: [account],
          ))!
          as BigInt;

  /// Whether [assetManager] is currently emergency-paused.
  ///
  /// Worth surfacing in a UI: while paused, minting and redemption are
  /// unavailable, and an app that ignores it will show operations that cannot
  /// succeed.
  Future<bool> isEmergencyPaused(EthAddress assetManager) async =>
      (await client.callFunctionSingle(
            contract: assetManager,
            function: emergencyPausedFn,
          ))!
          as bool;

  /// The minting lot size, in UBA (the underlying asset's smallest unit).
  ///
  /// FAssets mints in whole lots, so this is the minimum and the granularity.
  Future<BigInt> lotSize(EthAddress assetManager) async =>
      (await client.callFunctionSingle(
            contract: assetManager,
            function: lotSizeFn,
          ))!
          as BigInt;
}
