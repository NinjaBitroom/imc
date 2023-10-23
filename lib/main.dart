import 'package:flutter/material.dart';
import 'widgets/customformfield.dart';

void main() {
  runApp(const IMCApp());
}

class IMCApp extends StatelessWidget {
  const IMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: IMCHomePage(),
    );
  }
}

class IMCHomePage extends StatefulWidget {
  const IMCHomePage({super.key});

  @override
  State<IMCHomePage> createState() => _IMCState();
}

class _IMCState extends State<IMCHomePage> {
  final _formkey = GlobalKey<FormState>();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomFormField(
                controller: pesoController,
                labelText: 'Peso (kg)',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                controller: alturaController,
                labelText: 'Altura (m)',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final peso = double.parse(
                        pesoController.text.replaceFirst(',', '.'));
                    final altura = double.parse(
                        alturaController.text.replaceFirst(',', '.'));
                    final imc = peso / (altura * altura);
                    final String classe;
                    if (imc < 18.5) {
                      classe = 'Baixo peso';
                    } else if (18.5 <= imc && imc < 25) {
                      classe = 'Peso normal';
                    } else if (25 <= imc && imc < 30) {
                      classe = 'Sobrepeso';
                    } else if (30 <= imc && imc < 35) {
                      classe = 'Obesidade grau I';
                    } else if (35 <= imc && imc < 40) {
                      classe = 'Obesidade grau II';
                    } else {
                      classe = 'Obesidade grau III';
                    }
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text('Seu IMC é de: $imc\n'
                                'Classificação: $classe'),
                          );
                        });
                  }
                },
                child: const Text('Calcular'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
