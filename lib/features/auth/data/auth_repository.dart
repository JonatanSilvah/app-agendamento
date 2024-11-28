import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/features/auth/data/auth_datasource.dart';
import 'package:app_agendamento/features/auth/data/results/login_failed_result.dart';
import 'package:app_agendamento/features/auth/models/user.dart';

class AuthRepository {
  AuthRepository(this._datasource);
  final AuthDatasource _datasource;

  Future<Result<LoginFailedResult, User>> login(
      {required email, required password}) async {
    final result = await _datasource.login(email: email, password: password);

    return result;
  }
}
