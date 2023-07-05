import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/models/modes.dart';

class NavigationAppBarTitle extends StatelessWidget {
  final String title;
  final String routeName;
  final Enum gameMode;
  const NavigationAppBarTitle(
      {super.key,
      this.gameMode = GameMode.training,
      required this.title,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.goNamed(routeName);
          },
          child: const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.arrow_back_ios_new)),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w400,
                letterSpacing: 4),
          ),
        ),
      ],
    );
  }
}
