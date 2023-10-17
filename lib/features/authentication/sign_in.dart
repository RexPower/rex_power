import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/router.dart';

class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign In',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Insert your login details',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TextFormField(
                obscureText: !passwordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    color: passwordVisible ? Colors.purple : Colors.grey,
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple, color: Colors.black,),
                  label: const Text('Sign in with Apple', style: TextStyle(color: Colors.black),),
                ),
                const SizedBox(height: 8.0),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.g_mobiledata_sharp,color: Color(0xFFFBBC04),),
                  label: const Text('Sign in with Google', style: TextStyle(color: Color(0xFF4285F4)),),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      GoRouter.of(context).push(RouteNames.home);
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
                        color: Colors.white,
                      ),
                    ),
                    child: const Text(
                      'Login Now',
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

        const SizedBox(height: 15.0),
        const SizedBox(height: 29),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).push(RouteNames.login);
            },
            child: RichText(
              text: const TextSpan(
                  text: 'If your are a New User? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'DM Sans',
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: 'Register Now',
                      style: TextStyle(
                          color: Color(0xFF035514), fontSize: 16),
                    ),
                  ]),
            ),
          ),
        ),
     ]),
    )
    );
  }

  void setState(Null Function() param0) {}
}
