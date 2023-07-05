import 'package:flutter/material.dart';
import 'package:note_jogger/components/navigation_app_bar_title.dart';
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
          automaticallyImplyLeading: false,
          title: NavigationAppBarTitle(
            title: capitalizeString(gameMode.name).toUpperCase(),
            routeName: 'select_mode_page',
          )),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: QuizModes(gameMode: gameMode)),
        ],
      ),
    ));
  }
}
