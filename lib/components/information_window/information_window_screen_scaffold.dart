import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../provider.dart';
import 'information_window_staging.dart';

class InformationWindowPage extends ConsumerWidget {
  const InformationWindowPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InformationWindowScreenScaffold(
        screens: ref.watch(informationWindowStagingProvider));
  }
}

class InformationWindowScreenScaffold extends ConsumerWidget {
  final List<Widget> screens;
  const InformationWindowScreenScaffold({
    required this.screens,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
              onTap: () {
                context.go('/');
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 42,
                color: Theme.of(context).colorScheme.error.withOpacity(.50),
              )),
        ),
      ),
      body: Column(
        children: [
          screens[ref.watch(informationWindowIndexProvider)],
          InformationWindowStaging(
            numberOfPages: screens.length,
          )
        ],
      ),
    );
  }
}
