import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/provider.dart';

import '../../game_logic/quiz_generate.dart';
import '../notestaff/note_staff.dart';

class QuizGenerate extends ConsumerWidget {
  final Enum note;
  final Enum gameMode;
  final int numberOfButtons;
  final String titleText;
  const QuizGenerate(
      {super.key,
      required this.note,
      required this.gameMode,
      this.numberOfButtons = 5,
      this.titleText = "Name the Note"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String clefPath = 'assets/treble_clef.svg';
    if (note.runtimeType is BassClefNotes) {
      clefPath = 'assets/bass_clef.svg';
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              GestureDetector(
                onLongPress: () => ref.read(showHintsProvider.notifier).state =
                    !ref.read(showHintsProvider),
                child: Text(
                  titleText,
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: NoteStaff(
                  imagePath: clefPath,
                  value: note,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: createQuizOptionButtons(
                          note, numberOfButtons, gameMode)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
