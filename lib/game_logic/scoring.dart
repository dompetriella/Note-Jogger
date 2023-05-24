import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/provider.dart';

import '../models/ranks.dart';
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

Enum calculateRank(double timeElapsed) {
  if (timeElapsed <= GLOBAL_sRankTimeLimit) return Rank.S;
  if (timeElapsed <= GLOBAL_aRankTimeLimit) return Rank.A;
  if (timeElapsed <= GLOBAL_bRankTimeLimit) return Rank.B;
  if (timeElapsed <= GLOBAL_cRankTimeLimit) return Rank.C;
  return Rank.D;
}

Enum calculateOverallRank(WidgetRef ref) {
  if (ref.read(livesProvider).every((element) => element == false)) {
    return Rank.D;
  }
  double totalTime = 0;
  int numberOfCorrectAnswers = 0;
  int livesRemaining =
      ref.read(livesProvider).where((element) => element == true).length;
  for (var answer in ref.read(quizAnswersProvider)) {
    if (answer.correct) {
      totalTime += answer.timeElapsed;
      numberOfCorrectAnswers++;
    }
  }
  double timeRanking = totalTime / numberOfCorrectAnswers;
  double finalRanking = timeRanking - (livesRemaining * GLOBAL_heartBonus);

  return calculateRank(finalRanking);
}

Color getRankTextColor(String rank) {
  if (rank == 'S') {
    return Colors.amber;
  }
  if (rank == 'A') {
    return Colors.deepOrange;
  }
  if (rank == 'B') {
    return Colors.green;
  }
  if (rank == 'S') {
    return Colors.lightBlue;
  }
  return Colors.blue;
}
