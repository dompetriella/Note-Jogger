import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/pages/start_page.dart';
import 'package:note_jogger/provider.dart';

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
                  child: Text(
                    "Treble Clef",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2),
                  ),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const StartPage(),
                            ),
                          );
                          ref
                              .watch(quizStagingProvider.notifier)
                              .resetQuizGenerate(ref);
                        },
                        child: const Icon(
                          Icons.close,
                          size: 28,
                        ))),
              ],
            )),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // TODO: Create lives system
                    // HeartContainer(),
                    // HeartContainer(),
                    // HeartContainer()
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
