class QuizAnswer {
  final bool correct;
  final String timeElasped;
  final double rankPercentage;

  QuizAnswer(
      {required this.correct,
      required this.timeElasped,
      required this.rankPercentage});

  QuizAnswer copyWith({bool? correct, String? timeElasped}) {
    return QuizAnswer(
        correct: correct ?? false,
        timeElasped: timeElasped ?? '',
        rankPercentage: 0.5);
  }
}
