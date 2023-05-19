import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/components/quiz/quiz_generate.dart';
import 'package:note_jogger/models/single_quiz_result.dart';
import 'package:note_jogger/provider.dart';

class QuizOptionButton extends ConsumerWidget {
  final String correctNote;
  final String givenNote;
  const QuizOptionButton({
    required this.givenNote,
    required this.correctNote,
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
            onPressed: () {
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return AnswerStagingBottomSheet(
                    correctNote: correctNote,
                    givenNote: givenNote,
                  );
                },
              );
            },
            child: Text(givenNote)));
  }
}

class AnswerStagingBottomSheet extends ConsumerWidget {
  final String correctNote;
  final String givenNote;
  const AnswerStagingBottomSheet({
    required this.correctNote,
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
        QuizAnswer(correct: correct, secondsElapsed: 0, rankPercentage: 0.5));

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
