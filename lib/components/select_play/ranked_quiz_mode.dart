import 'package:flutter/material.dart';
import 'package:note_jogger/components/select_play/ranked_play_button.dart';
import 'package:note_jogger/content/ranked_content/circuit_one.dart';
import 'package:note_jogger/models/ranked_difficulty.dart';

class Ranked extends StatelessWidget {
  const Ranked({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border(
                    bottom: BorderSide(
                        width: 4,
                        color: Theme.of(context).colorScheme.onPrimary))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'CIRCUIT 1 - BASICS AVENUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                      color: Theme.of(context).colorScheme.onPrimary),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36.0),
          child: Column(children: circuitOne),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                border: Border.symmetric(
                    horizontal: BorderSide(
                        width: 4,
                        color: Theme.of(context).colorScheme.onPrimary))),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text(
                  'FINISH',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 4,
                      color: Theme.of(context).colorScheme.onTertiary),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
