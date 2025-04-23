import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core /theme/app_color.dart';
import '../../../main.dart';
import 'custom_loader.dart';

class GradientButton1 extends StatelessWidget {
  final double width;
  final double height;
  final LoadingState? loadingStatus;
  final Color buttonTextColor;
  final Function() onPressed;
  final String buttonName;
  final Widget buttonWidget;
  final double? borderRadius;
  final double? fontSize;
  final String? fontFamily;
  final Color? bgColor;
  final bool? isExpanded;
  final Color? borderColor;
  final bool? isIconByRight;

  const GradientButton1(
      {super.key,
        required this.buttonName,
        required this.onPressed,
        required this.buttonTextColor,
        this.loadingStatus,
        required this.width,
        required this.height, required this.buttonWidget, this.borderRadius, this.fontSize, this.fontFamily,  this.bgColor, this.isExpanded, this.borderColor, this.isIconByRight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: width, height: height),
        child: Container(
          decoration: BoxDecoration(
           color: bgColor,
            borderRadius:
            BorderRadius.circular(borderRadius ?? 70.0),
            border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
          ),
          child: ElevatedButton(
            onPressed: loadingStatus == LoadingState.still ? onPressed : () {},
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 70.0),
              ),
            ),
            child: Row(
              children: [
                Flexible(
                    child: loadingStatus == LoadingState.still
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        isExpanded == false ? const SizedBox(
                          width: 0.0,
                        ) : const SizedBox.shrink(),
                        Padding(
                          padding: EdgeInsets.only(right: isIconByRight == false ? 8.0 : 0.0),
                          child: buttonWidget,
                        ),
                        isExpanded == false ?
                        ButtonStateText(buttonName: buttonName, fontFamily: fontFamily, fontSize: fontSize, buttonTextColor: buttonTextColor) :
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: ButtonStateText(buttonName: buttonName, fontFamily: fontFamily, fontSize: fontSize, buttonTextColor: buttonTextColor),
                        )),

                      ],
                    )
                        : loadingStatus == LoadingState.success
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonName,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize ?? 18,
                              color: buttonTextColor),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Icon(
                          Icons.check,
                          color: buttonTextColor,
                          size: 24,
                        )
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          buttonName,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize ?? 18,
                              color: buttonTextColor),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        CustomLoader(width: 20, height: 20, indicatorColor: buttonTextColor)
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonStateText extends StatelessWidget {
  const ButtonStateText({
    super.key,
    required this.buttonName,
    required this.fontFamily,
    required this.fontSize,
    required this.buttonTextColor,
  });

  final String buttonName;
  final String? fontFamily;
  final double? fontSize;
  final Color buttonTextColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonName,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: fontSize ?? 18,
          color: buttonTextColor),
      textAlign: TextAlign.center,
    );
  }
}

class GradientButton2 extends StatefulWidget {
  final double width;
  final double height;
  final LoadingState? loadingStatus;
  final Color buttonTextColor;
  final Color gradientOne;
  final Color gradientTwo;
  final Function() onPressed;
  final String buttonName;
  final bool isTwoComponent;
  final String? imageName;
  final String? fontFamily;
  final Color? borderColor;
  final int? bottomBorderWidth;
  final double? borderRadius;

  const GradientButton2({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.buttonTextColor,
    this.loadingStatus,
    required this.width,
    required this.height,
    required this.isTwoComponent,
    this.imageName, required this.gradientOne, required this.gradientTwo, this.fontFamily, this.borderColor, this.bottomBorderWidth, this.borderRadius,
  });

  @override
  State<GradientButton2> createState() => _GradientButton2State();
}

