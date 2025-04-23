import 'package:flutter/material.dart';
import 'package:get/get.dart';

void closeKeyboard() {
  if (Get.focusScope != null && Get.focusScope!.hasFocus) {
    Get.focusScope!.unfocus();
  }
}
