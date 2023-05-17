import 'package:flutter/material.dart';
import 'dart:math';

import '../models/notes.dart';
import '../pages/quiz_page.dart';

createNewQuizGenerateList(int numberOfQuizGenerates, List<Enum> clefNotes,
    {int numberOfButtons = 5}) {
  List<Enum> enumNotes = [];
  for (var i = 0; i < numberOfQuizGenerates; i++) {
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

  for (var enumNote in enumNotes) {}
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
  return notes.map((e) => QuizOptionButton(note: e)).toList();
}
