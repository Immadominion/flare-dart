// Reads the wrapped native token (WNat) contract on Coston2.
//
// WNat wraps the native gas token into an ERC-20, which FTSO delegation,
// governance voting and most DeFi expect. This example is read-only; wrapping
// and unwrapping require signing, which this SDK deliberately does not do.
//
//   dart run bin/coston2/wnat.dart
import 'package:flare_network/flare_network.dart';

Future<void> main() async {
  final client = FlareClient(FlareChain.coston2);
  try {
    final registry = ContractRegistry(client);
    final wnat = await registry.addressOf(FlareContract.wNat);
    print('WNat: $wnat');

    Future<Object?> read(String name, String returns) => client
        .callFunctionSingle(
          contract: wnat,
          function: AbiFunction(
            name: name,
            inputs: const [],
            outputs: [AbiParameter(name: '', type: AbiType.parse(returns))],
            stateMutability: StateMutability.view,
          ),
        );

    print('name        : ${await read('name', 'string')}');
    print('symbol      : ${await read('symbol', 'string')}');
    print('decimals    : ${await read('decimals', 'uint8')}');

    final supply = (await read('totalSupply', 'uint256'))! as BigInt;
    // WNat uses 18 decimals like the native token.
    final whole = supply ~/ BigInt.from(10).pow(18);
    print('totalSupply : $supply wei (~$whole ${client.chain.nativeSymbol})');
  } finally {
    client.close();
  }
}
