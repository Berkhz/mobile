import 'package:banco/Services/IService/IContaBancariaService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContaBancariaService extends IContaBancariaService {
  static const String baseUrl = 'http://localhost:3000/contas';

  ContaBancariaService(String s); // Defina sua URL aqui

  @override
  Future<List<Map<String, dynamic>>> listar() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Erro ao carregar contas');
    }
  }

  @override
  Future<void> criar(String nome, double saldo) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nome': nome, 'saldo': saldo}),
    );
  }

  @override
  Future<void> editar(int id, String nome, double saldo) async {
    await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'nome': nome, 'saldo': saldo}),
    );
  }

  @override
  Future<void> excluir(int id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}