class _GradientButton2State extends State<GradientButton2> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.loadingStatus == LoadingState.still) {
          widget.onPressed();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: ConstrainedBox(
        constraints:
        BoxConstraints.tightFor(width: widget.width, height: widget.height),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-1, -7),
              end: const Alignment(1, 10),
              colors: [
                widget.gradientOne,
                widget.gradientOne,
                widget.gradientTwo,
                widget.gradientTwo,
              ],
              stops: const [0.25, 0.25, 0.8, 1.0],  // Adjust the stops to control the fade
            ),
            boxShadow: _isPressed
                ? [
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(2, 2),
                blurRadius: 4,
              ),
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(-2, -2),
                blurRadius: 4,
              ),
            ]
                : [
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(4, 4),
                blurRadius: 8,
              ),
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(-4, -4),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
            border: Border(
              top: BorderSide(width: 1.0, color: widget.borderColor ?? Colors.transparent),
              left: BorderSide(width: 1.0, color: widget.borderColor ?? Colors.transparent),
              right: BorderSide(width: 1.0, color: widget.borderColor ?? Colors.transparent),
              bottom: BorderSide(width: 2.0, color: widget.borderColor ?? Colors.transparent),
            ),
          ),
          child: ElevatedButton(
            onPressed: widget.loadingStatus == LoadingState.still
                ? widget.onPressed
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: widget.loadingStatus == LoadingState.still
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.isTwoComponent
                          ? SvgPicture.asset(widget.imageName ?? "")
                          : const SizedBox.shrink(),
                      widget.isTwoComponent
                          ? const SizedBox(width: 10.0,)
                          : const SizedBox.shrink(),
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: widget.buttonTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : widget.loadingStatus == LoadingState.success
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Loading.svg",
                        width: 36.0,
                        height: 36.0,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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

class GradientButton3 extends StatefulWidget {
  final double width;
  final double height;
  final LoadingState? loadingStatus;
  final Color buttonTextColor;
  final Color gradientOne;
  final Color gradientTwo;
  final Function() onPressed;
  final String buttonName;
  final bool isTwoComponent;
  final String? imageName;
  final String? fontFamily;
  final double? fontSize;
  final double? borderRadius;

  const GradientButton3({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.buttonTextColor,
    this.loadingStatus,
    required this.width,
    required this.height,
    required this.isTwoComponent,
    this.imageName, required this.gradientOne, required this.gradientTwo, this.fontFamily, this.fontSize, this.borderRadius,
  });

  @override
  State<GradientButton3> createState() => _GradientButton3State();
}

class _GradientButton3State extends State<GradientButton3> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.loadingStatus == LoadingState.still) {
          widget.onPressed();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: ConstrainedBox(
        constraints:
        BoxConstraints.tightFor(width: widget.width, height: widget.height),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-1, -7),
              end: const Alignment(1, 10),
              colors: [
                widget.gradientOne,
                widget.gradientOne,
                widget.gradientTwo,
                widget.gradientTwo,
              ],
              stops: const [0.25, 0.25, 0.8, 1.0],  // Adjust the stops to control the fade
            ),
            boxShadow: _isPressed
                ? [
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(2, 2),
                blurRadius: 4,
              ),
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(-2, -2),
                blurRadius: 4,
              ),
            ]
                : [
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(4, 4),
                blurRadius: 8,
              ),
              const BoxShadow(
                color: kNeutralShade60,
                offset: const Offset(-4, -4),
                blurRadius: 8,
              ),
            ],
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 70.0), //Border radius here
          ),
          child: ElevatedButton(
            onPressed: widget.loadingStatus == LoadingState.still
                ? widget.onPressed
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 70.0),//Border radius here
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: widget.loadingStatus == LoadingState.still
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.isTwoComponent
                          ? SvgPicture.asset(widget.imageName ?? "")
                          : const SizedBox.shrink(),
                      widget.isTwoComponent
                          ? const SizedBox(width: 10.0,)
                          : const SizedBox.shrink(),
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: widget.fontSize ?? 18,
                            color: widget.buttonTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : widget.loadingStatus == LoadingState.success
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: widget.fontSize,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: widget.fontSize,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Loading.svg",
                        width: 36.0,
                        height: 36.0,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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

