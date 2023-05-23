class QuizAnswer {
  final bool correct;
  final double timeElapsed;
  final double rankPercentage;

  QuizAnswer(
      {required this.correct,
      required this.timeElapsed,
      required this.rankPercentage});

  QuizAnswer copyWith(
      {bool? correct, double? timeElasped, double? rankPercentage}) {
    return QuizAnswer(
        correct: correct ?? false,
        timeElapsed: timeElapsed ?? 0,
        rankPercentage: rankPercentage ?? 0);
  }
}
