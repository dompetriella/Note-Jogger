import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/components/notestaff/note_staff.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';

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
    var noteValue = useState(clefValues[startingValue].index);

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
              onPressed: () => {
                if (jumpTwoWholeSteps)
                  {
                    if (noteValue.value > 1) {noteValue.value -= 2}
                  }
                else
                  {
                    if (noteValue.value > 0) {noteValue.value--}
                  }
              },
            ),
            ToggleButton(
              icon: Icons.arrow_upward,
              onPressed: () => {
                if (jumpTwoWholeSteps)
                  {
                    if (noteValue.value < clefValues.last.index - 1)
                      {noteValue.value += 2}
                  }
                else
                  {
                    if (noteValue.value < clefValues.last.index)
                      {noteValue.value++}
                  }
              },
            ),
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
