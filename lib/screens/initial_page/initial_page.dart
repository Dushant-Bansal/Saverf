import 'package:flutter/material.dart';
import '../../screens/initial_page/drawing_green.dart';
import '../../styles/pallete.dart';
import '../../styles/text_style.dart';
import 'drawing_sand.dart';
import 'drawing_white.dart';
import 'sign_in.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.darkGreen,
      body: Stack(
        children: [
          const Drawing(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              InitialPageText(),
              SignIn(),
            ],
          ),
        ],
      ),
    );
  }
}

class Drawing extends StatelessWidget {
  const Drawing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        DrawingSand(),
        DrawingWhite(),
        DrawingGreen(),
      ],
    );
  }
}

class InitialPageText extends StatelessWidget {
  const InitialPageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Again\nWelcome Back',
            style: kPoppinsBoldWhite,
          ),
          const SizedBox(height: 20.0),
          Text(
            'We are here to help our through\nwaste recycling',
            style: kPoppinsLightWhite,
          ),
        ],
      ),
    );
  }
}
