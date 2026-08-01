import 'dart:typed_data';

import '../abi/abi_function.dart';
import '../abi/abi_type.dart';
import '../abi/eth_address.dart';
import '../registry/contract_registry.dart';
import '../rpc/flare_client.dart';
import '../rpc/flare_exception.dart';
import 'attestation.dart';

/// Read access to the Flare Data Connector.
///
/// The FDC proves facts about other chains and about public Web2 APIs. The full
/// flow is: request an attestation on chain (paying a fee), wait for the voting
/// round to finalise, fetch the response and Merkle proof from the Data
/// Availability Layer, then verify that proof on chain.
///
/// This client covers everything in that flow **except submitting the request**,
/// which needs a signed, payable transaction. Use [DaLayerClient] for the proof
/// retrieval step.
///
/// ```dart
/// final fdc = await FdcClient.resolve(client);
///
/// // What would this attestation cost?
/// final fee = await fdc.getRequestFee(
///   AttestationType.payment,
///   AttestationSource.xrp.forChain(client.chain),
/// );
///
/// // Which round is being voted on right now?
/// final round = await fdc.currentVotingRoundId();
/// ```
class FdcClient {
  /// `getRequestFee(bytes) returns (uint256)`
  static final AbiFunction getRequestFeeFn = AbiFunction(
    name: 'getRequestFee',
    inputs: [AbiParameter(name: '_data', type: AbiType.parse('bytes'))],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint256'))],
    stateMutability: StateMutability.view,
  );

