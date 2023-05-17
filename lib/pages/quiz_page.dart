import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/pages/start_page.dart';
import 'package:note_jogger/provider.dart';

import '../components/notestaff/full_staff.dart';
import '../game_logic/quiz_generate.dart';
import '../models/notes.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

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
              "Treble Clef",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2),
            )),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary)),
                      fixedSize: const Size(150, 40)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const StartPage(),
                      ),
                    );
                  },
                  child: const Text('Return to Main')),
              GestureDetector(
                onTap: () => print('hello'),
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.lightbulb,
                      color: Theme.of(context).colorScheme.onSecondary,
                      size: 40,
                    )),
              ),
            ],
          ),
        ),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: const Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    HeartContainer(),
                    HeartContainer(),
                    HeartContainer()
                  ],
                ),
              ),
              QuizGenerate(note: TrebleClefNotes.C1),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizGenerate extends ConsumerWidget {
  final Enum note;
  final int numberOfButtons;
  final String titleText;
  const QuizGenerate(
      {super.key,
      required this.note,
      this.numberOfButtons = 5,
      this.titleText = "Name the Note"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                titleText,
                style: TextStyle(
                    fontSize: 24, color: Theme.of(context).colorScheme.primary),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: NoteStaff(
                  value: note.index,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  child: Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.center,
                      children: createQuizOptionButtons(note, numberOfButtons)),
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50),
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () => print('hello'),
              child: Text(
                'Next Question',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onTertiary),
              ))
        ],
      ),
    );
  }
}

class QuizOptionButton extends ConsumerWidget {
  final String note;
  const QuizOptionButton({
    required this.note,
    super.key,
  });

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
                fixedSize: const Size(80, 40)),
            onPressed: () => ref.watch(nextQuestionProvider.notifier).state =
                !ref.watch(nextQuestionProvider),
            child: Text(note)));
  }
}

class HeartContainer extends StatelessWidget {
  const HeartContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(9),
          border: Border.symmetric(
              vertical: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 2),
              horizontal: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 5)),
        ),
      ),
    );
  }
}
