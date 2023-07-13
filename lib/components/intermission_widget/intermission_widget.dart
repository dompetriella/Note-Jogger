import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_jogger/components/intermission_widget/intermission_finish.dart';
import 'package:note_jogger/components/intermission_widget/intermission_message.dart';
import 'package:note_jogger/models/modes.dart';

showIntermissionWidget(
    BuildContext context, int duration, String endRoute, Enum gameMode) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      switch (gameMode) {
        case GameMode.intro:
          return IntermissionMessage(
              duration: duration, endRoute: endRoute, gameMode: gameMode);
        case GameMode.training:
          return IntermissionMessage(
              duration: duration, endRoute: endRoute, gameMode: gameMode);
        case GameMode.ranked:
          return IntermissionFinish(
              duration: 8000, endRoute: endRoute, gameMode: gameMode);
        default:
          return IntermissionMessage(
              duration: duration, endRoute: endRoute, gameMode: gameMode);
      }
    }),
  );
}
