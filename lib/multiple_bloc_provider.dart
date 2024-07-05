import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

MultiRepositoryProvider createRepositoryAndBlocProviders(
    {required Widget child}) {
  return MultiRepositoryProvider(
    providers: const [
      // Thêm các RepositoryProvider khác ở đây
    ],
    child: MultiBlocProvider(
      providers: const [
        // BlocProvider<AnotherBloc>(
        //   create: (context) => AnotherBloc(),
        // ),
        // Thêm các BlocProvider khác ở đây
      ],
      child: child,
    ),
  );
}
