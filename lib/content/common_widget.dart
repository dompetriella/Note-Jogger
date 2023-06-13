import 'package:flutter/material.dart';

class InformationWindowTitle extends StatelessWidget {
  final String text;
  const InformationWindowTitle({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class InformationWindowText extends StatelessWidget {
  final String text;
  const InformationWindowText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
