import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/game_logic/quiz_generate.dart';
import 'package:note_jogger/models/notes.dart';
import 'package:note_jogger/pages/quiz_page.dart';
import 'package:note_jogger/provider.dart';

class SelectModePage extends StatelessWidget {
  const SelectModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(.1),
          foregroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            "Select Mode",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          )),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: ListView(
          children: const [
            Padding(padding: EdgeInsets.all(32.0), child: QuizModes()),
          ],
        ),
      ),
    ));
  }
}

class QuizModes extends StatelessWidget {
  const QuizModes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpandableCatergory(
        title: 'Treble Clef',
        modeButtonTree: QuizCatergory(
          modeButtons: [
            ModeButton(
              title: 'Treble Clef (Easy)',
              subText: 'Only notes on the lines of the staff',
              modeNotes: trimClefNotes(TrebleClefNotes.values.toList(),
                  TrebleClefNotes.E1.index, TrebleClefNotes.F2.index,
                  lineNotesOnly: true),
            ),
            ModeButton(
              title: 'Treble Clef (Medium)',
              subText: 'Only notes on the staff',
              modeNotes: trimClefNotes(
                TrebleClefNotes.values.toList(),
                TrebleClefNotes.E1.index,
                TrebleClefNotes.F2.index,
              ),
            ),
            ModeButton(
              title: 'Treble Clef (Hard)',
              subText: 'The staff notes and above',
              modeNotes: trimClefNotes(
                TrebleClefNotes.values.toList(),
                TrebleClefNotes.E1.index,
                TrebleClefNotes.G3.index,
              ),
            ),
            ModeButton(
              title: 'Treble Clef (Expert)',
              subText: 'All notes',
              modeNotes: TrebleClefNotes.values.toList(),
            ),
          ],
        ),
      ),
      ExpandableCatergory(
          title: 'Bass Clef',
          modeButtonTree: QuizCatergory(modeButtons: [
            ModeButton(
              title: 'Bass Clef (Easy)',
              subText: 'Only notes on lines of the staff',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(BassClefNotes.values.toList(),
                  BassClefNotes.G1.index, BassClefNotes.A2.index,
                  lineNotesOnly: true),
            ),
            ModeButton(
              title: 'Bass Clef (Medium)',
              subText: 'Only notes on the staff',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(
                BassClefNotes.values.toList(),
                BassClefNotes.G1.index,
                BassClefNotes.A2.index,
              ),
            ),
            ModeButton(
              title: 'Bass Clef (Hard)',
              subText: 'The staff notes and above',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: trimClefNotes(
                BassClefNotes.values.toList(),
                BassClefNotes.G1.index,
                BassClefNotes.B3.index,
              ),
            ),
            ModeButton(
              title: 'Bass Clef (Expert)',
              subText: 'All notes',
              imagePath: 'assets/bass_clef.svg',
              modeNotes: BassClefNotes.values.toList(),
            ),
          ]))
    ]);
  }
}

class ModeButton extends ConsumerWidget {
  final String title;
  final String subText;
  final String imagePath;
  final List<Enum> modeNotes;
  const ModeButton(
      {super.key,
      required this.title,
      required this.modeNotes,
      this.imagePath = 'assets/treble_clef.svg',
      this.subText = ''});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.secondary)),
              fixedSize: const Size(300, 100)),
          onPressed: () {
            createNewQuizGenerateList(ref, modeNotes);
            //TODO: change this to change per note, this is a bad solution
            ref.read(imagePathProvider.notifier).state = imagePath;
            context.go('/quiz_page');
            ref.read(stopwatchProvider.notifier).startStopwatch(ref);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w700),
              ),
              if (subText != '')
                Text(
                  subText,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
            ],
          )),
    );
  }
}

class QuizCatergory extends StatelessWidget {
  final List<Widget> modeButtons;
  const QuizCatergory({
    required this.modeButtons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: modeButtons
          .animate(interval: 150.ms, delay: 150.ms)
          .slideX(duration: 300.ms, curve: Curves.easeInOut)
          .fadeIn(),
    );
  }
}

class ExpandableCatergory extends HookConsumerWidget {
  final String title;
  final Widget modeButtonTree;
  const ExpandableCatergory(
      {super.key, required this.title, required this.modeButtonTree});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isOpen = useState(false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => isOpen.value = !isOpen.value,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.25),
                          blurRadius: 5,
                          offset: const Offset(0, 5))
                    ],
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.75),
                        width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 32),
                  ),
                ),
              )),
          if (isOpen.value)
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: modeButtonTree),
        ],
      ),
    );
  }
}
