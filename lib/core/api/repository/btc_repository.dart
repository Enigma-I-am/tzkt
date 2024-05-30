import 'package:dartz/dartz.dart';
import 'package:tzkt/core/api/clients/clients.dart';
import 'package:tzkt/core/api/exception/request_failure.dart';
import 'package:tzkt/core/api/models/models.dart';

import 'package:tzkt/core/api/repository/base_repository.dart';

abstract class BtcRepository {
  Future<Either<RequestFailure, BtcLatestBlockModel>> getLastestBtcBlock();
  Future<Either<RequestFailure, BtcLatestBlockTransactions>>
      getBlockTransactionsByHash({
    required String hash,
  });
}

class BtcRepositoryImpl extends BaseRepository implements BtcRepository {
  BtcRepositoryImpl({
    required BtcClient btcClient,
  }) : _btcClient = btcClient;
  final BtcClient _btcClient;

  Future<Either<RequestFailure, BtcLatestBlockModel>>
      getLastestBtcBlock() async {
    try {
      final res = await _btcClient.getLatestBtcBlock();
      return Right(res);
    } catch (e, s) {
      return handleRequestFailure(e, s);
    }
  }

  Future<Either<RequestFailure, BtcLatestBlockTransactions>>
      getBlockTransactionsByHash({
    required String hash,
  }) async {
    try {
      final res = await _btcClient.getBlockTransactionsByHash(hash: hash);
      return Right(res);
    } catch (e, s) {
      return handleRequestFailure(e, s);
    }
  }
}
