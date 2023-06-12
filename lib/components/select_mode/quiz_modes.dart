import 'package:flutter/material.dart';
import 'package:note_jogger/models/modes.dart';
import '../../game_logic/quiz_generate.dart';
import '../../models/notes.dart';
import 'expandable_category.dart';
import 'mode_button.dart';

class QuizModes extends StatelessWidget {
  final Enum gameMode;
  const QuizModes({super.key, required this.gameMode});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      switch (gameMode) {
        case GameMode.training:
          return const Training();
        case GameMode.ranked:
          return const Ranked();
        default:
          return const Training();
      }
    });
  }
}

class Training extends StatelessWidget {
  const Training({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Enum gameMode = GameMode.training;
    return Column(
      children: [
        ExpandableCatergory(
          title: 'Intro',
          modeButtonTree: [
            ModeButton(
              title: 'Treble Clef',
              subText: 'A crash course of the Treble Clef',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                  spaceNotesOnly: true),
            ),
            ModeButton(
              title: 'Bass Clef',
              subText: 'A crash course of the Bass Clef',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                  spaceNotesOnly: true),
            ),
          ],
        ),
        ExpandableCatergory(title: 'Treble Clef', modeButtonTree: [
          ModeButton(
            title: 'Treble Clef 1',
            subText: 'Only notes between the lines of the staff',
            gameMode: gameMode,
            enableHintsOnStartup: true,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                spaceNotesOnly: true),
          ),
          ModeButton(
            title: 'Treble Clef 2',
            subText: 'Only notes on the lines of the staff',
            enableHintsOnStartup: true,
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                lineNotesOnly: true),
          ),
          ModeButton(
            title: 'Treble Clef 3',
            subText: 'Only notes on the staff',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.F2.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef 4',
            subText: 'The staff notes and above',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.G3.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef 5',
            subText: 'All notes',
            gameMode: gameMode,
            modeNotes: TrebleClefNotes.values.toList(),
          ),
        ]),
        ExpandableCatergory(title: 'Bass Clef', modeButtonTree: [
          ModeButton(
            title: 'Bass Clef 1',
            subText: 'Only notes between the lines of the staff',
            enableHintsOnStartup: true,
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G1.index, BassClefNotes.A2.index,
                spaceNotesOnly: true),
          ),
          ModeButton(
            title: 'Bass Clef 2',
            subText: 'Only notes on lines of the staff',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G1.index, BassClefNotes.A2.index,
                lineNotesOnly: true),
          ),
          ModeButton(
            title: 'Bass Clef 3',
            subText: 'Only notes on the staff',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              BassClefNotes.values.toList(),
              BassClefNotes.G1.index,
              BassClefNotes.A2.index,
            ),
          ),
          ModeButton(
            title: 'Bass Clef 4',
            subText: 'The staff notes and above',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(
              BassClefNotes.values.toList(),
              BassClefNotes.G1.index,
              BassClefNotes.B3.index,
            ),
          ),
          ModeButton(
            title: 'Bass Clef 5',
            subText: 'All notes',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: BassClefNotes.values.toList(),
          ),
        ])
      ],
    );
  }
}

class Ranked extends StatelessWidget {
  const Ranked({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Enum gameMode = GameMode.ranked;
    return Column(
      children: [
        ExpandableCatergory(title: 'Treble Clef', modeButtonTree: [
          ModeButton(
            title: 'Treble Clef (Easy)',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.F2.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef (Medium)',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              TrebleClefNotes.values.toList(),
              TrebleClefNotes.E1.index,
              TrebleClefNotes.G3.index,
            ),
          ),
          ModeButton(
            title: 'Treble Clef (Hard)',
            gameMode: gameMode,
            modeNotes: TrebleClefNotes.values.toList(),
          ),
        ]),
        ExpandableCatergory(title: 'Bass Clef', modeButtonTree: [
          ModeButton(
            title: 'Bass Clef (Easy)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              BassClefNotes.values.toList(),
              BassClefNotes.G1.index,
              BassClefNotes.A2.index,
            ),
          ),
          ModeButton(
            title: 'Bass Clef (Medium)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(
              BassClefNotes.values.toList(),
              BassClefNotes.G1.index,
              BassClefNotes.B3.index,
            ),
          ),
          ModeButton(
            title: 'Bass Clef (Hard)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: BassClefNotes.values.toList(),
          ),
        ])
      ],
    );
  }
}
