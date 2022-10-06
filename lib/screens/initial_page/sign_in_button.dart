import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:project/widgets/loader.dart';
import '../../controllers/authController.dart';
import '../../controllers/persistenceController.dart';
import '../../router/constants.dart';
import '../../styles/Pallete.dart';
import '../../styles/snack_bar.dart';
import '../../styles/text_style.dart';
import '../../utilities/size.dart';

class SingInButton extends StatelessWidget {
  const SingInButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        try {
          if (controller.text.isEmpty) {
            showSnackBar('Name not provided');
            return;
          } else {
            showLoader(context);
            PersistenceController.addName(controller.text);
          }
          await AuthController.signInWithGoogle().whenComplete(() => {
                if (AuthController.isUserSignedIn())
                  {controller.clear(), context.go(home)}
              });
        } catch (_) {}
      },
      child: Card(
        elevation: 5,
        shadowColor: Pallete.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          width: kWidth(context) / 2,
          height: 50.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Pallete.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset('assets/icons/Google__G__Logo.svg'),
              Text('Sign In', style: kPoppinsWhite),
              const Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
