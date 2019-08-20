import 'dart:convert';
import 'package:sierad/login_screen.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> getUserList() async {
    try {
      final response = await http.post('${Urls.BASE_API_URL}');
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }
}