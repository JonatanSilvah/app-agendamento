import 'package:app_agendamento/core/di/di.dart';
import 'package:app_agendamento/core/flavor/flavor_config.dart';
import 'package:app_agendamento/core/helpers/result.dart';
import 'package:app_agendamento/core/route/app_routes.dart';
import 'package:app_agendamento/features/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';

void bootstrap(Flavorconfig config) {
  configureDependencies(config);

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();

    initialize();
  }

  Future<void> initialize() async {
    final AuthRepository authRepository = getIt();
    final result = await authRepository.login(
        email: "jonatanda25@gmail.com", password: "123456");
    switch (result) {
      case Success(object: final user):
        print('sucess ${user.id}');
      case Failure(error: final error):
        print('app: ${error}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
