import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeartContainer extends StatelessWidget {
  final bool isFilled;
  final double size;
  const HeartContainer({super.key, this.isFilled = true, this.size = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Transform.rotate(
        angle: (2 * pi) / 1.02,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 30 * size,
              width: 30 * size,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.symmetric(
                    horizontal: BorderSide(
                        width: 3 * size,
                        color: Theme.of(context).colorScheme.tertiary),
                    vertical: BorderSide(
                        width: 9 * size,
                        color: Theme.of(context).colorScheme.tertiary),
                  )),
            ),
            AnimatedSize(
              duration: 500.ms,
              curve: Curves.easeIn,
              child: AnimatedContainer(
                duration: 500.ms,
                curve: Curves.easeOut,
                height: isFilled ? 30 * size : 0,
                width: 30 * size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Theme.of(context).colorScheme.tertiary.withOpacity(.95),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
