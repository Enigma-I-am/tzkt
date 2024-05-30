import 'package:tzkt/core/api/authenticated_dio_client.dart';

import '../models/models.dart';

abstract class TezosClient {
  Future<List<Tezosblockmodel>> getTezosBlocks();
  Future<Tezosblockmodel> getTezosBlockByHash({
    required String hash,
  });
}

class TezosClientImpl implements TezosClient {
  TezosClientImpl({AuthenticatedDioClient? client})
      : _client = client ?? AuthenticatedDioClient();
  final AuthenticatedDioClient _client;

  static String baseURL = 'https://api.tzkt.io/v1';
  static String blocksURL = '$baseURL/blocks';
  static String blockByHash({
    required String hash,
  }) =>
      '$blocksURL/$hash';

  @override
  Future<Tezosblockmodel> getTezosBlockByHash({required String hash}) async {
    final res = await _client.get(blockByHash(hash: hash));
    final req = _client.errorInterceptor(res);
    return Tezosblockmodel.fromJson(req.data ?? '{}');
  }

  @override
  Future<List<Tezosblockmodel>> getTezosBlocks() async {
    final res = await _client.get(blocksURL);
    final req = _client.errorInterceptor(res);
    return TezosBlocks.fromJson('{"data": ${req.data ?? '{}'}}').data;
  }
}
