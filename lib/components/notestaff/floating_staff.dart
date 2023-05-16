import 'package:flutter/material.dart';

class FloatingStaffWidget extends StatelessWidget {
  const FloatingStaffWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: FloatingStaffPainter(
        staffColor: Theme.of(context).colorScheme.secondary.withOpacity(.60),
      ),
    );
  }
}

class FloatingStaffPainter extends CustomPainter {
  final Color staffColor;
  FloatingStaffPainter({
    required this.staffColor,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final floatingStaffPaint = Paint()
      ..color = staffColor
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
