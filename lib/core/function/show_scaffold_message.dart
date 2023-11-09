import 'package:flutter/material.dart';

showScaffoldMessage(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blueGrey,
      content: Text(title, style: const TextStyle(color: Colors.white)),
    ),
  );
}
