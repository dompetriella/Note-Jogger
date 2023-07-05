import 'package:flutter/material.dart';

class IntermissionMessage extends StatelessWidget {
  final int duration;
  const IntermissionMessage({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Great Training!'.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
                color: Theme.of(context).colorScheme.tertiary),
          ),
          Text(
            "Don't worry, I'll get the water".toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
                color: Theme.of(context).colorScheme.onPrimary),
          ),
        ],
      ),
    );
  }
}
