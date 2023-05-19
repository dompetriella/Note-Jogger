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
    rankCards
        .add(RankCard(answer: ref.watch(quizAnswersProvider)[i], index: i));
  }
  return rankCards;
}

String calculateRank(WidgetRef ref) {
  double percentageCorrect =
      calculateCorrectAnswers(ref) / ref.watch(quizGenerateTotalProvider);
  if (percentageCorrect < .70) {
    return 'D';
  }
  if (percentageCorrect < .80) {
    return 'C';
  }
  if (percentageCorrect < .90) {
    return 'B';
  } else {
    return 'A';
  }
}
