import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_lib/src/log/logger_utils.dart';
import 'package:flutter_bloc_lib/src/routes/app_pages.dart';
import 'package:flutter_bloc_lib/src/theme/theme.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.

void main() {
  Bloc.observer = LoggerBlocObserver();
  runApp(
    BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: appPages,
            theme: theme,
          );
        },
      ),
    ),
  );
}
