import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PianoLabSelectModeBackground extends StatelessWidget {
  final String text;
  const PianoLabSelectModeBackground({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: SvgPicture.asset('assets/piano_lab.svg')),
        Transform.translate(
          offset: Offset(0, -60),
          child: Center(
            child: Text(
              text.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 36,
                  letterSpacing: 1,
                  color: Theme.of(context).colorScheme.onTertiary),
            ),
          ),
        ),
      ],
    );
  }
}
