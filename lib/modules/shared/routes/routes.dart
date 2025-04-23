import 'package:flutter/cupertino.dart';
import 'package:mobank/modules/auth/splash/presentation/screens/onboarding.dart';

import '../../auth/login/presentation/screens/login.dart';
import '../../auth/sign_up/presentation/screens/auth_selection_screen.dart';
import '../../auth/sign_up/presentation/screens/sign_up.dart';
import '../../auth/splash/presentation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const Onboarding(), //Formerly SplashScreen
  '/auth_selection_screen': (context) => const AuthSelectionScreen(),
  '/sign_up': (context) => const SignUp(),
  '/login': (context) => const Login(),
};