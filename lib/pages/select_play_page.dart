import 'package:flutter/material.dart';
import '../components/select_play/quiz_modes.dart';
import '../utility.dart';

class SelectPlayPage extends StatelessWidget {
  final Enum gameMode;
  const SelectPlayPage({super.key, required this.gameMode});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            capitalizeString(gameMode.name).toUpperCase(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w400,
                letterSpacing: 4),
          )),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(32.0),
              child: QuizModes(gameMode: gameMode)),
        ],
      ),
    ));
  }
}
