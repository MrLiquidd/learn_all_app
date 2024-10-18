import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_all/core/app/router/go_router_refresh_stream.dart';
import 'package:learn_all/core/di/di.dart';
import 'package:learn_all/features/features.dart';
import 'package:learn_all/utils/services/hive/hive.dart';

import 'app_route.dart';

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

      // If not login
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      // If login
      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.home.path;
      }

      /// No direct
      return null;
    },
  );

  void dispose() {}

  static final _routes = <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          RootPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.home.path,
              builder: (context, state) => BlocProvider(
                create: (_) => HomeCubit(inject<GetUserUseCase>())..getData(),
                child: const HomePage(),
              ),
              // routes: [
              //   GoRoute(
              //     path: 'detail',
              //     builder: (context, state) => Container(),
              //   ),
              // ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.cources.path,
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    MyCourseCubit(inject<GetCourcesUseCase>())..getData(),
                child: const CourcesPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.search.path,
              builder: (context, state) => Container(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.account.path,
              builder: (context, state) => BlocProvider(
                create: (_) =>
                    AuthCubit(inject<SignupUseCase>(), inject<SigninUseCase>()),
                child: const AccountPage(),
              ),
            ),
          ],
        ),
      ],
    ),
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
  ];
}
