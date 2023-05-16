import 'package:flutter/material.dart';
import 'package:note_jogger/pages/quiz_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
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
              const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      StartPageButton(
                        text: 'Treble Clef Quiz',
                      ),
                      StartPageButton(
                        text: 'Bass Clef Quiz',
                      ),
                      StartPageButton(
                        text: 'Settings',
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}

class StartPageButton extends StatelessWidget {
  final String text;
  const StartPageButton({super.key, required this.text});

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
              fixedSize: const Size(200, 60)),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const QuizPage(),
              ),
            );
          },
          child: Text(text)),
    );
  }
}
