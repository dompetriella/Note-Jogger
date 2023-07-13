import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/components/attention_button.dart';
import 'package:note_jogger/components/quiz/heart_container.dart';
import 'package:note_jogger/components/results/rank_card.dart';
import 'package:note_jogger/game_logic/results.dart';
import 'package:note_jogger/provider.dart';
import 'package:note_jogger/utility.dart';
import 'package:rive/rive.dart';
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
              return const IntroResult();
            case GameMode.training:
              return const TrainingResult();
            case GameMode.ranked:
              return const RankedResult();
            default:
              return const TrainingResult();
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
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NavigationButton(text: 'Return Home'),
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
    double animationDuration = 6000;

    return SizedBox.expand(
      child: Stack(
        children: [
          Center(
              child: SvgPicture.asset('assets/empty_bottle.svg')
                  .animate()
                  .shake(duration: 400.ms)
                  .scale(delay: 800.ms, end: Offset(10, 10), duration: 800.ms)),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 91,
              child: RiveAnimation.asset(
                'assets/liquid_background_animated.riv',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  children: [
                    Text(
                      'RESULTS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 48,
                          letterSpacing: 4),
                    ).animate(delay: 800.ms).fadeIn().slideY().scale(),
                    Divider()
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Correct\n$percentCorrect%',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 36,
                          letterSpacing: 4),
                    ).animate(delay: 800.ms).fadeIn(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Time\n${calculateTotalTimeInSeconds(ref)}s',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 36,
                          letterSpacing: 4),
                    ).animate(delay: 800.ms).fadeIn(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'XP\nN/A',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 36,
                          letterSpacing: 4),
                    ).animate(delay: 800.ms).fadeIn(),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AttentionButton(
                  text: 'RETURN TO TRAINING',
                  onPressed: () {
                    context.goNamed('select_play_page',
                        extra: GameMode.training);
                    ref
                        .read(quizStagingProvider.notifier)
                        .resetQuizGenerate(ref);
                  },
                  height: 85,
                  width: 220,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RankedResult extends ConsumerWidget {
  const RankedResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    context.goNamed('select_play_page', extra: GameMode.ranked);
                    ref
                        .watch(quizStagingProvider.notifier)
                        .resetQuizGenerate(ref);
                  },
                  child: Icon(
                    Icons.close,
                    size: 42,
                    color: Theme.of(context).colorScheme.error.withOpacity(.50),
                  ))),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.symmetric(
                    horizontal: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 4))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                  child: Text(
                'RESULTS',
                style: TextStyle(
                    fontSize: 60,
                    color: Theme.of(context).colorScheme.onTertiary,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 6),
              )),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  'Total Time'.toUpperCase(),
                  style: TextStyle(fontSize: 22, letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Divider(
                  height: 4,
                  thickness: 4,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Text(
                '${calculateTotalTimeInSeconds(ref)}s',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 4,
                    fontSize: 60),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  'LIVES LEFT'.toUpperCase(),
                  style: TextStyle(fontSize: 22, letterSpacing: 1),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Divider(
                  height: 4,
                  thickness: 4,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: ref
                        .watch(livesProvider)
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: HeartContainer(
                                size: 3,
                                isFilled: e,
                              ),
                            ))
                        .toList()),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: Text(
                  'RANK'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 72,
                      height: 0,
                      letterSpacing: 7,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                child: Divider(
                  height: 0,
                  thickness: 4,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              FinalRankResult(),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: AttentionButton(
                  text: 'EXIT RESULTS',
                  onPressed: () => context.goNamed('select_play_page',
                      extra: GameMode.ranked)))
        ]),
      ],
    );
  }
}

class FinalRankResult extends ConsumerWidget {
  const FinalRankResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var overallRank = calculateOverallRank(ref);
    return Center(
      child: Container(
        height: 250,
        width: 265,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary, width: 4)),
        child: Center(
          child: Container(
            height: 200,
            width: 215,
            decoration: BoxDecoration(
              color: getRankTextColor(overallRank.name),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                overallRank.name,
                style:
                    TextStyle(height: .8, fontSize: 240, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
