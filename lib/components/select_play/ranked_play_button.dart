import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/models/ranked_difficulty.dart';

import '../../game_logic/quiz_generate.dart';
import '../../provider.dart';

String getNoteImagePath(Enum difficulty) {
  switch (difficulty) {
    case RankedDifficulty.medium:
      return 'assets/eighth_note.svg';
    case RankedDifficulty.hard:
      return 'assets/sixteenth_note.svg';
    default:
      return 'assets/quarter_note.svg';
  }
}

class RankedPlayButton extends HookConsumerWidget {
  final Enum rankedDifficulty;
  final List<Enum> modeNotes;
  final Enum gameMode;
  const RankedPlayButton({
    super.key,
    required this.rankedDifficulty,
    required this.modeNotes,
    required this.gameMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool accesible = true;
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: 400.ms,
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.75),
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
                    showModalBottomSheet(
                        elevation: 0,
                        useSafeArea: true,
                        barrierColor: Colors.transparent,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        constraints: BoxConstraints(maxWidth: 350),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 4,
                              color: Theme.of(context).colorScheme.onPrimary),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0)),
                        ),
                        context: context,
                        builder: (builder) {
                          return RankedModeInfoBottomSheet(
                              gameMode: gameMode,
                              modeNotes: modeNotes,
                              rankedDifficulty: rankedDifficulty);
                        });
                  },
                  child: Center(
                      child: accesible
                          ? Text(
                              '',
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
              offset: Offset(
                  rankedDifficulty != RankedDifficulty.easy ? 20 : 12, -100),
              child: SizedBox(
                height: 135,
                width: 135,
                child: Transform.rotate(
                    angle: pi / 80,
                    child:
                        SvgPicture.asset(getNoteImagePath(rankedDifficulty))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RankedModeInfoBottomSheet extends ConsumerWidget {
  final Enum rankedDifficulty;
  final List<Enum> modeNotes;
  final Enum gameMode;
  const RankedModeInfoBottomSheet({
    super.key,
    required this.rankedDifficulty,
    required this.modeNotes,
    required this.gameMode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              height: 60,
              child: Center(
                child: Text(
                  'Treble Clef',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                      letterSpacing: 3),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Difficulty'.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
                Text(
                  rankedDifficulty.name.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Rank'.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
                Text(
                  'N/A',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FEE'.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
                Text(
                  'N/A',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(250, 62),
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  createNewQuizGenerateList(ref, modeNotes, gameMode,
                      hintsEnabled: false);
                  context.go('/quiz_page', extra: gameMode);
                  ref.read(stopwatchProvider.notifier).resetStopwatch(ref);
                  ref.read(stopwatchProvider.notifier).startStopwatch(ref);
                },
                child: Text(
                  'START'.toUpperCase(),
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2),
                )),
          ),
        ],
      ),
    );
  }
}
