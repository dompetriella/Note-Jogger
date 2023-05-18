import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/pages/start_page.dart';
import 'package:note_jogger/provider.dart';
import '../components/quiz/quiz_generate.dart';
import '../models/notes.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(.1),
            foregroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      "Treble Clef",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 2),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(.50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          fixedSize: const Size(75, 30)),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const StartPage(),
                          ),
                        );
                        ref
                            .watch(quizStagingProvider.notifier)
                            .resetQuizGenerate(ref);
                      },
                      child: Text(
                        'Quit',
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.onTertiary),
                      )),
                ),
              ],
            )),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Stack(
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
              ref
                  .watch(quizStagingProvider.notifier)
                  .state[ref.watch(quizGenerateIndexStagingProvider)]
            ],
          ),
        ),
      ),
    );
  }
}
