import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rexpower/constants/colors.dart';
import 'package:rexpower/utilities/generate_color_swatch.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

import 'routing/router.dart';

void main() async {
  ///Call this first to make sure we can make other system level calls safely
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    // current: #1 1440x3120 @ 60Hz
    // new: #2 1440x3120 @ 90Hz
    await FlutterDisplayMode.setHighRefreshRate();
  }

  runApp(const RexPowerApp());
}

class RexPowerApp extends StatelessWidget {
  const RexPowerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
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
    );
  }
}
