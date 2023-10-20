import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../../Controllers/auth_controller.dart';
import '../../Controllers/loading_controller.dart';
import '../../routing/router.dart';
import '../../utilities/route_path.dart';
import '../../utilities/show_error_snackbar.dart';
import '../../utilities/show_snackbar.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController _authController =
      Get.put<AuthController>(AuthController());
  // bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
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
            SizedBox(height: 16.0),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    LoadingController().startLoading();

                    var userMessage = "";

                    _authController
                        .signInwithEmailAndPassword(
                            _emailController.value.text.trim(),
                            _passwordController.value.text.trim())
                        .then((value) {
                      if (value) {
                        LoadingController().stopLoading();
                        Get.offAllNamed(RoutePaths.home);

                        userMessage = "Login in successfully";
                        debugPrint(userMessage);
                      } else {
                        LoadingController().stopLoading();
                        showErrorSnackbar("Login failed, Something went wrong");
                      }
                    }).onError((error, stackTrace) {
                      LoadingController().stopLoading();

                      userMessage = "Login failed, $error";
                      showSnackbar("Oops", userMessage);
                      debugPrint(userMessage);
                    });
                  }
                },
                style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        60,
                      ),
                    ),
                  ),
                  maximumSize: const Size(double.infinity, 100),
                  backgroundColor: Color(0xFF035515),
                  side: const BorderSide(
                    color: Color(0xFF035515),
                  ),
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
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
                          style:
                              TextStyle(color: Color(0xFF035514), fontSize: 16),
                        ),
                      ]),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // void setState(Null Function() param0) {}
}
