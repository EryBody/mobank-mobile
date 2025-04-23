import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobank/modules/auth/login/presentation/controller/login_controller.dart';

import 'modules/auth/sign_up/presentation/controller/signup_controller.dart';
import 'modules/shared/routes/routes.dart';

enum LoadingState{
  still,
  loading,
  success
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'MoBank',
      initialRoute: '/',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      routes: routes,
      initialBinding: BindingsBuilder(() {
        Get.put(SignupController());
        Get.put(LoginController());
      }),
    );
  }
}