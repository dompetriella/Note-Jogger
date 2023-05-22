import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/quiz_answer.dart';
import 'package:note_jogger/pages/results_page.dart';
import 'components/quiz/quiz_generate.dart';

final lightModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final quizGenerateIndexStagingProvider = StateProvider<int>((ref) {
  return 0;
});

final quizGenerateTotalProvider = StateProvider<int>((ref) {
  return 0;
});

final stopwatchTimeProvider = StateProvider<Stopwatch>((ref) {
  return Stopwatch();
});

final stopwatchProvider =
    StateNotifierProvider<StopwatchNotifier, List<double>>((ref) {
  return StopwatchNotifier();
});

class StopwatchNotifier extends StateNotifier<List<double>> {
  StopwatchNotifier() : super([]);

  startStopwatch(WidgetRef ref) {
    ref.read(stopwatchTimeProvider).start();
  }

  stopStopwatch(WidgetRef ref) {
    ref.read(stopwatchTimeProvider).stop();
  }

  resetStopwatch(WidgetRef ref) {
    ref.read(stopwatchTimeProvider).reset();
    print('stopwatch stopped');
  }

  double stopStopwatchAndReturnTime(WidgetRef ref) {
    stopStopwatch(ref);
    var timeElapsed =
        ref.read(stopwatchTimeProvider).elapsed.inMilliseconds.toDouble();
    ref.read(stopwatchTimeProvider).reset();
    return timeElapsed;
  }
}

final quizAnswersProvider =
    StateNotifierProvider<QuizAnswersNotifier, List<QuizAnswer>>((ref) {
  return QuizAnswersNotifier();
});

class QuizAnswersNotifier extends StateNotifier<List<QuizAnswer>> {
  QuizAnswersNotifier() : super([]);

  addQuizAnswerToState(QuizAnswer quizAnswer, WidgetRef ref) {
    var newState = state;
    newState.add(quizAnswer);
    state = newState;
  }

  finalizeAnswers(WidgetRef ref) {
    List<QuizAnswer> newState = state;
    List<QuizAnswer> answers = List.from(newState.reversed);
    state = answers;
  }
}

final quizStagingProvider =
    StateNotifierProvider<QuizStagingNotifier, List<QuizGenerate>>((ref) {
  return QuizStagingNotifier();
});

class QuizStagingNotifier extends StateNotifier<List<QuizGenerate>> {
  QuizStagingNotifier() : super([]);

  nextQuestionAction(WidgetRef ref, BuildContext context) {
    if (ref.watch(quizGenerateIndexStagingProvider) <
        ref.watch(quizGenerateTotalProvider) - 1) {
      ref.watch(quizGenerateIndexStagingProvider.notifier).state++;
    } else {
      ref.watch(quizAnswersProvider.notifier).finalizeAnswers(ref);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const ResultsPage(),
        ),
      );
    }
  }

  resetQuizGenerate(WidgetRef ref) {
    ref.watch(quizGenerateIndexStagingProvider.notifier).state = 0;
    ref.watch(quizGenerateTotalProvider.notifier).state = 0;
    ref.watch(quizAnswersProvider.notifier).state = [];
    ref.read(stopwatchProvider.notifier).state = [];
    ref.read(stopwatchTimeProvider).reset();
  }
}
