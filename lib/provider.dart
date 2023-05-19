import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/single_quiz_result.dart';
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

final quizAnswersProvider =
    StateNotifierProvider<QuizAnswersNotifier, List<QuizAnswer>>((ref) {
  return QuizAnswersNotifier();
});

class QuizAnswersNotifier extends StateNotifier<List<QuizAnswer>> {
  QuizAnswersNotifier() : super([]);

  addQuizAnswerToState(QuizAnswer quizAnswer) {
    var newState = state;
    newState.add(quizAnswer);
    state = newState;
  }

  finalizeAnswers() {
    var newState = state;
    newState = List.from(newState.reversed);
    state = newState;
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
      ref.watch(quizAnswersProvider.notifier).finalizeAnswers();
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
  }
}
