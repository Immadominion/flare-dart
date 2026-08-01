// Inspects the Flare Data Connector on Coston2: which attestation types are
// available, what each costs, and how voting round IDs are derived.
//
// Requesting an attestation needs a signed, payable transaction, which this
// SDK does not do. Everything below is a free read.
//
//   dart run bin/coston2/fdc_fees.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final fdc = await FdcClient.resolve(client);
    print('FdcRequestFeeConfigurations : ${fdc.feeConfigurations}');
    print('FdcVerification             : ${fdc.verification}');
    print('ProtocolsV2                 : ${fdc.protocolsV2}\n');

    // Source identifiers differ between mainnet and testnets: Coston2 expects
    // testXRP, testBTC and so on. `forChain` picks the right one, and using a
    // mainnet name here would revert with a message about an unsupported
    // type/source combination.
    final chain = client.chain;
    final pairs = <(AttestationType, AttestationSource)>[
      (AttestationType.payment, AttestationSource.xrp.forChain(chain)),
      (AttestationType.payment, AttestationSource.btc.forChain(chain)),
      (AttestationType.evmTransaction, AttestationSource.eth.forChain(chain)),
      (AttestationType.addressValidity, AttestationSource.xrp.forChain(chain)),
      (AttestationType.web2Json, AttestationSource.publicWeb2),
    ];

    print('Attestation fees on ${chain.name}:');
    for (final (type, source) in pairs) {
      final fee = await fdc.getRequestFee(type, source);
      print('  ${type.id.padRight(30)} ${source.id.padRight(12)} '
          '${fee.toString().padLeft(22)} wei');
    }

    // Voting round timing must be read at runtime — a hardcoded constant does
    // not hold across networks, and a wrong round makes every proof lookup miss.
    final timing = await fdc.timing();
    final current = await fdc.currentVotingRoundId();
    final derived = await fdc.votingRoundIdAt(DateTime.now().toUtc());

    print('\nVoting rounds:');
    print('  epoch 0 began at  ${timing.firstVotingRoundStartTs}');
    print('  round duration    ${timing.votingEpochDurationSeconds}s');
    print('  current (onchain) $current');
    print('  current (derived) $derived');
    print('  round $current began ${timing.startOf(current).toIso8601String()}');
  } finally {
    client.close();
  }
}
