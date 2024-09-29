import 'package:flutter/material.dart';

class ListCard extends StatelessWidget{

  final String titulo;
  final String subTitulo;

  const ListCard({super.key, required this.titulo, required this.subTitulo});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(titulo),
        subtitle: Text(subTitulo),
      ),
    );
  }
}