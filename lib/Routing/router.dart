
import 'package:go_router/go_router.dart';
import 'package:rexpower/Authentication/sign_in.dart';

import '../Authentication/login.dart';
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
      builder: (context, state) => const SignIn(),
    ),
  ],
);

class RouteNames {
  static const String splashscreen = "/Splashscreen";
  static const String login       = "/Login";
  static const String signin      =   "/SignIn";
  }
