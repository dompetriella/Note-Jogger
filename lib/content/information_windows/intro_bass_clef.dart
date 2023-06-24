import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_jogger/components/notestaff/interactive_note_staff.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';
import '../common_widget.dart';

List<List<Widget>> introBassClefContent = [
  [
    const InformationWindowTitle(text: 'Bass Clef'),
    SizedBox(height: 100, child: SvgPicture.asset(GLOBAL_bass_clef_path)),
    const InformationWindowText(
        text:
            'The bass clef notates music for lower pitches below below middle C, and is traditionally used for the left hand when playing piano.  It also sometimes called "F Clef" because the two dots point to the note F on the staff.'),
  ],
  [
    const InformationWindowTitle(text: 'Learning Bass Clef'),
    const InformationWindowSubtitle(text: 'All Cows Eat Grass'),
    const InformationWindowText(
      text:
          'A common mnemonic device for the notes between the staff on the bass clef is "All Cows Eat Grass", with the first letter of each word corresponding to the notes in the open space.',
    ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InteractiveNoteStaff(
        startingValue: BassClefNotes.A2.index,
        isTrebleClef: false,
        jumpTwoWholeSteps: true,
      ),
    ),
    const InformationWindowText(
        text:
            "Keep in mind, these are just common mnemonic devices, and making up your own might help you remember better than the ones suggested!"),
  ],
  [
    const InformationWindowTitle(text: 'Learning Bass Clef (Cont.)'),
    const InformationWindowSubtitle(text: "Grizzly Bears Don't Fly Airplanes"),
    const InformationWindowText(
        text:
            "To remember the notes on the lines of the staff for the bass clef I use Grizzly Bears Don't Fly Airplanes as my mnemonic device.  There are more common ones, but they often reuse the word 'good' from the treble clef. The obsurdity of it makes it very memorable!"),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Builder(builder: (context) {
        return InteractiveNoteStaff(
          startingValue: BassClefNotes.F2.index,
          isTrebleClef: false,
          jumpTwoWholeSteps: true,
        );
      }),
    ),
    const InformationWindowText(
      text:
          "That's it!  Jump into the training and ranked modes when you feel ready.  Good luck!",
    ),
  ],
];
