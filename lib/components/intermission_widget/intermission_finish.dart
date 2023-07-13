import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/pages/start_page.dart';

class IntermissionFinish extends HookConsumerWidget {
  final int duration;
  final String endRoute;
  final Enum gameMode;
  const IntermissionFinish(
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
    double animationDuration = (duration - breathingDelay) * .75;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          body: Stack(
            children: [
              Container(
                color: Theme.of(context).colorScheme.background,
              )
                  .animate(delay: breathingDelay.ms)
                  .fadeIn(duration: (animationDuration / 2).ms),
              Center(
                child: Stack(
                  children: [
                    SignPost(
                      width: 15,
                      height: 260,
                    ),
                    Positioned(
                        left: 240,
                        child: SignPost(
                          width: 15,
                          height: 260,
                        )),
                    Container(
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).colorScheme.onPrimary)),
                      child: Center(
                        child: Text(
                          'FINISH',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w400,
                              height: 0.4,
                              letterSpacing: 4,
                              color: Theme.of(context).colorScheme.onTertiary),
                        ),
                      ),
                    ),
                  ],
                )
                    .animate()
                    .slideY(duration: animationDuration.ms)
                    .fadeIn(duration: animationDuration.ms)
                    .scale(
                        duration: animationDuration.ms,
                        begin: Offset(0, 0),
                        end: Offset(2, 2))
                    .then()
                    .slideY(begin: 0.3)
                    .fadeOut(duration: 2000.ms),
              ),
            ],
          )),
    );
  }
}
