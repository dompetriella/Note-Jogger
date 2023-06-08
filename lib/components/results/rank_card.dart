import 'package:flutter/material.dart';

import '../../game_logic/results.dart';
import '../../models/quiz_answer.dart';

class RankCard extends StatelessWidget {
  final QuizAnswer answer;
  final int index;
  const RankCard({
    required this.answer,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String rank = calculateRank(answer.timeElapsed).name;

    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: answer.correct
                  ? Theme.of(context).colorScheme.tertiary.withOpacity(.10)
                  : Theme.of(context).colorScheme.error.withOpacity(.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(.50))),
          child: Center(
              child: Text(
            answer.correct ? rank : '',
            style: TextStyle(
                height: 0,
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: getRankTextColor(rank)),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            '${index + 1}',
            style: const TextStyle(fontSize: 10),
          ),
        ),
        if (!answer.correct)
          Icon(
            Icons.close_sharp,
            weight: 50,
            size: 40,
            color: Theme.of(context).colorScheme.error,
          )
      ],
    );
  }
}
