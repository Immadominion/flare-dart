import 'dart:convert';
import 'dart:typed_data';

import '../abi/abi_function.dart';
import '../abi/abi_type.dart';
import '../abi/eth_address.dart';
import '../abi/hex.dart';
import '../registry/contract_registry.dart';
import '../rpc/flare_client.dart';
import '../rpc/json_rpc_client.dart';
import 'smart_account.dart';

/// Reads Flare's Smart Accounts, which let XRP Ledger holders act on Flare.
///
/// An XRPL holder gets a Flare account whose address is derived from their
/// XRPL address, and which the `MasterAccountController` operates on their
/// behalf. They never hold FLR for gas and never manage a Flare key.
///
/// ```dart
/// final accounts = await SmartAccountsClient.resolve(client);
/// final account = await accounts.accountFor('rLDkBYohbZw1AuFnpYtAcq8sbMjjBWKvE4');
/// if (account.isDeployed) {
///   final held = await accounts.balancesOf(account.address);
///   print('FXRP: ${held.fXrp.balance}');
/// }
/// ```
///
/// ## The trap this class exists to close
///
/// `getPersonalAccount` **derives** an address; it does not look one up. It
/// returns a plausible non-zero address for an XRPL address that has never
/// been seen, and for the empty string. Treating a non-zero result as "the
/// account exists" is wrong, and wrong in the direction that loses funds — an
/// undeployed address accepts a transfer and has no code to ever move it out.
/// Every method here reports deployment alongside the address so the question
/// is hard to skip.
///
/// Read-only. Creating an account and operating one both happen through XRPL
/// payments carrying instructions, not through Flare transactions.
final class SmartAccountsClient {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved `MasterAccountController` address.
  final EthAddress address;

  const SmartAccountsClient({required this.client, required this.address});

  /// Resolves the controller through the [ContractRegistry].
  ///
  /// Registered as `MasterAccountController` on Flare mainnet and Coston2, and
  /// deployed at the same address on both. Songbird and Coston do not carry it,
  /// where this throws [FlareRegistryException] rather than returning a client
  /// that fails on every call.
  static Future<SmartAccountsClient> resolve(
    FlareClient client, {
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      FlareContract.masterAccountController,
    );
    return SmartAccountsClient(client: client, address: resolved);
  }

