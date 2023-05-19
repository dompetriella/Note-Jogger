import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';

import '../pages/results_page.dart';

int calculateCorrectAnswers(WidgetRef ref) {
  int correct = 0;
  for (var answer in ref.read(quizAnswersProvider)) {
    if (answer.correct) correct++;
  }
  return correct;
}

List<RankCard> displayRankCards(WidgetRef ref) {
  List<RankCard> rankCards = [];
  for (var i = 0; i < ref.watch(quizAnswersProvider).length; i++) {
    rankCards.add(
        RankCard(correct: ref.watch(quizAnswersProvider)[i].correct, index: i));
  }
  return rankCards;
}
