import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../game_logic/quiz_generate.dart';
import '../../provider.dart';

class ModeButton extends ConsumerWidget {
  final String title;
  final String subText;
  final String imagePath;
  final List<Enum> modeNotes;
  final Enum gameMode;
  const ModeButton(
      {super.key,
      required this.title,
      required this.modeNotes,
      required this.gameMode,
      this.imagePath = 'assets/treble_clef.svg',
      this.subText = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)),
              fixedSize: const Size(300, 100)),
          onPressed: () {
            createNewQuizGenerateList(ref, modeNotes, gameMode);
            context.go('/quiz_page', extra: gameMode);
            ref.read(stopwatchProvider.notifier).resetStopwatch(ref);
            ref.read(stopwatchProvider.notifier).startStopwatch(ref);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              ),
              if (subText != '')
                Text(
                  subText,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
            ],
          )),
    );
  }
}
