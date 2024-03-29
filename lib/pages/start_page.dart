import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/components/intermission_widget/intermission_message.dart';
import 'package:note_jogger/game_logic/quiz_generate.dart';
import 'package:note_jogger/models/modes.dart';
import '../components/attention_button.dart';
import '../components/intermission_widget/intermission_widget.dart';
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
                        child: MediaQuery.of(context).size.height > 750
                            ? SvgPicture.asset('assets/road_divider.svg')
                            : SizedBox.shrink())),
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
                          )

                          // Transform.translate(
                          //   offset: Offset(0, 85),
                          //   child: AttentionButton(
                          //     text: 'Intermission Finish',
                          //     width: 240,
                          //     height: 70,
                          //     onPressed: () {
                          //       showIntermissionWidget(context, 8000,
                          //           'start_page', GameMode.ranked);
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
  final double width;
  final double height;
  const SignPost({
    this.height = 300,
    this.width = 19,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(20, -5),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary, width: 4)),
      ),
    );
  }
}
