import 'package:get/get.dart';

double screenWidth = Get.mediaQuery.size.height;
double screenHeight =  Get.mediaQuery.size.height;

double getHeightSpacing(double small, double medium, double large) {
  if (screenHeight < 600) {
    return small;
  } else if (screenHeight < 900) {
    return medium;
  } else {
    return large;
  }
}


double getWidthSpacing(double small, double medium, double large) {
  if (screenWidth < 400) {
    return small;
  } else if (screenWidth < 800) {
    return medium;
  } else {
    return large;
  }
}

double getLineHeight(double lineHeight, double fontSize){
  return lineHeight/fontSize;
}