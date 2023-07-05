import 'package:flutter/material.dart';

class SelectModeButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget backgroundImageWidget;
  const SelectModeButton(
      {super.key,
      required this.onPressed,
      required this.backgroundImageWidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            fixedSize: const Size(340, 330),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary, width: 4)),
          ),
          onPressed: onPressed,
          child: SizedBox.expand(
            child: backgroundImageWidget,
          )),
    );
  }
}
