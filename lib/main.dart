import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rexpower/constants/colors.dart';
import 'package:rexpower/utilities/generate_color_swatch.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'firebase_options.dart';
import 'routing/router.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();

  WidgetsFlutterBinding.ensureInitialized();

  usePathUrlStrategy();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }

  runApp(const RexPowerApp());
}

class RexPowerApp extends StatelessWidget {
  const RexPowerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: GetMaterialApp.router(
        // Begin: Routing params
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        // End: Routing params
        debugShowCheckedModeBanner: false,
        title: 'RexPower',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: primaryColor,
          primarySwatch: generateMaterialColorSwatch(primaryColor),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF035515),
              textStyle: const TextStyle(
                fontSize: 24,
              ),
            ),
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(),
        themeMode: ThemeMode.light,
      ),
    );
  }
}
