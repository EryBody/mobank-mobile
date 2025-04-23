import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../core /theme/app_color.dart';
import '../../../../shared/functions/close_keyboard.dart';
import '../../../../shared/widgets/app_buttons.dart';
import '../../../../shared/widgets/app_text_form_fields.dart';
import '../controller/signup_controller.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  SignupController controller = Get.find<SignupController>();
  final ValueNotifier<bool> isDropdownOpenNotifier = ValueNotifier(false);

  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

  void _closeDropdown() {
    isDropdownOpenNotifier.value = false; // Notify listeners to close dropdown
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    isDropdownOpenNotifier.dispose(); // Clean up
    super.dispose();
  }

  void _selectDate(TextEditingController inputText) {
    DateTime selectedDate = DateTime.now();
    Get.bottomSheet(Container(
      height: 345,
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 28.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 212,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: DateTime.now(),
                onDateTimeChanged: (DateTime date) {
                  selectedDate = date;
                },
              ),
            ),
            CupertinoButton(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Done',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: kPrimaryColor,
                    )),
              ),
              onPressed: () {
                setState(() {
                  inputText.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          _closeDropdown(); // Close dropdown when scrolling
          return false;
        },
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.fromLTRB(17.58, 46.66, 17.58, 10.0),
            child: GestureDetector(
              onTap: (){
                closeKeyboard();
              },
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Let's Get Started", style: GoogleFonts.poppins(
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

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container() //dropdown
                                ),

                                const SizedBox(width: 10,),

                                SizedBox(
                                  width: 100,
                                  child:Container() //dropdown,
                                ),
                              ],
                            ),

                            const SizedBox(height: 20,),

                            TextInputField(
                                radius: 10,
                                hint: 'Email Address',
                                textEditingController: controller.email,
                                textInputType: TextInputType.emailAddress,
                                inputColor: kBlueShade10,
                                fillColor: kBlueShade10,
                                textColor: kTextColorShade40,
                                fontSize: 14,
                                onValidation: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please provide your Email Address";
                                  }
                                  return null;
                                },
                                onChangeCallback: (value) {},
                                isObscure: false,
                                withIcon: false, isLabel: false
                            ),

                            TextInputField(
                                radius: 10,
                                hint: 'Username',
                                textEditingController: controller.username,
                                textInputType: TextInputType.text,
                                inputColor: kBlueShade10,
                                fillColor: kBlueShade10,
                                textColor: kTextColorShade40,
                                fontSize: 14,
                                onValidation: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please provide username";
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

                            TextInputField(
                                radius: 10,
                                hint: 'First name',
                                textEditingController: controller.firstName,
                                textInputType: TextInputType.text,
                                inputColor: kBlueShade10,
                                fillColor: kBlueShade10,
                                textColor: kTextColorShade40,
                                fontSize: 14,
                                onValidation: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please provide your first name";
                                  }
                                  return null;
                                },
                                onChangeCallback: (value) {},
                                isObscure: false,
                                withIcon: false, isLabel: false
                            ),

                            TextInputField(
                                radius: 10,
                                hint: 'Last name',
                                textEditingController: controller.lastName,
                                textInputType: TextInputType.text,
                                inputColor: kBlueShade10,
                                fillColor: kBlueShade10,
                                textColor: kTextColorShade40,
                                fontSize: 14,
                                onValidation: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please provide last name";
                                  }
                                  return null;
                                },
                                onChangeCallback: (value) {},
                                isObscure: false,
                                withIcon: false, isLabel: false
                            ),

                            TextInputField(
                                radius: 10,
                                hint: 'Mobile',
                                textEditingController: controller.mobile,
                                textInputType: TextInputType.phone,
                                inputColor: kBlueShade10,
                                fillColor: kBlueShade10,
                                textColor: kTextColorShade40,
                                fontSize: 14,
                                onValidation: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please enter mobile number";
                                  }
                                  return null;
                                },
                                onChangeCallback: (value) {},
                                isObscure: false,
                                withIcon: false, isLabel: false
                            ),


                            const SizedBox(height: 40,),

                            Obx(() =>  GradientButton1(
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
                                  controller.register();
                                }catch(e){
                                  debugPrint("===>>> sign_up exception: ${e.toString()}");
                                }
                              },
                              buttonWidget: const SizedBox.shrink(),
                            )),

                            const SizedBox(height: 20,),

                            GestureDetector(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Text("Go Back", style: GoogleFonts.poppins(
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
