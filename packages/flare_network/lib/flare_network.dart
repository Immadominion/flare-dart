/// A Dart client for [Flare Network](https://flare.network).
///
/// Resolve contracts through the Flare Contract Registry, read FTSOv2 price
/// feeds, and call any Flare contract over JSON-RPC. Pure Dart, with no Flutter
/// dependency, so it runs in Flutter apps, server code and CLI tools alike.
///
/// ## Quick start
///
/// ```dart
/// import 'package:flare_network/flare_network.dart';
///
/// Future<void> main() async {
///   final client = FlareClient(FlareChain.coston2);
///   try {
///     final ftso = await FtsoV2.resolve(client);
///     for (final feed in await ftso.getFeedsById([Feeds.flrUsd, Feeds.btcUsd])) {
///       print('${feed.feedId.name}: ${feed.toDecimalString()}');
///     }
///   } finally {
///     client.close();
///   }
/// }
/// ```
///
/// ## Two rules worth knowing up front
///
/// **Never hardcode a contract address except the registry.** Flare redeploys
/// contracts, so resolve everything through [ContractRegistry] at runtime.
/// Flare's own published Python example hardcodes an FTSOv2 address that no
/// longer matches what the registry returns on Coston2.
///
/// **Never assume a feed's decimal scale.** [FtsoFeedValue.decimals] varies per
/// feed and is signed. One live call to Coston2 returned 8 decimals for
/// FLR/USD, 2 for BTC/USD and 6 for XRP/USD.
library;

// ABI
export 'src/abi/abi_event.dart'
    show AbiEvent, AbiEventParameter, ContractAbiEvents, IndexedHash;
export 'src/abi/abi_function.dart'
    show AbiFunction, AbiParameter, ContractAbi, StateMutability;
export 'src/abi/abi_type.dart'
    show
        AbiAddressType,
        AbiArrayType,
        AbiBoolType,
        AbiBytesType,
        AbiCodec,
        AbiFixedArrayType,
        AbiFixedBytesType,
        AbiIntType,
        AbiStringType,
        AbiTupleType,
        AbiType;
export 'src/abi/eth_address.dart' show EthAddress;
export 'src/abi/hex.dart' show bytesToHex, hexToBigInt, hexToBytes;
// Exported because computing a topic hash is a legitimate caller need:
// filtering on an indexed dynamic parameter requires hashing the value
// yourself, since the chain stores keccak256(value) rather than the value.
export 'src/abi/keccak.dart' show functionSelector, keccak256, keccak256Utf8;

// DA Layer (Scaling anchor feeds)
export 'src/dalayer/da_layer_client.dart'
    show AnchorFeed, DaLayerClient, FspStatus;

// FAssets (FXRP, FBTC, FDOGE)
export 'src/fassets/fassets_client.dart' show FAssetInfo, FAssetsClient;

// FDC (Flare Data Connector)
export 'src/fdc/attestation.dart'
    show
        AttestationProof,
        AttestationSource,
        AttestationType,
        VotingEpochTiming,
        bytes32Hex,
        encodeTypeAndSource;
export 'src/fdc/fdc_client.dart' show FdcClient;

// FTSO
export 'src/ftso/feed_id.dart' show FeedCategory, FeedId, Feeds;
export 'src/ftso/ftso_v2.dart' show FtsoFeedValue, FtsoV2;

// Network
export 'src/network/flare_chain.dart' show AbiProfile, FlareChain;

// Registry
export 'src/registry/contract_registry.dart'
    show ContractRegistry, FlareContract;

// RPC
export 'src/rpc/flare_client.dart' show BlockTag, FlareClient;
export 'src/rpc/logs.dart' show BlockRef, DecodedLog, FlareLog, LogFilter;
// Uses dart:io, so it is unavailable on Flutter Web; everything else in this
// package is platform-neutral.
export 'src/rpc/subscriptions.dart' show BlockHeaderHex, FlareSubscriptions;
export 'src/rpc/transaction.dart'
    show BlockInfo, CallRequest, TransactionInfo, TransactionReceipt;
export 'src/rpc/flare_exception.dart'
    show
        FlareAbiException,
        FlareContractException,
        FlareException,
        FlareRegistryException,
        FlareRpcException,
        FlareTransportException;
export 'src/rpc/json_rpc_client.dart'
    show JsonRpcClient, RetryPolicy, RpcRequest;
