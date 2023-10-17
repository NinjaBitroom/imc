import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;

  const CustomFormField({required Key key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
