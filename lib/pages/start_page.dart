import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/pages/select_mode_page.dart';

import '../provider.dart';

class StartPage extends ConsumerWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Theme.of(context).colorScheme.onPrimary,
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
                              text: 'Start',
                              onPressed: () {
                                ref
                                    .watch(quizStagingProvider.notifier)
                                    .resetQuizGenerate(ref);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SelectModePage(),
                                  ),
                                );
                              },
                            ),
                            GenericPageButton(
                              text: 'Settings',
                              onPressed: () {
                                print('Settings');
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () {
                    if (ref.watch(lightModeProvider) == ThemeMode.light) {
                      ref.watch(lightModeProvider.notifier).state =
                          ThemeMode.dark;
                    } else {
                      ref.watch(lightModeProvider.notifier).state =
                          ThemeMode.light;
                    }
                  },
                  child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.lightbulb,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: 30,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GenericPageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double height;
  final double width;
  const GenericPageButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height = 60,
      this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)),
              fixedSize: Size(width, height)),
          onPressed: onPressed,
          child: Text(text)),
    );
  }
}