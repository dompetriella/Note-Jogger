import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/quiz_answer.dart';
import '../../provider.dart';
import 'next_question_button.dart';

class AnswerStagingBottomSheet extends ConsumerWidget {
  final double timeElapsed;
  final String correctNote;
  final String givenNote;
  const AnswerStagingBottomSheet({
    required this.correctNote,
    required this.timeElapsed,
    required this.givenNote,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool correct = false;
    if (correctNote == givenNote) {
      correct = true;
    }
    ref.watch(quizAnswersProvider.notifier).addQuizAnswerToState(
        QuizAnswer(
            correct: correct, timeElapsed: timeElapsed, rankPercentage: 0.5),
        ref);

    return SizedBox(
      height: 200,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            correct ? '$givenNote is Correct!' : '$givenNote is Incorrect',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                color: correct
                    ? Theme.of(context).colorScheme.tertiary
                    : Theme.of(context).colorScheme.error),
          ),
          if (!correct)
            Text(
              'The correct answer is $correctNote',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.secondary),
            ),
          const NextQuestionButton(),
        ],
      )),
    );
  }
}
