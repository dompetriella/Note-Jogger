import 'package:note_jogger/components/select_play/ranked_play_button.dart';
import '../../game_logic/quiz_generate.dart';
import '../../models/modes.dart';
import '../../models/notes.dart';
import '../../models/ranked_difficulty.dart';
import 'package:flutter/material.dart';

var gameMode = GameMode.ranked;

List<Widget> circuitOne = [
  Align(
    alignment: Alignment.centerLeft,
    child: RankedPlayButton(
      title: 'Treble Clef Easy',
      modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
          TrebleClefNotes.E4, TrebleClefNotes.F5,
          includeFlats: false),
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.easy,
    ),
  ),
  Align(
    alignment: Alignment.centerRight,
    child: RankedPlayButton(
      title: 'Treble Clef Medium',
      modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
          TrebleClefNotes.E4, TrebleClefNotes.values.last,
          includeFlats: false),
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.medium,
    ),
  ),
  Align(
    alignment: Alignment.centerLeft,
    child: RankedPlayButton(
      title: 'Treble Clef Hard',
      modeNotes: TrebleClefNotes.values,
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.hard,
    ),
  ),
  Align(
    alignment: Alignment.centerRight,
    child: RankedPlayButton(
      title: 'Bass Clef Easy',
      modeNotes: trimClefNotes(
          BassClefNotes.values.toList(), BassClefNotes.G3, BassClefNotes.A4,
          includeFlats: false),
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.easy,
    ),
  ),
  Align(
    alignment: Alignment.centerLeft,
    child: RankedPlayButton(
      title: 'Bass Clef Medium',
      modeNotes: trimClefNotes(BassClefNotes.values.toList(),
          BassClefNotes.values.first, BassClefNotes.A4,
          includeFlats: false),
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.medium,
    ),
  ),
  Align(
    alignment: Alignment.centerRight,
    child: RankedPlayButton(
      title: 'Bass Clef Hard',
      modeNotes: BassClefNotes.values,
      gameMode: gameMode,
      rankedDifficulty: RankedDifficulty.hard,
    ),
  ),
];
