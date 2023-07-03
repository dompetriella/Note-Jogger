import 'package:flutter/material.dart';

class PlayModeChapterTitle extends StatelessWidget {
  final String titleText;
  const PlayModeChapterTitle({super.key, required this.titleText});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: [
              Text(
                titleText,
                style: TextStyle(
                    height: 0.9,
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              Divider(
                thickness: 4,
              )
            ],
          ),
        ));
  }
}
