import 'package:flutter/material.dart';
import 'package:project/styles/pallete.dart';

showLoader(context) => showDialog(
      context: context,
      builder: (context) => Center(
        child: WillPopScope(
          onWillPop: () async => false,
          child: CircularProgressIndicator(color: Pallete.green),
        ),
      ),
    );
