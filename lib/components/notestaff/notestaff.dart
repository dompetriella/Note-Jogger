import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../globals.dart';
import '../../models/notes.dart';
import '../../provider.dart';
import 'floating_staff.dart';

class NoteStaff extends ConsumerWidget {
  final Enum note;
  final double size;
  final double horizontalPadding;
  final bool showHints;
  const NoteStaff({
    required this.note,
    this.horizontalPadding = 32,
    this.size = 1,
    this.showHints = false,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTrebleClef = note.runtimeType == TrebleClefNotes;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding * size),
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: Center(
            child: StaffContainer(
          size: size,
          note: note,
          isTrebleClef: isTrebleClef,
          showHints: showHints,
        )),
      ),
    );
  }
}

class StaffContainer extends HookConsumerWidget {
  final Enum note;
  final double size;
  final bool isTrebleClef;
  final bool showHints;
  const StaffContainer(
      {super.key,
      required this.note,
      required this.size,
      required this.showHints,
      required this.isTrebleClef});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double clefImageWidth = 75;

    List<String> hintList =
        isTrebleClef ? [' ', 'E', 'C', 'A', 'F'] : [' ', 'G', 'E', 'C', 'A'];

    return Container(
      height: 350 * size,
      width: 350 * size,
      decoration: BoxDecoration(
          border: Border.all(
            width: 4 * size,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(20 * size)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 5; i++)
                Container(
                  height: 25 * size,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 3 * size,
                              color: Colors.black.withOpacity(.7)))),
                  child: showHints
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: (clefImageWidth + 20) * size),
                          child: Transform.translate(
                            offset: Offset(0, -2 * size),
                            child: Text(
                              hintList[i],
                              style: TextStyle(
                                  fontSize: 18 * size,
                                  color: Colors.black.withOpacity(.80),
                                  fontWeight: FontWeight.w700),
                            ).animate().fadeIn(delay: 200.ms * i),
                          ),
                        )
                      : SizedBox.shrink(),
                ),
              SizedBox(
                height: 20 * size,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 200 * size,
                width: clefImageWidth * size,
                child: Padding(
                  padding: EdgeInsets.only(left: 16 * size, bottom: 25 * size),
                  child: note.index < 0
                      ? SizedBox.shrink()
                      : SvgPicture.asset(isTrebleClef
                          ? GLOBAL_treble_clef_path
                          : GLOBAL_bass_clef_path),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NoteAndFloatingStaff(
                      isTrebleClef: isTrebleClef, note: note, size: size),
                ],
              ),
              SizedBox(
                width: clefImageWidth * size,
              )
            ],
          ),
        ],
      ),
    );
  }
}
