import 'package:flutter/material.dart';

import 'Routing/router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
       routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        routerDelegate: router.routerDelegate,
        // End: Routing params
      debugShowCheckedModeBanner: false,
      title: 'RexPower ',
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
          primary: const Color(0xFF035515),
      textStyle: const TextStyle(
        fontSize: 24,
      ),
    ),
    ),
      ),
    );
  }
}