  /// `firstVotingRoundStartTs() returns (uint64)`
  static final AbiFunction firstVotingRoundStartTsFn = AbiFunction(
    name: 'firstVotingRoundStartTs',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// `votingEpochDurationSeconds() returns (uint64)`
  static final AbiFunction votingEpochDurationSecondsFn = AbiFunction(
    name: 'votingEpochDurationSeconds',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint64'))],
    stateMutability: StateMutability.view,
  );

  /// `getCurrentVotingEpochId() returns (uint32)`
  static final AbiFunction getCurrentVotingEpochIdFn = AbiFunction(
    name: 'getCurrentVotingEpochId',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint32'))],
    stateMutability: StateMutability.view,
  );

  /// `fdcProtocolId() returns (uint8)`
  static final AbiFunction fdcProtocolIdFn = AbiFunction(
    name: 'fdcProtocolId',
    inputs: const [],
    outputs: [AbiParameter(name: '', type: AbiType.parse('uint8'))],
    stateMutability: StateMutability.view,
  );

  /// The client used for calls.
  final FlareClient client;

  /// `FdcRequestFeeConfigurations`, which prices each type/source pair.
  final EthAddress feeConfigurations;

  /// `ProtocolsV2`, which supplies voting round timing.
  final EthAddress protocolsV2;

  /// `FdcVerification`, which verifies Merkle proofs on chain.
  final EthAddress verification;

  VotingEpochTiming? _timing;

  FdcClient({
    required this.client,
    required this.feeConfigurations,
    required this.protocolsV2,
    required this.verification,
  });

  /// Resolves every FDC contract through the registry in one batched call.
  static Future<FdcClient> resolve(
    FlareClient client, {
    ContractRegistry? registry,
  }) async {
    final resolved = await (registry ?? ContractRegistry(client)).addressesOf([
      FlareContract.fdcRequestFeeConfigurations,
      FlareContract.protocolsV2,
      FlareContract.fdcVerification,
    ]);

    return FdcClient(
      client: client,
      feeConfigurations:
          resolved[FlareContract.fdcRequestFeeConfigurations]!,
      protocolsV2: resolved[FlareContract.protocolsV2]!,
      verification: resolved[FlareContract.fdcVerification]!,
    );
  }

  /// The fee, in wei, for an attestation of [type] against [source].
  ///
  /// Measured on 2026-08-01: every supported pair costs 1,000 wei on Coston2
  /// and 20 FLR on Flare mainnet. Read it rather than assuming — a request that
  /// omits the fee reverts.
  ///
  /// Throws [FlareContractException] if the pair is not supported on this
  /// network. The most common cause is a mainnet source identifier used on a
  /// testnet: pass `AttestationSource.xrp.forChain(client.chain)` and let it
  /// pick `testXRP` where appropriate.
  Future<BigInt> getRequestFee(
    AttestationType type,
    AttestationSource source,
  ) async {
    try {
      return (await client.callFunctionSingle(
        contract: feeConfigurations,
        function: getRequestFeeFn,
        args: [encodeTypeAndSource(type, source)],
      ))! as BigInt;
    } on FlareRpcException catch (e) {
      if (e.message.contains('not supported')) {
        throw FlareContractException(
          '${type.id} is not available for source "${source.id}" on '
          '${client.chain.name}. Testnets use test-prefixed sources '
          '(testXRP, testBTC, testETH); mainnets use the bare names. '
          'Use AttestationSource.<chain>.forChain(client.chain).',
          address: feeConfigurations.checksummed,
          function: getRequestFeeFn.canonicalSignature,
        );
      }
      rethrow;
    }
  }

  /// Whether [type] can be attested against [source] on this network.
  Future<bool> isSupported(
    AttestationType type,
    AttestationSource source,
  ) async {
    try {
      await getRequestFee(type, source);
      return true;
    } on FlareContractException {
      return false;
    }
  }

  /// Voting round timing, read once and cached.
  ///
  /// Never hardcode these. Flare's own TypeScript example ships a constant that
  /// does not hold across networks, and a wrong round ID makes every proof
  /// lookup return nothing.
  Future<VotingEpochTiming> timing() async {
    final cached = _timing;
    if (cached != null) return cached;

    final start = await client.callFunctionSingle(
      contract: protocolsV2,
      function: firstVotingRoundStartTsFn,
    );
    final duration = await client.callFunctionSingle(
      contract: protocolsV2,
      function: votingEpochDurationSecondsFn,
    );

    return _timing = VotingEpochTiming(
      firstVotingRoundStartTs: (start! as BigInt).toInt(),
      votingEpochDurationSeconds: (duration! as BigInt).toInt(),
    );
  }

  /// The voting round currently being voted on, straight from the contract.
  Future<int> currentVotingRoundId() async =>
      ((await client.callFunctionSingle(
        contract: protocolsV2,
        function: getCurrentVotingEpochIdFn,
      ))! as BigInt)
          .toInt();

  /// The voting round that covers [when], derived from [timing].
  ///
  /// Useful for locating the round a past event belongs to, which is what a
  /// proof lookup needs.
  Future<int> votingRoundIdAt(DateTime when) async =>
      (await timing()).votingRoundIdAtTime(when);

  /// The FDC's protocol ID within the Flare Systems Protocol.
  Future<int> protocolId() async =>
      ((await client.callFunctionSingle(
        contract: verification,
        function: fdcProtocolIdFn,
      ))! as BigInt)
          .toInt();

  /// Verifies an attestation proof on chain.
  ///
  /// [proof] must be the ABI structure the matching `verify*` function expects:
  /// a `(bytes32[] merkleProof, <ResponseBody> data)` tuple, as returned by the
  /// DA Layer. Returns whether the proof checks out against the finalised
  /// Merkle root.
  ///
  /// This is a free `eth_call` — verification costs nothing to *check*; only
  /// requesting the attestation in the first place has a fee.
  Future<bool> verify(
    AttestationType type,
    List<Object?> proof, {
    required AbiType proofType,
  }) async {
    final fn = AbiFunction(
      name: _verifyMethodFor(type),
      inputs: [AbiParameter(name: '_proof', type: proofType)],
      outputs: [AbiParameter(name: '', type: AbiType.parse('bool'))],
      stateMutability: StateMutability.view,
    );

    return (await client.callFunctionSingle(
      contract: verification,
      function: fn,
      args: [proof],
    ))! as bool;
  }

  /// The `FdcVerification` method name for [type].
  static String _verifyMethodFor(AttestationType type) => switch (type) {
        AttestationType.payment => 'verifyPayment',
        AttestationType.evmTransaction => 'verifyEVMTransaction',
        AttestationType.addressValidity => 'verifyAddressValidity',
        AttestationType.confirmedBlockHeightExists =>
          'verifyConfirmedBlockHeightExists',
        AttestationType.referencedPaymentNonexistence =>
          'verifyReferencedPaymentNonexistence',
        AttestationType.balanceDecreasingTransaction =>
          'verifyBalanceDecreasingTransaction',
        AttestationType.web2Json => 'verifyWeb2Json',
        AttestationType.xrpPayment => 'verifyXRPPayment',
        AttestationType.xrpPaymentNonexistence => 'verifyXRPPaymentNonexistence',
      };

  /// The calldata a `requestAttestation` transaction would carry.
  ///
  /// Exposed so an external wallet can sign and submit it — this SDK does not
  /// sign. Attach [getRequestFee] as the transaction value, or the call
  /// reverts.
  static Uint8List encodeRequestAttestation(Uint8List abiEncodedRequest) =>
      AbiFunction(
        name: 'requestAttestation',
        inputs: [AbiParameter(name: '_data', type: AbiType.parse('bytes'))],
        outputs: const [],
        stateMutability: StateMutability.payable,
      ).encodeCall([abiEncodedRequest]);
}
