import 'package:flutter/material.dart';

import '../../content/information_windows/intro_basics.dart';
import '../../content/information_windows/intro_bass_clef.dart';
import '../../content/information_windows/intro_music_notation.dart';
import '../../content/information_windows/intro_treble_clef.dart';
import '../../game_logic/quiz_generate.dart';
import '../../models/modes.dart';
import '../../models/notes.dart';
import 'expandable_category.dart';
import 'play_button.dart';
import 'play_mode_chapter_title.dart';

class Training extends StatelessWidget {
  const Training({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Enum gameMode = GameMode.training;
    return Column(
      children: [
        const PlayModeChapterTitle(
          titleText: 'Session 1: The Basics',
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(
            title: 'Intro',
            modeButtonTree: [
              PlayButton(
                  title: 'Basics of Note Jogger',
                  subText: 'How to Play',
                  gameMode: GameMode.intro,
                  listOfInformationWindowScreen: introBasicsContent,
                  modeNotes: const []),
              PlayButton(
                  title: 'Music Notation',
                  subText: 'Names and Terms of Written Music',
                  gameMode: GameMode.intro,
                  listOfInformationWindowScreen: introMusicNotation,
                  modeNotes: const []),
              PlayButton(
                  title: 'Treble Clef',
                  subText: 'A Crash Course of the Treble Clef',
                  gameMode: GameMode.intro,
                  listOfInformationWindowScreen: introTrebleClefContent,
                  modeNotes: const []),
              PlayButton(
                  title: 'Bass Clef',
                  subText: 'A Crash Course of the Bass Clef',
                  gameMode: GameMode.intro,
                  listOfInformationWindowScreen: introBassClefContent,
                  modeNotes: const []),
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(title: 'Treble Clef', modeButtonTree: [
            PlayButton(
              title: 'Treble Clef 1',
              subText: 'Only notes between the lines of the staff',
              gameMode: gameMode,
              enableHintsOnStartup: true,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E4, TrebleClefNotes.F5,
                  spaceNotesOnly: true, includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 2',
              subText: 'Only notes on the lines of the staff',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E4, TrebleClefNotes.F5,
                  lineNotesOnly: true, includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 3',
              subText: 'Only notes on the staff',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E4, TrebleClefNotes.F5,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 4',
              subText: 'The notes above the staff',
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.F5, TrebleClefNotes.values.last,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 5',
              subText: 'Notes below the staff',
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.values.first, TrebleClefNotes.D4,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 6',
              subText: 'The staff notes and above',
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E4, TrebleClefNotes.values.last,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 7',
              subText: 'The staff notes and below',
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.values.first, TrebleClefNotes.F5,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Treble Clef 8',
              subText: 'All notes',
              gameMode: gameMode,
              modeNotes: trimClefNotes(TrebleClefNotes.values,
                  TrebleClefNotes.values.first, TrebleClefNotes.values.first,
                  includeFlats: false),
            ),
          ]),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(title: 'Bass Clef', modeButtonTree: [
            PlayButton(
              title: 'Bass Clef 1',
              subText: 'Only notes between the lines of the staff',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.A2, BassClefNotes.G3,
                  spaceNotesOnly: true, includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 2',
              subText: 'Only notes on lines of the staff',
              enableHintsOnStartup: true,
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.G2, BassClefNotes.A3,
                  lineNotesOnly: true, includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 3',
              subText: 'Only notes on the staff',
              enableHintsOnStartup: true,
              imagePath: 'assets/bass_clef.svg',
              gameMode: gameMode,
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.G2, BassClefNotes.A3,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 4',
              subText: 'Notes above the staff',
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.B2, BassClefNotes.values.last,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 5',
              subText: 'Notes below the staff',
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.F2, BassClefNotes.values.first,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 6',
              subText: 'The staff notes and above',
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.G3, BassClefNotes.values.last,
                  includeFlats: false),
            ),
            PlayButton(
              title: 'Bass Clef 7',
              subText: 'The notes on the staff and below',
              gameMode: gameMode,
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.values.first, BassClefNotes.A3,
                  includeFlats: false),
            ),
            PlayButton(
                title: 'Bass Clef 8',
                subText: 'All notes',
                gameMode: gameMode,
                imagePath: 'assets/bass_clef.svg',
                modeNotes: trimClefNotes(BassClefNotes.values,
                    BassClefNotes.values.first, BassClefNotes.values.last,
                    includeFlats: false)),
          ]),
        )
      ],
    );
  }
}
