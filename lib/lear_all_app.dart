import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/core/di/di.dart';

import 'core/app/common/helpers/dark_mode/bloc/theme_cubit.dart';
import 'core/app/library/theme/app_theme.dart';
import 'core/app/router/app_route_config.dart';
import 'features/auth/auth.dart';

class LearnAllApp extends StatelessWidget {
  const LearnAllApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
        BlocProvider(
          create: (_) => AuthCubit(
            inject<SignupUseCase>(),
            inject<SigninUseCase>(),
          ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          AppRouterConfig.setStream(context);
          return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouterConfig.router,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          // locale: TranslationProvider.of(context).flutterLocale,
          // supportedLocales: AppLocaleUtils.supportedLocales,
          // localizationsDelegates: const [
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate
          // ],
        );
        },
      ),
    );
  }
}
