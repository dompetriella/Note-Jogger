import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/components/select_mode/select_mode_button.dart';
import 'package:note_jogger/models/modes.dart';
import 'package:note_jogger/pages/piano_lab_page.dart';
import 'package:note_jogger/pages/select_play_page.dart';
import '../components/navigation_app_bar_title.dart';
import '../provider.dart';

class SelectModePage extends ConsumerWidget {
  const SelectModePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: NavigationAppBarTitle(
            title: 'Select Mode',
            routeName: 'start_page',
          ),
        ),
        body: ListView(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SelectModeButton(
                    text: 'Training',
                    onPressed: () {
                      ref
                          .watch(quizStagingProvider.notifier)
                          .resetQuizGenerate(ref);
                      context.goNamed('select_play_page',
                          extra: GameMode.training);
                    },
                  ),
                ),
                SelectModeButton(
                  text: 'Ranked \nMode',
                  onPressed: () {
                    ref
                        .watch(quizStagingProvider.notifier)
                        .resetQuizGenerate(ref);
                    context.goNamed('select_play_page', extra: GameMode.ranked);
                  },
                ),
                SelectModeButton(
                  text: 'Piano Lab',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PianoLabPage(),
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
