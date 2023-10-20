import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/auth_controller.dart';
import '../../Controllers/loading_controller.dart';
import '../../routing/router.dart';
import '../../utilities/route_path.dart';
import '../../utilities/show_error_snackbar.dart';

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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          if (!GetUtils.isEmail(value)) {
                            return "Email is not valid";
                          }

                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        obscureText: passwordVisible,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "Password",
                          // labelText: "Password",
                          helperText:
                              "Password must contain special Characters",
                          hintStyle: const TextStyle(color: Colors.black54),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            color: const Color(0xFF0F9203),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        obscureText: passwordVisible,
                        controller: _confirmPasswordController,
                        decoration: InputDecoration(
                          labelText: "Confirm Password",
                          helperText:
                              "Password must contain special Characters",
                          // labelText: "Password",
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            color: const Color(0xFF0F9203),
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
                    const SizedBox(height: 16.0),
                    RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context)
                            .style
                            .copyWith(decoration: TextDecoration.none),
                        children: [
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(right: 4.0),
                                child: Icon(
                                  Icons.check_box,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const TextSpan(
                            text:
                                'I accept terms and condition for this app.  ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                          const TextSpan(
                            text: 'Terms and Conditions.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF035515),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const SizedBox(height: 30.0),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LoadingController().startLoading();

                            if (_passwordController.value.text.trim() !=
                                _confirmPasswordController.value.text.trim()) {
                              showErrorSnackbar('Password must match');
                              LoadingController().stopLoading();
                            }

                            AuthController()
                                .register(
                                    _emailController.value.text.trim(),
                                    _passwordController.value.text.trim(),
                                    _phoneNumberController.value.text.trim(),
                                    _firstAndNameController.value.text.trim())
                                .then((value) {
                              if (value) {
                                Get.toNamed(RoutePaths.login);
                              }
                            }).catchError((error) {
                              LoadingController().stopLoading();

                              showErrorSnackbar("Sign in failed");
                              if (kDebugMode) {
                                debugPrint(error);
                              }
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          maximumSize: const Size(double.infinity, 100),
                          backgroundColor: Color(0xFF035515),
                          side: const BorderSide(
                            color: Color(0xFF035515),
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
        ),
      ),
    );
  }
}
