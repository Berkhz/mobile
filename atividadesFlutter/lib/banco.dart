import 'package:flutter/material.dart';
// Exercício 1
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BancoHome(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class BancoHome extends StatelessWidget {
  const BancoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplicação Bancária'),
      ),
      body: ListView(
        children: const [
          Card(
            child: ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Conta Corrente'),
              subtitle: Text('Saldo: R\$ 99.000,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.savings),
              title: Text('Conta Poupança'),
              subtitle: Text('Saldo: R\$ 300.000,00'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Cartão de Crédito'),
              subtitle: Text('Limite: R\$ 50.000,00'),
            ),
          ),
        ],
      ),
    );
  }
}
