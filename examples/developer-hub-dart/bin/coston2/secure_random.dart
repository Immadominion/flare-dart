// Reads Flare's secure random number from Coston2.
//
// The value comes from the FTSO commit-reveal process, so it is not derived
// from block data and cannot be ground by a miner or validator.
//
// Always check `isSecureRandom` before using the value for anything of value:
// it is false when the round did not reach the required consensus.
//
//   dart run bin/coston2/secure_random.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final registry = ContractRegistry(client);
    final address = await registry.addressOf(FlareContract.randomNumberV2);

    final getRandomNumber = AbiFunction(
      name: 'getRandomNumber',
      inputs: const [],
      outputs: [
        AbiParameter(name: '_randomNumber', type: AbiType.parse('uint256')),
        AbiParameter(name: '_isSecureRandom', type: AbiType.parse('bool')),
        AbiParameter(name: '_randomTimestamp', type: AbiType.parse('uint256')),
      ],
      stateMutability: StateMutability.view,
    );

    final out = await client.callFunction(
      contract: address,
      function: getRandomNumber,
    );

    final random = out[0]! as BigInt;
    final isSecure = out[1]! as bool;
    final timestamp = (out[2]! as BigInt).toInt();

    print('RandomNumberV2 : $address');
    print('random         : $random');
    print('isSecureRandom : $isSecure');
    print(
      'timestamp      : '
      '${DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true)}',
    );

    if (!isSecure) {
      print(
        '\nThis round is NOT flagged secure — do not use it for anything '
        'with value at stake.',
      );
    }
  } finally {
    client.close();
  }
}
