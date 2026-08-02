// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IReaderFacet
// Functions: 5 — 5 readable via eth_call, 0 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 1
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IReaderFacet` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IReaderFacetContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IReaderFacetContract({required this.client, required this.address});

  /// Resolves `IReaderFacet` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IReaderFacetContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IReaderFacetContract(client: client, address: resolved);
  }

  /// ABI descriptor for `agentVaults()`.
  static final AbiFunction agentVaultsFn = AbiFunction(
    name: 'agentVaults',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_agentVaults',
        type: AbiType.parse('(uint256,address)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalances(string)`.
  static final AbiFunction getBalancesFn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_xrplOwner', type: AbiType.parse('string'))],
    outputs: [
      AbiParameter(
        name: '_balances',
        type: AbiType.parse(
          '(uint256,(address,uint256),(address,uint256),(uint256,address,uint8,uint256,uint256)[])',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getBalances(address)`.
  static final AbiFunction getBalances2Fn = AbiFunction(
    name: 'getBalances',
    inputs: [AbiParameter(name: '_account', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_balances',
        type: AbiType.parse(
          '(uint256,(address,uint256),(address,uint256),(uint256,address,uint8,uint256,uint256)[])',
        ),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isSmartAccount(address)`.
  static final AbiFunction isSmartAccountFn = AbiFunction(
    name: 'isSmartAccount',
    inputs: [AbiParameter(name: '_address', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '_isSmartAccount', type: AbiType.parse('bool')),
      AbiParameter(name: '_xrplOwner', type: AbiType.parse('string')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `vaults()`.
  static final AbiFunction vaultsFn = AbiFunction(
    name: 'vaults',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_vaults',
        type: AbiType.parse('(uint256,address,uint8)[]'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// Calls `agentVaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> agentVaults() async {
    final out = await client.callFunction(
      contract: address,
      function: agentVaultsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// Calls `getBalances(string)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getBalances(String xrplOwner) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalancesFn,
      args: [xrplOwner],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getBalances(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getBalances2(EthAddress account) async {
    final out = await client.callFunction(
      contract: address,
      function: getBalances2Fn,
      args: [account],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `isSmartAccount(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool isSmartAccount, String xrplOwner})> isSmartAccount(
    EthAddress address_,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isSmartAccountFn,
      args: [address_],
    );
    return (isSmartAccount: out[0]! as bool, xrplOwner: out[1]! as String);
  }

  /// Calls `vaults()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<List<Object?>>> vaults() async {
    final out = await client.callFunction(
      contract: address,
      function: vaultsFn,
    );
    return (out[0]! as List).cast<List<Object?>>();
  }

  /// `UnsupportedVaultType(uint8)`
  ///
  /// A custom error carries no message, so a node reports it
  /// as a bare `execution reverted`. Match it with
  /// [decodeRevert] to recover the name and arguments.
  static final AbiError unsupportedVaultTypeError = AbiError(
    name: 'UnsupportedVaultType',
    inputs: [AbiParameter(name: 'vaultType', type: AbiType.parse('uint8'))],
  );

  /// Every custom error this contract declares.
  static final List<AbiError> allErrors = [unsupportedVaultTypeError];

  /// Explains why a call to this contract reverted.
  ///
  /// ```dart
  /// try {
  ///   await client.estimateGas(request.toCallRequest());
  /// } on FlareRpcException catch (e) {
  ///   print(decodeRevert(e)?.description);
  /// }
  /// ```
  ///
  /// Returns null when the node attached no revert data,
  /// which is how Flare reports a bare `revert()`.
  static RevertReason? decodeRevert(FlareRpcException e) =>
      e.revertReasonWith(allErrors);
}
