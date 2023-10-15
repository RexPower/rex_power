import 'package:go_router/go_router.dart';
import 'package:rexpower/features/authentication/sign_in.dart';
import 'package:rexpower/features/home/home_dashboard.dart';

import '../features/authentication/login.dart';
import '../features/authentication/register.dart';
import '../features/authentication/splashscreen.dart';

final router = GoRouter(
  // initialLocation: '/splashScreen',
  initialLocation: RouteNames.splashscreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path: RouteNames.signin,
      builder: (context, state) => SignIn(),
    ),
    GoRoute(
      path: RouteNames.splashscreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.register,
      builder: (context, state) => const Register(),
    ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => const HomeDashboard(),
    ),
  ],
);

class RouteNames {
  static const String splashscreen = "/Splashscreen";
  static const String login = "/Login";
  static const String signin = "/SignIn";
  static const String register = "/Register";
  static const String home = "/home";
}
