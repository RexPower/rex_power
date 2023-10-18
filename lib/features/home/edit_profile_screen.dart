import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../routing/router.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailAddressController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();



  @override
  void initState() {
    // _profileController.getBioData().then((bioData) {
    //   _firstNameController.text = (bioData['name'] as String).split(' ')[0];
    //   _lastNameController.text = (bioData['name'] as String).split(' ')[1];
    //   _emailAddressController.text = bioData['email'] as String;
    //   _phoneNumberController.text = bioData['phoneNumber'] as String;
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => GoRouter.of(context).push(RouteNames.profile),
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Satoshi',
            ),
          ),
        ),
        // actions: [
        //   Row(
        //     children: [
        //       const MenuButton(
        //         popupColor: Colors.black,
        //       ),
        //       Container(
        //         width: menuPadding,
        //       ),
        //       Container(
        //         width: menuPadding,
        //       )
        //     ],
        //   )
        // ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(children: [
                        Positioned(
                          child: Obx(() => CircleAvatar(
                            radius: 50.0,
                            // backgroundImage: NetworkImage(
                            //     _authController.currentUser.value?.photoURL ??
                            //         ''),
                            backgroundColor: Get.theme.primaryColor,
                          )),
                        ),
                        Positioned(
                            bottom: 0.2,
                            right: 0.2,
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        color: Get.theme.primaryColor, width: .5)),
                                child: Center(
                                  // child: IconButton(
                                  //     iconSize: 15,
                                  //     onPressed: () {
                                  //       _profileController.updateProfilePicture();
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.camera_alt_rounded,
                                  //       color: Get.theme.primaryColor,
                                  //     )),
                                ))),
                      ]),
                      Container(
                        color: const Color(0xFFF6FDFC),
                        margin: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _firstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Satoshi',
                                color: Colors.black54),
                            hintText: "Your First name ",
                            hintStyle: const TextStyle(
                                color: Colors.black54, fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.5,
                                    style: BorderStyle.solid)),
                            alignLabelWithHint: false,
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xFFF6FDFC),
                        margin: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          controller: _lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Satoshi',
                                color: Colors.black54),
                            hintText: "your Last Name ",
                            hintStyle: const TextStyle(
                                color: Colors.black54, fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.5,
                                    style: BorderStyle.solid)),
                            alignLabelWithHint: false,
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xFFF6FDFC),
                        margin: const EdgeInsets.all(8.0),
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
                          controller: _emailAddressController,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Satoshi',
                                color: Colors.black54),
                            hintText: " Your Email Address",
                            hintStyle: const TextStyle(
                                color: Colors.black54, fontSize: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.5,
                                    style: BorderStyle.solid)),
                            alignLabelWithHint: false,
                            filled: false,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        margin: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   _profileController.updateBioData(
                            //       '${_firstNameController.value.text.trim()} ${_lastNameController.value.text.trim()}',
                            //       _emailAddressController.value.text.trim(),
                            //       _phoneNumberController.value.text.trim());
                            // }
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
                            backgroundColor: Colors.teal,
                            side: const BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ]))),
      ),
    );
  }
}
