import 'package:flutter/material.dart';
import '../../utilities/default_box_decoration.dart';
import '../../styles/Pallete.dart';
import '../../styles/text_style.dart';
import '../../utilities/size.dart';
import '../../widgets/text_input_field.dart';
import 'sign_in_button.dart';

TextEditingController controller = TextEditingController();

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: kHeight(context) / 2.5,
        width: double.maxFinite,
        decoration: defaultBoxDecoration(Pallete.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Expanded(child: SizedBox()),
            Text(
              'Enter your name to Continue',
              style: kPoppinsLightBold,
            ),
            const SizedBox(height: 30),
            TextInputField(
              controller: controller,
              hintText: 'Name',
              iconData: Icons.person_outline,
            ),
            const SizedBox(height: 20),
            SingInButton(controller: controller),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
