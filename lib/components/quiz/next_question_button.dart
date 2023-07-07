import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/components/intermission_widget/intermission_message.dart';
import '../../models/modes.dart';
import '../../provider.dart';

class NextQuestionButton extends ConsumerWidget {
  final Enum gameMode;
  const NextQuestionButton({super.key, required this.gameMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(250, 62),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary, width: 4),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pop(context);
          if (gameMode != GameMode.intro) {
            ref
                .watch(quizStagingProvider.notifier)
                .nextQuestionAction(ref, context, gameMode);

            ref.read(stopwatchProvider.notifier).startStopwatch(ref);
          }
        },
        child: Text(
          'Continue'.toUpperCase(),
          style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              letterSpacing: 2),
        ));
  }
}
