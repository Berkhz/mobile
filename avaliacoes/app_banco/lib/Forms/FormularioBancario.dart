import 'package:banco/Forms/FormularioConta.dart';
import 'package:flutter/material.dart';

class FormularioBancario extends StatefulWidget {
  const FormularioBancario({super.key});

  @override
  _FormularioContaState createState() => _FormularioContaState();
}

class _FormularioContaState extends State<FormularioConta> {
  final _nomeController = TextEditingController();
  final _saldoController = TextEditingController();

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
              onPressed: () {
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
