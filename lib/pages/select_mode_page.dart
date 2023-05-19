import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/game_logic/quiz_generate.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/pages/quiz_page.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(.1),
          foregroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            "Select Mode",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          )),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(32.0),
                child: Column(
                    children: [
                  ModeButton(
                    title: 'Treble Clef (Hard)',
                    subText: 'All notes in the treble clef',
                  ),
                  ModeButton(
                    title: 'Bass Cleff (Hard)',
                    subText: 'All notes in the bass clef',
                  ),
                ]
                        .animate(interval: 150.ms, delay: 150.ms)
                        .slideX(duration: 300.ms, curve: Curves.easeInOut)
                        .fadeIn())),
          ],
        ),
      ),
    ));
  }
}

class ModeButton extends ConsumerWidget {
  final String title;
  final String subText;
  const ModeButton({super.key, required this.title, this.subText = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)),
              fixedSize: const Size(300, 100)),
          onPressed: () {
            createNewQuizGenerateList(ref, 5, TrebleClefNotes.values.toList());
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuizPage(),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              ),
              if (subText != '')
                Text(
                  subText,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
            ],
          )),
    );
  }
}
