import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core /theme/app_color.dart';
import '../../../login/infrastructure/secure_storage/auth_secure_storage.dart';
import 'onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  AuthSecureStorage authSecureStorage = AuthSecureStorage();

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(milliseconds: 1000)); // Splash delay

    String? onboardingCompleted = await authSecureStorage.getIsOnboardingDone();
    debugPrint("===>>> onboardingCompleted: $onboardingCompleted");

    if (onboardingCompleted == "done") {
      Get.offAllNamed('/login');
    } else {
      Get.offAll(() => const Onboarding());
    }
  }

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(
                "assets/icons/transfer_boss_logo.png",
                width: 329,
                height: 208,
              ),
            ),
          ),
          Positioned(
            top: 550,
            left: -120.0,
            child: SvgPicture.asset(
              "assets/icons/splash_one.svg",
              width: 372,
              height: 372,
            ),
          ),
          Positioned(
            top: 500,
            left: -110.0,
            child: SvgPicture.asset(
              "assets/icons/splash_two.svg",
              width: 372,
              height: 372,
            ),
          )
        ],
      ),
    );
  }
}
