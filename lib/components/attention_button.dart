import 'package:flutter/material.dart';

class AttentionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const AttentionButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 60,
      this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                      width: 4,
                      color: Theme.of(context).colorScheme.onPrimary)),
              fixedSize: Size(width, height)),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 22,
                letterSpacing: 1,
                color: Theme.of(context).colorScheme.onTertiary),
          )),
    );
  }
}
