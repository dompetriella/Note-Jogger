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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onSecondary,
            size: 30,
          ),
        ),
        body: ListView(
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
            Column(
              children: [
                AttentionButton(
                  text: 'START',
                  width: 210,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
