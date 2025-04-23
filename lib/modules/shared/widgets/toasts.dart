import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core /theme/app_color.dart';

class SnackBarManager {
  static DateTime? _lastSnackBarTime;

  static const int debounceDurationMs = 2000; // Debounce duration in milliseconds

  static bool canShowSnackBar() {
    final now = DateTime.now();
    if (_lastSnackBarTime == null ||
        now.difference(_lastSnackBarTime!) > const Duration(milliseconds: debounceDurationMs)) {
      _lastSnackBarTime = now;
      return true;
    }
    return false;
  }
}

void successSnackBar(String title, String message) {
  _showDebouncedSnackBar(title, message, "assets/icons/Icon_success.svg");
}

void warningSnackBar(String title, String message) {
  _showDebouncedSnackBar(title, message, "assets/icons/Icon-warning.svg");
}

void infoSnackBar(String title, String message) {
  _showDebouncedSnackBar(title, message, "assets/icons/Icon-info.svg");
}

void errorSnackBar(String title, String message) {
  _showDebouncedSnackBar(title, message, "assets/icons/Icon-error.svg");
}

void _showDebouncedSnackBar(String title, String message, String svgPath) {
  if (!SnackBarManager.canShowSnackBar()) return;

  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: kBlueShade10,
    margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    borderRadius: 10,
    snackStyle: SnackStyle.FLOATING,
    icon: Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SvgPicture.asset(
        svgPath,
        width: 24,
        height: 24,
      ),
    ),
    titleText: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: kTextColorShade50,
        ),
      ),
    ),
    messageText: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        message,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: kTextColorShade50,
        ),
      ),
    ),
    colorText: Colors.white,
    duration: const Duration(seconds: 4),
  );
}
