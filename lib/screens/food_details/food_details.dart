import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project/controllers/firestoreController.dart';
import 'package:project/models/sell.dart';
import 'package:project/utilities/check_internet.dart';
import 'package:project/widgets/gradient_button.dart';
import 'package:project/widgets/loader.dart';
import 'package:project/widgets/text_input_field.dart';
import '../../styles/text_style.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController rName = TextEditingController();
    TextEditingController contact = TextEditingController();
    TextEditingController address = TextEditingController();
    TextEditingController fDetails = TextEditingController();
    TextEditingController sell = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextInputField(
                      controller: rName,
                      hintText: 'Restaurant Name',
                      iconData: Icons.restaurant_menu_outlined,
                    ),
                    TextInputField(
                      controller: contact,
                      hintText: 'Contact No.',
                      iconData: Icons.phone_outlined,
                    ),
                    TextInputField(
                      controller: address,
                      hintText: 'Restaurant Address',
                      iconData: Icons.location_city_outlined,
                      maxLines: 4,
                    ),
                    TextInputField(
                      controller: fDetails,
                      hintText: 'Food Details (i.e. inventory)',
                      iconData: Icons.food_bank_outlined,
                      maxLines: 10,
                    ),
                    TextInputField(
                      controller: sell,
                      hintText: 'Selling Price',
                    ),
                  ],
                ),
              ),
              GradientButton(
                child: Text('Submit', style: kPoppinsLightWhiteLarge),
                onTap: () async {
                  if (!await checkInternet()) {
                    return;
                  }
                  if (formKey.currentState!.validate()) {
                    showLoader(context);
                    await FirestoreController.addSellOrder(Sell(
                      rName.text,
                      contact.text,
                      address.text,
                      fDetails.text,
                      sell.text,
                      DateTime.now().toString(),
                    ).toMap())
                        .whenComplete(() {
                      rName.dispose();
                      contact.dispose();
                      address.dispose();
                      fDetails.dispose();
                      sell.dispose();
                      context.pop();
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
