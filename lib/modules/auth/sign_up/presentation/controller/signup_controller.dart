
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../main.dart';
import '../../../../shared/widgets/toasts.dart';
import '../../../login/infrastructure/secure_storage/auth_secure_storage.dart';
import '../../infrastructure/api/signup_service.dart';
import '../../infrastructure/models/signup_request.dart';
import '../../infrastructure/models/signup_response.dart';
import '../../infrastructure/secure_storage/signup_secure_storage.dart';

class SignupController extends GetxController {

  var loadingRegistrationAction = Rx<LoadingState>(LoadingState.still);

  SignupSecureStorage signupSecureStorage = SignupSecureStorage();
  AuthSecureStorage authSecureStorage = AuthSecureStorage();

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    mobile.dispose();
    super.onClose();
  }


  void register() async {
    try {

      loadingRegistrationAction.value = LoadingState.still;
      if (password.text != confirmPassword.text) {
        infoSnackBar("Passwords do not match", "Validation error");
        return;
      }

      loadingRegistrationAction.value = LoadingState.loading;

        SignupRequest request = SignupRequest(emailAddress: email.text, displayName: username.text, password: password.text, confirmPassword: confirmPassword.text, firstName: firstName.text, lastName: lastName.text, countryCode: "+234", mobileNumber: mobile.text, provider: "EMAIL", providerId: "", referralCode: "");

        debugPrint("===>>> request: $request");

        String fullName = "${request.lastName} ${request.firstName}";

        SignupResponse res = await SignupService().signup(request);

        loadingRegistrationAction.value = LoadingState.still;

        if (res.status) {
          authSecureStorage.setToken(res.data.accessToken);
          authSecureStorage.setIsOnboardingDone("done");
          authSecureStorage.setUserName(res.data.userData.username);
          authSecureStorage.setEmail(res.data.userData.emailAddress);

          successSnackBar(res.message, "Confirm registration");
          Get.toNamed("/login");
        } else {
          infoSnackBar("Something happened while storing data",
              "Something wrong happened");
        }
    }catch(e){
      loadingRegistrationAction.value = LoadingState.still;
      errorSnackBar(e.toString(), "Something went wrong!");
    }
  }

}
