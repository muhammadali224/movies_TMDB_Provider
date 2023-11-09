import 'package:flutter/material.dart';

void showModelSheet(BuildContext context, Widget widget) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    elevation: 20,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15), topLeft: Radius.circular(15))),
    builder: (context) => widget,
  );
}
