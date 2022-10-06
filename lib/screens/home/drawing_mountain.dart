import 'package:flutter/material.dart';
import '../../figures/mountain.dart';
import '../../styles/Pallete.dart';
import '../../utilities/size.dart';

class DrawingMountain extends StatelessWidget {
  const DrawingMountain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: ClipPath(
        clipper: Mountain(),
        child: Container(
          height: kHeight(context),
          width: kWidth(context),
          color: Pallete.green,
        ),
      ),
    );
  }
}
