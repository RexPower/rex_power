import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routing/router.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final TextEditingController _firstAndNameController = TextEditingController();

  bool passwordVisible = false;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 80),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 25),
                child: const Text(
                  "Register and lets get started ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: _firstAndNameController,
                decoration: const InputDecoration(
                  labelText: "First and last Name",
                  border: OutlineInputBorder(),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                controller: _phoneNumberController,
                decoration: const InputDecoration(
                  labelText: "start with your country code (+234)",
                  border: OutlineInputBorder(),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: passwordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  // labelText: "Password",
                  helperText: "Password must contain special Characters",
                  hintStyle: const TextStyle(color: Colors.black54),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    color: Colors.teal.shade200,
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: passwordVisible,
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  helperText: "Password must contain special Characters",
                  // labelText: "Password",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    color: Colors.teal.shade200,
                    icon: Icon(passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          passwordVisible = !passwordVisible;
                        },
                      );
                    },
                  ),
                  alignLabelWithHint: false,
                  filled: true,
                ),
              ),
            ),
            RichText(
              text: TextSpan(
                text: 'I accept terms and conditions for this app. ',
                style: DefaultTextStyle.of(context).style,
                children: const [
                  WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.0),
                      child: Icon(
                        Icons.check_box,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: 'Terms and Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push(RouteNames.signin);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: const Color(0xFF035515),
                  side: const BorderSide(
                    color: Colors.teal,
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    )));
  }
}
