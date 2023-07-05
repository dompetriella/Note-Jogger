import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/models/modes.dart';
import '../../game_logic/quiz_generate.dart';
import '../../provider.dart';
import '../information_window/information_window_screen_scaffold.dart';

class ModeButton extends ConsumerWidget {
  final String title;
  final String subText;
  final String imagePath;
  final List<Enum> modeNotes;
  final bool enableHintsOnStartup;
  final Enum gameMode;
  final List<List<Widget>> listOfInformationWindowScreen;
  const ModeButton(
      {super.key,
      required this.title,
      required this.modeNotes,
      required this.gameMode,
      this.listOfInformationWindowScreen = const [],
      this.enableHintsOnStartup = false,
      this.imagePath = 'assets/treble_clef.svg',
      this.subText = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 4)),
                fixedSize: const Size(275, 100)),
            onPressed: () {
              if (gameMode == GameMode.intro) {
                ref
                    .read(informationWindowStagingProvider.notifier)
                    .addInformationWindowsToState(
                        ref, listOfInformationWindowScreen);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InformationWindowPage()));
                return;
              }
              createNewQuizGenerateList(ref, modeNotes, gameMode,
                  hintsEnabled: enableHintsOnStartup);
              context.go('/quiz_page', extra: gameMode);
              ref.read(stopwatchProvider.notifier).resetStopwatch(ref);
              ref.read(stopwatchProvider.notifier).startStopwatch(ref);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
                if (subText != '')
                  Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w300,
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
              ],
            )),
      ),
    );
  }
}
