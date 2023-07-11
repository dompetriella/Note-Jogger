import 'package:flutter/material.dart';
import 'package:note_jogger/content/training_content/session_one.dart';
import 'expandable_category.dart';
import 'play_mode_chapter_title.dart';

class Training extends StatelessWidget {
  const Training({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PlayModeChapterTitle(
          titleText: 'Session 1: The Basics',
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(
              title: 'Intro', modeButtonTree: sessionOne_Intro),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(
              title: 'Treble Clef', modeButtonTree: sessionOne_Intro),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: ExpandableCatergory(
              title: 'Bass Clef', modeButtonTree: sessionOne_BassClef),
        )
      ],
    );
  }
}
