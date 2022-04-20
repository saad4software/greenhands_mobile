import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    this.controller,
    this.label,
    this.validator,
    this.isPassword = false,
    this.keyboard,
    Key? key}) : super(key: key);

  final Function(String?)? validator;
  final String? label;
  final bool isPassword;
  final TextInputType? keyboard;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      validator: (value)=>validator?.call(value),
      obscureText: isPassword,
      obscuringCharacter: "*",
      keyboardType: keyboard,
      autovalidateMode: validator == null ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        label: Text(label ?? ""),
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}