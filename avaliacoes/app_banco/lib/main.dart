import 'package:banco/Forms/FormularioConta.dart';
import 'package:banco/Services/ContaBancariaService.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cadastro de Contas Bancárias'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ContaBancariaService contaService = ContaBancariaService('http://localhost:3000/contas');

  void _cadastrarConta(String nome, double saldo) {
    contaService.criar(nome, saldo).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Conta "$nome" cadastrada com sucesso!')),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao cadastrar conta: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FormularioConta(onSubmit: _cadastrarConta), 
    );
  }
}