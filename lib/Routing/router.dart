
import 'package:go_router/go_router.dart';
import 'package:rexpower/Authentication/sign_in.dart';

import '../Authentication/login.dart';
import '../Authentication/register.dart';
import '../Authentication/splashscreen.dart';

final router = GoRouter(
  // initialLocation: '/splashScreen',
  initialLocation: RouteNames.splashscreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:RouteNames.login,
      builder: (context, state) => const Login(),
    ),
    GoRoute(
      path:RouteNames.signin,
      builder: (context, state) => SignIn(),
    ),
    GoRoute(
      path:RouteNames.splashscreen,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path:RouteNames.register,
      builder: (context, state) => const Register(),
    ),
  ],
);

class RouteNames {
  static const String splashscreen = "/Splashscreen";
  static const String login       = "/Login";
  static const String signin      =   "/SignIn";
  static const String register    =   "/Register";
  }
