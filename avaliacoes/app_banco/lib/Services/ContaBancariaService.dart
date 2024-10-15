import 'IService/IContaBancariaService.dart';

class ContaBancariaService extends IContaBancariaService {
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