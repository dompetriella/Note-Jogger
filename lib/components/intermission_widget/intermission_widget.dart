import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

showIntermissionWidget(BuildContext context, int duration, String endRoute,
    Widget contents, Enum gameMode) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => IntermissionWidget(
          duration: duration,
          contents: contents,
          endRoute: endRoute,
          gameMode: gameMode),
    ),
  );
}

// context.goNamed(endRoute, extra: gameMode);

class IntermissionWidget extends HookConsumerWidget {
  final int duration;
  final Widget contents;
  final String endRoute;
  final Enum gameMode;
  const IntermissionWidget(
      {super.key,
      required this.contents,
      required this.duration,
      required this.endRoute,
      required this.gameMode});

  @override
  Widget build(BuildContext context, WidgetRef) {
    final initFunction = useCallback((_) async {
      Timer(Duration(milliseconds: duration), () {
        context.goNamed(endRoute, extra: gameMode);
        if (context != null) {
          Navigator.of(context).pop();
        }
      });
    }, []);

    useEffect(() {
      initFunction(null);
    }, []);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
              color: Theme.of(context).colorScheme.background, child: contents),
        ),
      ),
    );
  }
}
