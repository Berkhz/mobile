import 'package:flutter/material.dart';

class FormularioConta extends StatefulWidget {
  final Function(String, double) onSubmit;

  FormularioConta({super.key, required this.onSubmit});

  @override
  _FormularioContaState createState() => _FormularioContaState();
}

class _FormularioContaState extends State<FormularioConta> {
  final _nomeController = TextEditingController();
  final _saldoController = TextEditingController();

  void _submitForm() {
    final String nome = _nomeController.text;
    final double saldo = double.tryParse(_saldoController.text) ?? 0.0;

    if (nome.isEmpty || saldo <= 0) {
      return;
    }

    widget.onSubmit(nome, saldo); 
    _nomeController.clear();
    _saldoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Conta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: const InputDecoration(labelText: 'Nome da Conta'),
            ),
            TextField(
              controller: _saldoController,
              decoration: const InputDecoration(labelText: 'Saldo Inicial'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}