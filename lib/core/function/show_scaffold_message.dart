import 'package:flutter/material.dart';

import '../constant/color.dart';

showScaffoldMessage(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColor.scaffoldBgColor,
      content: Text(title, style: const TextStyle(color: Colors.red)),
    ),
  );
}
