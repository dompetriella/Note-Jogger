import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/provider.dart';

import '../components/results/rank_card.dart';
import '../models/ranks.dart';

int calculateCorrectAnswers(WidgetRef ref) {
  int correct = 0;
  for (var answer in ref.read(quizAnswersProvider)) {
    if (answer.correct) correct++;
  }
  return correct;
}

double calculateCorrectAnswerPercentageAsDouble(WidgetRef ref) {
  int correct = 0;
  for (var answer in ref.read(quizAnswersProvider)) {
    if (answer.correct) correct++;
  }
  double percentCorrect = correct / ref.read(quizAnswersProvider).length;
  return percentCorrect;
}

int calculateCorrectAnswerPercentageAsInt(WidgetRef ref) {
  double percentCorrect = calculateCorrectAnswerPercentageAsDouble(ref) * 100;
  return percentCorrect.toInt();
}

int calculateIncorrectAnswers(WidgetRef ref) {
  return ref.read(quizAnswersProvider).length - calculateCorrectAnswers(ref);
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

double calculateTotalTimeInMiliseconds(WidgetRef ref) {
  double totalTime = 0;
  for (var answer in ref.read(quizAnswersProvider)) {
    totalTime += answer.timeElapsed;
  }
  return totalTime;
}

String calculateTotalTimeInSeconds(WidgetRef ref) {
  double secondsWithDecimal = calculateTotalTimeInMiliseconds(ref) / 1000;
  return secondsWithDecimal.toStringAsFixed(1);
}

Enum calculateOverallRank(WidgetRef ref) {
  if (calculateIncorrectAnswers(ref) > GLOBAL_lives) {
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
  double finalTimeRanking = timeRanking - (livesRemaining * GLOBAL_heartBonus);

  // if there's no lives left, drop a rank
  Enum finalRank = calculateRank(finalTimeRanking);
  if (livesRemaining == 0 && finalRank != Rank.S) {
    int rankIndex = finalRank.index;
    rankIndex++;
    return Rank.values[rankIndex];
  }

  return finalRank;
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
