import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/globals.dart';
import 'package:note_jogger/models/quiz_answer.dart';
import 'package:note_jogger/pages/experimental_ui.dart';
import 'components/quiz/quiz_generate.dart';

final lightModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final imagePathProvider = StateProvider<String>((ref) {
  return 'assets/treble_clef.svg';
});

final quizGenerateIndexStagingProvider = StateProvider<int>((ref) {
  return 0;
});

final showHintsProvider = StateProvider<bool>((ref) {
  return false;
});

final stopwatchProvider =
    StateNotifierProvider<StopwatchNotifier, Stopwatch>((ref) {
  return StopwatchNotifier();
});

class StopwatchNotifier extends StateNotifier<Stopwatch> {
  StopwatchNotifier() : super(Stopwatch());

  startStopwatch(WidgetRef ref) {
    state.start();
  }

  stopStopwatch(WidgetRef ref) {
    state.stop();
  }

  resetStopwatch(WidgetRef ref) {
    state.reset();
  }

  double stopStopwatchAndReturnTime(WidgetRef ref) {
    stopStopwatch(ref);
    var timeElapsed = state.elapsed.inMilliseconds.toDouble();
    state.reset();
    return timeElapsed;
  }
}

final quizAnswersProvider =
    StateNotifierProvider<QuizAnswersNotifier, List<QuizAnswer>>((ref) {
  return QuizAnswersNotifier();
});

class QuizAnswersNotifier extends StateNotifier<List<QuizAnswer>> {
  QuizAnswersNotifier() : super([]);

  addQuizAnswerToState(QuizAnswer quizAnswer, WidgetRef ref) {
    var newState = state;
    newState.add(quizAnswer);
    state = newState;
  }

  finalizeAnswers(WidgetRef ref) {
    List<QuizAnswer> newState = state;
    List<QuizAnswer> answers = List.from(newState.reversed);
    state = answers;
  }
}

final quizStagingProvider =
    StateNotifierProvider<QuizStagingNotifier, List<QuizGenerate>>((ref) {
  return QuizStagingNotifier();
});

class QuizStagingNotifier extends StateNotifier<List<QuizGenerate>> {
  QuizStagingNotifier() : super([]);

  nextQuestionAction(WidgetRef ref, BuildContext context, Enum gameMode) {
    if (ref.watch(quizGenerateIndexStagingProvider) <
        ref.watch(quizStagingProvider).length - 1) {
      ref.watch(quizGenerateIndexStagingProvider.notifier).state++;
    } else {
      ref.read(stopwatchProvider.notifier).stopStopwatchAndReturnTime(ref);
      context.go('/results_page', extra: gameMode);
    }
  }

  resetQuizGenerate(WidgetRef ref) {
    ref.watch(quizGenerateIndexStagingProvider.notifier).state = 0;
    ref.watch(quizAnswersProvider.notifier).state = [];
    ref.read(stopwatchProvider).reset();
    ref.read(livesProvider.notifier).resetLives();
    ref.read(showHintsProvider.notifier).state = false;
  }
}

final livesProvider = StateNotifierProvider<LivesNotifier, List<bool>>((ref) {
  return LivesNotifier();
});

class LivesNotifier extends StateNotifier<List<bool>> {
  LivesNotifier() : super([]);

  resetLives() {
    List<bool> newState = [];
    for (var i = 0; i < GLOBAL_lives; i++) {
      newState.add(true);
    }
    state = newState;
  }

  loseLife(BuildContext context) {
    if (state.every((element) => element == false)) {
    } else {
      var newState = state;
      if (state.every((element) => element == true)) {
        newState[0] = false;
        state = newState;
      } else {
        int lastHeartIndex = newState.lastIndexOf(false);
        newState[lastHeartIndex + 1] = false;
        state = newState;
      }
    }
  }
}

final informationWindowIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final informationWindowStagingProvider = StateNotifierProvider<
    InformationWindowStagingNotifier, List<InformationWindowScreen>>((ref) {
  return InformationWindowStagingNotifier();
});

class InformationWindowStagingNotifier
    extends StateNotifier<List<InformationWindowScreen>> {
  InformationWindowStagingNotifier() : super([]);

  goToNextPage(WidgetRef ref, BuildContext context) {
    if (ref.watch(informationWindowIndexProvider) < state.length - 1) {
      ref.read(informationWindowIndexProvider.notifier).state++;
    } else {
      Navigator.pop(context);
    }
  }

  goToPreviousPage(WidgetRef ref) {
    if (ref.watch(informationWindowIndexProvider) != 0) {
      ref.read(informationWindowIndexProvider.notifier).state--;
    }
  }

  flushInformationWindow(WidgetRef ref) {
    ref.read(informationWindowIndexProvider.notifier).state = 0;
    ref.read(informationWindowStagingProvider.notifier).state = [];
  }

  addInformationWindowsToState(
      List<List<Widget>> listOfInformationWindowScreen) {
    state = [];
    var newState = state;
    for (var data in listOfInformationWindowScreen) {
      newState.add(InformationWindowScreen(content: data));
    }
  }
}
