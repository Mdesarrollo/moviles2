import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usuario.dart';

class ApiService {
  static const String baseUrl = "http://192.168.1.17:8080";

  static Future<List<Usuario>> getDatos() async {
    final url = Uri.parse("$baseUrl/otro/todos");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Usuario.fromJson(e)).toList();
      
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

  static Future<bool> enviarUsuario(Usuario usuario) async {
    final url = Uri.parse("$baseUrl/otro/crear"); 

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(usuario.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw Exception("Error en el POST: ${response.statusCode}");
    }
  }
}
