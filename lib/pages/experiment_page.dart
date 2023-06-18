import 'package:flutter/material.dart';
import 'package:note_jogger/components/notestaff/interactive_note_staff.dart';
import 'package:note_jogger/content/information_windows/intro_music_notation.dart';

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0), child: InteractiveNoteStaff()),
      ),
    );
  }
}
