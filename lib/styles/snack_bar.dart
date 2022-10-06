import 'package:flutter/material.dart';
import 'package:project/styles/text_style.dart';
import 'package:project/utilities/check_device.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey(debugLabel: 'scaffoldMessengerKey');

void showSnackBar(String message) {
  final tp = TextPainter(
    text: TextSpan(text: message, style: kPoppins),
    textDirection: TextDirection.ltr,
  )..layout();

  final messenger = scaffoldMessengerKey.currentState;
  messenger?.showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.center),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 1),
      width: tp.width + (isAndriod ? 80 : 40),
    ),
  );
}
