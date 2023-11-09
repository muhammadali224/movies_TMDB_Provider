import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../core/constant/color.dart';

class BackButtonContainer extends StatelessWidget {
  const BackButtonContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 18, left: 18),
      decoration: BoxDecoration(
          color: AppColor.scaffoldBgColor,
          borderRadius: BorderRadius.circular(5)),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(IconBroken.Arrow___Left),
      ),
    );
  }
}
