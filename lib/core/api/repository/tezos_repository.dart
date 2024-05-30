import 'package:dartz/dartz.dart';
import 'package:tzkt/core/api/clients/clients.dart';
import 'package:tzkt/core/api/models/models.dart';
import 'package:tzkt/core/api/repository/base_repository.dart';

import '../exception/request_failure.dart';

abstract class TezosRepository {
  Future<Either<RequestFailure, List<Tezosblockmodel>>> getTezosBlocks();
  Future<Either<RequestFailure, Tezosblockmodel>> getTezosBlockByHash({
    required String hash,
  });
}

class TezosRepositoryImpl extends BaseRepository implements TezosRepository {
  TezosRepositoryImpl({
    required TezosClient tezosClient,
  }) : _tezosClient = tezosClient;

  TezosClient _tezosClient;
  @override
  Future<Either<RequestFailure, Tezosblockmodel>> getTezosBlockByHash({
    required String hash,
  }) async {
    try {
      final res = await _tezosClient.getTezosBlockByHash(hash: hash);
      return Right(res);
    } catch (e, s) {
      return handleRequestFailure(e, s);
    }
  }

  @override
  Future<Either<RequestFailure, List<Tezosblockmodel>>> getTezosBlocks() async {
    try {
      final res = await _tezosClient.getTezosBlocks();
      return Right(res);
    } catch (e, s) {
      return handleRequestFailure(e, s);
    }
  }
}
