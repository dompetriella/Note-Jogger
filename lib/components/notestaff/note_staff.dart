import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_jogger/models/notes.dart';
import 'floating_staff.dart';
import 'note.dart';

showHintsSwitch(String hintString, bool showHints, bool isTreble) {
  if (!showHints) {
    return ' ';
  }
  if (isTreble) {
    return hintString;
  }
  if (!isTreble) {
    switch (hintString) {
      case 'E':
        return 'G';
      case 'C':
        return 'E';
      case 'A':
        return 'C';
      case 'F':
        return 'A';
    }
  }
}

class NoteStaff extends ConsumerWidget {
  final dynamic value;
  final String imagePath;
  final bool showHints;
  const NoteStaff({
    required this.value,
    required this.imagePath,
    this.showHints = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTrebleClef = value.runtimeType == TrebleClefNotes;

    return Stack(
      children: [
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  width: 2.0, color: Theme.of(context).colorScheme.secondary)),
        ),
        Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Stack(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StaffLine(
                          valueHint:
                              showHintsSwitch('E', showHints, isTrebleClef),
                          animationDelay: 600,
                        ),
                        StaffLine(
                          valueHint:
                              showHintsSwitch('C', showHints, isTrebleClef),
                          animationDelay: 500,
                        ),
                        StaffLine(
                          valueHint:
                              showHintsSwitch('A', showHints, isTrebleClef),
                          animationDelay: 400,
                        ),
                        StaffLine(
                          valueHint:
                              showHintsSwitch('F', showHints, isTrebleClef),
                          animationDelay: 300,
                        ),
                        const StaffLine(),
                      ]),
                  Stack(
                    children: [
                      if (isTrebleClef
                          ? value.index > TrebleClefNotes.F6.index
                          : value.index > BassClefNotes.A5.index)
                        const Positioned(
                            left: 150,
                            bottom: 290,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index > TrebleClefNotes.D6.index
                          : value.index > BassClefNotes.F5.index)
                        const Positioned(
                            left: 150,
                            bottom: 270,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index > TrebleClefNotes.B5.index
                          : value.index > BassClefNotes.D4.index)
                        const Positioned(
                            left: 150,
                            bottom: 250,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index > TrebleClefNotes.G5.index
                          : value.index > BassClefNotes.B4.index)
                        const Positioned(
                            left: 150,
                            bottom: 230,
                            child: FloatingStaffWidget()),
                      // below the staff
                      if (isTrebleClef
                          ? value.index < TrebleClefNotes.D4_flat.index
                          : value.index < BassClefNotes.F3.index)
                        const Positioned(
                            left: 150,
                            bottom: 110,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index < TrebleClefNotes.B3_flat.index
                          : value.index < BassClefNotes.D2_flat.index)
                        const Positioned(
                            left: 150,
                            bottom: 90,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index < TrebleClefNotes.G3_flat.index
                          : value.index < BassClefNotes.B2_flat.index)
                        const Positioned(
                            left: 150,
                            bottom: 70,
                            child: FloatingStaffWidget()),
                      if (isTrebleClef
                          ? value.index < TrebleClefNotes.E3_flat.index
                          : value.index < BassClefNotes.G2_flat.index)
                        const Positioned(
                            left: 150,
                            bottom: 50,
                            child: FloatingStaffWidget()),
                    ],
                  ),
                  // TODO: Fix this/get a different svg.  The elevation is need for bass but looks bad
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: isTrebleClef ? 18.0 : 38.0, left: 6),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SvgPicture.asset(value.clefImagePath,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.secondary,
                              BlendMode.srcIn),
                          height:
                              value.clefImagePath == 'assets/treble_clef.svg'
                                  ? 120
                                  : 80,
                          width: 80,
                          semanticsLabel: ''),
                    ),
                  )
                ],
              ),
              Center(
                child: Note(
                  clef: isTrebleClef
                      ? TrebleClefNotes.values
                      : BassClefNotes.values,
                  value: value,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StaffLine extends StatelessWidget {
  final String valueHint;
  final double animationDelay;
  const StaffLine({super.key, this.valueHint = '', this.animationDelay = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 20,
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.50),
                      width: 3))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Transform.translate(
            offset: Offset(0, 1),
            child: Text(
              valueHint,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.primary),
            )
                .animate()
                .fadeIn(delay: animationDelay.ms)
                .slideY(begin: -2, delay: animationDelay.ms),
          ),
        )
      ],
    );
  }
}
