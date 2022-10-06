import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/models/sell.dart';
import 'package:project/styles/pallete.dart';
import 'package:project/styles/snack_bar.dart';
import 'package:project/styles/text_style.dart';
import 'package:project/utilities/default_box_decoration.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.sell});

  final Sell sell;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(sell.rName, style: kPoppinsBold),
            subtitle:
                Text(sell.address, style: TextStyle(color: Pallete.black)),
            trailing: Text('Rs. ${sell.sell}'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text(sell.fDetails, style: TextStyle(color: Pallete.black)),
            ),
          ),
          ButtonBar(
            children: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: Pallete.green),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: sell.contact))
                      .whenComplete(() {
                    showSnackBar('Copied');
                    Navigator.pop(context);
                  });
                },
                child: Text(sell.contact),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
