import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/notes.dart';

class Note extends StatelessWidget {
  final double size;
  final int noteValue;
  final List<Enum> clefValues;
  const Note({
    super.key,
    required this.size,
    required this.noteValue,
    this.clefValues = TrebleClefNotes.values,
  });

  @override
  Widget build(BuildContext context) {
    int previousFlats = 0;
    for (var i = 0; i < clefValues[noteValue].index; i++) {
      if (clefValues[i].name.contains('flat')) {
        previousFlats++;
      }
    }

    double noteSize = 77 * size;
    bool flagIsUp = noteValue < 24 ? true : false;
    // -25 / 2 is the staff height divided by 2
    double offset = 5 + (noteValue - previousFlats) * -25 / 2;
    double flagOffset = flagIsUp ? offset : offset + 50;

    return Transform.translate(
      offset: Offset(0, flagOffset * size),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: flagIsUp
            ? Stack(
                children: [
                  SvgPicture.asset(
                    'assets/quarter_note.svg',
                    height: noteSize,
                  ),
                ],
              )
            : Transform.flip(
                flipX: true,
                flipY: true,
                child: SvgPicture.asset(
                  'assets/quarter_note.svg',
                  height: noteSize,
                ),
              ),
      ),
    );
  }
}
