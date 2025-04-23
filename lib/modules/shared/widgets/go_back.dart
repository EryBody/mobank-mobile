import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({super.key, required this.onTap, required this.svgColorFiler});

  final VoidCallback onTap;
  final ColorFilter svgColorFiler;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset("", colorFilter: svgColorFiler,);
  }
}
