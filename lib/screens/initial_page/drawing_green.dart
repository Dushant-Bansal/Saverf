import 'package:flutter/material.dart';
import '../../figures/wave2.dart';
import '../../styles/Pallete.dart';
import '../../utilities/size.dart';

class DrawingGreen extends StatelessWidget {
  const DrawingGreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 50,
          top: kHeight(context) / 10 + 20,
          child: CustomPaint(
            painter: Wave2(Pallete.whiteGreen),
            size: const Size.square(100),
          ),
        ),
      ],
    );
  }
}
