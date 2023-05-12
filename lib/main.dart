import 'dart:math';

import 'package:flutter/material.dart';
import 'package:note_jogger/models/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.lightBlue.withOpacity(.10),
              child: Stack(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                      StaffLine(),
                    ],
                  ),
                  Center(
                    child: Note(
                      value: TrebleClefNotes.C2.index,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  final int value;
  const Note({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // low c in treble cleft
        // low e in bass cleft
        Positioned(
            left: 135,
            bottom: 30 + ((value + 1) * 10),
            child: QuarterNoteWidget(
              value: value,
            )),
      ],
    );
  }
}

class StaffLine extends StatelessWidget {
  const StaffLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: Colors.black.withOpacity(.75), width: 2))),
    );
  }
}

class FloatingStaffWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FloatingStaffPainter(),
    );
  }
}

class FloatingStaffPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final floatingStaffPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    canvas.translate(0, 11);

    canvas.drawLine(
      Offset(-20, center.dy),
      Offset(center.dx + 20, center.dy),
      floatingStaffPaint,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class QuarterNoteWidget extends StatelessWidget {
  final int value;
  const QuarterNoteWidget({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: QuarterNotePainter(flagIsUp: (value < 13)),
    );
  }
}

class QuarterNotePainter extends CustomPainter {
  final bool flagIsUp;
  final bool needsFloatingStaff;
  final Color noteColor;
  QuarterNotePainter(
      {this.flagIsUp = true,
      this.needsFloatingStaff = false,
      this.noteColor = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final circlePaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);

    final rect = Rect.fromLTWH(0, 0, 30, 20);
    canvas.drawOval(rect, circlePaint);

    final linePaint = Paint()
      ..color = noteColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.5;

    // Save the current state of the canvas.
    canvas.save();

    canvas.rotate(pi / 2);
    flagIsUp ? canvas.translate(0, -28.5) : canvas.translate(0, 0);

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
