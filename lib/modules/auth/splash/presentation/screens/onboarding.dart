import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core /theme/app_color.dart';
import '../../../../../main.dart';
import '../../../../shared/functions/close_keyboard.dart';
import '../../../../shared/widgets/app_buttons.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

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
          margin: const EdgeInsets.fromLTRB(17.58, 46.66, 17.58, 0.0),
          child: GestureDetector(
            onTap: (){
              closeKeyboard();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/welcome.png", width: double.infinity, height: 299.84,),
                      const SizedBox(height: 30,),
                      Text("Welcome to Mo Digital Bank", style: GoogleFonts.poppins(
                        fontSize: 29,
                        fontWeight: FontWeight.w700,
                        color: kPrimaryColor
                      ),
                      textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 20,),
                      Text("Make swift transfer worldwide", style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: kTextColorShade50
                      ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 100,),

                    ],
                  ),
                ),
                GradientButton1(
                  width: 350.54,
                  height: 54.88,
                  borderRadius: 30,
                  fontSize: 16,
                  buttonTextColor: kWhiteColor,
                  bgColor: kPrimaryColor,
                  borderColor: kPrimaryColor,
                  buttonName: "Get Started",
                  loadingStatus: LoadingState.still,
                  isExpanded: false,
                  onPressed: () {
                    try{
                      Get.toNamed("/auth_selection_screen");
                    }catch(e){
                      debugPrint("===>>> onboarding exception: ${e.toString()}");
                    }
                  },
                  buttonWidget: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
