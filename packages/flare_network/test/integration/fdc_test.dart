@Tags(['integration'])
library;

import 'package:flare_network/flare_network.dart';
import 'package:test/test.dart';

/// Live FDC tests against Coston2.
///
/// Run with: `dart test -P integration`
void main() {
  late FlareClient client;
  late FdcClient fdc;

  setUpAll(() async {
    client = FlareClient(FlareChain.coston2);
    fdc = await FdcClient.resolve(client);
  });
  tearDownAll(() => client.close());

  test('resolves every FDC contract through the registry', () {
    expect(fdc.feeConfigurations.isZero, isFalse);
    expect(fdc.protocolsV2.isZero, isFalse);
    expect(fdc.verification.isZero, isFalse);
  });

  test('prices supported attestations at 1000 wei on Coston2', () async {
    // Measured 2026-08-01: every supported pair on Coston2 costs 1000 wei.
    // Mainnet charges 20 FLR for the same attestations.
    final pairs = <(AttestationType, AttestationSource)>[
      (AttestationType.payment, AttestationSource.xrp.forChain(client.chain)),
      (
        AttestationType.evmTransaction,
        AttestationSource.eth.forChain(client.chain),
      ),
      (AttestationType.web2Json, AttestationSource.publicWeb2),
    ];

    for (final (type, source) in pairs) {
      final fee = await fdc.getRequestFee(type, source);
      expect(fee, BigInt.from(1000), reason: '${type.id}/${source.id}');
    }
  });

  test(
    'explains an unsupported type/source pair rather than reverting raw',
    () async {
      // Bare mainnet source names are not accepted on a testnet. Without a clear
      // message this surfaces as "execution reverted", which says nothing about
      // the actual naming rule.
      await expectLater(
        fdc.getRequestFee(
          AttestationType.payment,
          AttestationSource.xrp.mainnet,
        ),
        throwsA(
          isA<FlareContractException>().having(
            (e) => e.message,
            'message',
            contains('test-prefixed'),
          ),
        ),
      );
    },
  );

  test(
    'isSupported distinguishes testnet from mainnet source naming',
    () async {
      expect(
        await fdc.isSupported(
          AttestationType.payment,
          AttestationSource.xrp.forChain(client.chain),
        ),
        isTrue,
      );
      expect(
        await fdc.isSupported(
          AttestationType.payment,
          AttestationSource.xrp.mainnet,
        ),
        isFalse,
      );
    },
  );

  test('reads voting epoch timing from ProtocolsV2', () async {
    final timing = await fdc.timing();

    // Verified live on both Coston2 and mainnet on 2026-08-01. Asserted
    // loosely so a legitimate protocol change fails informatively rather than
    // pinning the SDK to a snapshot.
    expect(timing.firstVotingRoundStartTs, greaterThan(1_600_000_000));
    expect(timing.votingEpochDurationSeconds, greaterThan(0));
    expect(timing.votingEpochDurationSeconds, lessThanOrEqualTo(600));
  });

  test('derived round ID agrees with the contract', () async {
    final reported = await fdc.currentVotingRoundId();
    final derived = await fdc.votingRoundIdAt(DateTime.now().toUtc());

    // This is the arithmetic every FDC proof lookup depends on. A couple of
    // epochs of slack absorbs clock skew and block lag.
    expect((derived - reported).abs(), lessThanOrEqualTo(2));
  });

  test('timing is cached after the first read', () async {
    final first = await fdc.timing();
    final second = await fdc.timing();
    expect(identical(first, second), isTrue);
  });

  test('reports the FDC protocol ID', () async {
    expect(await fdc.protocolId(), greaterThan(0));
  });

  test('DA Layer and FdcClient agree on the current round', () async {
    final da = DaLayerClient(FlareChain.coston2);
    addTearDown(da.close);

    final status = await da.getStatus();
    final onchain = await fdc.currentVotingRoundId();

    // Two independent sources for the same protocol clock.
    expect((status.activeVotingRoundId - onchain).abs(), lessThanOrEqualTo(2));
  });
}
