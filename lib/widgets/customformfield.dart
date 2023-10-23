import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final controller;

  const CustomFormField({
    super.key,
    required this.labelText,
    required this.controller,
  });

  _validarNumeros(value) {
    if (value == null || value.isEmpty) {
      return 'Insira um valor!';
    }
    final numero = double.tryParse(value.replaceFirst(',', '.'));
    if (numero == null || numero < 0) {
      return 'Insira um número válido!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        return _validarNumeros(value);
      },
    );
  }
}
