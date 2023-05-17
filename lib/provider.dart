import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/pages/quiz_page.dart';

final nextQuestionProvider = StateProvider<bool>((ref) {
  return false;
});

final quizStagingProvider =
    StateNotifierProvider<QuizStagingNotifier, List<QuizGenerate>>((ref) {
  return QuizStagingNotifier();
});

class QuizStagingNotifier extends StateNotifier<List<QuizGenerate>> {
  QuizStagingNotifier() : super([]);
}
