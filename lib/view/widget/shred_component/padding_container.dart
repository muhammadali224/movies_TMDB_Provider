import 'package:flutter/cupertino.dart';

class PaddingContainer extends StatelessWidget {
  final Widget? child;

  const PaddingContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }
}
