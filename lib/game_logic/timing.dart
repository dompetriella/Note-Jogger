import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:note_jogger/provider.dart';

void startTimer(WidgetRef ref) {
  Timer.periodic(Duration(milliseconds: 10), (timer) {
    ref.watch(timerProvider.notifier).state += 10;
    ref.watch(timerRunningProvider.notifier).state = true;
  });
}
