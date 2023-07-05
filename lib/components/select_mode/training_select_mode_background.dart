import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

class TrainingSelectModeBackground extends StatelessWidget {
  const TrainingSelectModeBackground({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
                top: 30, right: 15, child: SvgPicture.asset('assets/towel.svg'))
            .animate()
            .scale(duration: 600.ms, begin: Offset(1.2, 1.2))
            .slideY(duration: 800.ms, begin: 0.3, curve: Curves.easeOut)
            .fadeIn(duration: 400.ms),
        Positioned(
                top: 130,
                left: 210,
                child: Transform.rotate(
                    angle: pi / 14,
                    child: SvgPicture.asset('assets/bottle.svg')))
            .animate()
            .scale(duration: 800.ms, begin: Offset(1.2, 1.2))
            .slideY(duration: 1000.ms, begin: 0.3, curve: Curves.easeOut)
            .fadeIn(duration: 200.ms),
        Align(
          alignment: Alignment.center,
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 36,
                letterSpacing: 1,
                color: Theme.of(context).colorScheme.onTertiary),
          ),
        ),
      ],
    );
  }
}
