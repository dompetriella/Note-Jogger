import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/notes.dart';
import 'note.dart';

class FloatingStaff extends StatelessWidget {
  final double size;
  final double yOffset;
  const FloatingStaff({
    required this.yOffset,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(0, yOffset * size),
        child: Container(
            height: 3 * size,
            width: 50 * size,
            color: Theme.of(context).colorScheme.onPrimary.withOpacity(.7)));
  }
}

class NoteAndFloatingStaff extends StatelessWidget {
  const NoteAndFloatingStaff({
    super.key,
    required this.isTrebleClef,
    required this.note,
    required this.size,
  });

  final bool isTrebleClef;
  final Enum note;
  final double size;

  @override
  Widget build(BuildContext context) {
    var clefValues =
        isTrebleClef ? TrebleClefNotes.values : BassClefNotes.values;

    double offset = 0;
    bool isFlat = note.name.contains('flat');
    if (isFlat) {
      int previousFlats = 0;
      for (var i = 0; i < clefValues[note.index].index; i++) {
        if (clefValues[i].name.contains('flat')) {
          previousFlats++;
        }
      }

      offset = 5 + (note.index - previousFlats) * -20 / 2;
    }

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        if (isTrebleClef
            ? note.index > TrebleClefNotes.F6.index
            : note.index > BassClefNotes.A5.index)
          FloatingStaff(
            yOffset: -320,
            size: size,
          ),
        if (isTrebleClef
            ? note.index > TrebleClefNotes.D6.index
            : note.index > BassClefNotes.F5.index)
          FloatingStaff(
            yOffset: -295,
            size: size,
          ),
        if (isTrebleClef
            ? note.index > TrebleClefNotes.B5.index
            : note.index > BassClefNotes.D4.index)
          FloatingStaff(
            yOffset: -270,
            size: size,
          ),
        if (isTrebleClef
            ? note.index > TrebleClefNotes.G5.index
            : note.index > BassClefNotes.B4.index)
          FloatingStaff(
            yOffset: -245,
            size: size,
          ),
        // below the staff

        if (isTrebleClef
            ? note.index < TrebleClefNotes.D4_flat.index
            : note.index < BassClefNotes.F3.index)
          FloatingStaff(
            yOffset: -94,
            size: size,
          ),
        if (isTrebleClef
            ? note.index < TrebleClefNotes.B3_flat.index
            : note.index < BassClefNotes.D2_flat.index)
          FloatingStaff(
            yOffset: -69,
            size: size,
          ),
        if (isTrebleClef
            ? note.index < TrebleClefNotes.G3_flat.index
            : note.index < BassClefNotes.B2_flat.index)
          FloatingStaff(
            yOffset: -44,
            size: size,
          ),
        if (isTrebleClef
            ? note.index < TrebleClefNotes.E3_flat.index
            : note.index < BassClefNotes.G2_flat.index)
          FloatingStaff(
            yOffset: -19,
            size: size,
          ),
        if (isFlat)
          Transform.translate(
            offset: Offset(-25, offset),
            child: SizedBox(
              height: 30,
              width: 20,
              child: SvgPicture.asset(
                'assets/flat.svg',
                // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
              ),
            ),
          ),
        Note(noteValue: note.index, size: size),
      ],
    );
  }
}
