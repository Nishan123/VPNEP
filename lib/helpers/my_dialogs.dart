import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs {
  static success({required String msg}) {
    Get.snackbar('Error', msg, colorText: Color.fromARGB(255, 0, 180, 90));
  }
  static error({required String msg}) {
    Get.snackbar('Error', msg, colorText: Color.fromARGB(255, 218, 0, 0));
  }

  static info({required String msg}) {
    Get.snackbar('Info', msg, colorText: Color.fromARGB(255, 4, 0, 238));
  }
}
