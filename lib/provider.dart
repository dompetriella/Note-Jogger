import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/quiz/quiz_generate.dart';

final lightModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final quizGenerateIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final quizStagingProvider =
    StateNotifierProvider<QuizStagingNotifier, List<QuizGenerate>>((ref) {
  return QuizStagingNotifier();
});

class QuizStagingNotifier extends StateNotifier<List<QuizGenerate>> {
  QuizStagingNotifier() : super([]);

  nextQuestionAction(WidgetRef ref, int numberOfQuizGenerate) {
    if (ref.watch(quizGenerateIndexProvider) < numberOfQuizGenerate - 1) {
      ref.watch(quizGenerateIndexProvider.notifier).state++;
    }
  }

  resetQuizGenerate(WidgetRef ref) {
    ref.watch(quizGenerateIndexProvider.notifier).state = 0;
  }
}
