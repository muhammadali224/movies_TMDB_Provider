import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintTitle;
  final IconData? icon;
  final void Function()? onIconTap;
  final void Function()? onTap;
  final String? Function(String?)? validate;
  final TextInputType? keyboardType;
  final Color? iconColor;
  final bool? isPassword;
  final bool? isExpanded;
  final bool? readOnly;
  final String? labelString;
  final void Function(String?)? onSubmit;

  const InputFormField({
    super.key,
    this.controller,
    required this.hintTitle,
    this.onIconTap,
    this.keyboardType,
    this.validate,
    this.icon,
    this.iconColor,
    this.isPassword,
    this.isExpanded,
    this.readOnly = false,
    this.onTap,
    this.labelString,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: TextFormField(
        onFieldSubmitted: onSubmit,
        onTap: onTap,
        readOnly: readOnly!,
        maxLines: isExpanded == false || isExpanded == null ? 1 : 6,
        minLines: 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validate,
        keyboardType: keyboardType,
        controller: controller,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hintTitle,
          labelText: labelString,
          labelStyle: const TextStyle(fontSize: 20),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 2)),
          suffixIcon: IconButton(
            onPressed: onIconTap,
            icon: Icon(
              icon,
              color: iconColor ?? Colors.red,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 1.2),
          ),
        ),
      ),
    );
  }
}
