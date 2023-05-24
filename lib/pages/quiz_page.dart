import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/provider.dart';

import '../components/quiz/heart_container.dart';

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
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '',
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
                          ref
                              .read(quizStagingProvider.notifier)
                              .resetQuizGenerate(ref);
                          context.go('/');
                          ref
                              .watch(quizStagingProvider.notifier)
                              .resetQuizGenerate(ref);
                        },
                        child: Icon(
                          Icons.close,
                          size: 42,
                          color: Theme.of(context)
                              .colorScheme
                              .error
                              .withOpacity(.50),
                        ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: ref
                      .watch(livesProvider)
                      .map((e) => HeartContainer(
                            isFilled: e,
                          ))
                      .toList(),
                ),
              ],
            )),
        body: Container(
          color: Theme.of(context).colorScheme.onPrimary,
          child: ref
              .watch(quizStagingProvider.notifier)
              .state[ref.watch(quizGenerateIndexStagingProvider)],
        ),
      ),
    );
  }
}
