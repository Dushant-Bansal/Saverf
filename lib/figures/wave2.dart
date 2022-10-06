import 'package:flutter/material.dart';

class Wave2 extends CustomPainter {
  Wave2(Color color) : _color = color;
  final Color _color;
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.quadraticBezierTo(40, 10, 80, 0);
    path.quadraticBezierTo(120, -15, 160, 5);
    canvas.drawPath(
      path,
      Paint()
        ..color = _color
        ..strokeWidth = 5.0
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
    );
  }

  @override
  bool shouldRepaint(Wave2 oldDelegate) => false;
}
