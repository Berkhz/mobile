import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TransacaoForm(),
    );
  }
}

class TransacaoForm extends StatefulWidget {
  const TransacaoForm({super.key});

  @override
  _TransacaoFormState createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  final List<String> transacoes = [];
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose(); // Libera o controlador ao fechar a tela
    super.dispose();
  }

  void adicionarTransacao() {
    if (controller.text.isNotEmpty) {
      setState(() {
        transacoes.add(controller.text);
        controller.clear();
      });
    }
  }

  void verTransacoes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaTransacoes(transacoes: transacoes),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Transações:'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Descrição da Transação:',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: adicionarTransacao,
              child: const Text('Adicionar'),
            ),
            ElevatedButton(
              onPressed: verTransacoes,
              child: const Text('Ver Transações'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListaTransacoes extends StatelessWidget {
  final List<String> transacoes;

  const ListaTransacoes({required this.transacoes, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Transações'),
      ),
      body: transacoes.isEmpty
          ? const Center(child: Text('Nenhuma transação adicionada.'))
          : ListView.builder(
        itemCount: transacoes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(transacoes[index]),
          );
        },
      ),
    );
  }
}