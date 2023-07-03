import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/quiz_answer.dart';
import '../../provider.dart';
import 'next_question_button.dart';

class AnswerStagingBottomSheet extends ConsumerWidget {
  final double timeElapsed;
  final String correctNote;
  final String givenNote;
  final Enum gameMode;
  const AnswerStagingBottomSheet({
    required this.correctNote,
    required this.timeElapsed,
    required this.givenNote,
    required this.gameMode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool correct = false;
    if (correctNote == givenNote) {
      correct = true;
    }
    ref.watch(quizAnswersProvider.notifier).addQuizAnswerToState(
        QuizAnswer(correct: correct, timeElapsed: timeElapsed), ref);

    return SizedBox(
      height: 200,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            correct ? 'Correct!' : '$givenNote is Incorrect',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                letterSpacing: 4,
                color: correct
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.error),
          ),
          if (!correct)
            Text(
              'The correct answer is $correctNote',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).colorScheme.onSecondary),
            ),
          NextQuestionButton(
            gameMode: gameMode,
          ),
        ],
      )),
    );
  }
}
