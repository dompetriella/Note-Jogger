import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider.dart';

class CorrectCount extends ConsumerWidget {
  const CorrectCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int answerCount = ref.read(quizAnswersProvider).length;
    int numberCorrect = ref
        .read(quizAnswersProvider)
        .where(
          (element) => element.correct,
        )
        .length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  offset: const Offset(0, 5))
            ],
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Correct',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.tertiary,
                      letterSpacing: 1),
                ),
                Text(
                  '$numberCorrect',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Missed',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.error,
                      letterSpacing: 1),
                ),
                Text('${answerCount - numberCorrect}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
