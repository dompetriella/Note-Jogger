import 'package:flutter/material.dart';

class SelectModeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SelectModeButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(340, 330),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary, width: 4)),
          ),
          onPressed: onPressed,
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                letterSpacing: 1,
                color: Theme.of(context).colorScheme.onTertiary),
          )),
    );
  }
}
