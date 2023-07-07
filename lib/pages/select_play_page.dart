import 'package:flutter/material.dart';
import 'package:note_jogger/components/navigation_app_bar_title.dart';
import 'package:note_jogger/models/modes.dart';
import '../components/select_play/quiz_modes.dart';
import '../utility.dart';

class SelectPlayPage extends StatelessWidget {
  final Enum gameMode;
  const SelectPlayPage({super.key, required this.gameMode});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: gameMode == GameMode.ranked
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: NavigationAppBarTitle(
            title: capitalizeString(gameMode.name).toUpperCase(),
            routeName: 'select_mode_page',
          )),
      body: ListView(
        children: [
          Padding(
              padding: gameMode != GameMode.ranked
                  ? EdgeInsets.only(top: 32.0)
                  : EdgeInsets.all(0),
              child: QuizModes(gameMode: gameMode)),
        ],
      ),
    ));
  }
}
