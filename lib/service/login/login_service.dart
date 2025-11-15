import 'package:dio/dio.dart';

class LoginService {
  static final _dio = Dio();
  static final _url = 'https://api.escuelajs.co/api/v1/auth/login';

  static Future<String> getToken(String userName, String password) async {
    try {
      final Response = await _dio.post(
        _url,
        data: {'email': userName, 'password': password},
      );
      if (Response.statusCode != 200) {
        return "Se jodio esto manito";
      }

      print("----------------------------------------------");
      print(Response.data);
      print("----------------------------------------------");

      return "login hecho";
    } on DioException catch (e) {
      return "error";
    }
  }
}
