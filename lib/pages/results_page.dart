import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/navigation_button.dart';
import '../components/results/correct_count.dart';
import '../components/results/rank_result.dart';

class ResultsPage extends ConsumerWidget {
  final Enum gameMode;
  const ResultsPage({super.key, required this.gameMode});

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
                    const NavigationButton(text: 'Return Home'),
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
