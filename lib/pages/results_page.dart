import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/components/quiz/quiz_generate.dart';
import 'package:note_jogger/game_logic/scoring.dart';
import 'package:note_jogger/pages/start_page.dart';

import '../components/quiz/heart_container.dart';
import '../models/quiz_answer.dart';
import '../provider.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: ListView(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Results",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w900,
                            fontSize: 48,
                            letterSpacing: 2),
                      ),
                    ),
                    // DetailedResults(),
                    const CorrectCount(),
                    const RankResult(),
                    const NavigationButton(),
                  ].animate(interval: 1.seconds).slideY().fadeIn(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationButton extends ConsumerWidget {
  const NavigationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GenericPageButton(
              text: 'Return Home',
              onPressed: () {
                ref.watch(quizStagingProvider.notifier).resetQuizGenerate(ref);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const StartPage(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

class RankResult extends ConsumerWidget {
  const RankResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String rank = calculateOverallRank(ref).name;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  offset: const Offset(0, 5))
            ],
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Individual Ranks')),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                spacing: 10,
                runSpacing: 10,
                children: displayRankCards(ref)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, top: 8.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Lives')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Rank',
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              Text(rank,
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      color: getRankTextColor(rank)))
            ],
          )
        ]),
      ),
    );
  }
}

class CorrectCount extends ConsumerWidget {
  const CorrectCount({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int answerCount = ref.read(quizAnswersProvider).length;
    int numberCorrect = ref
        .read(quizAnswersProvider)
        .where(
          (element) => element.correct,
        )
        .length;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 5,
                  offset: const Offset(0, 5))
            ],
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'Correct',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.tertiary,
                      letterSpacing: 1),
                ),
                Text(
                  '$numberCorrect',
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  'Missed',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.error,
                      letterSpacing: 1),
                ),
                Text('${answerCount - numberCorrect}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedResults extends ConsumerWidget {
  const DetailedResults({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: ref.watch(quizAnswersProvider).length,
        itemBuilder: ((context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: SingleResultContainer(),
            )));
  }
}

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

class SingleResultContainer extends StatelessWidget {
  const SingleResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(.5)),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
