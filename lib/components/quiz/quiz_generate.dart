import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_logic/quiz_generate.dart';
import '../../provider.dart';
import '../notestaff/full_staff.dart';

class QuizGenerate extends ConsumerWidget {
  final Enum note;
  final int numberOfButtons;
  final int numberOfQuizGenerate;
  final String titleText;
  const QuizGenerate(
      {super.key,
      required this.note,
      required this.numberOfQuizGenerate,
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
        ],
      ),
    );
  }
}

class NextQuestionButton extends ConsumerWidget {
  const NextQuestionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(200, 50),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          ref.watch(quizStagingProvider.notifier).nextQuestionAction(ref);
        },
        child: Text(
          'Continue',
          style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
        ));
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
