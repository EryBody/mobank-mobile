import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core /theme/app_color.dart';
import '../../../core /utils/spacing.dart';


class TextInputField extends StatefulWidget {
  const TextInputField({
    super.key,
    required this.textEditingController,
    required this.textInputType,
    required this.onValidation,
    required this.onChangeCallback,
    required this.inputColor,
    this.onSaved,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    required this.isObscure,
    required this.withIcon,
    this.fillColor,
    this.fontSize,
    this.textColor,
    this.radius, this.isLabel, this.hint, this.suffixIconConstraints, this.enabled, this.isTextArea, this.textInputName, this.width, this.paddingHeight, this.maxLength, this.inputFormatters, this.prefixIconConstraints, this.prefixPadding,
  });

  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?) onValidation;
  final Function(String) onChangeCallback;
  final Function(String?)? onSaved;
  final Color inputColor;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final bool withIcon;
  final Color? fillColor;
  final double? fontSize;
  final Color? textColor;
  final double? radius;
  final bool? isLabel;
  final String? hint;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final bool? enabled;
  final bool? isTextArea;
  final String? textInputName;
  final double? width;
  final double? paddingHeight;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final double? prefixPadding;

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _scrollController = ScrollController(); // Initialize ScrollController
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getHeightSpacing(widget.paddingHeight ?? 20, widget.paddingHeight ?? 20, widget.paddingHeight ?? 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.textInputName == null ? const SizedBox.shrink() : Column(
            children: [
              Text(widget.textInputName ?? "", style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: kTextColorShade50
              ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 5,)
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Ensure vertical scrolling
              controller: _scrollController, // Use the same ScrollController here
              child: TextFormField(
                enabled: widget.enabled ?? true,
                cursorColor: kPrimaryColor,
                obscureText: widget.isObscure,
                keyboardType: widget.textInputType,
                textInputAction: TextInputAction.done,
                controller: widget.textEditingController,
                maxLength: widget.maxLength ?? 1000,
                inputFormatters: widget.inputFormatters,
                style: GoogleFonts.poppins(
                  fontSize: widget.fontSize ?? 16.0,
                  fontWeight: FontWeight.w500,
                  height: 1.22,
                  color: widget.textColor ?? kTextColorShade40,
                ),
                // maxLines: 8, // Allow typing up to 8 lines before scrolling
                minLines: widget.isTextArea == true ? 8 : 1, // Start with a single line
                decoration: InputDecoration(
                  hintText: widget.hint,
                  alignLabelWithHint: true, // Align label and hint to top-left
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: widget.suffixIcon,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(widget.prefixPadding ?? 10.0),
                    child: widget.prefixIcon,
                  ),
                  suffixIconConstraints: widget.suffixIconConstraints ??  const BoxConstraints(
                    minWidth: 16,  // Ensure a minimum width to center-align
                    minHeight: 16,
                  ),
                  prefixIconConstraints: widget.prefixIconConstraints ??  const BoxConstraints(
                    minWidth: 16,  // Ensure a minimum width to center-align
                    minHeight: 16,
                  ),
                  counterText: '',
                  filled: true,
                  fillColor: widget.fillColor ?? kWhiteColor,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kTextColorShade40,
                  ),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kTextColorShade40,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: BorderSide(
                      color: widget.inputColor, // Color for unfocused border
                      width: 1.0, // Thickness of the border
                    ),
                  ),
                  // Focused border (when input is focused)
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kPrimaryColor, // Color when the input is focused
                      width: 2.0, // Slightly thicker border when focused
                    ),
                  ),
                  // Error border
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kDangerColor, // Color for error border
                      width: 1.0,
                    ),
                  ),
                  // Focused error border
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kDangerColor, // Color for focused error border
                      width: 2.0,
                    ),
                  ),
                  errorMaxLines: 3,
                  // Custom error style to change color or hide error message
                  errorStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kDangerColor,
                  ), // Change color to blue
                  contentPadding: EdgeInsets.symmetric(
                    vertical: widget.width ?? 20.0,
                    horizontal: widget.withIcon == true ? 0 : 12.0,
                  ),
                ),
                onChanged: widget.onChangeCallback,
                onSaved: widget.onSaved,
                validator: widget.onValidation,
                onTap: widget.onTap,
                focusNode: _focusNode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextInputPasswordField extends StatefulWidget {
  const TextInputPasswordField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.textInputType,
    required this.onValidation,
    required this.onChangeCallback,
    required this.inputColor,
    this.onSaved,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
    required this.isObscure,
    required this.withIcon,
    this.fillColor,
    this.fontSize,
    this.textColor,
    this.radius, this.isLabel, this.label,
  });

  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?) onValidation;
  final Function(String) onChangeCallback;
  final Function(String?)? onSaved;
  final Color inputColor;
  final Function()? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isObscure;
  final bool withIcon;
  final Color? fillColor;
  final double? fontSize;
  final Color? textColor;
  final double? radius;
  final bool? isLabel;
  final String? label;

  @override
  State<TextInputPasswordField> createState() => _TextInputPasswordFieldState();
}

class _TextInputPasswordFieldState extends State<TextInputPasswordField> {
  late FocusNode _focusNode;
  bool _hasFocus = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
    _scrollController = ScrollController(); // Initialize ScrollController
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getHeightSpacing(20, 20, 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Scrollbar(
            thumbVisibility: true, // Add scrollbar for better UX
            controller: _scrollController, // Attach the ScrollController
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical, // Ensure vertical scrolling
              controller: _scrollController, // Use the same ScrollController here
              child: TextFormField(
                cursorColor: kPrimaryColor,
                obscureText: widget.isObscure,
                keyboardType: widget.textInputType,
                textInputAction: TextInputAction.done,
                controller: widget.textEditingController,
                style: GoogleFonts.poppins(
                  fontSize: widget.fontSize ?? 16.0,
                  fontWeight: FontWeight.w500,
                  height: 1.22,
                  color: widget.textColor ?? kTextColorShade40,
                ),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  suffixIcon: widget.suffixIcon,
                  prefixIcon: widget.prefixIcon,
                  filled: true,
                  fillColor: widget.fillColor ?? kWhiteColor,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kTextColorShade40,
                  ),
                  labelStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kTextColorShade40,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: BorderSide(
                      color: widget.inputColor, // Color for unfocused border
                      width: 1.0, // Thickness of the border
                    ),
                  ),
                  // Focused border (when input is focused)
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kPrimaryColor, // Color when the input is focused
                      width: 2.0, // Slightly thicker border when focused
                    ),
                  ),
                  // Error border
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kDangerColor, // Color for error border
                      width: 1.0,
                    ),
                  ),
                  // Focused error border
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 6.0),
                    borderSide: const BorderSide(
                      color: kDangerColor, // Color for focused error border
                      width: 2.0,
                    ),
                  ),
                  errorMaxLines: 3,
                  // Custom error style to change color or hide error message
                  errorStyle: GoogleFonts.poppins(
                    fontSize: widget.fontSize ?? 16.0,
                    fontWeight: FontWeight.w500,
                    height: 1.22,
                    color: kDangerColor,
                  ), // Change color to blue
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: widget.withIcon == true ? 0 : 12.0,
                  ),
                ),
                onChanged: widget.onChangeCallback,
                onSaved: widget.onSaved,
                validator: widget.onValidation,
                onTap: widget.onTap,
                focusNode: _focusNode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
