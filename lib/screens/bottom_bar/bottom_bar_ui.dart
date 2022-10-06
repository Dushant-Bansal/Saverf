import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../router/constants.dart';
import '../../styles/Pallete.dart';
import 'provider.dart';

class BottomBarUI extends StatelessWidget {
  const BottomBarUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BottomBarProvider>(
      create: (context) => BottomBarProvider(),
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: Pallete.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [
            BoxShadow(
              color: Pallete.iconColor,
              offset: const Offset(0.0, 3.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          children: const [
            BarIcon(iconData: Icons.home_outlined, index: 0),
            BarIcon(iconData: Icons.shopping_bag_outlined, index: 1),
          ],
        ),
      ),
    );
  }
}

class BarIcon extends StatelessWidget {
  const BarIcon({Key? key, required this.iconData, required this.index})
      : super(key: key);

  final IconData iconData;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              context.read<BottomBarProvider>().setSelectedIndex(index);
              context
                  .go(routes[context.read<BottomBarProvider>().selectedIndex]);
            },
            child: Icon(
              iconData,
              color: Pallete.iconColor,
              size: 32.0,
            ),
          ),
          const SizedBox(height: 10),
          context.watch<BottomBarProvider>().selectedIndex == index
              ? CircleAvatar(backgroundColor: Pallete.lightGreen, radius: 4.0)
              : Container(),
        ],
      ),
    );
  }
}
