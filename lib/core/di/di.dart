import 'package:app_agendamento/core/flavor/flavor_config.dart';
import 'package:app_agendamento/core/helpers/token_interceptor.dart';
import 'package:app_agendamento/features/auth/data/auth_datasource.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final getIt = GetIt.I;

void configureDependencies(Flavorconfig config) {
  getIt.registerSingleton(config);

  getIt.registerSingleton(Dio(BaseOptions(baseUrl: config.baseUrl, headers: {
    'X-Parse-Application-Id': config.appId,
    'X-Parse-REST-API-Key': config.restKey,
  }))
    ..interceptors.addAll([
      TokenInterceptor(),
      if (config.flavor == AppFlavor.dev)
        PrettyDioLogger(requestHeader: true, requestBody: true),
    ]));

  getIt.registerFactory(() => RemoteAuthDatasource(getIt()));
  getIt.registerLazySingleton(() => AuthRepository(getIt()));
}
