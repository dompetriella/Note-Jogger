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
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 3)),
                fixedSize: const Size(80, 45)),
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
                backgroundColor: Theme.of(context).colorScheme.primary,
                constraints: const BoxConstraints(maxWidth: 350),
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10)),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 4)),
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
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSecondary),
            )));
  }
}
