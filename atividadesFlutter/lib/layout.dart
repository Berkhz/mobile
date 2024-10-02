import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Formulario(),
    );
  }
}

class Formulario extends StatefulWidget {
  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<Formulario> {
  final List<String> transacoes = [];
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Transações'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Descrição da Transação',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                transacoes.add(controller.text);
                controller.clear();
              });
            },
            child: const Text('Adicionar'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transacoes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(transacoes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}