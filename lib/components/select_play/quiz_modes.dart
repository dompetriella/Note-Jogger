import 'package:flutter/material.dart';
import 'package:note_jogger/models/modes.dart';

import 'ranked_quiz_mode.dart';
import 'training_quiz_mode.dart';

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
