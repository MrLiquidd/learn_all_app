import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_all/app/library/theme/app_theme.dart';
import 'package:learn_all/app/common/helpers/dark_mode/bloc/theme_cubit.dart';
import 'package:learn_all/app/router/app_route_config.dart';

class LearnAllApp extends StatefulWidget {
  const LearnAllApp({super.key});

  @override
  State<LearnAllApp> createState() => _LearnAllAppState();
}

class _LearnAllAppState extends State<LearnAllApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void dispose() {
    super.dispose();
    _appRouterConfig.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouterConfig.router,
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
        ),
      ),
    );
  }
}
