import 'package:flutter/material.dart';

class MaterialCustomButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;
  final Color color;
  final Color? textColor;

  const MaterialCustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.color,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 40,
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: color,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: textColor ?? Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
