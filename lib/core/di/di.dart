import 'package:get_it/get_it.dart';
import 'package:tzkt/core/api/authenticated_dio_client.dart';
import 'package:tzkt/core/api/repository/repository.dart';

import '../api/clients/clients.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<AuthenticatedDioClient>(
      () => AuthenticatedDioClient());

// Clients
  getIt.registerLazySingleton<BtcClient>(
    () => BtcClientImpl(
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<TezosClient>(
    () => TezosClientImpl(
      client: getIt(),
    ),
  );

// Repositories
  getIt.registerLazySingleton<BtcRepository>(
    () => BtcRepositoryImpl(
      btcClient: getIt(),
    ),
  );
  getIt.registerLazySingleton<TezosRepository>(
    () => TezosRepositoryImpl(
      tezosClient: getIt(),
    ),
  );
}
