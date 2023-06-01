import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExpandableCatergory extends HookConsumerWidget {
  final String title;
  final List<Widget> modeButtonTree;
  const ExpandableCatergory(
      {super.key, required this.title, required this.modeButtonTree});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var isOpen = useState(false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => isOpen.value = !isOpen.value,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.25),
                          blurRadius: 5,
                          offset: const Offset(0, 5))
                    ],
                    border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.75),
                        width: 2),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 32),
                  ),
                ),
              )),
          if (isOpen.value)
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: modeButtonTree,
                )),
        ],
      ),
    );
  }
}
