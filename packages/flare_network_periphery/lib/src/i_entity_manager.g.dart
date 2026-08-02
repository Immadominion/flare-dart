// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IEntityManager
// Functions: 26 — 14 readable via eth_call, 12 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IEntityManager` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IEntityManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IEntityManagerContract({required this.client, required this.address});

  /// Resolves `IEntityManager` through the [ContractRegistry].
  ///
  /// Registered as `EntityManager`, which is what the registry
  /// answers to — the Solidity interface name is not a registry
  /// key.
  static Future<IEntityManagerContract> resolve(
    FlareClient client, {
    ContractRegistry? registry,
    String registryName = 'EntityManager',
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IEntityManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `confirmDelegationAddressRegistration(address)`.
  static final AbiFunction confirmDelegationAddressRegistrationFn = AbiFunction(
    name: 'confirmDelegationAddressRegistration',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `confirmSigningPolicyAddressRegistration(address)`.
  static final AbiFunction confirmSigningPolicyAddressRegistrationFn =
      AbiFunction(
        name: 'confirmSigningPolicyAddressRegistration',
        inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `confirmSubmitAddressRegistration(address)`.
  static final AbiFunction confirmSubmitAddressRegistrationFn = AbiFunction(
    name: 'confirmSubmitAddressRegistration',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `confirmSubmitSignaturesAddressRegistration(address)`.
  static final AbiFunction confirmSubmitSignaturesAddressRegistrationFn =
      AbiFunction(
        name: 'confirmSubmitSignaturesAddressRegistration',
        inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `getDelegationAddressOf(address)`.
  static final AbiFunction getDelegationAddressOfFn = AbiFunction(
    name: 'getDelegationAddressOf',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDelegationAddressOfAt(address,uint256)`.
  static final AbiFunction getDelegationAddressOfAtFn = AbiFunction(
    name: 'getDelegationAddressOfAt',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNodeIdsOf(address)`.
  static final AbiFunction getNodeIdsOfFn = AbiFunction(
    name: 'getNodeIdsOf',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes20[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getNodeIdsOfAt(address,uint256)`.
  static final AbiFunction getNodeIdsOfAtFn = AbiFunction(
    name: 'getNodeIdsOfAt',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bytes20[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPublicKeyOf(address)`.
  static final AbiFunction getPublicKeyOfFn = AbiFunction(
    name: 'getPublicKeyOf',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getPublicKeyOfAt(address,uint256)`.
  static final AbiFunction getPublicKeyOfAtFn = AbiFunction(
    name: 'getPublicKeyOfAt',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
      AbiParameter(name: '', type: AbiType.parse('bytes32')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterAddresses(address)`.
  static final AbiFunction getVoterAddressesFn = AbiFunction(
    name: 'getVoterAddresses',
    inputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    outputs: [
      AbiParameter(
        name: '_addresses',
        type: AbiType.parse('(address,address,address)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterAddressesAt(address,uint256)`.
  static final AbiFunction getVoterAddressesAtFn = AbiFunction(
    name: 'getVoterAddressesAt',
    inputs: [
      AbiParameter(name: '_voter', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [
      AbiParameter(
        name: '_addresses',
        type: AbiType.parse('(address,address,address)'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForDelegationAddress(address,uint256)`.
  static final AbiFunction getVoterForDelegationAddressFn = AbiFunction(
    name: 'getVoterForDelegationAddress',
    inputs: [
      AbiParameter(name: '_delegationAddress', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForNodeId(bytes20,uint256)`.
  static final AbiFunction getVoterForNodeIdFn = AbiFunction(
    name: 'getVoterForNodeId',
    inputs: [
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForPublicKey(bytes32,bytes32,uint256)`.
  static final AbiFunction getVoterForPublicKeyFn = AbiFunction(
    name: 'getVoterForPublicKey',
    inputs: [
      AbiParameter(name: '_part1', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_part2', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForSigningPolicyAddress(address,uint256)`.
  static final AbiFunction getVoterForSigningPolicyAddressFn = AbiFunction(
    name: 'getVoterForSigningPolicyAddress',
    inputs: [
      AbiParameter(
        name: '_signingPolicyAddress',
        type: AbiType.parse('address'),
      ),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForSubmitAddress(address,uint256)`.
  static final AbiFunction getVoterForSubmitAddressFn = AbiFunction(
    name: 'getVoterForSubmitAddress',
    inputs: [
      AbiParameter(name: '_submitAddress', type: AbiType.parse('address')),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getVoterForSubmitSignaturesAddress(address,uint256)`.
  static final AbiFunction getVoterForSubmitSignaturesAddressFn = AbiFunction(
    name: 'getVoterForSubmitSignaturesAddress',
    inputs: [
      AbiParameter(
        name: '_submitSignaturesAddress',
        type: AbiType.parse('address'),
      ),
      AbiParameter(name: '_blockNumber', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '_voter', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `proposeDelegationAddress(address)`.
  static final AbiFunction proposeDelegationAddressFn = AbiFunction(
    name: 'proposeDelegationAddress',
    inputs: [
      AbiParameter(name: '_delegationAddress', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `proposeSigningPolicyAddress(address)`.
  static final AbiFunction proposeSigningPolicyAddressFn = AbiFunction(
    name: 'proposeSigningPolicyAddress',
    inputs: [
      AbiParameter(
        name: '_signingPolicyAddress',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `proposeSubmitAddress(address)`.
  static final AbiFunction proposeSubmitAddressFn = AbiFunction(
    name: 'proposeSubmitAddress',
    inputs: [
      AbiParameter(name: '_submitAddress', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `proposeSubmitSignaturesAddress(address)`.
  static final AbiFunction proposeSubmitSignaturesAddressFn = AbiFunction(
    name: 'proposeSubmitSignaturesAddress',
    inputs: [
      AbiParameter(
        name: '_submitSignaturesAddress',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `registerNodeId(bytes20,bytes,bytes)`.
  static final AbiFunction registerNodeIdFn = AbiFunction(
    name: 'registerNodeId',
    inputs: [
      AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20')),
      AbiParameter(name: '_certificateRaw', type: AbiType.parse('bytes')),
      AbiParameter(name: '_signature', type: AbiType.parse('bytes')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `registerPublicKey(bytes32,bytes32,bytes)`.
  static final AbiFunction registerPublicKeyFn = AbiFunction(
    name: 'registerPublicKey',
    inputs: [
      AbiParameter(name: '_part1', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_part2', type: AbiType.parse('bytes32')),
      AbiParameter(name: '_verificationData', type: AbiType.parse('bytes')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unregisterNodeId(bytes20)`.
  static final AbiFunction unregisterNodeIdFn = AbiFunction(
    name: 'unregisterNodeId',
    inputs: [AbiParameter(name: '_nodeId', type: AbiType.parse('bytes20'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unregisterPublicKey()`.
  static final AbiFunction unregisterPublicKeyFn = AbiFunction(
    name: 'unregisterPublicKey',
    inputs: [],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getDelegationAddressOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegationAddressOf(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegationAddressOfFn,
      args: [voter],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDelegationAddressOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDelegationAddressOfAt(
    EthAddress voter,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getDelegationAddressOfAtFn,
      args: [voter, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getNodeIdsOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> getNodeIdsOf(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getNodeIdsOfFn,
      args: [voter],
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `getNodeIdsOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Uint8List>> getNodeIdsOfAt(
    EthAddress voter,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getNodeIdsOfAtFn,
      args: [voter, blockNumber],
    );
    return (out[0]! as List).cast<Uint8List>();
  }

  /// Calls `getPublicKeyOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<(Uint8List, Uint8List)> getPublicKeyOf(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getPublicKeyOfFn,
      args: [voter],
    );
    return (out[0]! as Uint8List, out[1]! as Uint8List);
  }

  /// Calls `getPublicKeyOfAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<(Uint8List, Uint8List)> getPublicKeyOfAt(
    EthAddress voter,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getPublicKeyOfAtFn,
      args: [voter, blockNumber],
    );
    return (out[0]! as Uint8List, out[1]! as Uint8List);
  }

  /// Calls `getVoterAddresses(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getVoterAddresses(EthAddress voter) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterAddressesFn,
      args: [voter],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getVoterAddressesAt(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<Object?>> getVoterAddressesAt(
    EthAddress voter,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterAddressesAtFn,
      args: [voter, blockNumber],
    );
    return (out[0]! as List).cast<Object?>();
  }

  /// Calls `getVoterForDelegationAddress(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForDelegationAddress(
    EthAddress delegationAddress,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForDelegationAddressFn,
      args: [delegationAddress, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVoterForNodeId(bytes20,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForNodeId(
    Uint8List nodeId,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForNodeIdFn,
      args: [nodeId, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVoterForPublicKey(bytes32,bytes32,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForPublicKey(
    Uint8List part1,
    Uint8List part2,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForPublicKeyFn,
      args: [part1, part2, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVoterForSigningPolicyAddress(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForSigningPolicyAddress(
    EthAddress signingPolicyAddress,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForSigningPolicyAddressFn,
      args: [signingPolicyAddress, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVoterForSubmitAddress(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForSubmitAddress(
    EthAddress submitAddress,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForSubmitAddressFn,
      args: [submitAddress, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getVoterForSubmitSignaturesAddress(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getVoterForSubmitSignaturesAddress(
    EthAddress submitSignaturesAddress,
    BigInt blockNumber,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: getVoterForSubmitSignaturesAddressFn,
      args: [submitSignaturesAddress, blockNumber],
    );
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `confirmDelegationAddressRegistration(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmDelegationAddressRegistrationTx(
    EthAddress voter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmDelegationAddressRegistrationFn,
    args: [voter],
    from: from,
  );

  /// Builds an unsigned `confirmSigningPolicyAddressRegistration(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmSigningPolicyAddressRegistrationTx(
    EthAddress voter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmSigningPolicyAddressRegistrationFn,
    args: [voter],
    from: from,
  );

  /// Builds an unsigned `confirmSubmitAddressRegistration(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmSubmitAddressRegistrationTx(
    EthAddress voter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmSubmitAddressRegistrationFn,
    args: [voter],
    from: from,
  );

  /// Builds an unsigned `confirmSubmitSignaturesAddressRegistration(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest confirmSubmitSignaturesAddressRegistrationTx(
    EthAddress voter, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: confirmSubmitSignaturesAddressRegistrationFn,
    args: [voter],
    from: from,
  );

  /// Builds an unsigned `proposeDelegationAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proposeDelegationAddressTx(
    EthAddress delegationAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proposeDelegationAddressFn,
    args: [delegationAddress],
    from: from,
  );

  /// Builds an unsigned `proposeSigningPolicyAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proposeSigningPolicyAddressTx(
    EthAddress signingPolicyAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proposeSigningPolicyAddressFn,
    args: [signingPolicyAddress],
    from: from,
  );

  /// Builds an unsigned `proposeSubmitAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proposeSubmitAddressTx(
    EthAddress submitAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proposeSubmitAddressFn,
    args: [submitAddress],
    from: from,
  );

  /// Builds an unsigned `proposeSubmitSignaturesAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest proposeSubmitSignaturesAddressTx(
    EthAddress submitSignaturesAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: proposeSubmitSignaturesAddressFn,
    args: [submitSignaturesAddress],
    from: from,
  );

  /// Builds an unsigned `registerNodeId(bytes20,bytes,bytes)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest registerNodeIdTx(
    Uint8List nodeId,
    Uint8List certificateRaw,
    Uint8List signature, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: registerNodeIdFn,
    args: [nodeId, certificateRaw, signature],
    from: from,
  );

  /// Builds an unsigned `registerPublicKey(bytes32,bytes32,bytes)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest registerPublicKeyTx(
    Uint8List part1,
    Uint8List part2,
    Uint8List verificationData, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: registerPublicKeyFn,
    args: [part1, part2, verificationData],
    from: from,
  );

  /// Builds an unsigned `unregisterNodeId(bytes20)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unregisterNodeIdTx(Uint8List nodeId, {EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: unregisterNodeIdFn,
        args: [nodeId],
        from: from,
      );

  /// Builds an unsigned `unregisterPublicKey()`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unregisterPublicKeyTx({EthAddress? from}) =>
      TransactionRequest.callFunction(
        to: address,
        function: unregisterPublicKeyFn,
        from: from,
      );

  /// `DelegationAddressProposed(address,address)`
  ///
  /// Decode a matching log with
  /// `delegationAddressProposedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegationAddressProposedEvent = AbiEvent(
    name: 'DelegationAddressProposed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'delegationAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `DelegationAddressRegistrationConfirmed(address,address)`
  ///
  /// Decode a matching log with
  /// `delegationAddressRegistrationConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent delegationAddressRegistrationConfirmedEvent = AbiEvent(
    name: 'DelegationAddressRegistrationConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'delegationAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `MaxNodeIdsPerEntitySet(uint256)`
  ///
  /// Decode a matching log with
  /// `maxNodeIdsPerEntitySetEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent maxNodeIdsPerEntitySetEvent = AbiEvent(
    name: 'MaxNodeIdsPerEntitySet',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'maxNodeIdsPerEntity',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `NodeIdRegistered(address,bytes20)`
  ///
  /// Decode a matching log with
  /// `nodeIdRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent nodeIdRegisteredEvent = AbiEvent(
    name: 'NodeIdRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
    ],
  );

  /// `NodeIdUnregistered(address,bytes20)`
  ///
  /// Decode a matching log with
  /// `nodeIdUnregisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent nodeIdUnregisteredEvent = AbiEvent(
    name: 'NodeIdUnregistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'nodeId',
        type: AbiType.parse('bytes20'),
        indexed: true,
      ),
    ],
  );

  /// `PublicKeyRegistered(address,bytes32,bytes32)`
  ///
  /// Decode a matching log with
  /// `publicKeyRegisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent publicKeyRegisteredEvent = AbiEvent(
    name: 'PublicKeyRegistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'part1',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'part2',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
    ],
  );

  /// `PublicKeyUnregistered(address,bytes32,bytes32)`
  ///
  /// Decode a matching log with
  /// `publicKeyUnregisteredEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent publicKeyUnregisteredEvent = AbiEvent(
    name: 'PublicKeyUnregistered',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'part1',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'part2',
        type: AbiType.parse('bytes32'),
        indexed: true,
      ),
    ],
  );

  /// `SigningPolicyAddressProposed(address,address)`
  ///
  /// Decode a matching log with
  /// `signingPolicyAddressProposedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signingPolicyAddressProposedEvent = AbiEvent(
    name: 'SigningPolicyAddressProposed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'signingPolicyAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `SigningPolicyAddressRegistrationConfirmed(address,address)`
  ///
  /// Decode a matching log with
  /// `signingPolicyAddressRegistrationConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent signingPolicyAddressRegistrationConfirmedEvent =
      AbiEvent(
        name: 'SigningPolicyAddressRegistrationConfirmed',
        anonymous: false,
        parameters: [
          AbiEventParameter(
            name: 'voter',
            type: AbiType.parse('address'),
            indexed: true,
          ),
          AbiEventParameter(
            name: 'signingPolicyAddress',
            type: AbiType.parse('address'),
            indexed: true,
          ),
        ],
      );

  /// `SubmitAddressProposed(address,address)`
  ///
  /// Decode a matching log with
  /// `submitAddressProposedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent submitAddressProposedEvent = AbiEvent(
    name: 'SubmitAddressProposed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'submitAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `SubmitAddressRegistrationConfirmed(address,address)`
  ///
  /// Decode a matching log with
  /// `submitAddressRegistrationConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent submitAddressRegistrationConfirmedEvent = AbiEvent(
    name: 'SubmitAddressRegistrationConfirmed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'submitAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `SubmitSignaturesAddressProposed(address,address)`
  ///
  /// Decode a matching log with
  /// `submitSignaturesAddressProposedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent submitSignaturesAddressProposedEvent = AbiEvent(
    name: 'SubmitSignaturesAddressProposed',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'voter',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'submitSignaturesAddress',
        type: AbiType.parse('address'),
        indexed: true,
      ),
    ],
  );

  /// `SubmitSignaturesAddressRegistrationConfirmed(address,address)`
  ///
  /// Decode a matching log with
  /// `submitSignaturesAddressRegistrationConfirmedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent submitSignaturesAddressRegistrationConfirmedEvent =
      AbiEvent(
        name: 'SubmitSignaturesAddressRegistrationConfirmed',
        anonymous: false,
        parameters: [
          AbiEventParameter(
            name: 'voter',
            type: AbiType.parse('address'),
            indexed: true,
          ),
          AbiEventParameter(
            name: 'submitSignaturesAddress',
            type: AbiType.parse('address'),
            indexed: true,
          ),
        ],
      );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    delegationAddressProposedEvent,
    delegationAddressRegistrationConfirmedEvent,
    maxNodeIdsPerEntitySetEvent,
    nodeIdRegisteredEvent,
    nodeIdUnregisteredEvent,
    publicKeyRegisteredEvent,
    publicKeyUnregisteredEvent,
    signingPolicyAddressProposedEvent,
    signingPolicyAddressRegistrationConfirmedEvent,
    submitAddressProposedEvent,
    submitAddressRegistrationConfirmedEvent,
    submitSignaturesAddressProposedEvent,
    submitSignaturesAddressRegistrationConfirmedEvent,
  ];

  /// Decodes [log] into whichever of [allEvents] it matches.
  ///
  /// Returns null when the log belongs to a different event,
  /// which is normal: one address emits many event types and
  /// an address-only filter returns all of them.
  static DecodedLog? decodeLog(FlareLog log) {
    for (final event in allEvents) {
      if (!event.matches(log.topics)) continue;
      return DecodedLog(
        log: log,
        event: event,
        values: event.decode(topics: log.topics, data: log.data),
      );
    }
    return null;
  }
}
