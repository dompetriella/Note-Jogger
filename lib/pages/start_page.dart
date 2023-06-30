import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/models/modes.dart';
import 'package:note_jogger/pages/piano_lab_page.dart';
import 'package:note_jogger/pages/select_mode_page.dart';
import '../components/generic_button.dart';
import '../provider.dart';
import 'experiment_page.dart';

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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "NOTE\nJOGGER",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 60,
                        letterSpacing: 6),
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
                          GenericPageButton(
                            text: 'Piano Lab',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const PianoLabPage(),
                                ),
                              );
                            },
                          ),
                          GenericPageButton(
                            text: 'Testing Page',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ExperimentPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
