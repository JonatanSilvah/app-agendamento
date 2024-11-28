import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:app_agendamento/features/auth/models/user.dart';
import 'package:dio/dio.dart';

abstract class AuthDatasource {
  Future<Result<LoginFailedResult, User>> login(
      {required email, required password});
}

class RemoteAuthDatasource implements AuthDatasource {
  RemoteAuthDatasource(this._dio);

  final Dio _dio;

  Future<Result<LoginFailedResult, User>> login(
      {required email, required password}) async {
    try {
      final response = await _dio.post('/v1-sign-in', data: {
        'email': email,
        'password': password,
      });

      return Success(User.fromMap(response.data['result']));
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Failure(LoginFailedResult.invalidCredentials);
      } else if (e.type == DioExceptionType.unknown) {
        return const Failure(LoginFailedResult.offiline);
      }
      return const Failure(LoginFailedResult.unknowError);
    }
  }
}
