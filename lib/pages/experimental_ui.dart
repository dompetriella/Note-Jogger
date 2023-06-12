import 'package:flutter/material.dart';
import 'package:note_jogger/components/generic_button.dart';
import 'package:note_jogger/components/navigation_button.dart';
import 'package:note_jogger/components/notestaff/note_staff.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/pages/start_page.dart';

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
                child: NoteStaff(
              value: BassClefNotes.C2,
              imagePath: '',
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: GenericPageButton(
                    text: 'Go Back',
                    onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const StartPage()),
                        ))),
          )
        ],
      ),
    );
  }
}
