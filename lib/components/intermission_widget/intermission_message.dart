import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/components/intermission_widget/intermission_messages.dart';
import 'package:note_jogger/utility.dart';

class IntermissionMessage extends HookConsumerWidget {
  final int duration;
  final String endRoute;
  final Enum gameMode;
  const IntermissionMessage(
      {super.key,
      required this.duration,
      required this.endRoute,
      required this.gameMode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initFunction = useCallback((_) async {
      Timer(Duration(milliseconds: duration), () async {
        context.goNamed(endRoute, extra: gameMode);
        if (Navigator.canPop(context)) {
          Future.delayed(200.ms);
        }
      });
    }, []);

    useEffect(() {
      initFunction(null);
    }, []);

    int breathingDelay = 400;
    int animationDuration = duration - (breathingDelay * 2);

    double firstMessageDelay = animationDuration * .15;
    double secondMessageDelay = animationDuration * .50;

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getRandomListItem(topMessage).toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                      color: Theme.of(context).colorScheme.tertiary),
                ).animate(delay: firstMessageDelay.ms).fadeIn().slideY(),
                Text(
                  getRandomListItem(bottomMessage).toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 4,
                      color: Theme.of(context).colorScheme.onPrimary),
                )
                    .animate(delay: secondMessageDelay.ms)
                    .fadeIn()
                    .slideY(begin: 0.9),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
