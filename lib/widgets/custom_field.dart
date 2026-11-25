import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String labelText;
  const CustomField({super.key, required this.controller, required this.labelText, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(width: size.width * 0.8,
    child: TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText
      ),
    ),
    );
  }
}
