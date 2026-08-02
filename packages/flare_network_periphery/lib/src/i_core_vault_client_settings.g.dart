// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: ICoreVaultClientSettings
// Functions: 15 — 8 readable via eth_call, 7 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `ICoreVaultClientSettings` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class ICoreVaultClientSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const ICoreVaultClientSettingsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `ICoreVaultClientSettings` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<ICoreVaultClientSettingsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return ICoreVaultClientSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getCoreVaultDonationTag()`.
  static final AbiFunction getCoreVaultDonationTagFn = AbiFunction(
    name: 'getCoreVaultDonationTag',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultManager()`.
  static final AbiFunction getCoreVaultManagerFn = AbiFunction(
    name: 'getCoreVaultManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumAmountLeftBIPS()`.
  static final AbiFunction getCoreVaultMinimumAmountLeftBIPSFn = AbiFunction(
    name: 'getCoreVaultMinimumAmountLeftBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultMinimumRedeemLots()`.
  static final AbiFunction getCoreVaultMinimumRedeemLotsFn = AbiFunction(
    name: 'getCoreVaultMinimumRedeemLots',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultNativeAddress()`.
  static final AbiFunction getCoreVaultNativeAddressFn = AbiFunction(
    name: 'getCoreVaultNativeAddress',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultRedemptionFeeBIPS()`.
  static final AbiFunction getCoreVaultRedemptionFeeBIPSFn = AbiFunction(
    name: 'getCoreVaultRedemptionFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getCoreVaultTransferDefaultPenaltyBIPS()`.
  static final AbiFunction getCoreVaultTransferDefaultPenaltyBIPSFn =
      AbiFunction(
        name: 'getCoreVaultTransferDefaultPenaltyBIPS',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getCoreVaultTransferTimeExtensionSeconds()`.
  static final AbiFunction getCoreVaultTransferTimeExtensionSecondsFn =
      AbiFunction(
        name: 'getCoreVaultTransferTimeExtensionSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `setCoreVaultManager(address)`.
  static final AbiFunction setCoreVaultManagerFn = AbiFunction(
    name: 'setCoreVaultManager',
    inputs: [
      AbiParameter(name: '_coreVaultManager', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultMinimumAmountLeftBIPS(uint256)`.
  static final AbiFunction setCoreVaultMinimumAmountLeftBIPSFn = AbiFunction(
    name: 'setCoreVaultMinimumAmountLeftBIPS',
    inputs: [
      AbiParameter(
        name: '_minimumAmountLeftBIPS',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultMinimumRedeemLots(uint256)`.
  static final AbiFunction setCoreVaultMinimumRedeemLotsFn = AbiFunction(
    name: 'setCoreVaultMinimumRedeemLots',
    inputs: [
      AbiParameter(name: '_minimumRedeemLots', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultNativeAddress(address)`.
  static final AbiFunction setCoreVaultNativeAddressFn = AbiFunction(
    name: 'setCoreVaultNativeAddress',
    inputs: [
      AbiParameter(name: '_nativeAddress', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultRedemptionFeeBIPS(uint256)`.
  static final AbiFunction setCoreVaultRedemptionFeeBIPSFn = AbiFunction(
    name: 'setCoreVaultRedemptionFeeBIPS',
    inputs: [
      AbiParameter(name: '_redemptionFeeBIPS', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setCoreVaultTransferDefaultPenaltyBIPS(uint256)`.
  static final AbiFunction setCoreVaultTransferDefaultPenaltyBIPSFn =
      AbiFunction(
        name: 'setCoreVaultTransferDefaultPenaltyBIPS',
        inputs: [
          AbiParameter(
            name: '_transferDefaultPenaltyBIPS',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setCoreVaultTransferTimeExtensionSeconds(uint256)`.
  static final AbiFunction setCoreVaultTransferTimeExtensionSecondsFn =
      AbiFunction(
        name: 'setCoreVaultTransferTimeExtensionSeconds',
        inputs: [
          AbiParameter(
            name: '_transferTimeExtensionSeconds',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// Calls `getCoreVaultDonationTag()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultDonationTag() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultDonationTagFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultMinimumAmountLeftBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumAmountLeftBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumAmountLeftBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultMinimumRedeemLots()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultMinimumRedeemLots() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultMinimumRedeemLotsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultNativeAddress()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getCoreVaultNativeAddress() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultNativeAddressFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getCoreVaultRedemptionFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultRedemptionFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultRedemptionFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferDefaultPenaltyBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferDefaultPenaltyBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferDefaultPenaltyBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getCoreVaultTransferTimeExtensionSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getCoreVaultTransferTimeExtensionSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getCoreVaultTransferTimeExtensionSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Builds an unsigned `setCoreVaultManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultManagerTx(
    EthAddress coreVaultManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultManagerFn,
    args: [coreVaultManager],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultMinimumAmountLeftBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultMinimumAmountLeftBIPSTx(
    BigInt minimumAmountLeftBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultMinimumAmountLeftBIPSFn,
    args: [minimumAmountLeftBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultMinimumRedeemLots(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultMinimumRedeemLotsTx(
    BigInt minimumRedeemLots, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultMinimumRedeemLotsFn,
    args: [minimumRedeemLots],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultNativeAddress(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultNativeAddressTx(
    EthAddress nativeAddress, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultNativeAddressFn,
    args: [nativeAddress],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultRedemptionFeeBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultRedemptionFeeBIPSTx(
    BigInt redemptionFeeBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultRedemptionFeeBIPSFn,
    args: [redemptionFeeBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultTransferDefaultPenaltyBIPS(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultTransferDefaultPenaltyBIPSTx(
    BigInt transferDefaultPenaltyBIPS, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultTransferDefaultPenaltyBIPSFn,
    args: [transferDefaultPenaltyBIPS],
    from: from,
  );

  /// Builds an unsigned `setCoreVaultTransferTimeExtensionSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setCoreVaultTransferTimeExtensionSecondsTx(
    BigInt transferTimeExtensionSeconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setCoreVaultTransferTimeExtensionSecondsFn,
    args: [transferTimeExtensionSeconds],
    from: from,
  );
}
