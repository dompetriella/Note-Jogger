import 'package:flutter/material.dart';

class InformationWindowTitle extends StatelessWidget {
  final String text;
  const InformationWindowTitle({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 36,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}

class InformationWindowSubtitle extends StatelessWidget {
  final String text;
  const InformationWindowSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Divider()
        ],
      ),
    );
  }
}

class InformationWindowText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  const InformationWindowText(
      {super.key, required this.text, this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
