import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyboardUtil {
  static void closeKeyboard() {
    FocusScope.of(Get.context!).unfocus();
  }
}
