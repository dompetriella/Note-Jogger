import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/components/notestaff/note_staff.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/notes.dart';

class InteractiveNoteStaff extends HookConsumerWidget {
  InteractiveNoteStaff({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var noteValue = useState(TrebleClefNotes.C2.index);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Note Value: ${TrebleClefNotes.values[noteValue.value].name[0]}',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        NoteStaff(
            showHints: true,
            value: TrebleClefNotes.values[noteValue.value],
            imagePath: GLOBAL_treble_clef_path),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleButton(
              icon: Icons.arrow_downward,
              onPressed: () => {
                if (noteValue.value > 0) {noteValue.value--}
              },
            ),
            ToggleButton(
              icon: Icons.arrow_upward,
              onPressed: () => {
                if (noteValue.value < TrebleClefNotes.values.last.index)
                  {noteValue.value++}
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
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side:
                    BorderSide(color: Theme.of(context).colorScheme.secondary)),
          ),
          onPressed: onPressed,
          child: Icon(icon)),
    );
  }
}
