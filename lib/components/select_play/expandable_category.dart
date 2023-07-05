import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    double titleLength = title.length * 25;
    double tabWidth = title.length * 25 > 350 ? 350 : title.length * 25;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          GestureDetector(
              onTap: () => isOpen.value = !isOpen.value,
              child: AnimatedContainer(
                curve: Curves.easeIn,
                duration: 450.ms,
                height: 80,
                width: isOpen.value ? 350 : tabWidth,
                decoration: BoxDecoration(
                  color: isOpen.value
                      ? Theme.of(context).colorScheme.tertiary
                      : Theme.of(context).colorScheme.secondary,
                  boxShadow: isOpen.value
                      ? []
                      : [
                          BoxShadow(
                              spreadRadius: 4,
                              color: Theme.of(context).colorScheme.onPrimary)
                        ],
                  border: isOpen.value
                      ? Border.all(
                          width: 4,
                          color: Theme.of(context).colorScheme.onPrimary)
                      : null,
                  borderRadius: isOpen.value
                      ? BorderRadius.circular(10)
                      : const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                ),
                child: AnimatedPadding(
                  duration: 500.ms,
                  padding: const EdgeInsets.only(left: 8.0),
                  child: AnimatedAlign(
                    duration: 300.ms,
                    alignment:
                        isOpen.value ? Alignment.center : Alignment.centerLeft,
                    child: Text(
                      title.toUpperCase(),
                      style: TextStyle(
                          color: isOpen.value
                              ? Theme.of(context).colorScheme.onTertiary
                              : Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                          fontSize: 32),
                    ),
                  ),
                ),
              )),
          if (isOpen.value)
            Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: modeButtonTree
                      .animate(interval: 150.ms, delay: 150.ms)
                      .slideX(duration: 300.ms, curve: Curves.easeInOut)
                      .fadeIn(),
                )),
        ],
      ),
    );
  }
}
