class QuizAnswer {
  final bool correct;
  final double timeElapsed;

  QuizAnswer({
    required this.correct,
    required this.timeElapsed,
  });

  QuizAnswer copyWith({bool? correct, double? timeElasped}) {
    return QuizAnswer(correct: correct ?? false, timeElapsed: timeElapsed ?? 0);
  }
}
