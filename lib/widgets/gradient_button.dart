import 'package:flutter/material.dart';
import 'package:project/styles/pallete.dart';
import 'package:project/utilities/default_box_decoration.dart';
import 'package:project/utilities/default_padding.dart';
import 'package:project/utilities/size.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return DefualtPadding(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: kHeight(context) / 10,
          width: double.maxFinite,
          decoration: defaultBoxDecoration(Pallete.lightGreen).copyWith(
            gradient: LinearGradient(
              colors: [Pallete.darkGreen, Pallete.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
