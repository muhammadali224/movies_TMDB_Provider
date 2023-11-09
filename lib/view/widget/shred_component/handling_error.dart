import 'package:flutter/material.dart';

class HandlingError extends StatelessWidget {
  final String errorMessage;
  const HandlingError({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
