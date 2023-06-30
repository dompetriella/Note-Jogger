import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/components/notestaff/note.dart';
import 'package:note_jogger/models/notes.dart';

moveNoteValueToNextNaturalNote(ValueNotifier<int> noteState,
    List<Enum> clefValues, bool increase, bool twoSteps) {
  switch (increase) {
    case true:
      var nextNote = twoSteps ? noteState.value + 3 : noteState.value + 1;
      if (nextNote < clefValues.length &&
          clefValues[nextNote].name.contains('flat')) {
        nextNote++;
      }
      if (nextNote < clefValues.length) {
        noteState.value = nextNote;
      }

      break;

    case false:
      var nextNote = twoSteps ? noteState.value - 3 : noteState.value - 1;
      if (nextNote > 0 && clefValues[nextNote].name.contains('flat')) {
        nextNote--;
      }
      if (nextNote > 0) {
        noteState.value = nextNote;
      }
      break;
  }
}

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoteStaff(
        size: 1,
      ),
    );
  }
}

class NoteStaff extends StatelessWidget {
  final double size;
  const NoteStaff({
    this.size = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Center(child: StaffContainer(size: size)),
    );
  }
}

class StaffContainer extends HookConsumerWidget {
  final double size;
  const StaffContainer({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isTrebleClef = true;

    var clefValues =
        isTrebleClef ? TrebleClefNotes.values : BassClefNotes.values;
    var noteValue = useState(TrebleClefNotes.C4.index);

    return Column(
      children: [
        Text(
          'Note Value: ${clefValues[noteValue.value].name}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 350 * size,
          decoration: BoxDecoration(
              border: Border.all(
                width: 4 * size,
                color: Colors.black,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 0; i < 5; i++)
                    Container(
                      height: 25 * size,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3 * size,
                                  color: Colors.black.withOpacity(.7)))),
                    ),
                  SizedBox(
                    height: 20 * size,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Note(noteValue: noteValue.value, size: size),
                ],
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
              onPressed: () => moveNoteValueToNextNaturalNote(
                  noteValue, clefValues, false, false),
              icon: Icons.arrow_downward,
            ),
            ToggleButton(
              onPressed: () => moveNoteValueToNextNaturalNote(
                  noteValue, clefValues, true, false),
              icon: Icons.arrow_upward,
            )
          ],
        ),
      ],
    );
  }
}

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

    bool flagIsUp = noteValue < 24 ? true : false;
    // -25 / 2 is the staff height divided by 2
    double offset = 5 + (noteValue - previousFlats) * -25 / 2;
    double flagOffset = flagIsUp ? offset : offset + 50;

    // flag down needs to be 50px less
    return Transform.translate(
      offset: Offset(0, flagOffset * size),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: flagIsUp
            ? SvgPicture.asset(
                'assets/quarter_note.svg',
                height: 77 * size,
              )
            : Transform.flip(
                flipX: true,
                flipY: true,
                child: SvgPicture.asset(
                  'assets/quarter_note.svg',
                  height: 77 * size,
                ),
              ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const ToggleButton({
    required this.onPressed,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: 32,
            ),
          )),
    );
  }
}
