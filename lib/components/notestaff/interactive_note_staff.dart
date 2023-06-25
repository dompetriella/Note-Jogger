import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/components/notestaff/note_staff.dart';
import 'package:note_jogger/globals.dart';
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

class InteractiveNoteStaff extends HookConsumerWidget {
  final int startingValue;
  final bool isTrebleClef;
  final bool jumpTwoWholeSteps;
  const InteractiveNoteStaff(
      {super.key,
      required this.startingValue,
      this.isTrebleClef = true,
      this.jumpTwoWholeSteps = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var clefValues =
        isTrebleClef ? TrebleClefNotes.values : BassClefNotes.values;
    ValueNotifier<int> noteValue = useState(clefValues[startingValue].index);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Note Value: ${clefValues[noteValue.value].name[0]}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        NoteStaff(
            showHints: true,
            value: clefValues[noteValue.value],
            imagePath:
                isTrebleClef ? GLOBAL_treble_clef_path : GLOBAL_bass_clef_path),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
                icon: Icons.arrow_downward,
                onPressed: () => moveNoteValueToNextNaturalNote(
                    noteValue, clefValues, false, jumpTwoWholeSteps)),
            ToggleButton(
                icon: Icons.arrow_upward,
                onPressed: () => moveNoteValueToNextNaturalNote(
                    noteValue, clefValues, true, jumpTwoWholeSteps)),
          ],
        )
      ],
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
