import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core /constants/api_constants.dart';
import '../../../../../main.dart';
import '../../../../shared/widgets/toasts.dart';
import '../../infrastructure/api/login_service.dart';
import '../../infrastructure/models/login_request.dart';
import '../../infrastructure/models/login_response.dart';
import '../../infrastructure/secure_storage/auth_secure_storage.dart';
import '../../infrastructure/secure_storage/login_secure_storage.dart';

class LoginController extends GetxController{

  var loadingLoginAction = Rx<LoadingState>(LoadingState.still);
  LoginSecureStorage loginSecureStorage = LoginSecureStorage();
  AuthSecureStorage authSecureStorage = AuthSecureStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  clearFields(){
    password.clear();
  }

  void login() async{
    try {
      loadingLoginAction.value = LoadingState.loading;
      LoginRequest request = LoginRequest(emailAddress: email.text, password: password.text, provider: 'EMAIL', providerId: '');

      debugPrint("===>>> Request: $request");

      LoginResponse res = await LoginService().login(request);

      debugPrint("===>>> Response: $res");

      loadingLoginAction.value = LoadingState.still;
      if (res.status) {
        authSecureStorage.setToken(res.data.accessToken);
        authSecureStorage.setIsOnboardingDone("done");
        authSecureStorage.setUserName(res.data.userData.username);
        authSecureStorage.setEmail(res.data.userData.emailAddress);

        infoSnackBar("Hurray!!",
            "Login Successful");
      } else {
        infoSnackBar(
            "Could not get user information, try again!", "Please Try again");
      }
    }catch(e){
      loadingLoginAction.value = LoadingState.still;
      debugPrint("===>>> login exception: ${e.toString()}");
      infoSnackBar(
          e.toString(), "Something went wrong!");
    }finally{
      clearFields();
    }
  }
}
