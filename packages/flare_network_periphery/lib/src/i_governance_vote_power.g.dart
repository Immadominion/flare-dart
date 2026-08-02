// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IGovernanceVotePower
// Functions: 6 — 4 readable via eth_call, 2 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IGovernanceVotePower` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IGovernanceVotePowerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IGovernanceVotePowerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IGovernanceVotePower` through the [ContractRegistry].
  ///
  /// Registered as `GovernanceVotePower`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IGovernanceVotePowerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'GovernanceVotePower',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IGovernanceVotePowerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `delegate(address)`.
  static final AbiFunction delegateFn = AbiFunction(
    name: 'delegate',
    inputs: [AbiParameter(name: '_to', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `getDelegateOfAt(address,uint256)`.
  static final AbiFunction getDelegateOfAtFn = AbiFunction(
    name: 'getDelegateOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegateOfAtNow(address)`.
  static final AbiFunction getDelegateOfAtNowFn = AbiFunction(
    name: 'getDelegateOfAtNow',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVotes(address)`.
  static final AbiFunction getVotesFn = AbiFunction(
    name: 'getVotes',
    inputs: [AbiParameter(name: '_who', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `undelegate()`.
  static final AbiFunction undelegateFn = AbiFunction(
    name: 'undelegate',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `votePowerOfAt(address,uint256)`.
  static final AbiFunction votePowerOfAtFn = AbiFunction(
    name: 'votePowerOfAt',
    inputs: [
      AbiParameter(name: '_who', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `getDelegateOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDelegateOfAtNow(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegateOfAtNow(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegateOfAtNowFn,
      args: [who],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVotes(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getVotes(EthAddress who) async {
    final out = await client.callFunction(
      contract: address,
      function: getVotesFn,
      args: [who],
    );
    return out[0]! as BigInt;
  }

  /// Calls `votePowerOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> votePowerOfAt(EthAddress who, BigInt blockNumber) async {
    final out = await client.callFunction(
      contract: address,
      function: votePowerOfAtFn,
      args: [who, blockNumber],
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `delegate(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest delegateTx(EthAddress to, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: delegateFn,
        args: [to],
        from: from,
      );

  /// Builds an unsigned `undelegate()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest undelegateTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: undelegateFn,
        from: from,
      );
}
