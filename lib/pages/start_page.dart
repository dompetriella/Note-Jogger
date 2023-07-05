import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/pages/intermission_page.dart';
import '../components/attention_button.dart';
import '../provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // TODO: Add back in floating action button
        // floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () => {
        //     if (ref.watch(lightModeProvider) == ThemeMode.light)
        //       {ref.watch(lightModeProvider.notifier).state = ThemeMode.dark}
        //     else
        //       {ref.watch(lightModeProvider.notifier).state = ThemeMode.light}
        //   },
        //   shape: RoundedRectangleBorder(
        //       side: BorderSide(
        //           color: Theme.of(context).colorScheme.onPrimary, width: 4),
        //       borderRadius: BorderRadius.circular(100)),
        //   backgroundColor: Theme.of(context).colorScheme.tertiary,
        //   child: Icon(
        //     Icons.settings,
        //     color: Theme.of(context).colorScheme.onTertiary,
        //     size: 30,
        //   ),
        // ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 600.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    border: Border(
                        top: BorderSide(
                            color: Theme.of(context).colorScheme.onPrimary,
                            width: 4))),
                child: Center(
                    child: SizedBox(
                        width: 135,
                        child: SvgPicture.asset('assets/road_divider.svg'))),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Center(
                    child: Text(
                      "NOTE\nJOGGER",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w500,
                          fontSize: 60,
                          letterSpacing: 8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          const SignPost(),
                          AttentionButton(
                            text: 'START',
                            width: 240,
                            height: 70,
                            onPressed: () {
                              ref
                                  .watch(quizStagingProvider.notifier)
                                  .resetQuizGenerate(ref);
                              context.goNamed('select_mode_page');
                            },
                          ),
                          Transform.translate(
                            offset: Offset(0, 85),
                            child: AttentionButton(
                              text: 'Intermission Widget',
                              width: 240,
                              height: 70,
                              onPressed: () {
                                showIntermissionWidget(context, 5000, []);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

showIntermissionWidget(
    BuildContext context, int duration, List<Widget> contents) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) =>
          IntermissionWidget(duration: duration, contents: contents),
    ),
  );
  Timer(Duration(milliseconds: duration), () {
    Navigator.of(context).pop();
  });
}

class SignPost extends StatelessWidget {
  const SignPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(20, -5),
      child: Container(
        height: 300,
        width: 19,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary, width: 4)),
      ),
    );
  }
}
