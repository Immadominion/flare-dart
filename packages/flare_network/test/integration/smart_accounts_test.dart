@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live Smart Accounts tests.
///
/// Smart Accounts is not a demo surface: the `MasterAccountController` had
/// 99,944 transactions on Coston2 and 66,479 on Flare mainnet when this was
/// written, and creates personal accounts continuously.
///
/// The mainnet pair below was taken from a real `PersonalAccountCreated` log at
/// block 66,480,471. It is used to prove the forward and reverse lookups agree
/// on data this SDK did not produce.
///
/// Run with: `dart test -P integration`
void main() {
  /// From PersonalAccountCreated at mainnet block 66,480,471.
  const knownXrplOwner = 'rLDkBYohbZw1AuFnpYtAcq8sbMjjBWKvE4';
  final knownAccount = EthAddress.parse(
    '0x11f8766e8cB6acc21999BB6bFD4b2f5f3C5731d4',
  );

  group('Coston2', () {
    late FlareClient client;
    late SmartAccountsClient accounts;

    setUpAll(() async {
      client = FlareClient(FlareChain.coston2);
      accounts = await SmartAccountsClient.resolve(client);
    });
    tearDownAll(() => client.close());

    test('resolves the controller through the registry', () async {
      expect(accounts.address.isZero, isFalse);
      expect(await client.isContract(accounts.address), isTrue);
    });

    test('is bound to the XRPL testnet', () async {
      // The same testnet/mainnet split the Data Connector uses for its sources.
      expect(await accounts.sourceId(), 'testXRP');
    });

    test('derivation answers for an address that was never seen', () async {
      // The point of the whole class. A plausible non-zero address comes back
      // for nonsense input, so a bare address proves nothing.
      final nonsense = await accounts.accountFor(
        'rDEFINITELYNOTAREALXRPLADDRESS123456',
      );
      expect(nonsense.address.isZero, isFalse);
      expect(nonsense.isDeployed, isFalse);
      expect(await client.isContract(nonsense.address), isFalse);
    });

    test('even the empty string derives an address', () async {
      final empty = await accounts.accountFor('');
      expect(empty.address.isZero, isFalse);
      expect(empty.isDeployed, isFalse);
    });

    test('derivation is deterministic and distinct per input', () async {
      final a = await accounts.deriveAddress(
        'rAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      );
      final b = await accounts.deriveAddress(
        'rBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB',
      );
      final aAgain = await accounts.deriveAddress(
        'rAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA',
      );

      expect(a, aAgain, reason: 'same input must derive the same address');
      expect(a, isNot(b), reason: 'different inputs must not collide');
    });

    test('an ordinary address is not a smart account', () async {
      final wnat = await ContractRegistry(client).addressOf(FlareContract.wNat);
      expect(await accounts.ownerOf(wnat), isNull);
    });

    test('balances answer for an account that does not exist', () async {
      // Zeros, not an error — which is exactly why isDeployed has to be
      // consulted separately.
      final derived = await accounts.deriveAddress(
        'rNOBODYHOMEXXXXXXXXXXXXXXXXXXXXXXXX',
      );
      final held = await accounts.balancesOf(derived);
      expect(held.native, BigInt.zero);
      expect(held.wNat.isEmpty, isTrue);
      expect(held.fXrp.isEmpty, isTrue);
      expect(held.isEmpty, isTrue);
    });

    test('vaults is a catalogue, not a portfolio', () async {
      // The controller lists every vault it knows about with the account's
      // position in each, zeroed where nothing is held. An address that has
      // never existed still comes back with the full set — so `vaults` is not
      // a list of holdings and must not be rendered as one.
      final derived = await accounts.deriveAddress(
        'rNOBODYHOMEXXXXXXXXXXXXXXXXXXXXXXXX',
      );
      final held = await accounts.balancesOf(derived);

      expect(held.vaults, isNotEmpty);
      expect(held.heldVaults, isEmpty);
      for (final v in held.vaults) {
        expect(v.vaultAddress.isZero, isFalse);
        expect(v.shares, BigInt.zero);
        expect(v.assets, BigInt.zero);
      }
    });

    test('batch derivation matches one-at-a-time derivation', () async {
      const inputs = [
        'rONE11111111111111111111111111111',
        'rTWO22222222222222222222222222222',
      ];
      final batched = await accounts.deriveAddresses(inputs);

      expect(batched, hasLength(2));
      for (final xrpl in inputs) {
        expect(batched[xrpl], await accounts.deriveAddress(xrpl));
      }
    });

    test('an empty batch makes no request', () async {
      expect(await accounts.deriveAddresses([]), isEmpty);
    });
  });

  group('Flare mainnet', () {
    late FlareClient client;
    late SmartAccountsClient accounts;

    setUpAll(() async {
      client = FlareClient(FlareChain.flare);
      accounts = await SmartAccountsClient.resolve(client);
    });
    tearDownAll(() => client.close());

    test('is bound to XRPL mainnet', () async {
      expect(await accounts.sourceId(), 'XRP');
    });

    test('a real account round-trips forward and back', () async {
      // Forward: XRPL owner -> Flare address, and it exists.
      final account = await accounts.accountFor(knownXrplOwner);
      expect(account.address, knownAccount);
      expect(account.isDeployed, isTrue);

      // Reverse: Flare address -> XRPL owner, agreeing with the log.
      final back = await accounts.ownerOf(knownAccount);
      expect(back, isNotNull);
      expect(back!.xrplOwner, knownXrplOwner);
      expect(back.isDeployed, isTrue);
    });

    test('a deployed account really has code', () async {
      expect(await client.isContract(knownAccount), isTrue);
    });

    test('balances decode for a real account', () async {
      final held = await accounts.balancesOf(knownAccount);

      // Token addresses must be real contracts whatever the balances are.
      expect(held.wNat.token.isZero, isFalse);
      expect(held.fXrp.token.isZero, isFalse);
      expect(held.native, greaterThanOrEqualTo(BigInt.zero));

      for (final v in held.vaults) {
        expect(v.vaultAddress.isZero, isFalse);
        expect(v.shares, greaterThanOrEqualTo(BigInt.zero));
      }
    });

    test(
      'the wNat token the controller reports is the registry WNat',
      () async {
        // Cross-checks the nested tuple decoding against an independent source:
        // if the fields were mis-ordered, this would not line up.
        final held = await accounts.balancesOf(knownAccount);
        final registryWNat = await ContractRegistry(
          client,
        ).addressOf(FlareContract.wNat);
        expect(held.wNat.token, registryWNat);
      },
    );

    test('addressing balances by XRPL owner matches by address', () async {
      final byAddress = await accounts.balancesOf(knownAccount);
      final byXrpl = await accounts.balancesForXrpl(knownXrplOwner);

      expect(byXrpl.wNat.token, byAddress.wNat.token);
      expect(byXrpl.fXrp.token, byAddress.fXrp.token);
      expect(byXrpl.vaults.length, byAddress.vaults.length);
    });

    test('the account names the controller as its own', () async {
      // IPersonalAccount.controllerAddress() should point back at the
      // controller we resolved from the registry.
      final controller = await client.callFunctionSingle(
        contract: knownAccount,
        function: AbiFunction(
          name: 'controllerAddress',
          inputs: const [],
          outputs: [AbiParameter(name: '', type: AbiAddressType())],
          stateMutability: StateMutability.view,
        ),
      );
      expect(controller, accounts.address);
    });
  });

  test('the controller sits at the same address on both networks', () async {
    // Unusual, and worth pinning: like the registry itself, Smart Accounts is
    // deployed at one address across networks.
    final c2 = FlareClient(FlareChain.coston2);
    final mainnet = FlareClient(FlareChain.flare);
    addTearDown(c2.close);
    addTearDown(mainnet.close);

    expect(
      (await SmartAccountsClient.resolve(c2)).address,
      (await SmartAccountsClient.resolve(mainnet)).address,
    );
  });

  test('Songbird does not carry Smart Accounts', () async {
    // It is registered on Flare and Coston2 only. Failing at resolution is
    // better than returning a client that throws on every call.
    final songbird = FlareClient(FlareChain.songbird);
    addTearDown(songbird.close);

    await expectLater(
      SmartAccountsClient.resolve(songbird),
      throwsA(isA<FlareRegistryException>()),
    );
  });
}
