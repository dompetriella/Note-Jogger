import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Note extends StatelessWidget {
  final int value;
  const Note({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // low c in treble cleft
        // low e in bass cleft
        AnimatedPositioned(
            duration: 200.ms,
            curve: Curves.easeInOut,
            left: 135,
            bottom: 29 + ((value + 1) * 10),
            child: QuarterNoteWidget(
              value: value,
            )),
      ],
    );
  }
}

class QuarterNoteWidget extends StatelessWidget {
  final int value;
  const QuarterNoteWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: QuarterNotePainter(
          flagIsUp: (value < 13),
          noteColor: Theme.of(context).colorScheme.secondary),
    );
  }
}

class QuarterNotePainter extends CustomPainter {
  final bool flagIsUp;
  final bool needsFloatingStaff;
  final Color noteColor;
  QuarterNotePainter({
    required this.noteColor,
    this.flagIsUp = true,
    this.needsFloatingStaff = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);

    const rect = Rect.fromLTWH(0, 0, 30, 20);
    canvas.drawOval(rect, circlePaint);

    final linePaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.5;

    // Save the current state of the canvas.
    canvas.save();

    canvas.rotate(pi / 2);
    flagIsUp ? canvas.translate(0, -29) : canvas.translate(0, -0.5);

    if (flagIsUp) {
      canvas.drawLine(
        Offset(-60, center.dy + -1),
        Offset(12, center.dy),
        linePaint,
      );
    } else {
      canvas.drawLine(
        Offset(8, center.dy + -1),
        Offset(90, center.dy),
        linePaint,
      );
    }

    canvas.restore();

    // Restore the canvas to its saved state.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
