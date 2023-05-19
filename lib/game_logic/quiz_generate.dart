import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';
import 'dart:math';
import '../components/quiz/quiz_generate.dart';
import '../components/quiz/quiz_option_button.dart';
import '../models/notes.dart';

createNewQuizGenerateList(
    WidgetRef ref, int numberOfQuizGenerate, List<Enum> clefNotes,
    {int numberOfButtons = 5}) {
  ref.watch(quizStagingProvider.notifier).state = [];
  ref.watch(quizGenerateTotalProvider.notifier).state = numberOfQuizGenerate;
  print('total questions: ${ref.watch(quizGenerateTotalProvider)}');
  List<Enum> enumNotes = [];
  for (var i = 0; i < numberOfQuizGenerate; i++) {
    while (true) {
      Random random = Random();
      int randomIndex = random.nextInt(clefNotes.length);
      var randomNote = clefNotes[randomIndex];
      if (!enumNotes.contains(randomNote)) {
        enumNotes.add(randomNote);
        break;
      }
    }
  }

  for (var enumNote in enumNotes) {
    ref.watch(quizStagingProvider.notifier).state.add(QuizGenerate(
        note: enumNote,
        numberOfQuizGenerate: numberOfQuizGenerate,
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
