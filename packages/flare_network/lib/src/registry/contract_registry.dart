import '../abi/abi_function.dart';
import '../abi/abi_type.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';
import '../rpc/flare_client.dart';
import '../rpc/flare_exception.dart';
import '../rpc/json_rpc_client.dart';

/// Well-known names registered in the Flare Contract Registry.
///
/// These are the entries this SDK exercises. The registry holds many more,
/// including deprecated V1 contracts, and [ContractRegistry.addressOf] accepts
/// any name — so this is a convenience, not a limit.
abstract final class FlareContract {
  /// FTSOv2 price feeds.
  static const ftsoV2 = 'FtsoV2';

  /// Wrapped native token (WFLR / WSGB / WC2FLR / WCFLR).
  static const wNat = 'WNat';

  /// Flare Data Connector hub, where attestation requests are submitted.
  static const fdcHub = 'FdcHub';

  /// Per-attestation-type fee configuration for the FDC.
  static const fdcRequestFeeConfigurations = 'FdcRequestFeeConfigurations';

  /// FDC proof verification.
  static const fdcVerification = 'FdcVerification';

  /// Protocol timing: voting epoch start and duration.
  static const protocolsV2 = 'ProtocolsV2';

  /// Secure random number source.
  static const randomNumberV2 = 'RandomNumberV2';

  /// Block-latency feed updates.
  static const fastUpdater = 'FastUpdater';

  /// Feed index configuration for [fastUpdater].
  static const fastUpdatesConfiguration = 'FastUpdatesConfiguration';

  /// Incentive manager controlling feed update rates.
  static const fastUpdateIncentiveManager = 'FastUpdateIncentiveManager';

  /// Reward claiming.
  static const rewardManager = 'RewardManager';

  /// Delegation and executor setup.
  static const claimSetupManager = 'ClaimSetupManager';

  /// FAssets asset manager controller.
  static const assetManagerController = 'AssetManagerController';
}

/// Resolves contract addresses by name through the Flare Contract Registry.
///
/// The registry is the one address this SDK hardcodes, and it is identical on
/// every Flare network. Everything else is resolved at runtime, because Flare
/// redeploys contracts and a pinned address eventually reads a dead one —
/// Flare's own published Python example hardcodes an FtsoV2 address that no
/// longer matches what the registry returns on Coston2.
///
/// ```dart
/// final registry = ContractRegistry(client);
/// final wnat = await registry.addressOf(FlareContract.wNat);
/// ```
///
/// Resolutions are cached in memory for the lifetime of the instance. Call
/// [clearCache] after a known upgrade.
class ContractRegistry {
  /// The registry address, identical on Flare, Coston2, Songbird and Coston.
  static final EthAddress address = EthAddress.parse(
    '0xaD67FE66660Fb8dFE9d6b1b4240d8650e30F6019',
  );

  /// Only two registry methods are needed, so they are declared inline rather
  /// than shipping the full artifact.
  static final AbiFunction getContractAddressByName = AbiFunction(
    name: 'getContractAddressByName',
    inputs: [AbiParameter(name: '_name', type: AbiType.parse('string'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  static final AbiFunction getAllContracts = AbiFunction(
    name: 'getAllContracts',
    inputs: const [],
    outputs: [
      AbiParameter(name: '_names', type: AbiType.parse('string[]')),
      AbiParameter(name: '_addresses', type: AbiType.parse('address[]')),
    ],
    stateMutability: StateMutability.view,
  );

  final FlareClient _client;
  final Map<String, EthAddress> _cache = {};

  ContractRegistry(this._client);

  /// Resolves [name] to its current address.
  ///
  /// Throws [FlareRegistryException] if the registry returns the zero address,
  /// which is how it reports an unknown name.
  Future<EthAddress> addressOf(String name) async {
    final cached = _cache[name];
    if (cached != null) return cached;

    final result = await _client.callFunctionSingle(
      contract: address,
      function: getContractAddressByName,
      args: [name],
    );
    return _cache[name] = _requireKnown(result! as EthAddress, name);
  }

  /// Resolves several names in one batched round trip.
  ///
  /// Prefer this at startup over repeated [addressOf] calls — one network wait
  /// instead of N.
  Future<Map<String, EthAddress>> addressesOf(List<String> names) async {
    final missing = names.where((n) => !_cache.containsKey(n)).toSet().toList();

    if (missing.isNotEmpty) {
      final responses = await _client.rpc.batch([
        for (final name in missing)
          RpcRequest('eth_call', [
            {
              'to': address.hex,
              'data': bytesToHex(getContractAddressByName.encodeCall([name])),
            },
            'latest',
          ]),
      ]);

      for (var i = 0; i < missing.length; i++) {
        final raw = responses[i];
        if (raw is! String) {
          throw FlareRegistryException(
            'Registry batch lookup returned no data for "${missing[i]}"',
            contractName: missing[i],
          );
        }
        final decoded =
            getContractAddressByName.decodeReturn(hexToBytes(raw)).single;
        _cache[missing[i]] = _requireKnown(decoded! as EthAddress, missing[i]);
      }
    }
    return {for (final n in names) n: _cache[n]!};
  }

  /// Every name and address the registry currently holds.
  ///
  /// Includes deprecated V1 contracts, so treat this as a directory to inspect
  /// rather than a surface to re-export wholesale.
  Future<Map<String, EthAddress>> listAll() async {
    final out = await _client.callFunction(
      contract: address,
      function: getAllContracts,
    );
    final names = (out[0]! as List).cast<String>();
    final addresses = (out[1]! as List).cast<EthAddress>();
    if (names.length != addresses.length) {
      throw const FlareContractException(
        'getAllContracts returned mismatched name and address array lengths',
      );
    }
    return {for (var i = 0; i < names.length; i++) names[i]: addresses[i]};
  }

  /// Drops cached resolutions, forcing the next lookup to hit the chain.
  void clearCache() => _cache.clear();

  EthAddress _requireKnown(EthAddress resolved, String name) {
    if (resolved.isZero) {
      throw FlareRegistryException(
        'The registry has no contract named "$name" on ${_client.chain.name}. '
        'Names are case-sensitive; call listAll() to see what is registered.',
        contractName: name,
      );
    }
    return resolved;
  }
}
