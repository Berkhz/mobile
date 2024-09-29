import 'package:flutter/material.dart';

class TransacaoForm extends StatefulWidget {

  final TextEditingController _controller = TextEditingController();
  TransacaoForm({super.key});

  @override
  State<StatefulWidget> createState() => _TransacaoFormState();
}

class _TransacaoFormState extends State<TransacaoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incluir Transacoes Bancárias"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget._controller,
                decoration: const InputDecoration(
                  labelText: "Valor da transacao:",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print(widget._controller.text);
              },
              child: const Text("Confirmar")
            )
          ],
        ),
      ),
    ); 
  }
}