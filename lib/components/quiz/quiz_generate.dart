import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/provider.dart';

import '../../game_logic/quiz_generate.dart';
import '../notestaff/notestaff.dart';

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
    var clefPath = note.runtimeType == TrebleClefNotes
        ? GLOBAL_treble_clef_path
        : GLOBAL_bass_clef_path;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                titleText,
                style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: NoteStaff(
                  note: note,
                  showHints: ref.watch(showHintsProvider),
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
