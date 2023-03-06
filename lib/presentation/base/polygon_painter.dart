import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;


class PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    // ignore: lines_longer_than_80_chars
    var topSpacer = 5.0;
    var left = 0.435;
    var right = 1 - left;
    const borderAngle = 0.04;
    final path = Path()
      ..moveTo(0, (size.height * 0.085))
      ..cubicTo(0, size.height * borderAngle, size.width * 0.052, topSpacer,
        size.width * 0.12, topSpacer)
      ..lineTo(size.width * (left), topSpacer)
      ..quadraticBezierTo(
          size.width / 2, size.height * 0.05, size.width * (right), topSpacer)
      ..lineTo(size.width * 0.88, topSpacer)
      ..cubicTo(size.width * 0.95, topSpacer, size.width,
        size.height * borderAngle, size.width, size.height * 0.085)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
