import 'package:flutter/material.dart';
import 'package:note_jogger/content/information_windows/intro_basics.dart';
import 'package:note_jogger/content/information_windows/intro_bass_clef.dart';
import 'package:note_jogger/content/information_windows/intro_music_notation.dart';
import 'package:note_jogger/content/information_windows/intro_treble_clef.dart';
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
        case GameMode.training || GameMode.intro:
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
        Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Session 1: The Basics',
                  style: TextStyle(
                      height: 0.9,
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Divider()
              ],
            )),
        ExpandableCatergory(
          title: 'Intro',
          modeButtonTree: [
            ModeButton(
                title: 'Basics of Note Jogger',
                subText: 'How to Play',
                gameMode: GameMode.intro,
                listOfInformationWindowScreen: introBasicsContent,
                modeNotes: const []),
            ModeButton(
                title: 'Music Notation',
                subText: 'Names and Terms of Written Music',
                gameMode: GameMode.intro,
                listOfInformationWindowScreen: introMusicNotation,
                modeNotes: const []),
            ModeButton(
                title: 'Treble Clef',
                subText: 'A Crash Course of the Treble Clef',
                gameMode: GameMode.intro,
                listOfInformationWindowScreen: introTrebleClefContent,
                modeNotes: const []),
            ModeButton(
                title: 'Bass Clef',
                subText: 'A Crash Course of the Bass Clef',
                gameMode: GameMode.intro,
                listOfInformationWindowScreen: introBassClefContent,
                modeNotes: const []),
          ],
        ),
        ExpandableCatergory(title: 'Treble Clef', modeButtonTree: [
          ModeButton(
            title: 'Treble Clef 1',
            subText: 'Only notes between the lines of the staff',
            gameMode: gameMode,
            enableHintsOnStartup: true,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.F5,
                spaceNotesOnly: true, includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 2',
            subText: 'Only notes on the lines of the staff',
            enableHintsOnStartup: true,
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.F5,
                lineNotesOnly: true, includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 3',
            subText: 'Only notes on the staff',
            enableHintsOnStartup: true,
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.F5,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 4',
            subText: 'The notes above the staff',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.F5, TrebleClefNotes.values.last,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 5',
            subText: 'Notes below the staff',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.values.first, TrebleClefNotes.D4,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 6',
            subText: 'The staff notes and above',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.values.last,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 7',
            subText: 'The staff notes and below',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.values.first, TrebleClefNotes.F5,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef 8',
            subText: 'All notes',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values,
                TrebleClefNotes.values.first, TrebleClefNotes.values.first,
                includeFlats: false),
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
                BassClefNotes.A2, BassClefNotes.G3,
                spaceNotesOnly: true, includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 2',
            subText: 'Only notes on lines of the staff',
            enableHintsOnStartup: true,
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G2, BassClefNotes.A3,
                lineNotesOnly: true, includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 3',
            subText: 'Only notes on the staff',
            enableHintsOnStartup: true,
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G2, BassClefNotes.A3,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 4',
            subText: 'Notes above the staff',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.B2, BassClefNotes.values.last,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 5',
            subText: 'Notes below the staff',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.F2, BassClefNotes.values.first,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 6',
            subText: 'The staff notes and above',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G3, BassClefNotes.values.last,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef 7',
            subText: 'The notes on the staff and below',
            gameMode: gameMode,
            imagePath: 'assets/bass_clef.svg',
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.values.first, BassClefNotes.A3,
                includeFlats: false),
          ),
          ModeButton(
              title: 'Bass Clef 8',
              subText: 'All notes',
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values,
                  BassClefNotes.values.first, BassClefNotes.values.last,
                  includeFlats: false)),
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
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Marathon #1 - Notes Circuit',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            )),
        Divider(),
        ExpandableCatergory(title: 'Treble Clef', modeButtonTree: [
          ModeButton(
            title: 'Treble Clef (Easy)',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.F5,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef (Medium)',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                TrebleClefNotes.E4, TrebleClefNotes.values.last,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Treble Clef (Hard)',
            gameMode: gameMode,
            modeNotes: trimClefNotes(TrebleClefNotes.values,
                TrebleClefNotes.values.first, TrebleClefNotes.values.last,
                includeFlats: false),
          ),
        ]),
        ExpandableCatergory(title: 'Bass Clef', modeButtonTree: [
          ModeButton(
            title: 'Bass Clef (Easy)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.G2, BassClefNotes.A3,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef (Medium)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                BassClefNotes.values.first, BassClefNotes.A3,
                includeFlats: false),
          ),
          ModeButton(
            title: 'Bass Clef (Hard)',
            imagePath: 'assets/bass_clef.svg',
            gameMode: gameMode,
            modeNotes: trimClefNotes(BassClefNotes.values,
                BassClefNotes.values.first, BassClefNotes.values.first,
                includeFlats: false),
          ),
        ])
      ],
    );
  }
}
