import 'package:artauct_app/app_routers.dart';
import 'package:artauct_app/multiple_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  final AppRouter appRouter = AppRouter();

  runApp(
    createRepositoryAndBlocProviders(
      child: MainApp(router: appRouter.router),
    ),
  );
}

class MainApp extends StatelessWidget {
  final GoRouter router;

  const MainApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
