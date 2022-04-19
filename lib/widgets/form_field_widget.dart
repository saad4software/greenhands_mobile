import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({Key? key}) : super(key: key);

  final Function(String) validator;
  final String label;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      textInputAction: TextInputAction.next,
      validator: (value)=>value.isValidValue() ? null : "invalid_value",
      decoration: const InputDecoration(
        label: Text("first_name"),
        border: OutlineInputBorder(),
      ),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}