import 'package:contabancaria/components/list_card.dart';
import 'package:contabancaria/models/enums/tipo_transacao.dart';
import 'package:contabancaria/models/transacao.dart';
import 'package:flutter/material.dart';

class Transacoes extends StatefulWidget {
  Transacoes({super.key});

  final List<Transacao> _transacoes = [
    Transacao(TipoTransacao.credito, 200.0),
    Transacao(TipoTransacao.debito, 45.0)
  ];

  @override
  State<StatefulWidget> createState() => _TransacoesState();
}

class _TransacoesState extends State<Transacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transacoes Bancárias"),
      ),
      body: ListView.builder(
          itemCount: widget._transacoes.length,
          itemBuilder: (context, indice) {
            return ListCard(
              titulo: widget._transacoes[indice].valor.toString(),
              subTitulo: widget._transacoes[indice].tipo.name,
            );
          }
        ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
    );
  }
}
