import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_jogger/models/notes.dart';

double whiteKeyHeight = 90;
double blackKeyHeight = 45;

List<Widget> createWhiteKeys() {
  List<Widget> returnList = [];
  for (var noteEnum in TrebleClefNotes.values) {
    if (!noteEnum.name.contains('flat')) {
      returnList.add(PianoKey(
        noteName: noteEnum.name,
      ));
    }
  }

  returnList = returnList.reversed.toList();

  return returnList;
}

class ExperimentPage extends StatelessWidget {
  const ExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [PianoControls()],
          backgroundColor: Colors.orange,
          shape: Border(
              bottom: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground, width: 4)),
          elevation: 20,
          shadowColor: Colors.black,
        ),
        body: ListView(children: createWhiteKeys()),
      ),
    );
  }
}

class PianoKey extends HookConsumerWidget {
  final String noteName;
  const PianoKey({
    super.key,
    required this.noteName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isPressed = useState(false);
    return GestureDetector(
      onTapDown: (details) => isPressed.value = true,
      onTapUp: (details) => isPressed.value = false,
      child: Container(
        height: whiteKeyHeight,
        decoration: BoxDecoration(
          color: isPressed.value
              ? Colors.orange.withOpacity(.25)
              : Theme.of(context).colorScheme.background,
          border: Border.symmetric(
              horizontal: BorderSide(
                  color: Theme.of(context).colorScheme.onBackground, width: 2)),
        ),
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Transform.rotate(
                angle: 3 * pi / 2,
                child: Text(
                  noteName,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
              ),
            )),
      ),
    );
  }
}

class PianoControls extends StatelessWidget {
  const PianoControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.pan_tool),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.line_axis),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.energy_savings_leaf),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.accessibility_outlined),
        ),
      ],
    );
  }
}
