import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../router/constants.dart';
import '../../screens/home/drawing_mountain.dart';
import '../../styles/Pallete.dart';
import '../../utilities/default_box_decoration.dart';
import 'home_card_text.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: defaultBoxDecoration(Pallete.lightGreen).copyWith(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Pallete.lightGreen, Pallete.darkGreen],
          stops: const [0.7, 0.9],
        ),
      ),
      child: Stack(
        children: [
          const DrawingMountain(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const HomeCardText(),
                      Expanded(child: Image.asset('assets/images/dustbin.png')),
                    ],
                  ),
                ),
                const Expanded(child: SubHomeCard())
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubHomeCard extends StatelessWidget {
  const SubHomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('$home/$foodDetails'),
      child: Container(
        decoration: defaultBoxDecoration(Pallete.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SubHomeCardText(),
            Image.asset('assets/icons/delivery.png')
          ],
        ),
      ),
    );
  }
}
