import 'package:flutter/material.dart';

class AuthAppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthAppButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      icon: const Icon(
        Icons.arrow_forward,
        size: 20,
      ),
      iconAlignment: IconAlignment.end,
      label: Text(text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
