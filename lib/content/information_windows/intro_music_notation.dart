import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_jogger/components/notestaff/interactive_note_staff.dart';
import 'package:note_jogger/components/notestaff/note.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';
import '../common_widget.dart';

List<List<Widget>> introMusicNotation = [
  [
    const InformationWindowTitle(text: 'Music Notation'),
    const InformationWindowSubtitle(text: 'The Note'),
    SizedBox(
      height: 150,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 32.0),
          child: QuarterNoteWidget(
            value: TrebleClefNotes.C5.index,
          ),
        ),
      ),
    ),
    const InformationWindowText(
        text:
            "The first thing to learn in music is the note.  Above is a note (a quarter note specifically).  Notes represent a specific tone played on an instrument and how long to hold the pitch."),
    const InformationWindowText(
        text:
            "Notes can have one of 7 values, A through G of the English alphabet, repeating that pattern as the pitch increases. The note itself doesn't tell you much, however, unless placed on a staff.")
  ],
  [
    const InformationWindowTitle(text: 'Music Notation (Cont.)'),
    const InformationWindowSubtitle(text: 'The Staff'),
    const InformationWindowText(
        text:
            'The staff gives context to the note as to what pitch should be played.  Notes higher on the staff are higher pitched, and notes lower on the staff are lower pitched.'),
    Align(
      alignment: Alignment.center,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InteractiveNoteStaff(
            isTrebleClef: true,
            startingValue: TrebleClefNotes.C5.index,
          )),
    ),
    const InformationWindowText(
        text:
            'Each movement up or down the staff is a "whole step".  (There are "half steps" as well, but we will not be covering them in this lesson)'),
    const InformationWindowText(
        text:
            'The exact value of a note on the staff, however, is subject to its clef.')
  ],
  [
    const InformationWindowTitle(text: 'Music Notation (Cont.)'),
    const InformationWindowSubtitle(text: 'The Clef'),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(GLOBAL_treble_clef_path)),
        SizedBox(
            height: 100,
            width: 100,
            child: SvgPicture.asset(GLOBAL_bass_clef_path)),
      ],
    ),
    const InformationWindowText(
        text:
            'The Treble (on left) and Bass (on right) clef are used for different instruments, and traditionally the right and left hand of the piano respectively.'),
    const InformationWindowText(
        text:
            'The exact value of the note is different depending on the clef used, with the treble clef used for higher pitched instruments and the bass clef used for lower pitched instruments.')
  ],
];
