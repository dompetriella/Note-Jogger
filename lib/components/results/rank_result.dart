import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../game_logic/results.dart';
import '../../provider.dart';
import '../quiz/heart_container.dart';

class RankResult extends ConsumerWidget {
  const RankResult({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const Padding(
            padding: EdgeInsets.only(left: 28.0, top: 8.0),
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
          const Padding(
            padding: EdgeInsets.only(left: 28.0, top: 8.0),
            child: Align(alignment: Alignment.centerLeft, child: Text('Lives')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: ref
                .watch(livesProvider)
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: HeartContainer(
                        size: 2,
                        isFilled: e,
                      ),
                    ))
                .toList()
                .animate(interval: 200.ms, delay: 2000.ms)
                .slideY(begin: -2, duration: 400.ms)
                .scale()
                .fadeIn(),
          ),
          FinalRankResult(text: calculateOverallRank(ref).name)
        ]),
      ),
    );
  }
}

class FinalRankResult extends StatelessWidget {
  final String text;
  const FinalRankResult({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Rank',
          style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(text,
                style: TextStyle(
                    fontSize: 84,
                    fontWeight: FontWeight.w900,
                    color: getRankTextColor(text)))
            .animate(delay: 3000.ms)
            .rotate(begin: .25)
            .fadeIn()
            .scale(begin: Offset(3, 3))
      ],
    );
  }
}
