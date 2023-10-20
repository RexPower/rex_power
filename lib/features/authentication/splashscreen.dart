import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      if (FirebaseAuth.instance.currentUser != null) {
        GoRouter.of(context).go(RouteNames.home);
      }

      GoRouter.of(context).go(RouteNames.auth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ClipRect(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Center(
              child: Hero(
                tag: 'splash_logo',
                child: Image.asset(
                  "assets/rexpower-appicon.png",
                  width: 130,
                  height: 130,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
