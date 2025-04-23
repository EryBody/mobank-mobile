import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  State<CustomCheckbox> createState() => _CustomCheckbox();
}

class _CustomCheckbox extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Checkbox")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isChecked = !isChecked;
            });
          },
          child: Container(
            height: 24.0,
            width: 24.0,
            decoration: BoxDecoration(
              color: isChecked ? Colors.blue : Colors.grey.shade300, // Checked/Unchecked color
              borderRadius: BorderRadius.circular(6.0), // Radius for rounded corners
              border: Border.all(
                color: isChecked ? Colors.blue : Colors.grey, // Border color
                width: 1.5,
              ),
            ),
            child: isChecked
                ? const Icon(
              Icons.check,
              size: 18.0,
              color: Colors.white, // Checkmark color
            )
                : null, // Empty when unchecked
          ),
        ),
      ),
    );
  }
}
