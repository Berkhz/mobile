import 'package:contabancaria/screens/transacao_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBank());
}

class MyBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.white,
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: TransacaoForm(),
    );
  }
}