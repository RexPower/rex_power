import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Routing/router.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/power2.jpg'),
          ),
          const SizedBox(height: 16.0),
          const Center(
          ) ,
          const SizedBox(height: 16.0),
        Center(
          child: Text(
            'Your everyday consumption record',
            style: GoogleFonts.baiJamjuree(fontSize: 20),
          ),
        ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    GoRouter.of(context).push(RouteNames.register);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    maximumSize: const Size(double.infinity, 100),
                    backgroundColor: const Color(0xFF035515),
                    side: const BorderSide(
                      color: Color(0xFF035515),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    GoRouter.of(context).push(RouteNames.signin);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                    ),
                    maximumSize: const Size(double.infinity, 100),
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF035515),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).push(RouteNames.login);
              },
              child: RichText(
                text: const TextSpan(
                    text: 'New Around here? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(
                            color: Color(0xFF035515), fontSize: 16),
                      ),
                    ]),
              ),
            ),
          ),
    ]
      ),
    );
  }
}
