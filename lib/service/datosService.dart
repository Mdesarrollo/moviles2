import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/usuario.dart';
import '../config/user_session.dart';

class ApiService {
  static const String baseUrl = "http://172.16.102.131:8080";

  static Future<bool> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/auth/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        
        UserSession.nombre = data['nombre_usuario']; 
        UserSession.email = data['email'];
        // UserSession.role = data['role'];
        print("EXCELENTE");
        return true;
      } else {
        print("pila");
        return false;
      }
    } catch (e) {
      throw Exception("Error de conexión al intentar loguearse: $e");
    }
  }

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
