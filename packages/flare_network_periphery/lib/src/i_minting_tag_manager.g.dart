// GENERATED CODE — DO NOT EDIT BY HAND.
//
// Source: @flarenetwork/flare-periphery-contract-artifacts@0.1.52
// Contract: IMintingTagManager
// Functions: 17 readable of 25 total (state-changing functions are omitted — this SDK does not sign).
//
// Regenerate with:
//   dart run flare_network_codegen --artifacts <dir> --out <dir>

import 'dart:typed_data';

import 'package:flare_network/flare_network.dart';

/// Typed read bindings for Flare's `IMintingTagManager` contract.
///
/// Resolve it through the registry rather than hardcoding an
/// address — Flare redeploys contracts.
class IMintingTagManagerContract {
  /// Client used for calls.
  final FlareClient client;

  /// Resolved address on [client]'s network.
  final EthAddress address;

  const IMintingTagManagerContract({
    required this.client,
    required this.address,
  });

  /// Resolves `IMintingTagManager` through the [ContractRegistry].
  ///
  /// This contract has no entry in Flare's published products
  /// map, so [registryName] is required — there is no name that
  /// could be defaulted correctly. Call `ContractRegistry.listAll`
  /// to see what this network registers.
  static Future<IMintingTagManagerContract> resolve(
    FlareClient client, {
    required String registryName,
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressOf(
      registryName,
    );
    return IMintingTagManagerContract(client: client, address: resolved);
  }

  /// ABI descriptor for `allowedExecutor(uint256)`.
  static final AbiFunction allowedExecutorFn = AbiFunction(
    name: 'allowedExecutor',
    inputs: [AbiParameter(name: '_mintingTag', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `balanceOf(address)`.
  static final AbiFunction balanceOfFn = AbiFunction(
    name: 'balanceOf',
    inputs: [AbiParameter(name: 'owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: 'balance', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `executorChangeAfterSeconds()`.
  static final AbiFunction executorChangeAfterSecondsFn = AbiFunction(
    name: 'executorChangeAfterSeconds',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `getApproved(uint256)`.
  static final AbiFunction getApprovedFn = AbiFunction(
    name: 'getApproved',
    inputs: [AbiParameter(name: 'tokenId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: 'operator', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `isApprovedForAll(address,address)`.
  static final AbiFunction isApprovedForAllFn = AbiFunction(
    name: 'isApprovedForAll',
    inputs: [
      AbiParameter(name: 'owner', type: AbiType.parse('address')),
      AbiParameter(name: 'operator', type: AbiType.parse('address')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `mintingRecipient(uint256)`.
  static final AbiFunction mintingRecipientFn = AbiFunction(
    name: 'mintingRecipient',
    inputs: [AbiParameter(name: '_mintingTag', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `nextAvailableTag()`.
  static final AbiFunction nextAvailableTagFn = AbiFunction(
    name: 'nextAvailableTag',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `ownerOf(uint256)`.
  static final AbiFunction ownerOfFn = AbiFunction(
    name: 'ownerOf',
    inputs: [AbiParameter(name: 'tokenId', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: 'owner', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `pendingAllowedExecutorChange(uint256)`.
  static final AbiFunction pendingAllowedExecutorChangeFn = AbiFunction(
    name: 'pendingAllowedExecutorChange',
    inputs: [AbiParameter(name: '_mintingTag', type: AbiType.parse('uint256'))],
    outputs: [
      AbiParameter(name: '_pending', type: AbiType.parse('bool')),
      AbiParameter(name: '_newExecutor', type: AbiType.parse('address')),
      AbiParameter(name: '_activeAfterTs', type: AbiType.parse('uint256')),
    ],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `reservationFee()`.
  static final AbiFunction reservationFeeFn = AbiFunction(
    name: 'reservationFee',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `reservationFeeRecipient()`.
  static final AbiFunction reservationFeeRecipientFn = AbiFunction(
    name: 'reservationFeeRecipient',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('address'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `reserve()`.
  static final AbiFunction reserveFn = AbiFunction(
    name: 'reserve',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.payable,
  );

  /// ABI descriptor for `reservedTagsForOwner(address)`.
  static final AbiFunction reservedTagsForOwnerFn = AbiFunction(
    name: 'reservedTagsForOwner',
    inputs: [AbiParameter(name: '_owner', type: AbiType.parse('address'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256[]'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `supportsInterface(bytes4)`.
  static final AbiFunction supportsInterfaceFn = AbiFunction(
    name: 'supportsInterface',
    inputs: [AbiParameter(name: 'interfaceId', type: AbiType.parse('bytes4'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `tokenByIndex(uint256)`.
  static final AbiFunction tokenByIndexFn = AbiFunction(
    name: 'tokenByIndex',
    inputs: [AbiParameter(name: 'index', type: AbiType.parse('uint256'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `tokenOfOwnerByIndex(address,uint256)`.
  static final AbiFunction tokenOfOwnerByIndexFn = AbiFunction(
    name: 'tokenOfOwnerByIndex',
    inputs: [
      AbiParameter(name: 'owner', type: AbiType.parse('address')),
      AbiParameter(name: 'index', type: AbiType.parse('uint256')),
    ],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// ABI descriptor for `totalSupply()`.
  static final AbiFunction totalSupplyFn = AbiFunction(
    name: 'totalSupply',
    inputs: [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// Calls `allowedExecutor(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> allowedExecutor(BigInt mintingTag) async {
    final out = await client.callFunction(
      contract: address,
      function: allowedExecutorFn,
      args: [mintingTag],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `balanceOf(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> balanceOf(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: balanceOfFn,
      args: [owner],
    );
    return out[0]! as BigInt;
  }

  /// Calls `executorChangeAfterSeconds()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> executorChangeAfterSeconds() async {
    final out = await client.callFunction(
      contract: address,
      function: executorChangeAfterSecondsFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `getApproved(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> getApproved(BigInt tokenId) async {
    final out = await client.callFunction(
      contract: address,
      function: getApprovedFn,
      args: [tokenId],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `isApprovedForAll(address,address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> isApprovedForAll(
    EthAddress owner,
    EthAddress operatorValue,
  ) async {
    final out = await client.callFunction(
      contract: address,
      function: isApprovedForAllFn,
      args: [owner, operatorValue],
    );
    return out[0]! as bool;
  }

  /// Calls `mintingRecipient(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> mintingRecipient(BigInt mintingTag) async {
    final out = await client.callFunction(
      contract: address,
      function: mintingRecipientFn,
      args: [mintingTag],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `nextAvailableTag()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> nextAvailableTag() async {
    final out = await client.callFunction(
      contract: address,
      function: nextAvailableTagFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `ownerOf(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> ownerOf(BigInt tokenId) async {
    final out = await client.callFunction(
      contract: address,
      function: ownerOfFn,
      args: [tokenId],
    );
    return out[0]! as EthAddress;
  }

  /// Calls `pendingAllowedExecutorChange(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<({bool pending, EthAddress newExecutor, BigInt activeAfterTs})>
  pendingAllowedExecutorChange(BigInt mintingTag) async {
    final out = await client.callFunction(
      contract: address,
      function: pendingAllowedExecutorChangeFn,
      args: [mintingTag],
    );
    return (
      pending: out[0]! as bool,
      newExecutor: out[1]! as EthAddress,
      activeAfterTs: out[2]! as BigInt,
    );
  }

  /// Calls `reservationFee()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> reservationFee() async {
    final out = await client.callFunction(
      contract: address,
      function: reservationFeeFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `reservationFeeRecipient()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<EthAddress> reservationFeeRecipient() async {
    final out = await client.callFunction(
      contract: address,
      function: reservationFeeRecipientFn,
    );
    return out[0]! as EthAddress;
  }

  /// Calls `reserve()`.
  ///
  /// Declared `payable` in Solidity; read via `eth_call`.
  Future<BigInt> reserve() async {
    final out = await client.callFunction(
      contract: address,
      function: reserveFn,
    );
    return out[0]! as BigInt;
  }

  /// Calls `reservedTagsForOwner(address)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<List<BigInt>> reservedTagsForOwner(EthAddress owner) async {
    final out = await client.callFunction(
      contract: address,
      function: reservedTagsForOwnerFn,
      args: [owner],
    );
    return (out[0]! as List).cast<BigInt>();
  }

  /// Calls `supportsInterface(bytes4)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<bool> supportsInterface(Uint8List interfaceId) async {
    final out = await client.callFunction(
      contract: address,
      function: supportsInterfaceFn,
      args: [interfaceId],
    );
    return out[0]! as bool;
  }

  /// Calls `tokenByIndex(uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> tokenByIndex(BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: tokenByIndexFn,
      args: [index],
    );
    return out[0]! as BigInt;
  }

  /// Calls `tokenOfOwnerByIndex(address,uint256)`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> tokenOfOwnerByIndex(EthAddress owner, BigInt index) async {
    final out = await client.callFunction(
      contract: address,
      function: tokenOfOwnerByIndexFn,
      args: [owner, index],
    );
    return out[0]! as BigInt;
  }

  /// Calls `totalSupply()`.
  ///
  /// Declared `view` in Solidity; read via `eth_call`.
  Future<BigInt> totalSupply() async {
    final out = await client.callFunction(
      contract: address,
      function: totalSupplyFn,
    );
    return out[0]! as BigInt;
  }

  /// `AllowedExecutorChangeCancelled(uint256)`
  ///
  /// Decode a matching log with
  /// `allowedExecutorChangeCancelledEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedExecutorChangeCancelledEvent = AbiEvent(
    name: 'AllowedExecutorChangeCancelled',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'tag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AllowedExecutorChangePending(uint256,address,uint256)`
  ///
  /// Decode a matching log with
  /// `allowedExecutorChangePendingEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedExecutorChangePendingEvent = AbiEvent(
    name: 'AllowedExecutorChangePending',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'tag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'executor',
        type: AbiType.parse('address'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'activeAfterTs',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `AllowedExecutorCleared(uint256)`
  ///
  /// Decode a matching log with
  /// `allowedExecutorClearedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent allowedExecutorClearedEvent = AbiEvent(
    name: 'AllowedExecutorCleared',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'tag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `Approval(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `approvalEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvalEvent = AbiEvent(
    name: 'Approval',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'approved',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'tokenId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// `ApprovalForAll(address,address,bool)`
  ///
  /// Decode a matching log with
  /// `approvalForAllEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent approvalForAllEvent = AbiEvent(
    name: 'ApprovalForAll',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'operator',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'approved',
        type: AbiType.parse('bool'),
        indexed: false,
      ),
    ],
  );

  /// `ExecutorChangeAfterSecondsChanged(uint256)`
  ///
  /// Decode a matching log with
  /// `executorChangeAfterSecondsChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent executorChangeAfterSecondsChangedEvent = AbiEvent(
    name: 'ExecutorChangeAfterSecondsChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'executorChangeAfterSeconds',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
    ],
  );

  /// `MintingTagReserved(uint256,address)`
  ///
  /// Decode a matching log with
  /// `mintingTagReservedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent mintingTagReservedEvent = AbiEvent(
    name: 'MintingTagReserved',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'tag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'owner',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `RecipientChanged(uint256,address)`
  ///
  /// Decode a matching log with
  /// `recipientChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent recipientChangedEvent = AbiEvent(
    name: 'RecipientChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'tag',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'recipient',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `ReservationFeeChanged(uint256,address)`
  ///
  /// Decode a matching log with
  /// `reservationFeeChangedEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent reservationFeeChangedEvent = AbiEvent(
    name: 'ReservationFeeChanged',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'reservationFee',
        type: AbiType.parse('uint256'),
        indexed: false,
      ),
      AbiEventParameter(
        name: 'recipient',
        type: AbiType.parse('address'),
        indexed: false,
      ),
    ],
  );

  /// `Transfer(address,address,uint256)`
  ///
  /// Decode a matching log with
  /// `transferEvent.decode(topics: …, data: …)`, or use
  /// [decodeLog] to dispatch automatically.
  static final AbiEvent transferEvent = AbiEvent(
    name: 'Transfer',
    anonymous: false,
    parameters: [
      AbiEventParameter(
        name: 'from',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'to',
        type: AbiType.parse('address'),
        indexed: true,
      ),
      AbiEventParameter(
        name: 'tokenId',
        type: AbiType.parse('uint256'),
        indexed: true,
      ),
    ],
  );

  /// Every event this contract declares.
  static final List<AbiEvent> allEvents = [
    allowedExecutorChangeCancelledEvent,
    allowedExecutorChangePendingEvent,
    allowedExecutorClearedEvent,
    approvalEvent,
    approvalForAllEvent,
    executorChangeAfterSecondsChangedEvent,
    mintingTagReservedEvent,
    recipientChangedEvent,
    reservationFeeChangedEvent,
    transferEvent,
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
