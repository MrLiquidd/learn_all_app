import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_all/core/di/di.dart';
import 'package:learn_all/features/auth/domain/usecases/usecases.dart';
import 'package:learn_all/features/auth/presentation/screens/screens.dart';
import 'package:learn_all/features/home/presentation/screens/screens.dart';
import 'package:learn_all/utils/services/hive/hive.dart';

import 'app_route.dart';
import 'go_router_refresh_stream.dart';


class AppRouterConfig {
  static late BuildContext context;

  AppRouterConfig.setStream(BuildContext ctx) {
    context = ctx;
  }
  static final GoRouter router = GoRouter(
    routes: _routes,
    initialLocation: Routes.login.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: GoRouterRefreshStream(context.read<AuthCubit>().stream),
        redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path ||
          state.matchedLocation == Routes.register.path;

      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.root.path;
      }

      /// No direct
      return null;
    },
  );

  void dispose() {}

  static final _routes = <RouteBase>[
    GoRoute(
      path: Routes.login.path,
      name: Routes.login.name,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            AuthCubit(inject<SignupUseCase>(), inject<SigninUseCase>()),
        child: const SigninPage(),
      ),
    ),
    GoRoute(
      path: Routes.register.path,
      name: Routes.register.name,
      builder: (context, state) => BlocProvider(
        create: (_) =>
            AuthCubit(inject<SignupUseCase>(), inject<SigninUseCase>()),
        child: const SignupPage(),
      ),
    ),
    GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        builder: (context, state) => const HomePage()),
  ];
}
