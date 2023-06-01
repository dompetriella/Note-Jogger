import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/start_page.dart';
import '../provider.dart';
import 'generic_button.dart';

class NavigationButton extends ConsumerWidget {
  final Widget pageWidget;
  final bool resetQuizValues;
  final bool useGoRouter;
  final String route;
  final double height;
  final double width;
  final String text;
  const NavigationButton({
    this.pageWidget = const StartPage(),
    this.resetQuizValues = true,
    this.useGoRouter = true,
    this.route = '/',
    this.height = 60,
    this.width = 200,
    this.text = '',
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GenericPageButton(
              text: text,
              height: height,
              width: width,
              onPressed: () {
                if (resetQuizValues) {
                  ref
                      .watch(quizStagingProvider.notifier)
                      .resetQuizGenerate(ref);
                }

                if (useGoRouter) {
                  context.go(route);
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => pageWidget,
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
