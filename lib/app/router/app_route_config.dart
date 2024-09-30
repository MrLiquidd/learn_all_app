import 'package:go_router/go_router.dart';
import 'package:learn_all/features/auth/presentation/screens/auth/pages/signin.dart';
import 'package:learn_all/app/router/app_route.dart';

class AppRouterConfig {
  late final GoRouter router =
      GoRouter(routes: _routes, initialLocation: AppRoute.signIn);

  void dispose() {}

  late final _routes = <RouteBase>[
    GoRoute(
      path: AppRoute.signIn,
      name: AppRoute.signIn,
      builder: (context, state) =>  const SigninPage()
    ),
    // GoRoute(
    //   path: "/main",
    //   name: AppRoute.main,
    //   builder: (context, state) => BlocProvider(
    //     create: (_) => HomeBloc(inject()),
    //     child: MainScreen(
    //       viewModel: MainScreenViewModel(),
    //     ),
    //   ),
    // ),
  ];
}