import 'package:go_router/go_router.dart';
import 'package:rexpower/features/authentication/login.dart';
import 'package:rexpower/features/home/home_dashboard.dart';
import 'package:rexpower/features/home/profile_screen.dart';

import '../features/authentication/first_auth_screen.dart';
import '../features/authentication/register.dart';
import '../features/authentication/splashscreen.dart';

final router = GoRouter(
  // initialLocation: '/splashScreen',
  initialLocation: RouteNames.splashscreen,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: RouteNames.auth,
      builder: (context, state) => const FirstAuthScreen(),
    ),
    GoRoute(
      path: RouteNames.login,
      builder: (context, state) => SignIn(),
    ),
    GoRoute(
      path: RouteNames.splashscreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: RouteNames.register,
      builder: (context, state) => Register(),
    ),
    GoRoute(
      path: RouteNames.home,
      builder: (context, state) => HomeDashboard(),
    ),
    GoRoute(
      path: RouteNames.marketplace,
      builder: (context, state) => HomeDashboard(),
    ),
    GoRoute(
      path: RouteNames.helpDesk,
      builder: (context, state) => HomeDashboard(),
    ),
    GoRoute(
      path: RouteNames.profile,
      builder: (context, state) => ProfileScreen(),
    ),
  ],
);

class RouteNames {
  static const String splashscreen = "/Splashscreen";
  static const String auth = "/auth";
  static const String login = "/login";
  static const String register = "/register";

  static const String home = "/home";
  static const String marketplace = "/marketplace";
  static const String helpDesk = "/help-dessk";
  static const String profile = "/profile";
  static const String editprofilescreen = "/EditProfileScreen";
}