  /// `getPersonalAccount(string)` — derives the Flare address for [xrplAddress].
  static final AbiFunction getPersonalAccountFn = AbiFunction(
    name: 'getPersonalAccount',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiStringType())],
    outputs: [AbiParameter(name: '', type: AbiAddressType())],
    stateMutability: StateMutability.view,
  );

  /// `isSmartAccount(address)` — whether it exists, and whose it is.
  static final AbiFunction isSmartAccountFn = AbiFunction(
    name: 'isSmartAccount',
    inputs: [AbiParameter(name: '_address', type: AbiAddressType())],
    outputs: [
      AbiParameter(name: '_isSmartAccount', type: AbiBoolType()),
      AbiParameter(name: '_xrplOwner', type: AbiStringType()),
    ],
    stateMutability: StateMutability.view,
  );

  /// `getSourceId()` — which XRPL network this controller is bound to.
  static final AbiFunction getSourceIdFn = AbiFunction(
    name: 'getSourceId',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiFixedBytesType(32))],
    stateMutability: StateMutability.view,
  );

  static final _balanceTuple = AbiTupleType([
    AbiIntType(256, signed: false), // natBalance
    AbiTupleType([AbiAddressType(), AbiIntType(256, signed: false)]), // wNat
    AbiTupleType([AbiAddressType(), AbiIntType(256, signed: false)]), // fXrp
    AbiArrayType(
      AbiTupleType([
        AbiIntType(256, signed: false), // vaultId
        AbiAddressType(), // vaultAddress
        AbiIntType(8, signed: false), // vaultType
        AbiIntType(256, signed: false), // shares
        AbiIntType(256, signed: false), // assets
      ]),
    ),
  ]);

  /// `getBalances(address)` — the whole holding, in one call.
  static final AbiFunction getBalancesByAddressFn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_account', type: AbiAddressType())],
    outputs: [AbiParameter(name: '_balances', type: _balanceTuple)],
    stateMutability: StateMutability.view,
  );

  /// `getBalances(string)` — the same, addressed by XRPL owner.
  ///
  /// Overloaded in Solidity on parameter type, so the two have different
  /// selectors and must be separate members here.
  static final AbiFunction getBalancesByXrplFn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiStringType())],
    outputs: [AbiParameter(name: '_balances', type: _balanceTuple)],
    stateMutability: StateMutability.view,
  );

  /// Derives the Flare address for [xrplAddress] without checking it exists.
  ///
  /// One call, and cheap. Prefer [accountFor] unless you have already
  /// established deployment some other way — see the class documentation for
  /// why a bare address is not enough.
  Future<EthAddress> deriveAddress(String xrplAddress) async =>
      (await client.callFunctionSingle(
            contract: address,
            function: getPersonalAccountFn,
            args: [xrplAddress],
          ))!
          as EthAddress;

  /// The account for [xrplAddress], including whether it has been created.
  ///
  /// Two sequential round trips, necessarily: the deployment check needs the
  /// derived address as its argument, so the calls cannot be batched. Use
  /// [deriveAddress] when one is genuinely enough.
  Future<SmartAccount> accountFor(String xrplAddress) async {
    final derived = await deriveAddress(xrplAddress);
    final exists = await _isSmartAccount(derived);
    return SmartAccount(
      xrplOwner: xrplAddress,
      address: derived,
      isDeployed: exists.$1,
    );
  }

  /// The XRPL owner of [flareAddress], or null if it is not a smart account.
  ///
  /// The reverse of [accountFor], and a genuine lookup rather than a
  /// derivation: an address that was never created answers `false`.
  Future<SmartAccount?> ownerOf(EthAddress flareAddress) async {
    final (isAccount, owner) = await _isSmartAccount(flareAddress);
    if (!isAccount) return null;
    return SmartAccount(
      xrplOwner: owner,
      address: flareAddress,
      isDeployed: true,
    );
  }

  Future<(bool, String)> _isSmartAccount(EthAddress candidate) async {
    final out = await client.callFunction(
      contract: address,
      function: isSmartAccountFn,
      args: [candidate],
    );
    return (out[0]! as bool, out[1]! as String);
  }

  /// Which XRPL network this controller is bound to.
  ///
  /// A `bytes32` holding right-padded ASCII: `XRP` on Flare mainnet and
  /// `testXRP` on Coston2 — the same testnet/mainnet split the Flare Data
  /// Connector uses for its attestation sources. Passing a mainnet XRPL address
  /// to a testnet controller derives an address that will never be created.
  Future<String> sourceId() async {
    final raw =
        (await client.callFunctionSingle(
              contract: address,
              function: getSourceIdFn,
            ))!
            as Uint8List;
    // Right-padded with zeros to fill the word.
    final end = raw.indexOf(0);
    return utf8.decode(raw.sublist(0, end == -1 ? raw.length : end));
  }

  /// Everything [account] holds: native, WNat, FXRP and vault positions.
  ///
  /// Answers for an address that has never been created, reporting zeros
  /// throughout — so an empty result means "nothing here", not "no such
  /// account". Use [accountFor] to tell those apart.
  Future<SmartAccountBalances> balancesOf(EthAddress account) async =>
      _decodeBalances(
        await client.callFunctionSingle(
          contract: address,
          function: getBalancesByAddressFn,
          args: [account],
        ),
      );

  /// The same, addressed by XRPL owner rather than Flare address.
  Future<SmartAccountBalances> balancesForXrpl(String xrplAddress) async =>
      _decodeBalances(
        await client.callFunctionSingle(
          contract: address,
          function: getBalancesByXrplFn,
          args: [xrplAddress],
        ),
      );

  /// Resolves several XRPL addresses in one round trip.
  ///
  /// Derivation only — deployment is not checked, because doing so needs each
  /// derived address before it can be asked about. Follow with [ownerOf] or
  /// [accountFor] for the ones that matter.
  Future<Map<String, EthAddress>> deriveAddresses(
    List<String> xrplAddresses,
  ) async {
    if (xrplAddresses.isEmpty) return const {};

    final results = await client.rpc.batch([
      for (final xrpl in xrplAddresses)
        RpcRequest('eth_call', [
          {
            'to': address.hex,
            'data': bytesToHex(getPersonalAccountFn.encodeCall([xrpl])),
          },
          'latest',
        ]),
    ]);

    return {
      for (var i = 0; i < xrplAddresses.length; i++)
        xrplAddresses[i]:
            getPersonalAccountFn.decodeReturn(
                  hexToBytes(results[i]! as String),
                )[0]!
                as EthAddress,
    };
  }

  /// Nested tuples decode positionally, so the shape is asserted here rather
  /// than trusted — a controller upgrade that reorders fields should fail
  /// loudly instead of silently reporting one balance as another.
  SmartAccountBalances _decodeBalances(Object? raw) {
    final t = raw! as List<Object?>;
    final wNat = t[1]! as List<Object?>;
    final fXrp = t[2]! as List<Object?>;
    final vaults = t[3]! as List<Object?>;

    return SmartAccountBalances(
      native: t[0]! as BigInt,
      wNat: TokenBalance(
        token: wNat[0]! as EthAddress,
        balance: wNat[1]! as BigInt,
      ),
      fXrp: TokenBalance(
        token: fXrp[0]! as EthAddress,
        balance: fXrp[1]! as BigInt,
      ),
      vaults: [
        for (final v in vaults)
          if (v is List<Object?>)
            VaultPosition(
              vaultId: v[0]! as BigInt,
              vaultAddress: v[1]! as EthAddress,
              vaultType: (v[2]! as BigInt).toInt(),
              shares: v[3]! as BigInt,
              assets: v[4]! as BigInt,
            ),
      ],
    );
  }
}
