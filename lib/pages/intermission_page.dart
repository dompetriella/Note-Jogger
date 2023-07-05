import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IntermissionWidget extends StatelessWidget {
  final int duration;
  final List<Widget> contents;
  const IntermissionWidget(
      {super.key, required this.contents, required this.duration});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.background,
          child: Center(
            child: Text(
              'JAZZ HANDS',
              style: TextStyle(fontSize: 48),
            ).animate().fadeIn(duration: (duration / 2).ms),
          ),
        ),
      ),
    );
  }
}
