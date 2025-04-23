import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core /theme/app_color.dart';
import '../../../../../main.dart';
import '../../../../shared/functions/close_keyboard.dart';
import '../../../../shared/widgets/app_buttons.dart';

class AuthSelectionScreen extends StatefulWidget {
  const AuthSelectionScreen({super.key});

  @override
  State<AuthSelectionScreen> createState() => _AuthSelectionScreenState();
}

class _AuthSelectionScreenState extends State<AuthSelectionScreen> {

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
            onTap: () {
              closeKeyboard();
            },
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40,),
                        Image.asset("assets/images/welcome_three.png", width: double.infinity, height: 361.54,),
                        const SizedBox(height: 70,),
                        Text("Global Payment Made Easy", style: GoogleFonts.poppins(
                            fontSize: 29,
                            fontWeight: FontWeight.w600,
                            color: kPrimaryColor
                        ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 50,),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(child:  GradientButton1(
                      width: 350.54,
                      height: 54.88,
                      borderRadius: 30,
                      fontSize: 16,
                      buttonTextColor: kWhiteColor,
                      bgColor: kPrimaryColor,
                      borderColor: kPrimaryColor,
                      buttonName: "Login",
                      loadingStatus: LoadingState.still,
                      isExpanded: false,
                      onPressed: () {
                        try{
                          Get.toNamed("/login");
                        }catch(e){
                          debugPrint("===>>> auth_selection_screen exception: ${e.toString()}");
                        }
                      },
                      buttonWidget: const SizedBox.shrink(),
                    ),),
                    const SizedBox( width: 19,),
                    Expanded(child:  GradientButton1(
                      width: 350.54,
                      height: 54.88,
                      borderRadius: 30,
                      fontSize: 16,
                      buttonTextColor: kWhiteColor,
                      bgColor: kPrimaryColor,
                      borderColor: kPrimaryColor,
                      buttonName: "Sign up",
                      loadingStatus: LoadingState.still,
                      isExpanded: false,
                      onPressed: () {
                        try{
                          Get.toNamed("/sign_up");
                        }catch(e){
                          debugPrint("===>>> auth_selection_screen exception: ${e.toString()}");
                        }
                      },
                      buttonWidget: const SizedBox.shrink(),
                    ),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
