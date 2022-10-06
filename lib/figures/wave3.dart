import 'package:flutter/material.dart';

class Wave3 extends CustomPainter {
  Wave3(Color color) : _color = color;
  final Color _color;
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.quadraticBezierTo(25, 10, 80, 0);
    path.quadraticBezierTo(110, -10, 140, 0);
    path.quadraticBezierTo(160, 10, 180, 0);
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
  bool shouldRepaint(Wave3 oldDelegate) => false;
}
