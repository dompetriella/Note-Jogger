import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RankedSelectModeBackground extends StatelessWidget {
  final String text;
  const RankedSelectModeBackground({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: SvgPicture.asset('assets/clock.svg')),
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
