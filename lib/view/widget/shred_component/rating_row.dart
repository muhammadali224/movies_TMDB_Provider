import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../core/extension/space_extension.dart';

class RatingRow extends StatelessWidget {
  final String rateNumber;
  const RatingRow({super.key, required this.rateNumber});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star_purple500_outlined, color: AppColor.ratingColor),
        5.width,
        Text(rateNumber),
      ],
    );
  }
}
