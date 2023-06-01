import 'package:flutter/material.dart';

class GenericPageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const GenericPageButton(
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)),
              fixedSize: Size(width, height)),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}
