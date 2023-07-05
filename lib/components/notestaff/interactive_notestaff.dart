import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/notes.dart';
import 'notestaff.dart';

moveNoteValueToNextNaturalNote(ValueNotifier<Enum> noteState,
    List<Enum> clefValues, bool increase, bool twoSteps) {
  switch (increase) {
    case true:
      var nextNote =
          twoSteps ? noteState.value.index + 3 : noteState.value.index + 1;
      if (nextNote < clefValues.length &&
          clefValues[nextNote].name.contains('flat')) {
        nextNote++;
      }
      if (nextNote < clefValues.length) {
        noteState.value = clefValues[nextNote];
      }

      break;

    case false:
      var nextNote =
          twoSteps ? noteState.value.index - 3 : noteState.value.index - 1;
      if (nextNote > 0 && clefValues[nextNote].name.contains('flat')) {
        nextNote--;
      }
      if (nextNote > 0) {
        noteState.value = clefValues[nextNote];
      }
      break;
  }
}

class InteractiveNoteStaff extends HookConsumerWidget {
  final double size;
  final Enum startingNote;
  final double horizontalPadding;
  final bool jumpTwoWholeSteps;
  const InteractiveNoteStaff({
    super.key,
    required this.startingNote,
    this.size = 1,
    this.horizontalPadding = 32,
    this.jumpTwoWholeSteps = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isTrebleClef = startingNote.runtimeType == TrebleClefNotes;
    var clefValues =
        isTrebleClef ? TrebleClefNotes.values : BassClefNotes.values;
    var noteState = useState(startingNote);
    return Column(
      children: [
        Text(
          'Note Value: ${clefValues[noteState.value.index].name[0]}',
          style: TextStyle(fontSize: 32 * size, fontWeight: FontWeight.w500),
        ),
        Builder(builder: (context) {
          return NoteStaff(
            note: noteState.value,
            size: size,
            horizontalPadding: horizontalPadding,
            showHints: true,
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
              onPressed: () => moveNoteValueToNextNaturalNote(
                  noteState, clefValues, false, jumpTwoWholeSteps),
              icon: Icons.arrow_downward,
            ),
            ToggleButton(
              onPressed: () => moveNoteValueToNextNaturalNote(
                  noteState, clefValues, true, jumpTwoWholeSteps),
              icon: Icons.arrow_upward,
            )
          ],
        ),
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
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(
                    color: Theme.of(context).colorScheme.onPrimary, width: 3)),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              size: 32,
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          )),
    );
  }
}
