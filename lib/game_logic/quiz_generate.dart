import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/provider.dart';
import 'dart:math';
import '../components/quiz/quiz_generate.dart';
import '../components/quiz/quiz_option_button.dart';
import '../models/notes.dart';

createNewQuizGenerateList(WidgetRef ref, List<Enum> clefNotes, Enum gameMode,
    {int numberOfButtons = 5, bool hintsEnabled = false}) {
  ref.watch(quizStagingProvider.notifier).state = [];
  List<Enum> preliminaryNoteList = [];
  if (GLOBAL_normal_quiz_amount > clefNotes.length) {
    // less than normal quiz amount
    int fillAmount = GLOBAL_normal_quiz_amount - clefNotes.length;
    for (var note in clefNotes) {
      preliminaryNoteList.add(note);
    }
    for (var i = 0; i < fillAmount; i++) {
      final random = new Random();
      var index = random.nextInt(clefNotes.length);
      var note = clefNotes[index];
      preliminaryNoteList.add(note);
    }
    preliminaryNoteList.shuffle();
    // more than normal quiz amount
  } else {
    for (var i = 0; i < GLOBAL_normal_quiz_amount; i++) {
      final random = new Random();
      var index = random.nextInt(clefNotes.length);
      var note = clefNotes[index];
      if (!preliminaryNoteList.contains(note)) {
        preliminaryNoteList.add(note);
      }
    }
    preliminaryNoteList.shuffle();
  }

  for (var enumNote in preliminaryNoteList) {
    ref.watch(quizStagingProvider.notifier).state.add(QuizGenerate(
          note: enumNote,
          numberOfButtons: numberOfButtons,
          gameMode: gameMode,
        ));
  }
  ref.read(livesProvider.notifier).resetLives();
  if (hintsEnabled) {
    ref.read(showHintsProvider.notifier).state = true;
  }
}

List<Widget> createQuizOptionButtons(
    Enum note, int numberOfButtons, Enum gameMode) {
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
            gameMode: gameMode,
            givenNote: e,
            correctNote: note.name[0],
          ))
      .toList();
}

// modes

List<Enum> trimClefNotes(List<Enum> clef, Enum lowestNote, Enum highestNote,
    {bool lineNotesOnly = false,
    bool spaceNotesOnly = false,
    bool includeFlats = true}) {
  List<Enum> returnList = [];
  // TODO: this is a hacky way to do this, need to change
  bool isTrebleClef = clef.first.name[0] == 'C';
  if (isTrebleClef) {
    if (lineNotesOnly) {
      return [
        TrebleClefNotes.E4,
        TrebleClefNotes.G4,
        TrebleClefNotes.B4,
        TrebleClefNotes.D5,
        TrebleClefNotes.F5
      ];
    }
    if (spaceNotesOnly) {
      return [
        TrebleClefNotes.F4,
        TrebleClefNotes.A4,
        TrebleClefNotes.C5,
        TrebleClefNotes.E5
      ];
    }
  } else {
    if (lineNotesOnly) {
      return [
        BassClefNotes.G3,
        BassClefNotes.B3,
        BassClefNotes.D3,
        BassClefNotes.F4,
        BassClefNotes.A4
      ];
    }
    if (spaceNotesOnly) {
      return [
        BassClefNotes.A3,
        BassClefNotes.C3,
        BassClefNotes.E3,
        BassClefNotes.G4,
      ];
    }
  }

  for (var i = 0; i < clef.length; i++) {
    if (i >= lowestNote.index && i <= highestNote.index) {
      returnList.add(clef[i]);
    }
  }

  if (!includeFlats) {
    returnList = returnList
        .where(
          (element) => !element.name.contains('flat'),
        )
        .toList();
  }

  return returnList;
}
