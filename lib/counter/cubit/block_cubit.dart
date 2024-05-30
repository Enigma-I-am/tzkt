import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tzkt/core/api/models/models.dart';
import 'package:tzkt/core/api/repository/repository.dart';
import 'package:tzkt/core/di/di.dart';

part 'block_state.dart';

class BlockCubit extends Cubit<BlockState> {
  BlockCubit() : super(BlockState.initial());

  final _btcRepository = getIt<BtcRepository>();
  final _tezosRepository = getIt<TezosRepository>();

  Future loadBtcTransactions() async {
    emit(state.copyWith(status: BlockStatus.loadingBtcTransactions));
    final $req1 = await _btcRepository.getLastestBtcBlock();
    $req1.fold(
      (l) => emit(
        state.copyWith(
          status: BlockStatus.failure,
          resMessage: l.message,
        ),
      ),
      (r) async {
        final $req2 = await _btcRepository.getBlockTransactionsByHash(
          hash: r.hash,
        );

        $req2.fold(
          (l) => emit(
            state.copyWith(
              status: BlockStatus.failure,
              resMessage: l.message,
            ),
          ),
          (r) => emit(
            BlockState.btcTransactionsSuccessState(r.tx),
          ),
        );
      },
    );
  }

  Future loadTezosTransactions() async {
    emit(state.copyWith(status: BlockStatus.loadingTezosTransactions));
    final req = await _tezosRepository.getTezosBlocks();

    req.fold(
      (l) => emit(state.copyWith(
        status: BlockStatus.failure,
        resMessage: l.message,
      )),
      (r) => emit(BlockState.tezosBlocksSuccessState(r)),
    );
  }
}
