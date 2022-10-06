import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../router/constants.dart';
import '../../utilities/default_box_decoration.dart';
import '../../styles/pallete.dart';
import '../../styles/text_style.dart';
import '../../utilities/default_padding.dart';

class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('More Services', style: kPoppinsBold),
            Text('See More', style: kPoppinsLight),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Expanded(child: IconCard(icon: 'storage', iconText: 'Storage')),
            SizedBox(width: 20),
            Expanded(child: IconCard(icon: 'charity', iconText: 'Donate')),
            SizedBox(width: 20),
            Expanded(child: IconCard(icon: 'recycle', iconText: 'Recycling'))
          ],
        )
      ],
    );
  }
}

class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    required this.icon,
    required this.iconText,
    this.onTap,
  });
  final String icon;
  final String iconText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Pallete.lightGrey,
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap ?? () => context.go('$home/$toBeImplemented'),
        borderRadius: borderRadius,
        child: DefualtPadding(
          child: Column(
            children: [
              Image.asset('assets/icons/$icon.png'),
              Text(iconText, style: kPoppinsSmallBold),
            ],
          ),
        ),
      ),
    );
  }
}
