import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:note_jogger/provider.dart';

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

class InformationWindowScreen extends StatelessWidget {
  final List<Widget> content;
  const InformationWindowScreen({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: InformationWindowContents(
          content: content,
        ),
      ),
    );
  }
}

class InformationWindowStaging extends ConsumerWidget {
  final int numberOfPages;
  const InformationWindowStaging({
    required this.numberOfPages,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(.1),
          border: Border(
              top: BorderSide(
                  color: Theme.of(context).colorScheme.secondary, width: 4))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ref.watch(informationWindowIndexProvider) > 0
                ? GestureDetector(
                    onTap: () {
                      ref
                          .read(informationWindowStagingProvider.notifier)
                          .goToPreviousPage(ref);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              width: 2,
                              color: Theme.of(context).colorScheme.background)),
                      height: 50,
                      width: 75,
                      child: Icon(Icons.arrow_back_ios_outlined,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                    .animate()
                    .fadeIn(curve: Curves.easeInOut, duration: 500.ms)
                    .slideX(curve: Curves.easeInOut, duration: 500.ms)
                : SizedBox(
                    height: 50,
                    width: 75,
                  ),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * .5,
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (var i = 0; i < numberOfPages; i++)
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => {
                            ref
                                .read(informationWindowIndexProvider.notifier)
                                .state = i
                          },
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: Center(
                              child:
                                  ref.watch(informationWindowIndexProvider) == i
                                      ? Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                        ).animate().scale(
                                            duration: 400.ms,
                                          )
                                      : SizedBox.shrink(),
                            ),
                          ),
                        )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                ref
                    .read(informationWindowStagingProvider.notifier)
                    .goToNextPage(ref, context);
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        width: 2,
                        color: Theme.of(context).colorScheme.background)),
                height: 50,
                width: 75,
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationWindowContents extends StatelessWidget {
  final List<Widget> content;
  const InformationWindowContents({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      child: ListView(children: content),
    );
  }
}
