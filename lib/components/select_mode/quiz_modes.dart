import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../game_logic/quiz_generate.dart';
import '../../models/notes.dart';
import 'expandable_category.dart';
import 'mode_button.dart';

class QuizModes extends StatelessWidget {
  const QuizModes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpandableCatergory(
        title: 'Treble Clef',
        modeButtonTree: [
          ModeButton(
            title: 'Treble Clef (Easy)',
            subText: 'Only notes on the lines of the staff',
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                lineNotesOnly: true),
          ),
          ModeButton(
            title: 'Treble Clef (Medium)',
            subText: 'Only notes on the staff',
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.F2.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef (Hard)',
            subText: 'The staff notes and above',
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.G3.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef (Expert)',
            subText: 'All notes',
            modeNotes: TrebleClefNotes.values.toList(),
          ),
        ]
            .animate(interval: 150.ms, delay: 150.ms)
            .slideX(duration: 300.ms, curve: Curves.easeInOut)
            .fadeIn(),
      ),
      ExpandableCatergory(
          title: 'Bass Clef',
          modeButtonTree: [
            ModeButton(
              title: 'Bass Clef (Easy)',
              subText: 'Only notes on lines of the staff',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.G1.index, BassClefNotes.A2.index,
                  lineNotesOnly: true),
            ),
            ModeButton(
              title: 'Bass Clef (Medium)',
              subText: 'Only notes on the staff',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(
                BassClefNotes.values.toList(),
                BassClefNotes.G1.index,
                BassClefNotes.A2.index,
              ),
            ),
            ModeButton(
              title: 'Bass Clef (Hard)',
              subText: 'The staff notes and above',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(
                BassClefNotes.values.toList(),
                BassClefNotes.G1.index,
                BassClefNotes.B3.index,
              ),
            ),
            ModeButton(
              title: 'Bass Clef (Expert)',
              subText: 'All notes',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: BassClefNotes.values.toList(),
            ),
          ]
              .animate(interval: 150.ms, delay: 150.ms)
              .slideX(duration: 300.ms, curve: Curves.easeInOut)
              .fadeIn())
    ]);
  }
}