class ButtonWithNoFill extends StatelessWidget {
  final double width;
  final double height;
  final LoadingState? loadingStatus;
  final Color buttonTextColor;
  final Function() onPressed;
  final String buttonName;
  final Widget? noIcon;
  final double? fontSize;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final Color? backgroundColor;
  final Color? borderColor;

  const ButtonWithNoFill(
      {super.key,
        required this.buttonName,
        required this.onPressed,
        required this.buttonTextColor,
        this.loadingStatus,
        required this.width,
        required this.height, this.noIcon, this.fontSize, this.borderRadius, this.fontWeight, this.fontFamily, this.backgroundColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                borderRadius ?? 10.0), // Adjust the border radius as needed
            border: Border.all(color: borderColor ?? kWhiteColor)),
        child: ElevatedButton(
          onPressed: loadingStatus == LoadingState.still ? onPressed : () {},
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero, // Remove default padding
            backgroundColor: backgroundColor ?? Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                  child: loadingStatus == LoadingState.still
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: fontWeight ?? FontWeight.w600,
                            fontSize: fontSize ?? 20,
                            color: buttonTextColor),
                        textAlign: TextAlign.center,
                      ),
                      noIcon ?? SvgPicture.asset(
                          "assets/icons/arrow-right-white.svg")
                    ],
                  )
                      : loadingStatus == LoadingState.success
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: fontWeight ?? FontWeight.w600,
                            fontSize: fontSize ?? 20,
                            color: buttonTextColor),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      noIcon ?? const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      )
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: fontWeight ?? FontWeight.w600,
                            fontSize: 20,
                            color: buttonTextColor),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Loading.svg",
                        width: 36.0,
                        height: 36.0,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientButton4 extends StatefulWidget {
  final double width;
  final double height;
  final LoadingState? loadingStatus;
  final Color buttonTextColor;
  final Color gradientOne;
  final Color gradientTwo;
  final Function() onPressed;
  final String buttonName;
  final bool isTwoComponent;
  final String? imageName;
  final String? fontFamily;
  final double? fontSize;
  final double? borderRadius;

  const GradientButton4({
    super.key,
    required this.buttonName,
    required this.onPressed,
    required this.buttonTextColor,
    this.loadingStatus,
    required this.width,
    required this.height,
    required this.isTwoComponent,
    this.imageName, required this.gradientOne, required this.gradientTwo, this.fontFamily, this.fontSize, this.borderRadius,
  });

  @override
  State<GradientButton4> createState() => _GradientButton4State();
}

class _GradientButton4State extends State<GradientButton4> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
        if (widget.loadingStatus == LoadingState.still) {
          widget.onPressed();
        }
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: ConstrainedBox(
        constraints:
        BoxConstraints.tightFor(width: widget.width, height: widget.height),
        child: Container(
          margin: EdgeInsets.zero,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const Alignment(-1, -7),
              end: const Alignment(1, 10),
              colors: [
                widget.gradientOne,
                widget.gradientOne,
                widget.gradientTwo,
                widget.gradientTwo,
              ],
              stops: const [0.25, 0.25, 0.8, 1.0],  // Adjust the stops to control the fade
            ),
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 70.0), //Border radius here
          ),
          child: ElevatedButton(
            onPressed: widget.loadingStatus == LoadingState.still
                ? widget.onPressed
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius ?? 70.0),//Border radius here
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: widget.loadingStatus == LoadingState.still
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.isTwoComponent
                          ? SvgPicture.asset(widget.imageName ?? "")
                          : const SizedBox.shrink(),
                      widget.isTwoComponent
                          ? const SizedBox(width: 10.0,)
                          : const SizedBox.shrink(),
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: widget.fontSize ?? 18,
                            color: widget.buttonTextColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                      : widget.loadingStatus == LoadingState.success
                      ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: widget.fontSize,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 24,
                      ),
                    ],
                  )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.buttonName,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: widget.fontSize,
                          color: widget.buttonTextColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      SvgPicture.asset(
                        "assets/icons/Loading.svg",
                        width: 36.0,
                        height: 36.0,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
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

