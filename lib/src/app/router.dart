import 'package:go_router/go_router.dart';
import '../presentations/presentation.dart';

class RouterConst {
  static const String splash = 'splash';
  static const String home = 'home';
}

class RouterConf {
  static final GoRouter goRouter = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        name: RouterConst.splash,
        path: '/splash',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        name: RouterConst.home,
        path: '/home',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
