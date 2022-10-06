import 'package:flutter/material.dart';
import '../../styles/pallete.dart';
import '../../styles/text_style.dart';

class HomeCardText extends StatelessWidget {
  const HomeCardText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Earn Money For\nDiscarded Food',
            style: kPoppinsBoldWhiteSmall,
          ),
          const SizedBox(height: 10),
          Text(
            'With you we will help ecology',
            style: kPoppinsLightWhiteSmall,
          ),
        ],
      ),
    );
  }
}

class SubHomeCardText extends StatelessWidget {
  const SubHomeCardText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Food Delivery',
          style: kPoppinsBold.copyWith(color: Pallete.green),
        ),
        const SizedBox(height: 5),
        Text(
          'Request for delivery of segregated',
          style: kPoppinsSmall,
        ),
      ],
    );
  }
}
