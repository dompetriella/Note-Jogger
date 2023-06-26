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
        text.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 48,
            letterSpacing: 3,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onBackground),
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
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  height: 0.9,
                  fontSize: 28,
                  letterSpacing: 3,
                  fontWeight: FontWeight.w400),
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
        style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
            fontSize: 18,
            letterSpacing: 2,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
