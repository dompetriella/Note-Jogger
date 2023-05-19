import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/game_logic/scoring.dart';
import 'package:note_jogger/pages/start_page.dart';

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
                    // results list, need the room for now
                    // will later wrap in an expander
                    // Expanded(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Theme.of(context).colorScheme.background,
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(
                    //             width: 2,
                    //             color: Theme.of(context)
                    //                 .colorScheme
                    //                 .primary
                    //                 .withOpacity(.50))),
                    //     child: ListView.builder(
                    //         itemCount: ref.watch(quizAnswersProvider).length,
                    //         itemBuilder: ((context, index) => Padding(
                    //               padding: const EdgeInsets.symmetric(
                    //                   horizontal: 8.0, vertical: 4.0),
                    //               child: SingleResultContainer(),
                    //             ))),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      letterSpacing: 1),
                                ),
                                Text(
                                  '${calculateCorrectAnswers(ref)}',
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Wrong',
                                  style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.w800,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      letterSpacing: 1),
                                ),
                                Text(
                                    '${ref.read(quizGenerateTotalProvider) - calculateCorrectAnswers(ref)}',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).colorScheme.primary),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                spacing: 10,
                                runSpacing: 10,
                                children: displayRankCards(ref)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Rank',
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onBackground),
                              ),
                              Text('C',
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.w900,
                                      color:
                                          Theme.of(context).colorScheme.error))
                            ],
                          )
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GenericPageButton(
                              text: 'Return Home',
                              onPressed: () {
                                ref
                                    .watch(quizStagingProvider.notifier)
                                    .resetQuizGenerate(ref);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const StartPage(),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RankCard extends StatelessWidget {
  final bool correct;
  final int index;
  const RankCard({
    required this.correct,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: correct
                  ? Theme.of(context).colorScheme.tertiary.withOpacity(.10)
                  : Theme.of(context).colorScheme.error.withOpacity(.10),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .secondary
                      .withOpacity(.50))),
        ),
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(
            '${index + 1}',
            style: const TextStyle(fontSize: 10),
          ),
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
