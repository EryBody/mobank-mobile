import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key, required this.width, required this.height, required this.indicatorColor});

  final double width;
  final double height;
  final Color indicatorColor;

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CircularProgressIndicator(
        color: widget.indicatorColor,
      ),
    );
  }
}
