import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDialogs {
  static success({required String msg}) {
    Get.snackbar('Connecting.....', msg, colorText: Colors.white);
  }
  static error({required String msg}) {
    Get.snackbar('Error', msg, colorText: Colors.white);
  }

  static info({required String msg}) {
    Get.snackbar('Info', msg, colorText: Colors.white);
  }
}
