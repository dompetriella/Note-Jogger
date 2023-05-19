import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';
import 'dart:math';
import '../components/quiz/quiz_generate.dart';
import '../components/quiz/quiz_option_button.dart';
import '../models/notes.dart';

createNewQuizGenerateList(WidgetRef ref, List<Enum> clefNotes,
    {int numberOfButtons = 5}) {
  ref.watch(quizStagingProvider.notifier).state = [];
  ref.watch(quizGenerateTotalProvider.notifier).state =
      clefNotes.length; // Number of available notes

  clefNotes.shuffle();
  for (var enumNote in clefNotes) {
    ref.watch(quizStagingProvider.notifier).state.add(QuizGenerate(
        note: enumNote,
        numberOfQuizGenerate: clefNotes.length,
        numberOfButtons: numberOfButtons));
  }
}

List<Widget> createQuizOptionButtons(Enum note, int numberOfButtons) {
  List<String> notes = [];
  notes.add(note.name[0]);
  for (var i = 0; i < numberOfButtons - 1; i++) {
    while (true) {
      Random random = Random();
      int randomIndex = random.nextInt(noteStrings.length);
      String randomNote = noteStrings[randomIndex][0];
      if (!notes.contains(randomNote)) {
        notes.add(randomNote);
        break;
      }
    }
  }
  notes.shuffle();
  return notes
      .map((e) => QuizOptionButton(
            givenNote: e,
            correctNote: note.name[0],
          ))
      .toList();
}

// modes

List<Enum> trimClefNotes(List<Enum> clef, int lowestNote, int highestNote,
    {bool lineNotesOnly = false}) {
  List<Enum> returnList = [];
  for (var i = 0; i < clef.length; i++) {
    if (i >= lowestNote && i <= highestNote) {
      if (lineNotesOnly) {
        if (!(i % 2 == 0)) {
          returnList.add(clef[i]);
        }
      } else {
        returnList.add(clef[i]);
      }
    }
  }
  return returnList;
}
