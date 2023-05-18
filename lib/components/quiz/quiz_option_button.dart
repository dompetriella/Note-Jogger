import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/components/quiz/quiz_generate.dart';

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
                  return AnswerStagingBottomSheet();
                },
              );
            },
            child: Text(givenNote)));
  }
}

class AnswerStagingBottomSheet extends StatelessWidget {
  const AnswerStagingBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Center(child: NextQuestionButton()),
    );
  }
}
