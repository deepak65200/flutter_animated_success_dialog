import 'dart:math';

import 'package:flutter/material.dart';
class DualArcPainter extends CustomPainter {
  final double yellowArcAngle;
  final double blueArcAngle;

  DualArcPainter(this.yellowArcAngle, this.blueArcAngle);

  @override
  void paint(Canvas canvas, Size size) {
    Paint yellowPaint =
    Paint()
      ..shader = LinearGradient(
        colors: [Colors.amber, Colors.orange],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    Paint bluePaint =
    Paint()
      ..shader = LinearGradient(
        colors: [Colors.blue, Colors.blueAccent],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2,
        ),
      )
      ..style = PaintingStyle.stroke
      ..strokeWidth = 9
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double outerRadius = size.width / 2 - 4;
    double innerRadius = outerRadius - 12;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: outerRadius),
      -pi / 2,
      yellowArcAngle * (pi / 180),
      false,
      yellowPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: innerRadius),
      -pi / 2,
      blueArcAngle * (pi / 180),
      false,
      bluePaint,
    );
  }

  @override
  bool shouldRepaint(DualArcPainter oldDelegate) {
    return oldDelegate.yellowArcAngle != yellowArcAngle ||
        oldDelegate.blueArcAngle != blueArcAngle;
  }
}