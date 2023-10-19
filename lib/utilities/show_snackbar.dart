import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar(String title, String message) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 3),
      // backgroundColor: Color(primaryColorCode),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM);
}
