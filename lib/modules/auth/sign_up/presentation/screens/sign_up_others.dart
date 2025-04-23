import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core /theme/app_color.dart';
import '../../../../shared/functions/close_keyboard.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/app_text_form_fields.dart';
import '../../../../shared/widgets/toasts.dart';
import '../controller/signup_controller.dart';

class SignUpOthers extends StatefulWidget {
  const SignUpOthers({super.key});

  @override
  State<SignUpOthers> createState() => _SignUpOthersState();
}

class _SignUpOthersState extends State<SignUpOthers> {

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  SignupController controller = Get.find<SignupController>();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(17.58, 46.66, 17.58, 10.0),
          child: GestureDetector(
            onTap: (){
              closeKeyboard();
            },
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Almost Done", style: GoogleFonts.poppins(
                              fontSize: 29,
                              fontWeight: FontWeight.w700,
                              color: kPrimaryColor
                          ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 15,),
                          Text("Create an account and start exploring a limitless world!", style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: kTextColorShade50
                          ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 30,),
                          TextInputField(
                              radius: 10,
                              hint: 'Email',
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
                              onChangeCallback: (value) {},
                              isObscure: false,
                              withIcon: false, isLabel: false
                          ),
                          TextInputField(
                              radius: 10,
                              hint: 'Create Password',
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

                          TextInputField(
                              radius: 10,
                              hint: 'Confirm Password',
                              textEditingController: controller.confirmPassword,
                              textInputType: TextInputType.text,
                              inputColor: kBlueShade10,
                              fillColor: kBlueShade10,
                              textColor: kTextColorShade40,
                              fontSize: 14,
                              onValidation: (value) {
                                if(value == null || value.isEmpty){
                                  return "Please provide confirm password";
                                }
                                return null;
                              },
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  setState(() {
                                    confirmPasswordObscure = !confirmPasswordObscure;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(confirmPasswordObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                                ),
                              ),
                              suffixIconConstraints: const BoxConstraints(),
                              onChangeCallback: (value) {},
                              isObscure: confirmPasswordObscure,
                              withIcon: false, isLabel: false
                          ),

                          const SizedBox(height: 30,),

                          Obx(() => GradientButton1(
                            width: 286,
                            height: 54.88,
                            borderRadius: 30,
                            fontSize: 16,
                            buttonTextColor: kWhiteColor,
                            bgColor: kPrimaryColor,
                            borderColor: kPrimaryColor,
                            buttonName: "Next",
                            loadingStatus: controller.loadingRegistrationAction.value,
                            isExpanded: false,
                            onPressed: () {
                              try{
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                if(isChecked){
                                  controller.register();
                                }else{
                                  infoSnackBar("Kindly tick the terms before proceeding", "Accept Terms and conditions");
                                }
                              }catch(e){
                                debugPrint("===>>> sign_up_others exception: ${e.toString()}");
                              }
                            },
                            buttonWidget: const SizedBox.shrink(),
                          )),

                          const SizedBox(height: 20,),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Checkbox(
                                  value: isChecked,
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0), // Checkbox shape
                                  ),
                                  side: WidgetStateBorderSide.resolveWith(
                                        (states) =>  BorderSide(
                                      color: isChecked ? kPrimaryColor : kTextColorShade40, // Border color
                                      width: 1.5,
                                    ),
                                  ),
                                  activeColor: isChecked ? kPrimaryColor : kTextColorShade40, // Color of the checkbox when active
                                  checkColor:  isChecked ? kWhiteColor : kWhiteColor, // Color of the checkmark
                                ),
                              ),
                              const SizedBox(width: 2,),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text("I agree to the terms and privacy policy including submitting a valid ID and proof of address.", style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: kTextColorShade50
                                  ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ],
                          )

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
