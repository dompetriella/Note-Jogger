class QuizAnswer {
  final bool correct;
  final String timeElasped;
  final String rank;

  QuizAnswer(
      {required this.correct, required this.timeElasped, this.rank = 'C'});

  QuizAnswer copyWith({bool? correct, String? timeElasped}) {
    return QuizAnswer(
        correct: correct ?? false, timeElasped: timeElasped ?? '', rank: rank);
  }
}
