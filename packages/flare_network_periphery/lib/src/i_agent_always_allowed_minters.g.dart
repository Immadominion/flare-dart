// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IAgentAlwaysAllowedMinters
// Functions: 3 — 1 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IAgentAlwaysAllowedMinters` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IAgentAlwaysAllowedMintersContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IAgentAlwaysAllowedMintersContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IAgentAlwaysAllowedMinters` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IAgentAlwaysAllowedMintersContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IAgentAlwaysAllowedMintersContract(
      client: client,
      address: resolved,
    );
  }

  /// ABI descriptor for `addAlwaysAllowedMinterForAgent(address,address)`.
  static final AbiFunction addAlwaysAllowedMinterForAgentFn = AbiFunction(
    name: 'addAlwaysAllowedMinterForAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_minter', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `alwaysAllowedMintersForAgent(address)`.
  static final AbiFunction alwaysAllowedMintersForAgentFn = AbiFunction(
    name: 'alwaysAllowedMintersForAgent',
    inputs: [AbiParameter(name: '_agentVault', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `removeAlwaysAllowedMinterForAgent(address,address)`.
  static final AbiFunction removeAlwaysAllowedMinterForAgentFn = AbiFunction(
    name: 'removeAlwaysAllowedMinterForAgent',
    inputs: [
      AbiParameter(name: '_agentVault', type: AbiType.parse('address')),
      AbiParameter(name: '_minter', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `alwaysAllowedMintersForAgent(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<EthAddress>> alwaysAllowedMintersForAgent(
    EthAddress agentVault,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: alwaysAllowedMintersForAgentFn,
      args: [agentVault],
    );
    return (out[0]! as List).cast<EthAddress>();
  }

  /// Builds an unsigned `addAlwaysAllowedMinterForAgent(address,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest addAlwaysAllowedMinterForAgentTx(
    EthAddress agentVault,
    EthAddress minter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: addAlwaysAllowedMinterForAgentFn,
    args: [agentVault, minter],
    from: from,
  );

  /// Builds an unsigned `removeAlwaysAllowedMinterForAgent(address,address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest removeAlwaysAllowedMinterForAgentTx(
    EthAddress agentVault,
    EthAddress minter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: removeAlwaysAllowedMinterForAgentFn,
    args: [agentVault, minter],
    from: from,
  );
}
