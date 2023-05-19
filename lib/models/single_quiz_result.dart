class QuizAnswer {
  final bool correct;
  final double secondsElapsed;
  final double rankPercentage;

  QuizAnswer(
      {required this.correct,
      required this.secondsElapsed,
      required this.rankPercentage});

  QuizAnswer copyWith({bool? correct, String? timeElasped}) {
    return QuizAnswer(
        correct: correct ?? false,
        secondsElapsed: secondsElapsed ?? 0,
        rankPercentage: 0.5);
  }
}
