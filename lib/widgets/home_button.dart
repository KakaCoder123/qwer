import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color colors;
  const HomeButton({super.key, required this.onPressed, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FilledButton(
          onPressed: onPressed,
          child: Text(text),
          style: FilledButton.styleFrom(
            backgroundColor: colors,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            )
          ),
      ),
    );
  }
}
