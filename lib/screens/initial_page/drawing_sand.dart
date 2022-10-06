import 'package:flutter/material.dart';
import '../../figures/ring.dart';
import '../../figures/wave2.dart';
import '../../figures/wave3.dart';
import '../../styles/Pallete.dart';
import '../../utilities/size.dart';

class DrawingSand extends StatelessWidget {
  const DrawingSand({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: kWidth(context) / 10,
          top: kHeight(context) / 7,
          child: Ring(Pallete.sand),
        ),
        Positioned(
          left: 0,
          top: kHeight(context) / 2.5,
          child: CustomPaint(
            painter: Wave2(Pallete.sand),
            size: const Size.square(100),
          ),
        ),
        Positioned(
          left: 0,
          top: kHeight(context) / 2.5 + 20,
          child: CustomPaint(
            painter: Wave3(Pallete.sand),
            size: const Size.square(100),
          ),
        ),
        Positioned(
          left: 0,
          top: kHeight(context) / 2.5 + 50,
          child: CustomPaint(
            painter: Wave2(Pallete.sand),
            size: const Size.square(100),
          ),
        ),
      ],
    );
  }
}
