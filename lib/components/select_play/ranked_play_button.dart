import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RankedPlayButton extends HookConsumerWidget {
  final Enum rankedDifficulty;
  final List<Enum> modeNotes;
  final bool enableHintsOnStartup;

  final Enum gameMode;
  const RankedPlayButton({
    super.key,
    required this.rankedDifficulty,
    required this.modeNotes,
    required this.gameMode,
    this.enableHintsOnStartup = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var clicked = useState(false);
    bool accesible = true;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: 400.ms,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: clicked.value
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.primary.withOpacity(.75),
                  borderRadius: BorderRadius.circular(500),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                      width: 4)),
            ),
            Positioned(
              left: 5,
              top: 4,
              child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(500),
                      ),
                      fixedSize: const Size(140, 129)),
                  onPressed: () {
                    clicked.value = !clicked.value;
                    // createNewQuizGenerateList(ref, modeNotes, gameMode,
                    //     hintsEnabled: enableHintsOnStartup);
                    // context.go('/quiz_page', extra: gameMode);
                    // ref.read(stopwatchProvider.notifier).resetStopwatch(ref);
                    // ref.read(stopwatchProvider.notifier).startStopwatch(ref);
                  },
                  child: Center(
                      child: accesible
                          ? Text(
                              'A',
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                  fontSize: 100),
                            )
                          : Icon(
                              Icons.lock,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withOpacity(.75),
                              size: 75,
                            ))),
            ),
            Transform.translate(
              offset: Offset(49, -70),
              child: SizedBox(
                height: 100,
                width: 50,
                child: Transform.rotate(
                    angle: pi / 80,
                    child: SvgPicture.asset('assets/quarter_note.svg')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
