import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/controllers/authController.dart';
import 'package:project/router/constants.dart';
import 'package:project/styles/pallete.dart';
import '../../screens/home/services.dart';
import 'home_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.notifications_outlined, color: Pallete.black),
        actions: [
          GestureDetector(
              onTap: () async {
                await AuthController.signOut().whenComplete(
                  () => context.go(initialPage),
                );
              },
              child: Icon(Icons.logout, color: Pallete.black)),
          const SizedBox(width: 16),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: const [
              Expanded(flex: 3, child: HomeCard()),
              Expanded(child: SizedBox()),
              Expanded(flex: 2, child: Services()),
            ],
          ),
        ),
      ),
    );
  }
}
