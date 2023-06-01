import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider.dart';

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
          ref
              .watch(quizStagingProvider.notifier)
              .nextQuestionAction(ref, context);

          ref.read(stopwatchProvider.notifier).startStopwatch(ref);
        },
        child: Text(
          'Continue',
          style: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
        ));
  }
}
