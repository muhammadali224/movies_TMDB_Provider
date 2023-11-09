import 'package:flutter/material.dart';

class BorderContainer extends StatelessWidget {
  final String? title;
  final Widget? widget;

  const BorderContainer({super.key, this.title, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey)),
      child: widget ?? Text(title ?? ""),
    );
  }
}
