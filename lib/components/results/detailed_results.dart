import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider.dart';

class DetailedResults extends ConsumerWidget {
  const DetailedResults({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
        itemCount: ref.watch(quizAnswersProvider).length,
        itemBuilder: ((context, index) => const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: SingleResultContainer(),
            )));
  }
}

class SingleResultContainer extends StatelessWidget {
  const SingleResultContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(.5)),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
