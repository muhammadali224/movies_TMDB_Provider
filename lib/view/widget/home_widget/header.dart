import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String headerText;

  const HeaderText({super.key, required this.headerText});

  @override
  Widget build(BuildContext context) {
    var text = headerText.split(" ");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      child: RichText(
        text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
          TextSpan(
            text: text.length > 2 ? "${text[0]} ${text[1]}" : text.first,
            style: DefaultTextStyle.of(context).style.copyWith(fontSize: 25),
          ),
          TextSpan(
            text: " ${text.last}",
            style: DefaultTextStyle.of(context)
                .style
                .copyWith(fontSize: 22, color: Colors.grey),
          ),
        ]),
      ),
    );
  }
}
