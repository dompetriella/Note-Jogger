import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

final quizStagingProvider =
    StateNotifierProvider<QuizStagingNotifier, List<QuizGenerate>>((ref) {
  return QuizStagingNotifier();
});

class QuizStagingNotifier extends StateNotifier<List<QuizGenerate>> {
  QuizStagingNotifier() : super([]);

  nextQuestionAction(WidgetRef ref) {
    if (ref.watch(quizGenerateIndexStagingProvider) <
        ref.watch(quizGenerateTotalProvider) - 1) {
      ref.watch(quizGenerateIndexStagingProvider.notifier).state++;
    }
  }

  resetQuizGenerate(WidgetRef ref) {
    ref.watch(quizGenerateIndexStagingProvider.notifier).state = 0;
    ref.watch(quizGenerateTotalProvider.notifier).state = 0;
  }
}
