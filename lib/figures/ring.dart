import 'package:flutter/material.dart';
import '../../styles/pallete.dart';

class Ring extends StatelessWidget {
  const Ring(Color color, {super.key}) : _color = color;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: _color,
      radius: 20.0,
      child: CircleAvatar(
        backgroundColor: Pallete.darkGreen,
        radius: 10.0,
      ),
    );
  }
}
