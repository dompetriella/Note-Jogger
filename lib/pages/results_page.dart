import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/game_logic/results.dart';
import 'package:note_jogger/provider.dart';
import 'package:note_jogger/utility.dart';
import '../components/navigation_button.dart';
import '../components/results/correct_count.dart';
import '../components/results/rank_result.dart';
import '../models/modes.dart';

class ResultsPage extends ConsumerWidget {
  final Enum gameMode;
  const ResultsPage({super.key, required this.gameMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Builder(builder: (context) {
          switch (gameMode) {
            case GameMode.intro:
              return IntroResult();
            case GameMode.training:
              return TrainingResult();
            case GameMode.ranked:
              return RankedResult();
            default:
              return TrainingResult();
          }
        }),
      ),
    );
  }
}

class IntroResult extends ConsumerWidget {
  const IntroResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Lesson\nComplete",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                      letterSpacing: 2),
                ).animate().fadeIn(duration: 800.ms).slideX(begin: 1.8),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: const NavigationButton(text: 'Return Home'),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingResult extends ConsumerWidget {
  const TrainingResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int percentCorrect = calculateCorrectAnswerPercentageAsInt(ref);
    double animationDuration = 2000;
    return SizedBox.expand(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:
                  MediaQuery.of(context).size.height * (percentCorrect / 100),
              color: ref.read(lightModeProvider) == ThemeMode.light
                  ? darkenColor(Theme.of(context).colorScheme.background,
                      percent: 5)
                  : lightenColor(Theme.of(context).colorScheme.background,
                      percent: 5),
            ).animate().scaleY(
                alignment: Alignment.bottomCenter,
                curve: Curves.decelerate,
                delay: 200.ms,
                duration: animationDuration.ms),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Results",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                        fontSize: 48,
                        letterSpacing: 2),
                  ).animate().fadeIn().scale(begin: Offset(2, 2)).then().scale(
                      begin: Offset(
                        1.2,
                        1.2,
                      ),
                      duration: (animationDuration / 2).ms),
                  Text(
                    '$percentCorrect%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.65),
                        fontWeight: FontWeight.w700,
                        fontSize: 60,
                        letterSpacing: 2),
                  ),
                  Text(
                    'Time: ${calculateTotalTimeInSeconds(ref)}s',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(.65),
                      fontWeight: FontWeight.w500,
                      fontSize: 36,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: const NavigationButton(text: 'Return Home'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RankedResult extends StatelessWidget {
  const RankedResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                const NavigationButton(text: 'Return Home'),
              ].animate(interval: 1.seconds).slideY().fadeIn(),
            ),
          ),
        ),
      ],
    );
  }
}
