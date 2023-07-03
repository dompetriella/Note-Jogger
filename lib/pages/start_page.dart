import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/modes.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/pages/piano_lab_page.dart';
import 'package:note_jogger/pages/select_play_page.dart';
import '../components/attention_button.dart';
import '../provider.dart';
import 'select_mode_page.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            if (ref.watch(lightModeProvider) == ThemeMode.light)
              {ref.watch(lightModeProvider.notifier).state = ThemeMode.dark}
            else
              {ref.watch(lightModeProvider.notifier).state = ThemeMode.light}
          },
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary, width: 4),
              borderRadius: BorderRadius.circular(100)),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onTertiary,
            size: 30,
          ),
        ),
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
                          SignPost(),
                          AttentionButton(
                            text: 'START',
                            width: 240,
                            height: 70,
                            onPressed: () {
                              ref
                                  .watch(quizStagingProvider.notifier)
                                  .resetQuizGenerate(ref);
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SelectModePage(),
                                ),
                              );
                            },
                          ),
                          // Transform.translate(
                          //   offset: Offset(0, 85),
                          //   child: AttentionButton(
                          //     text: 'START',
                          //     width: 240,
                          //     height: 70,
                          //     onPressed: () {
                          //       ref
                          //           .watch(quizStagingProvider.notifier)
                          //           .resetQuizGenerate(ref);
                          //       Navigator.of(context).push(
                          //         MaterialPageRoute(
                          //           builder: (context) => const SelectModePage(),
                          //         ),
                          //       );
                          //     },
                          //   ),
                          // ),
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

class SignPost extends StatelessWidget {
  const SignPost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(20, -5),
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
