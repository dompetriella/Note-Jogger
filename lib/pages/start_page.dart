import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/modes.dart';
import 'package:note_jogger/pages/select_mode_page.dart';

import '../components/generic_button.dart';
import '../provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            if (ref.watch(lightModeProvider) == ThemeMode.light)
              {ref.watch(lightModeProvider.notifier).state = ThemeMode.dark}
            else
              {ref.watch(lightModeProvider.notifier).state = ThemeMode.light}
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onSecondary,
            size: 30,
          ),
        ),
        body: Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.background,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Note \nJogger",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: 60,
                          letterSpacing: 2),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          children: [
                            GenericPageButton(
                              text: 'Training',
                              onPressed: () {
                                ref
                                    .watch(quizStagingProvider.notifier)
                                    .resetQuizGenerate(ref);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SelectModePage(
                                      gameMode: GameMode.training,
                                    ),
                                  ),
                                );
                              },
                            ),
                            GenericPageButton(
                              text: 'Ranked Mode',
                              onPressed: () {
                                ref
                                    .watch(quizStagingProvider.notifier)
                                    .resetQuizGenerate(ref);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SelectModePage(
                                      gameMode: GameMode.ranked,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )),
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
