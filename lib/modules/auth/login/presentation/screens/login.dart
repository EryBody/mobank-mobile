import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core /theme/app_color.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/app_text_form_fields.dart';
import '../../infrastructure/secure_storage/auth_secure_storage.dart';
import '../../infrastructure/secure_storage/login_secure_storage.dart';
import '../controller/login_controller.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  AuthSecureStorage authSecureStorage = AuthSecureStorage();
  LoginSecureStorage loginSecureStorage = LoginSecureStorage();

  LoginController controller = Get.find<LoginController>();

  bool passwordObscure = true;
  bool inputEmailObscure = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getEmailIfLoginBefore();
    getFullName();
  }

  getEmailIfLoginBefore() async {
    debugPrint("===>>> login Before: ");
    String? emailAddress = await loginSecureStorage.getEmail();
    if(emailAddress != null){
      setState(() {
        controller.email.text = emailAddress;
        inputEmailObscure = true;
      });
    }

    debugPrint("===>>> login Before: ${controller.email.text}");
    debugPrint("===>>> login Before: $inputEmailObscure");
  }

  String? userFullName;
  getFullName() async {
    String? fullName = await authSecureStorage.getUserName();
    if(fullName != null){
     setState(() {
       userFullName = fullName;
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.fromLTRB(17.58, 20.66, 17.58, 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset(
                        "assets/icons/transfer_small_clear.png",
                        width: 113,
                        height: 69,
                      ),
                    ),

                    const SizedBox(height: 40,),

                    inputEmailObscure ? Column(
                      children: [
                        Text("Welcome Back", style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: kTextColorShade50
                        ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20,),

                        Text(userFullName ?? "", style: GoogleFonts.poppins(
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor
                        ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 20,),

                        GestureDetector(
                          onTap: (){
                            setState(() {
                              inputEmailObscure = !inputEmailObscure;
                            });
                          },
                          child: Text("Switch User", style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: kTextColorShade50,
                              decoration: TextDecoration.underline,
                              decorationColor: kTextColorShade50,
                              decorationStyle: TextDecorationStyle.solid,
                              decorationThickness: 1
                          ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ) :
                    Column(
                      children: [
                        Text("Welcome", style: GoogleFonts.poppins(
                            fontSize: 29,
                            fontWeight: FontWeight.w700,
                            color: kPrimaryColor
                        ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15,),
                        Text("Begin making seamless payments worldwide", style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kTextColorShade50
                        ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30,),

                    inputEmailObscure ? const SizedBox.shrink() : TextInputField(
                        radius: 10,
                        hint: 'Input email',
                        textEditingController: controller.email,
                        textInputType: TextInputType.emailAddress,
                        inputColor: kBlueShade10,
                        fillColor: kBlueShade10,
                        textColor: kTextColorShade40,
                        fontSize: 14,
                        onValidation: (value) {
                          if(value == null || value.isEmpty){
                            return "Please provide your email address";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.mail_outline_rounded),
                        onChangeCallback: (value) {},
                        isObscure: false,
                        withIcon: false, isLabel: false
                    ),


                    TextInputField(
                        radius: 10,
                        hint: 'Password',
                        textEditingController: controller.password,
                        textInputType: TextInputType.text,
                        inputColor: kBlueShade10,
                        fillColor: kBlueShade10,
                        textColor: kTextColorShade40,
                        fontSize: 14,
                        onValidation: (value) {
                          if(value == null || value.isEmpty){
                            return "Please provide password";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              passwordObscure = !passwordObscure;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Icon(passwordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(),
                        onChangeCallback: (value) {},
                        isObscure: passwordObscure,
                        withIcon: false, isLabel: false
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Get.toNamed("/reset_password");
                          },
                          child: Text("Forgot Password?", style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor
                          ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40,),

                    Obx(() => GradientButton1(
                      width: 286,
                      height: 54.88,
                      borderRadius: 30,
                      fontSize: 16,
                      buttonTextColor: kWhiteColor,
                      bgColor: kPrimaryColor,
                      borderColor: kPrimaryColor,
                      buttonName: "Login",
                      loadingStatus: controller.loadingLoginAction.value,
                      isExpanded: false,
                      onPressed: () {
                        try{
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          controller.login();
                        }catch(e){
                          debugPrint("===>>> login exception: ${e.toString()}");
                        }
                      },
                      buttonWidget: const SizedBox.shrink(),
                    ),),

                    const SizedBox(height: 25,),

                    GestureDetector(
                      onTap: (){
                        loginSecureStorage.clear();
                        authSecureStorage.clear();
                        Get.toNamed("/sign_up");
                        // Get.toNamed("/check_rates");
                      },
                      child: Text("Create new account", style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor
                      ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      )),
    );
  }
}

