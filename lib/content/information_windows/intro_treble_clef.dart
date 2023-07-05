import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';
import '../../components/notestaff/interactive_notestaff.dart';
import '../common_widget.dart';

List<List<Widget>> introTrebleClefContent = [
  [
    const InformationWindowTitle(text: 'Treble Clef'),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
          height: 300, child: SvgPicture.asset(GLOBAL_treble_clef_path)),
    ),
    const InformationWindowText(
        text:
            'The treble clef notates music notes above middle C, and is traditionally used for the right hand when playing piano.'),
    const InformationWindowText(
        text:
            "The notes on the treble clef are different than that of the bass clef (two whole steps higher), making it important to learn their positions at a glance"),
  ],
  [
    const InformationWindowTitle(text: 'Learning Treble Clef'),
    const InformationWindowSubtitle(text: 'F A C E'),
    const InformationWindowText(
      text:
          'When memorizing notes, it often helps to come up with a mnemonic device for the notes until their names and positions become second nature.',
    ),
    const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: InteractiveNoteStaff(
        startingNote: TrebleClefNotes.F4,
        jumpTwoWholeSteps: true,
      ),
    ),
    const InformationWindowText(
      text:
          'For the notes between the staff lines on the treble clef, the most common mnemonic device is the notes spelling the word F A C E.',
    ),
    const InformationWindowText(
        text:
            "Commit these notes to memory first!  For some of the earlier lessons, these notes will be displayed on the staff, but not forever!")
  ],
  [
    const InformationWindowTitle(text: 'Learning Treble Clef (Cont.)'),
    const InformationWindowSubtitle(text: 'Every Good Boy Does Fine'),
    const InformationWindowText(
      text:
          'The lines of the staff on the treble clef also have mnemonic devices, the most common being Every Good Boy Does Fine, with the first letter of each word representing the note value.',
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Builder(builder: (context) {
        return const InteractiveNoteStaff(
          startingNote: TrebleClefNotes.E4,
          jumpTwoWholeSteps: true,
        );
      }),
    ),
    const InformationWindowText(
      text:
          'Between a combination of these two mnemonic devices, you can easily memorize the notes on the staff of the treble clef.',
    ),
  ],
];
