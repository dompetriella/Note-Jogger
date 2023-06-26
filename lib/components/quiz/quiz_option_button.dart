import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';
import 'answer_staging_bottom_sheet.dart';

class QuizOptionButton extends ConsumerWidget {
  final Enum gameMode;
  final String correctNote;
  final String givenNote;
  const QuizOptionButton({
    required this.gameMode,
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
              var timeElapsed = ref
                  .watch(stopwatchProvider.notifier)
                  .stopStopwatchAndReturnTime(ref);
              bool correct = false;
              if (correctNote == givenNote) {
                correct = true;
              }
              if (!correct) {
                ref.read(livesProvider.notifier).loseLife(context);
              }
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return AnswerStagingBottomSheet(
                    gameMode: gameMode,
                    correctNote: correctNote,
                    givenNote: givenNote,
                    timeElapsed: timeElapsed,
                  );
                },
              );
            },
            child: Text(
              givenNote,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            )));
  }
}
