import 'package:flutter/material.dart';
import '../../figures/ring.dart';
import '../../figures/wave2.dart';
import '../../figures/wave3.dart';
import '../../styles/Pallete.dart';
import '../../utilities/size.dart';

class DrawingWhite extends StatelessWidget {
  const DrawingWhite({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: kWidth(context) / 10,
          bottom: kHeight(context) / 15,
          child: Ring(Pallete.whiteGreen),
        ),
        Positioned(
          right: 60,
          bottom: -kHeight(context) / 15,
          child: CustomPaint(
            painter: Wave2(Pallete.whiteGreen),
            size: const Size.square(100),
          ),
        ),
        Positioned(
          right: 80,
          bottom: -kHeight(context) / 15 + 20,
          child: CustomPaint(
            painter: Wave3(Pallete.whiteGreen),
            size: const Size.square(100),
          ),
        ),
        Positioned(
          right: 60,
          bottom: -kHeight(context) / 15 + 50,
          child: CustomPaint(
            painter: Wave2(Pallete.whiteGreen),
            size: const Size.square(100),
          ),
        ),
      ],
    );
  }
}
