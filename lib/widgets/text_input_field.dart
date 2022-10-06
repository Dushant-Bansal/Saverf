import 'package:flutter/material.dart';
import 'package:project/styles/text_style.dart';
import '../styles/Pallete.dart';
import '../utilities/default_box_decoration.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.iconData,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData? iconData;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Container(
        decoration: defaultBoxDecoration(Pallete.lightGrey),
        child: TextFormField(
          controller: controller,
          cursorColor: Pallete.darkGreen,
          maxLines: maxLines,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Empty';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: '    $hintText',
            hintStyle: kPoppinsLightBold,
            suffixIcon: Icon(iconData, color: Pallete.darkGreen),
            border: const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
