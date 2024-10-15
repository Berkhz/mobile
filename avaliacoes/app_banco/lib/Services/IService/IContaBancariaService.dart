import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class IContaBancariaService {
  static const String baseUrl = 'http://localhost:3000/contas';

  Future<List<Map<String, dynamic>>> listar();
  Future<void> criar(String nome, double saldo);
  Future<void> editar(int id, String nome, double saldo);
  Future<void> excluir(int id);
}