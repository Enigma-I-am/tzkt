part of 'block_cubit.dart';

enum BlockStatus {
  initial,
  successBtcTransactions,
  successTezosTransactions,
  failure,
  loadingBtcTransactions,
  loadingTezosTransactions,
}

extension BlockStatusX on BlockStatus {
  bool get isInitial => this == BlockStatus.initial;
  bool get isSuccessBtcTransactions =>
      this == BlockStatus.successBtcTransactions;
  bool get isSuccessTezosTransactions =>
      this == BlockStatus.successTezosTransactions;
  bool get isFailure => this == BlockStatus.failure;
  bool get isLoadingBtcTransactions =>
      this == BlockStatus.loadingBtcTransactions;
  bool get isLoadingTezosTransactions =>
      this == BlockStatus.loadingTezosTransactions;
}

class BlockState with EquatableMixin {
  const BlockState({
    this.status = BlockStatus.initial,
    required this.btcTransactions,
    required this.tezosBlock,
    required this.tezosBlocks,
    this.resMessage,
  });

  final BlockStatus status;
  final List<Tx> btcTransactions;
  final List<Tezosblockmodel> tezosBlocks;
  final Tezosblockmodel? tezosBlock;

  final String? resMessage;

  factory BlockState.initial() {
    return BlockState(
      btcTransactions: [],
      tezosBlock: null,
      tezosBlocks: [],
    );
  }

  factory BlockState.btcTransactionsSuccessState(List<Tx> btcTransactions) {
    return BlockState(
      status: BlockStatus.successBtcTransactions,
      btcTransactions: btcTransactions,
      tezosBlock: null,
      tezosBlocks: [],
    );
  }

  factory BlockState.tezosBlocksSuccessState(
    List<Tezosblockmodel> tezosBlocks,
  ) {
    return BlockState(
      status: BlockStatus.successTezosTransactions,
      btcTransactions: [],
      tezosBlock: null,
      tezosBlocks: tezosBlocks,
    );
  }

  @override
  List<Object> get props => [status, btcTransactions, resMessage ?? ''];

  BlockState copyWith({
    BlockStatus? status,
    List<Tx>? btcTransactions,
    List<Tezosblockmodel>? tezosBlocks,
    Tezosblockmodel? tezosBlock,
    String? resMessage,
  }) {
    return BlockState(
      status: status ?? this.status,
      btcTransactions: btcTransactions ?? this.btcTransactions,
      tezosBlock: tezosBlock ?? this.tezosBlock,
      tezosBlocks: tezosBlocks ?? this.tezosBlocks,
      resMessage: resMessage ?? this.resMessage,
    );
  }
}
