import 'package:tzkt/core/api/authenticated_dio_client.dart';
import 'package:tzkt/core/api/models/models.dart';

abstract class BtcClient {
  Future<BtcLatestBlockModel> getLatestBtcBlock();
  Future<BtcLatestBlockTransactions> getBlockTransactionsByHash({
    required String hash,
  });
}

class BtcClientImpl implements BtcClient {
  BtcClientImpl({AuthenticatedDioClient? client})
      : _client = client ?? AuthenticatedDioClient();

  final AuthenticatedDioClient _client;

  static String baseURL = 'https://blockchain.info';
  static String latestBlock = '$baseURL/latestblock';
  static String latestBlockTxn(String blockHash) =>
      '$baseURL/rawblock/$blockHash';

  Future<BtcLatestBlockModel> getLatestBtcBlock() async {
    final res = await _client.get(latestBlock);
    final req = _client.errorInterceptor(res);
    return BtcLatestBlockModel.fromJson(req.data ?? '{}');
  }

  Future<BtcLatestBlockTransactions> getBlockTransactionsByHash({
    required String hash,
  }) async {
    final res = await _client.get(latestBlockTxn(hash));
    final req = _client.errorInterceptor(res);
    return BtcLatestBlockTransactions.fromJson(req.data ?? '{}');
  }
}
