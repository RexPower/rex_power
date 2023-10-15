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
      body: SingleChildScrollView(
        child: Padding(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.apple),
                    label: const Text('Sign in with Apple'),
                  ),
                  const SizedBox(width: 8.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata_outlined),
                    label: const Text('Sign in with Google'),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
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
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'Register Now',
                            style: TextStyle(
                                color: Color(0xFF035515), fontSize: 16),
                          ),
                        ]),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go(RouteNames.home);
                },
                child: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
