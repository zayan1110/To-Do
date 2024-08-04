import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  custombutton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).colorScheme.secondary,
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
