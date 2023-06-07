import 'package:flutter/material.dart';
import '../components/select_mode/quiz_modes.dart';
import '../utility.dart';

class SelectModePage extends StatelessWidget {
  final Enum gameMode;
  const SelectModePage({super.key, required this.gameMode});

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
            capitalizeString(gameMode.name),
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          )),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: ListView(
          children: [
            Padding(
                padding: EdgeInsets.all(32.0),
                child: QuizModes(gameMode: gameMode)),
          ],
        ),
      ),
    ));
  }
}
