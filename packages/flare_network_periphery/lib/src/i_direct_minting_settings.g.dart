// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IDirectMintingSettings
// Functions: 24 — 14 readable via eth_call, 10 requiring a
// signed transaction. Payable functions are both, and get a reader and a
// `…Tx` builder. This package never signs: a builder returns an unsigned
// TransactionRequest for a wallet to sign.
// Custom errors: 0
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'package:flare_network/flare_network.dart';

/// Typed bindings for Flare's `IDirectMintingSettings` contract.
///
/// Read methods call through `eth_call`. Methods ending in
/// `Tx` build an unsigned [TransactionRequest] for a wallet
/// to sign — this package holds no keys.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IDirectMintingSettingsContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IDirectMintingSettingsContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IDirectMintingSettings` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IDirectMintingSettingsContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IDirectMintingSettingsContract(client: client, address: resolved);
  }

  /// ABI descriptor for `getDirectMintingDailyLimitUBA()`.
  static final AbiFunction getDirectMintingDailyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingDailyLimitUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingDailyLimiterState()`.
  static final AbiFunction getDirectMintingDailyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingDailyLimiterState',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_windowStartTimestamp',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_mintedInCurrentWindow',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingExecutorFeeUBA()`.
  static final AbiFunction getDirectMintingExecutorFeeUBAFn = AbiFunction(
    name: 'getDirectMintingExecutorFeeUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeBIPS()`.
  static final AbiFunction getDirectMintingFeeBIPSFn = AbiFunction(
    name: 'getDirectMintingFeeBIPS',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingFeeReceiver()`.
  static final AbiFunction getDirectMintingFeeReceiverFn = AbiFunction(
    name: 'getDirectMintingFeeReceiver',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimitUBA()`.
  static final AbiFunction getDirectMintingHourlyLimitUBAFn = AbiFunction(
    name: 'getDirectMintingHourlyLimitUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingHourlyLimiterState()`.
  static final AbiFunction getDirectMintingHourlyLimiterStateFn = AbiFunction(
    name: 'getDirectMintingHourlyLimiterState',
    inputs: [],
    outputs: [
      AbiParameter(
        name: '_windowStartTimestamp',
        type: AbiType.parse('uint64'),
      ),
      AbiParameter(
        name: '_mintedInCurrentWindow',
        type: AbiType.parse('uint64'),
      ),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingLargeMintingDelaySeconds()`.
  static final AbiFunction getDirectMintingLargeMintingDelaySecondsFn =
      AbiFunction(
        name: 'getDirectMintingLargeMintingDelaySeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingLargeMintingThresholdUBA()`.
  static final AbiFunction getDirectMintingLargeMintingThresholdUBAFn =
      AbiFunction(
        name: 'getDirectMintingLargeMintingThresholdUBA',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingMinimumFeeUBA()`.
  static final AbiFunction getDirectMintingMinimumFeeUBAFn = AbiFunction(
    name: 'getDirectMintingMinimumFeeUBA',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getDirectMintingOthersCanExecuteAfterSeconds()`.
  static final AbiFunction getDirectMintingOthersCanExecuteAfterSecondsFn =
      AbiFunction(
        name: 'getDirectMintingOthersCanExecuteAfterSeconds',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getDirectMintingsUnblockUntilTimestamp()`.
  static final AbiFunction getDirectMintingsUnblockUntilTimestampFn =
      AbiFunction(
        name: 'getDirectMintingsUnblockUntilTimestamp',
        inputs: [],
        outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
        stateMutability: StateMutability.view,
      );

  /// ABI descriptor for `getMintingTagManager()`.
  static final AbiFunction getMintingTagManagerFn = AbiFunction(
    name: 'getMintingTagManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getSmartAccountManager()`.
  static final AbiFunction getSmartAccountManagerFn = AbiFunction(
    name: 'getSmartAccountManager',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `setDirectMintingDailyLimitUBA(uint256)`.
  static final AbiFunction setDirectMintingDailyLimitUBAFn = AbiFunction(
    name: 'setDirectMintingDailyLimitUBA',
    inputs: [
      AbiParameter(name: '_dailyLimitUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingExecutorFee(uint256)`.
  static final AbiFunction setDirectMintingExecutorFeeFn = AbiFunction(
    name: 'setDirectMintingExecutorFee',
    inputs: [
      AbiParameter(name: '_executorFeeUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingFee(uint256,uint256)`.
  static final AbiFunction setDirectMintingFeeFn = AbiFunction(
    name: 'setDirectMintingFee',
    inputs: [
      AbiParameter(name: '_mintingFeeBIPS', type: AbiType.parse('uint256')),
      AbiParameter(
        name: '_minimumMintingFeeUBA',
        type: AbiType.parse('uint256'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingFeeReceiver(address)`.
  static final AbiFunction setDirectMintingFeeReceiverFn = AbiFunction(
    name: 'setDirectMintingFeeReceiver',
    inputs: [
      AbiParameter(name: '_mintingFeeReceiver', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingHourlyLimitUBA(uint256)`.
  static final AbiFunction setDirectMintingHourlyLimitUBAFn = AbiFunction(
    name: 'setDirectMintingHourlyLimitUBA',
    inputs: [
      AbiParameter(name: '_hourlyLimitUBA', type: AbiType.parse('uint256')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setDirectMintingLargeMintingThrottling(uint256,uint256)`.
  static final AbiFunction setDirectMintingLargeMintingThrottlingFn =
      AbiFunction(
        name: 'setDirectMintingLargeMintingThrottling',
        inputs: [
          AbiParameter(
            name: '_largeMintingThresholdUBA',
            type: AbiType.parse('uint256'),
          ),
          AbiParameter(
            name: '_largeMintingDelaySeconds',
            type: AbiType.parse('uint256'),
          ),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setDirectMintingOthersCanExecuteAfterSeconds(uint256)`.
  static final AbiFunction setDirectMintingOthersCanExecuteAfterSecondsFn =
      AbiFunction(
        name: 'setDirectMintingOthersCanExecuteAfterSeconds',
        inputs: [
          AbiParameter(name: '_seconds', type: AbiType.parse('uint256')),
        ],
        outputs: [],
        stateMutability: StateMutability.nonpayable,
      );

  /// ABI descriptor for `setMintingTagManager(address)`.
  static final AbiFunction setMintingTagManagerFn = AbiFunction(
    name: 'setMintingTagManager',
    inputs: [
      AbiParameter(name: '_mintingTagManager', type: AbiType.parse('address')),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `setSmartAccountManager(address)`.
  static final AbiFunction setSmartAccountManagerFn = AbiFunction(
    name: 'setSmartAccountManager',
    inputs: [
      AbiParameter(
        name: '_smartAccountManager',
        type: AbiType.parse('address'),
      ),
    ],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// ABI descriptor for `unblockDirectMintingsUntil(uint256)`.
  static final AbiFunction unblockDirectMintingsUntilFn = AbiFunction(
    name: 'unblockDirectMintingsUntil',
    inputs: [AbiParameter(name: '_timestamp', type: AbiType.parse('uint256'))],
    outputs: [],
    stateMutability: StateMutability.nonpayable,
  );

  /// Calls `getDirectMintingDailyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingDailyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingDailyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})>
  getDirectMintingDailyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingDailyLimiterStateFn,
    );
    return (
      windowStartTimestamp: out[0]! as BigInt,
      mintedInCurrentWindow: out[1]! as BigInt,
    );
  }

  /// Calls `getDirectMintingExecutorFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingExecutorFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingExecutorFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeBIPS()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingFeeBIPS() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeBIPSFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingFeeReceiver()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getDirectMintingFeeReceiver() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingFeeReceiverFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getDirectMintingHourlyLimitUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingHourlyLimitUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimitUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingHourlyLimiterState()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({BigInt windowStartTimestamp, BigInt mintedInCurrentWindow})>
  getDirectMintingHourlyLimiterState() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingHourlyLimiterStateFn,
    );
    return (
      windowStartTimestamp: out[0]! as BigInt,
      mintedInCurrentWindow: out[1]! as BigInt,
    );
  }

  /// Calls `getDirectMintingLargeMintingDelaySeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingDelaySeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingDelaySecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingLargeMintingThresholdUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingLargeMintingThresholdUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingLargeMintingThresholdUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingMinimumFeeUBA()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingMinimumFeeUBA() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingMinimumFeeUBAFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingOthersCanExecuteAfterSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingOthersCanExecuteAfterSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingOthersCanExecuteAfterSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getDirectMintingsUnblockUntilTimestamp()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> getDirectMintingsUnblockUntilTimestamp() async {
    final out = await client.callFunction(
      contract: address,
      function: getDirectMintingsUnblockUntilTimestampFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getMintingTagManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getMintingTagManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getMintingTagManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `getSmartAccountManager()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getSmartAccountManager() async {
    final out = await client.callFunction(
      contract: address,
      function: getSmartAccountManagerFn,
    );
    return out[0]! as EthAddress;
  }

  /// Builds an unsigned `setDirectMintingDailyLimitUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingDailyLimitUBATx(
    BigInt dailyLimitUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingDailyLimitUBAFn,
    args: [dailyLimitUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingExecutorFee(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingExecutorFeeTx(
    BigInt executorFeeUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingExecutorFeeFn,
    args: [executorFeeUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingFee(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingFeeTx(
    BigInt mintingFeeBIPS,
    BigInt minimumMintingFeeUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingFeeFn,
    args: [mintingFeeBIPS, minimumMintingFeeUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingFeeReceiver(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingFeeReceiverTx(
    EthAddress mintingFeeReceiver, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingFeeReceiverFn,
    args: [mintingFeeReceiver],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingHourlyLimitUBA(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingHourlyLimitUBATx(
    BigInt hourlyLimitUBA, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingHourlyLimitUBAFn,
    args: [hourlyLimitUBA],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingLargeMintingThrottling(uint256,uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingLargeMintingThrottlingTx(
    BigInt largeMintingThresholdUBA,
    BigInt largeMintingDelaySeconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingLargeMintingThrottlingFn,
    args: [largeMintingThresholdUBA, largeMintingDelaySeconds],
    from: from,
  );

  /// Builds an unsigned `setDirectMintingOthersCanExecuteAfterSeconds(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setDirectMintingOthersCanExecuteAfterSecondsTx(
    BigInt seconds, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setDirectMintingOthersCanExecuteAfterSecondsFn,
    args: [seconds],
    from: from,
  );

  /// Builds an unsigned `setMintingTagManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setMintingTagManagerTx(
    EthAddress mintingTagManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setMintingTagManagerFn,
    args: [mintingTagManager],
    from: from,
  );

  /// Builds an unsigned `setSmartAccountManager(address)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest setSmartAccountManagerTx(
    EthAddress smartAccountManager, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: setSmartAccountManagerFn,
    args: [smartAccountManager],
    from: from,
  );

  /// Builds an unsigned `unblockDirectMintingsUntil(uint256)`
  /// transaction.
  ///
  /// Declared `nonpayable` in Solidity, so it changes state and
  /// must be signed. This package holds no keys: pass the
  /// result to [FlareClient.prepareTransaction] to fill in
  /// gas and fees, then hand
  /// [TransactionRequest.toWalletJson] to a wallet.
  TransactionRequest unblockDirectMintingsUntilTx(
    BigInt timestamp, {
    EthAddress? from,
  }) => TransactionRequest.callFunction(
    to: address,
    function: unblockDirectMintingsUntilFn,
    args: [timestamp],
    from: from,
  );
}
