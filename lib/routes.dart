import 'package:go_router/go_router.dart';
import 'package:note_jogger/pages/quiz_page.dart';
import 'package:note_jogger/pages/results_page.dart';
import 'package:note_jogger/pages/select_mode_page.dart';
import 'package:note_jogger/pages/select_play_page.dart';
import 'package:note_jogger/pages/start_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      name: 'start_page',
      builder: (context, state) => const StartPage(),
    ),
    GoRoute(
      path: "/select_mode_page",
      name: 'select_mode_page',
      builder: (context, state) => const SelectModePage(),
    ),
    GoRoute(
      path: "/select_play_page",
      name: 'select_play_page',
      builder: (context, state) {
        Enum gameMode = state.extra as Enum;
        return SelectPlayPage(gameMode: gameMode);
      },
    ),
    GoRoute(
      path: "/quiz_page",
      name: 'quiz_page',
      builder: (context, state) {
        Enum gameMode = state.extra as Enum;
        return QuizPage(gameMode: gameMode);
      },
    ),
    GoRoute(
      path: "/results_page",
      name: 'results_page',
      builder: (context, state) {
        Enum gameMode = state.extra as Enum;
        return ResultsPage(gameMode: gameMode);
      },
    ),
  ],
);
